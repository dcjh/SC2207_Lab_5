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

CREATE TRIGGER trg_increment_season_count_on_insert
ON SeasonalPass
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Carpark
    SET season_current_count = season_current_count + 1
    WHERE carpark_id IN (SELECT carpark_id FROM inserted);
END
GO

CREATE TRIGGER trg_decrement_season_count_on_delete
ON SeasonalPass
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Carpark
    SET season_current_count = season_current_count - 1
    WHERE carpark_id IN (SELECT carpark_id FROM deleted);
END
GO