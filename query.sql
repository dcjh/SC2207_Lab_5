-- Q1. Weekday Parking for Less Than an Hour in MSCPs
SELECT
    m.carpark_id,
    vm.vehicle_type,
    COUNT(*) AS NumberOfVehicles
FROM
    EntryExitMode AS eem
JOIN
    MSCP AS m ON eem.carpark_id = m.carpark_id
JOIN
    Vehicle AS v ON eem.vrn = v.vrn
JOIN
    VehicleModel AS vm ON v.model = vm.model
WHERE
    DATEDIFF(minute, eem.entry_datetime, eem.exit_datetime) < 60
    AND DATENAME(weekday, eem.entry_datetime) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY
    m.carpark_id,
    vm.vehicle_type
ORDER BY
    m.carpark_id,
    vm.vehicle_type;


-- Q2. Total Revenue by Carpark
SELECT
    carpark_id,
    SUM(ShortTermRevenue) AS TotalShortTermRevenue,
    SUM(SeasonParkingRevenue) AS TotalSeasonParkingRevenue
FROM
(
    -- Calculate revenue from short-term parking sessions
    SELECT
        carpark_id,
        amount_paid AS ShortTermRevenue,
        0 AS SeasonParkingRevenue
    FROM
        ParkingSession
    WHERE
        rate_id IS NOT NULL -- Short-term sessions have a rateid

    UNION ALL

    -- Calculate revenue from season pass sales
    SELECT
        carpark_id,
        0 AS ShortTermRevenue,
        amount_paid AS SeasonParkingRevenue
    FROM
        SeasonalPass
) AS RevenueData
GROUP BY
    carpark_id
ORDER BY
    carpark_id;

-- Q3. Non-Resident Season Parking Holders
SELECT
    p.name AS PassHolderName,
    v.vrn AS VehicleRegistration,
    sp.carpark_id,
    SUM(DATEDIFF(month, sp.start_date, sp.end_date)) AS TotalMonthsSubscribed
FROM
    SeasonalPass AS sp
JOIN
    Vehicle AS v ON sp.vrn = v.vrn
JOIN
    Person AS p ON v.nric = p.nric
WHERE
    -- Check if the person's postal code does not match any HDB block linked to the carpark
    NOT EXISTS (
        SELECT 1
        FROM HdbBlock AS hb
        WHERE hb.carpark_id = sp.carpark_id AND hb.postal_code = p.postal_code
    )
GROUP BY
    p.name,
    v.vrn,
    sp.carpark_id
ORDER BY
    sp.carpark_id,
    p.name;


 -- Q4. Parking Offences by Non-Residents
 SELECT
    p.name AS OwnerName,
    v.vrn AS VehicleRegistration,
    COUNT(o.offense_id) AS NumberOfOffences,
    SUM(rf.fine_amount) AS TotalFines
FROM
    Offence AS o
JOIN
    ParkingSession AS ps ON o.session_id = ps.session_id
JOIN
    Vehicle AS v ON ps.vrn = v.vrn
JOIN
    Person AS p ON v.nric = p.nric
JOIN
    VehicleModel AS vm ON v.model = vm.model
JOIN
    RuleFines AS rf ON o.rule_id = rf.rule_id AND vm.vehicle_type = rf.vehicle_type
WHERE
    -- Ensure the offence occurred in a carpark where the owner is not a resident
    NOT EXISTS (
        SELECT 1
        FROM HdbBlock AS hb
        WHERE hb.carpark_id = ps.carpark_id AND hb.postal_code = p.postal_code
    )
GROUP BY
    p.name,
    v.vrn
ORDER BY
    OwnerName,
    VehicleRegistration;

-- Q6. Households with More Than Three Season Passes
WITH HouseholdPasses AS (
    SELECT
        p.postal_code,
        p.unit_no,
        FORMAT(sp.start_date, 'yyyy-MM') AS ParkingMonth,
        p.name AS OwnerName,
        v.vrn AS VehicleRegistration,
        -- Count passes per household per month
        COUNT(*) OVER (PARTITION BY p.postal_code, p.unit_no, FORMAT(sp.start_date, 'yyyy-MM')) AS PassesPerHousehold
    FROM
        SeasonalPass AS sp
    JOIN
        Vehicle AS v ON sp.vrn = v.vrn
    JOIN
        Person AS p ON v.nric = p.nric
)
SELECT
    hp.postal_code,
    hp.unit_no,
    hp.ParkingMonth,
    hp.OwnerName,
    hp.VehicleRegistration
FROM
    HouseholdPasses hp
WHERE
    hp.PassesPerHousehold > 3
ORDER BY
    hp.postal_code,
    hp.unit_no,
    hp.ParkingMonth;

-- Q5. Season Pass Purchase Simulation for Non-Residents
-- Setup: Ensure carpark W44 is at 90% capacity
UPDATE Carpark
    SET season_current_count = 270
    WHERE carpark_id = 'W44';

-- FAILURE SCENARIO: A non-resident tries to buy a pass at a 90% full carpark.
-- The person associated with vehicle 'SKE2214T' is assumed to be a non-resident for carpark W44.

SELECT v.vrn, p.nric, hdb.postal_code, hdb.carpark_id, c.season_current_count, c.season_total_quota
    FROM Vehicle v 
    INNER JOIN Person p ON v.nric = p.nric 
    INNER JOIN HdbBlock hdb ON hdb.postal_code = p.postal_code
    INNER JOIN Carpark c ON c.carpark_id = hdb.carpark_id
    WHERE v.vrn = 'SKE2214T';

PRINT '--- Attempting to insert a pass for a non-resident (EXPECTED TO FAIL) ---';
BEGIN TRY
    INSERT INTO SeasonalPass (status, start_date, end_date, amount_paid, pass_type, purchase_datetime, season_rate_id, carpark_id, vrn)
    VALUES ('active', '2025-12-01', '2025-12-31', 110.00, 'regular', GETDATE(), 5, 'W44', 'SKE2214T');
END TRY
BEGIN CATCH
    PRINT 'Transaction failed as expected. Error message:';
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- Verify that the count did NOT increase.
SELECT carpark_id, season_current_count, season_total_quota
FROM Carpark
WHERE carpark_id = 'W44'; -- The count should still be 270

-- SUCCESS SCENARIO: A resident buys a pass at the same 90% full carpark.
-- The person associated with vehicle 'SFS3378B' is a resident of a block linked to carpark W44.

SELECT v.vrn, p.nric, hdb.postal_code, hdb.carpark_id, c.season_current_count, c.season_total_quota
    FROM Vehicle v 
    INNER JOIN Person p ON v.nric = p.nric 
    INNER JOIN HdbBlock hdb ON hdb.postal_code = p.postal_code
    INNER JOIN Carpark c ON c.carpark_id = hdb.carpark_id
    WHERE v.vrn = 'SFS3378B';

PRINT '--- Attempting to insert a pass for a resident (EXPECTED TO SUCCEED) ---';
INSERT INTO SeasonalPass (status, start_date, end_date, amount_paid, pass_type, purchase_datetime, season_rate_id, carpark_id, vrn)
VALUES ('active', '2025-12-01', '2025-12-31', 110.00, 'regular', GETDATE(), 5, 'W44', 'SFS3378B');
GO

-- Verify that the count DID increase.
SELECT carpark_id, season_current_count, season_total_quota
FROM Carpark
WHERE carpark_id = 'W44'; -- The count should now be 271

