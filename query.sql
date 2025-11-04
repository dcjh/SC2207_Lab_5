/*
 1. For each MSCP, count how many vehicles park for less than an hour during weekdays (Mon – Fri). 
Breakdown the records by vehicle types (i.e. car, motorcycle, and commercial vehicle).
*/

SELECT 
    m.mscp_id,
    m.mscp_name,
    v.vehicle_type,
    COUNT(ps.session_id) AS vehicle_count
FROM mscp m, parking_session ps, vehicle v
WHERE m.carpark_id = ps.carpark_id
    AND ps.vehicle_id = v.vehicle_id
    AND DATEDIFF(MINUTE, ps.start_time, ps.end_time) < 60
    AND DATENAME(WEEKDAY, ps.start_time) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday')
GROUP BY m.mscp_id, m.mscp_name, v.vehicle_type

/* 
2. For each carpark, list down the total revenue 
collected for both short term parking as season parking separately.
*/

SELECT 
    c.carpark_id,
    c.carpark_name,
    SUM(CASE WHEN ps.parking_type = 'Short Term' THEN ps.amount_paid ELSE 0 END) AS short_term_revenue,
    SUM(CASE WHEN sp.pass_type = 'Season' THEN sp.total_amount ELSE 0 END) AS season_parking_revenue
FROM carpark c, parking_session ps, seasonal_pass sp 
WHERE c.carpark_id = ps.carpark_id
  AND c.carpark_id = sp.carpark_id
GROUP BY c.carpark_id, c.carpark_name

/* 
3. List down the season parking holder who are not resident at the HDB block that linked to the carpark. 
For each pass holder, count how many months they have subscribe to the season parking, break down by different carpark.
*/

SELECT 
    p.person_name,
    sp.carpark_id,
    COUNT(sp.pass_id) AS months_subscribed
FROM person p, seasonal_pass sp, residence r, hdb_block h, carpark c
WHERE p.person_id = sp.person_id
    AND p.person_id = r.person_id
    AND r.hdb_postal_code = h.postal_code
    AND h.carpark_id = c.carpark_id
    AND sp.carpark_id <> h.carpark_id
GROUP BY p.person_name, sp.carpark_id


/* 
4. List down the name of vehicle owner and their vehicle registration 
number who committed parking offences at the carpark where they are 
not the residents. Count the number of offences and total amount of fines.
*/

SELECT 
    p.person_name,
    v.registration_number,
    COUNT(o.offence_id) AS offence_count,
    SUM(o.fine_amount) AS total_fines
FROM person p, vehicle v, offence o, residence r, hdb_block h, carpark c
WHERE p.person_id = v.owner_id
    AND v.vehicle_id = o.vehicle_id
    AND p.person_id = r.person_id
    AND r.hdb_postal_code = h.postal_code
    AND h.carpark_id = c.carpark_id
    AND o.carpark_id <> h.carpark_id
GROUP BY p.person_name, v.registration_number

/* 
5. When 90% of season parking passes for a particular month and carpark (all parking lots) are sold, 
only the residents living in the HDB block that linked to the carpark who have not purchased any season parking pass can purchase the remaining pass. 
Prepare your data and query to simulate the success and fail scenario for non-resident.
*/

SELECT 
    sp.pass_id,
    p.person_name,
    sp.carpark_id,
    sp.start_date,
    sp.end_date
FROM seasonal_pass sp, person p, residence r, hdb_block h
WHERE sp.person_id = p.person_id
    AND p.person_id = r.person_id
    AND r.hdb_postal_code = h.postal_code
    AND h.carpark_id = sp.carpark_id
    AND (
        (SELECT 
            COUNT(*) 
        FROM seasonal_pass sp2 
        WHERE sp2.carpark_id = sp.carpark_id 
            AND MONTH(sp2.start_date) = MONTH(sp.start_date)
        ) 
        < 0.9 * (SELECT 
                    season_total_quota 
                 FROM carpark c 
                 WHERE c.carpark_id = sp.carpark_id
                )
        OR
        p.person_id IN (
            SELECT 
                r2.person_id
            FROM residence r2, hdb_block h2
            WHERE r2.hdb_postal_code = h2.postal_code
              AND h2.carpark_id = sp.carpark_id
              AND r2.person_id NOT IN (
                  SELECT 
                    sp3.person_id
                  FROM seasonal_pass sp3
                  WHERE MONTH(sp3.start_date) = MONTH(sp.start_date)
              )
        )
    )

/* 6. Identify the household (address) that purchases more than three season parking for the same month. 
List down the name of vehicle owners and the vehicle registration number. */

SELECT 
    h.block_no,
    h.street_name,
    p.person_name,
    v.registration_number
FROM hdb_block h, residence r, person p, seasonal_pass sp, vehicle v
WHERE h.postal_code = r.hdb_postal_code
    AND r.person_id = p.person_id
    AND p.person_id = sp.person_id
    AND p.person_id = v.owner_id
GROUP BY h.block_no, h.street_name, p.person_name, v.registration_number
HAVING COUNT(sp.pass_id) > 3