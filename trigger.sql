CREATE TRIGGER trg_check_vehicle_type_parking_session
ON ParkingSession
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if there is a mismatch in vehicle types
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Vehicle v ON i.vrn = v.vrn
        JOIN VehicleModel vm ON v.model = vm.model
        JOIN ShortTermRates str ON i.rate_id = str.rate_id
        WHERE vm.vehicle_type <> str.vehicle_type
    )
    BEGIN
        -- If a mismatch is found, raise an error and roll back the transaction
        RAISERROR('Vehicle type mismatch between VehicleModel and ShortTermRates for the ParkingSession.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO


CREATE TRIGGER trg_check_vehicle_type_offence
ON Offence
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if a corresponding fine rule exists for the vehicle's type
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN ParkingSession ps ON i.session_id = ps.session_id
        JOIN Vehicle v ON ps.vrn = v.vrn
        JOIN VehicleModel vm ON v.model = vm.model
        WHERE NOT EXISTS (
            SELECT 1
            FROM RuleFines rf
            WHERE rf.rule_id = i.rule_id
              AND rf.vehicle_type = vm.vehicle_type
        )
    )
    BEGIN
        -- If no fine is defined for this rule and vehicle type, raise an error
        RAISERROR('A fine is not defined in RuleFines for the specified rule and the vehicle''s type.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO


CREATE TRIGGER trg_check_vehicle_type_seasonal_pass
ON SeasonalPass
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if there is a mismatch in vehicle types for the seasonal pass
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Vehicle v ON i.vrn = v.vrn
        JOIN VehicleModel vm ON v.model = vm.model
        JOIN SeasonRate sr ON i.season_rate_id = sr.season_rate_id
        WHERE vm.vehicle_type <> sr.vehicle_type
    )
    BEGIN
        -- If a mismatch is found, raise an error and roll back the transaction
        RAISERROR('Vehicle type mismatch between VehicleModel and SeasonRate for the SeasonalPass.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO

-- Trigger 1: Validates the purchase against the 90% quota rule.
-- This should be set to execute FIRST.
CREATE TRIGGER trg_EnforceSeasonPassQuota
ON SeasonalPass
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check for any violations in the inserted batch.
    IF EXISTS (
        SELECT 1
        FROM
            inserted i
        JOIN
            Carpark c ON i.carpark_id = c.carpark_id
        WHERE
            -- Condition 1: Block ANY purchase if the carpark is at or over maximum capacity.
            (c.season_current_count >= c.season_total_quota)
            OR
            -- Condition 2: Block non-resident purchases if the carpark is at or over 90% capacity.
            (
                c.season_current_count >= (c.season_total_quota * 0.9)
                AND
                NOT EXISTS (
                    SELECT 1
                    FROM Vehicle v
                    JOIN Person p ON v.nric = p.nric
                    JOIN HdbBlock hb ON p.postal_code = hb.postal_code AND hb.carpark_id = c.carpark_id
                    WHERE v.vrn = i.vrn
                )
            )
    )
    BEGIN
        -- If any row in the batch violates either rule, roll back the entire transaction.
        RAISERROR ('Purchase failed. The carpark has either reached its maximum capacity or its 90%% quota, which is reserved for residents.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
GO


-- Trigger 2: Increments the season pass count in the Carpark table.
-- This should be set to execute LAST.
CREATE TRIGGER trg_increment_season_count_on_insert
ON SeasonalPass
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- This query correctly handles multi-row inserts by grouping the inserted rows
    -- by carparkid and updating the count for each affected carpark.
    UPDATE C
    SET
        season_current_count = C.season_current_count + I.NewPasses
    FROM
        Carpark AS C
    JOIN
        (
            SELECT
                carpark_id,
                COUNT(*) AS NewPasses
            FROM
                inserted
            GROUP BY
                carpark_id
        ) AS I ON C.carpark_id = I.carpark_id;
END;
GO
