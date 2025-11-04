--Carpark data insertion
INSERT INTO Carpark (carpark_id, night_parking, grace_minutes, season_total_quota, season_current_count)
VALUES
  ('A34',  1, 15,  50, 10),
  ('A35',  1, 15,  50, 10),
  ('A36',  1, 15,  50, 10),
  ('SE50', 1, 15, 360, 72),
  ('C28',  1, 15,  50, 10),
  ('SK48', 1, 15, 360, 72),
  ('SK49', 1, 15, 360, 72),
  ('SK15', 1, 15, 390, 78),
  ('PL80', 0,  0,  60, 12),
  ('PL90', 0,  0,  50, 10),
  ('J80M', 1, 15, 330, 66),
  ('JM24', 1, 15, 360, 72),
  ('JM25', 1, 15, 360, 72),
  ('CK22', 0,  0, 330, 66),
  ('CK25', 0,  0,  50, 10),
  ('CK51', 0,  0, 300, 60),
  ('W44',  1, 15, 300, 60),
  ('W45',  1, 15, 300, 60),
  ('W780', 1, 15, 390, 78),
  ('W81',  1, 15, 300, 60),
  ('SB23', 1, 15, 360, 72),
  ('PM23', 1, 15, 330, 66),
  ('PM24', 1, 15, 240, 48),
  ('B13',  1, 15,  50, 10),
  ('GE1A', 1, 15,  50, 10);

INSERT INTO MSCP (carpark_id, clearance_height, deck_count)
VALUES
  ('SE50', 2.15, 12),
  ('SK48', 2.15, 12),
  ('SK49', 2.15, 12),
  ('SK15', 2.15, 13),
  ('PL80', 2.15,  2),
  ('J80M', 2.00, 11),
  ('JM24', 2.15, 12),
  ('JM25', 2.15, 12),
  ('CK22', 1.90, 11),
  ('CK51', 2.00, 10),
  ('W44',  2.00, 10),
  ('W45',  2.00, 10),
  ('W780', 2.15, 13),
  ('W81',  2.15, 10),
  ('SB23', 2.15, 12),
  ('PM23', 2.00, 11),
  ('PM24', 2.00,  8);

INSERT INTO SeasonRate (monthly_charges, tier, carpark_type, vehicle_type)
VALUES
	(80.00, 1, 'normal', 'car'),
	(165.00, 2, 'normal', 'car'),
	(15.00, 0, 'normal', 'motorcycle'),
	(185.00, 0, 'normal', 'commercial'),
	(110.00, 1, 'mscp', 'car'),
	(190.00, 2, 'mscp', 'car'),
	(17.00, 0, 'mscp', 'motorcycle'),
	(185.00, 0, 'mscp', 'commercial');

INSERT INTO ParkingRule (rule_desc)
VALUES
    ('Parking other than in a parking lot'),
    ('Using a parking place for unauthorised purpose'),
    ('Failure to pay parking charge at the payment station prior to leaving a parking place'),
    ('Parking in a parking place not designated for the use thereof'),
    ('Drawing/ driving/ pushing/ parking a motor vehicle in a disorderly manner without regard for the safety of other vehicles and persons'),
    ('Failure to obey signs exhibited in the parking place'),
    ('Entering a parking place other than through the access provided for that purpose'),
    ('Repairing/ allowing repairs to a motor vehicle in a parking place'),
    ('Failure to obey lawful directions given by Parking Wardens'),
    ('Parking in a season parking place without valid season parking'),
    ('Unauthorised parking in reserved parking lot or parking without displaying an authorised label'),
    ('Displaying any authorisation that has been altered or erased or contain any other irregularity therein indicating that it has been tampered with'),
    ('No parking coupon/parking session'),
    ('Parking without displaying valid parking coupon(s) or displaying insufficient amount of parking coupons'),
    ('Illegal parking in common property');

INSERT INTO RuleFines (rule_id, vehicle_type, fine_amount)
VALUES
    (1, 'Motorcycle', 35.00),
    (1, 'Car', 70.00),
    (1, 'HeavyVehicle', 100.00),
    (2, 'Motorcycle', 80.00),
    (2, 'Car', 80.00),
    (2, 'HeavyVehicle', 80.00),
    (3, 'Motorcycle', 35.00),
    (3, 'Car', 70.00),
    (3, 'HeavyVehicle', 100.00),
    (4, 'Motorcycle', 35.00),
    (4, 'Car', 70.00),
    (4, 'HeavyVehicle', 100.00),
    (5, 'Motorcycle', 35.00),
    (5, 'Car', 70.00),
    (5, 'HeavyVehicle', 100.00),
    (6, 'Motorcycle', 35.00),
    (6, 'Car', 70.00),
    (6, 'HeavyVehicle', 100.00),
    (7, 'Motorcycle', 35.00),
    (7, 'Car', 70.00),
    (7, 'HeavyVehicle', 100.00),
    (8, 'Motorcycle', 80.00),
    (8, 'Car', 80.00),
    (8, 'HeavyVehicle', 80.00),
    (9, 'Motorcycle', 35.00),
    (9, 'Car', 70.00),
    (9, 'HeavyVehicle', 100.00),
    (10, 'Motorcycle', 35.00),
    (10, 'Car', 70.00),
    (10, 'HeavyVehicle', 100.00),
    (11, 'Motorcycle', 35.00),
    (11, 'Car', 70.00),
    (11, 'HeavyVehicle', 100.00),
    (12, 'Motorcycle', 300.00),
    (12, 'Car', 300.00),
    (12, 'HeavyVehicle', 300.00),
    (13, 'Motorcycle', 8.00),
    (13, 'Car', 40.00),
    (13, 'HeavyVehicle', 50.00),
    (14, 'Motorcycle', 8.00),
    (14, 'Car', 40.00),
    (14, 'HeavyVehicle', 50.00),
    (15, 'Motorcycle', 100.00),
    (15, 'Car', 100.00),
    (15, 'HeavyVehicle', 100.00);

    
INSERT INTO ShortTermRates (vehicle_type, price, start_time, end_time, day_type, cap_amount, cap_scope) VALUES 
     ('Car', 0.60, '00:00:00', '23:59:59', 'Weekday', 12, 'Day'),
     ('Car', 0.60, '00:00:00', '23:59:59', 'Weekend', 12, 'Day'),
     ('Motorcycle', 0.65, '07:00:00', '22:30:00', 'DaySession', 5, 'Day'),
     ('Motorcycle', 0.65, '22:30:01', '06:59:59', 'NightSession', 5, 'Day'),
     ('HeavyVehicle', 1.20, '00:00:00', '23:59:59', 'AllDays', 12, 'Day');

INSERT INTO HdbBlock(postal_code, block_no, street_name, carpark_id) 
VALUES
    ('560422', '422', 'Ang Mo Kio Ave 3', 'A34'),
    ('560426', '426', 'Ang Mo Kio Ave 3', 'A35'),
    ('560440', '440', 'Ang Mo Kio Ave 10', 'A36'),
    ('550232', '232', 'Serangoon Ave 3', 'SE50'),
    ('120204', '204', 'Clementi Ave 6', 'C28'),
    ('120205', '205', 'Clementi Ave 6', 'C28'),
    ('542319', '319B', 'Anchorvale Dr', 'SK49'),
    ('542320', '320B', 'Anchorvale Dr', 'SK48'),
    ('543250', '250C', 'Compassvale St', 'SK15'),
    ('540252', '252', 'Compassvale St', 'SK15'),
    ('821445', '445A', 'New Punggol Rd', 'PL90'),
    ('822409', '409B', 'Northshore Dr', 'PL80'),
    ('640735', '735', 'Jurong West St 75', 'J80M'),
    ('641672', '672A', 'Jurong West St 65', 'JM25'),
    ('642654', '654B', 'Jurong West St 61', 'JM24'),
    ('642655', '655B', 'Jurong West St 61', 'JM24'),
    ('680344', '344', 'Choa Chu Kang Loop', 'CK22'),
    ('680354', '354', 'Choa Chu Kang Central', 'CK25'),
    ('680618', '618', 'Choa Chu Kang North 7', 'CK51'),
    ('730411', '411', 'Woodlands Street 41', 'W44'),
    ('730418', '418', 'Woodlands Street 41', 'W45'),
    ('730421', '421', 'Woodlands Street 41', 'W45'),
    ('735780', '780E', 'Woodlands Cres', 'W780'),
    ('735786', '786B', 'Woodlands Drive 60', 'W81'),
    ('754354', '354D', 'Admiralty Dr', 'SB23'),
    ('510560', '560', 'Pasir Ris Street 51', 'PM24'),
    ('510566', '556', 'Pasir Ris Street 51', 'PM23'),
    ('460425', '425', 'Bedok North Rd', 'B13'),
    ('460426', '426', 'Bedok North Rd', 'B13'),
    ('380103', '103', 'Aljunied Cres', 'GE1A');

INSERT INTO Residence(unit_no, postal_code) 
VALUES
    ('#02-53', '560422'),
    ('#03-54', '560426'),
    ('#04-215', '560440'),
    ('#05-26', '550232'),
    ('#09-03', '120204'),
    ('#10-03', '120205'),
    ('#05-25', '542319'),
    ('#06-152', '542320'),
    ('#11-143', '543250'),
    ('#13-29', '540252'),
    ('#27-47', '821445'),
    ('#12-45', '822409'),
    ('#31-134', '640735'),
    ('#15-26', '641672'),
    ('#07-02', '642654'),
    ('#08-07', '642655'),
    ('#11-54', '680344'),
    ('#12-29', '680354'),
    ('#25-42', '680618'),
    ('#27-31', '730411'),
    ('#11-111', '730418'),
    ('#22-12', '730421'),
    ('#28-191', '735780'),
    ('#02-57', '735786'),
    ('#04-211', '754354'),
    ('#30-112', '510560'),
    ('#33-134', '510566'),
    ('#07-101', '460425'),
    ('#09-105', '460426'),
    ('#10-121', '380103');


INSERT INTO LotType (color)
VALUES 
	('Red'),
	('Red_white'),
	('White'),
	('Yellow');


USE tddag1;

IF OBJECT_ID('tempdb..#people') IS NOT NULL DROP TABLE #people;
IF OBJECT_ID('tempdb..#vehicle_details') IS NOT NULL DROP TABLE #vehicle_details;
IF OBJECT_ID('tempdb..#vehicle_model') IS NOT NULL DROP TABLE #vehicle_model;

-- temp tables allow for data manipulation before inserting into actual tables
CREATE TABLE #people (
  nric          CHAR(9)      NOT NULL PRIMARY KEY,
  [name]        VARCHAR(100) NOT NULL,
  email         VARCHAR(255) NOT NULL,
  contact       VARCHAR(16)  NOT NULL
);
CREATE TABLE #vehicle_details (
  vrn               VARCHAR(8)   NOT NULL PRIMARY KEY,
  obu_id_id         VARCHAR(32)  NOT NULL,
  color             VARCHAR(20)  NOT NULL,
  year_manufactured SMALLINT     NOT NULL,
  sg_registered     BIT          NOT NULL
);
CREATE TABLE #vehicle_model (
	model           VARCHAR(255)        NOT NULL PRIMARY KEY,
	brand           VARCHAR(255)        NOT NULL,
	vehicle_type    VARCHAR(255)        NOT NULL
);


-- Insert people into temp table
INSERT INTO #people(nric,[name],email,contact) 
VALUES
    ('S9123456D', 'tan wei ming',     'weiming.tan@gmail.com',    '98542103'),
    ('T0287654E', 'ong kai jie',      'kaijie.ong@gmail.com',     '91234407'),
    ('S9801123F', 'lim jia hui',      'jiahui.lim@gmail.com',     '87885512'),
    ('S9007788B', 'lee jian hong',    'jianhong.lee@gmail.com',   '96907721'),
    ('S8812234J', 'annie lee',        'annie.lee@gmail.com',      '81129980'),
    ('F1234567N', 'hathaway chen',    'hathaway.chen@gmail.com',  '83926015'),
    ('S9745678D', 'nur aisyah ahmad', 'aisyah.ahmad@gmail.com',   '96443150'),
    ('T0154321G', 'samuel tan',       'sam.tan@gmail.com',        '88997451'),
    ('S8901123A', 'rachel lim',       'rachel.lim@gmail.com',     '93312209'),
    ('G2345678M', 'james wong',       'james.wong@gmail.com',     '90213488'),
    ('S9012234H', 'chong li ting',    'liting.chong@gmail.com',   '98330012'),
    ('S8823456K', 'goh de wei',       'dewei.goh@gmail.com',      '94556677'),
    ('S8734567C', 'chua mei lin',     'meilin.chua@gmail.com',    '98445566'),
    ('S8645678Z', 'teo zhi xuan',     'zhixuan.teo@gmail.com',    '93887766'),
    ('S8556789P', 'prakash nair',     'prakash.nair@gmail.com',   '92998877'),
    ('S8467890Q', 'muhd irfan',       'muhd.irfan@gmail.com',     '98661234'),
    ('S8378901R', 'siti nurhaliza',   'siti.nurhaliza@gmail.com', '91551234'),
    ('S8289012S', 'alicia tan',       'alicia.tan@gmail.com',     '98223344'),
    ('S8190123T', 'benjamin koh',     'ben.koh@gmail.com',        '98997766'),
    ('S8101234U', 'fiona quek',       'fiona.quek@gmail.com',     '97220011'),
    ('S8012345V', 'daniel lee',       'daniel.lee@gmail.com',     '98550022'),
    ('S7923456W', 'grace wong',       'grace.wong@gmail.com',     '98221144'),
    ('S7834567X', 'joseph lim',       'joseph.lim@gmail.com',     '96553322'),
    ('S7745678Y', 'natalie ong',      'natalie.ong@gmail.com',    '98110077'),
    ('S7656789Z', 'ryan tay',         'ryan.tay@gmail.com',       '93667788'),
    ('S7567890A', 'elaine goh',       'elaine.goh@gmail.com',     '98880066'),
    ('S7478901B', 'marcus ho',        'marcus.ho@gmail.com',      '98112233'),
    ('S7389012C', 'ng hui qi',        'huiqi.ng@gmail.com',       '99442211'),
    ('S7290123D', 'jason low',        'jason.low@gmail.com',      '97885544'),
    ('S7101234E', 'clara phua',       'clara.phua@gmail.com',     '98446655');

-- Insert vehicle details into temp table
INSERT INTO #vehicle_details(vrn, obu_id_id, color, year_manufactured, sg_registered) 
VALUES
    ('SJA1234K', 'A1234567890B', 'white',  2018, 1),
    ('SMD4521L', 'B1029384756C', 'blue',   2017, 1),
    ('SNL9876T', 'C5647382910D', 'grey',   2020, 1),
    ('SKB3310Z', 'D9988776655E', 'red',    2019, 1),
    ('SLH2205U', 'E7766554433F', 'silver', 2016, 1),
    ('SMU7781P', 'F3344556677G', 'black',  2015, 1),
    ('SNE5528R', 'G4455667788H', 'white',  2014, 1),
    ('SJQ9021M', 'H1122334455J', 'blue',   2012, 1),
    ('SGL6619A', 'J2233445566K', 'grey',   2021, 1),
    ('SLP4410S', 'K5566778899L', 'silver', 2018, 1),
    ('SNY2035D', 'L6677889900M', 'white',  2013, 1),
    ('SKH7702J', 'M7788990011N', 'red',    2016, 1),
    ('SMC1122H', 'N8800112233P', 'grey',   2015, 1),
    ('SMC7788H', 'P8800998877Q', 'black',  2014, 1),
    ('SJJ2208B', 'Q9000111122R', 'blue',   2013, 1),
    ('SJJ8811B', 'R9000998877S', 'white',  2020, 1),
    ('SFA3301L', 'S7700123456T', 'silver', 2011, 1),
    ('SFA7703L', 'T7700654321U', 'grey',   2018, 1),
    ('SFA9907L', 'U7700765432V', 'white',  2010, 0),
    ('SGX2201C', 'V1111222233W', 'blue',   2022, 1),
    ('SGX4420C', 'W1111333344X', 'black',  2023, 1),
    ('SGX7722C', 'X1111444455Y', 'white',  2024, 1),
    ('SDB1123M', 'Y2222111100Z', 'grey',   2012, 1),
    ('SDE2234P', 'Z2222333322A', 'silver', 2009, 1),
    ('SDZ4456R', 'A2222555544B', 'black',  2008, 1),
    ('SKZ1144F', 'B3333000011C', 'white',  2017, 1),
    ('SKZ7714F', 'C3333999911D', 'red',    2016, 1),
    ('SKE2214T', 'D3333222211E', 'blue',   2019, 1),
    ('SLZ9904D', 'E3333444411F', 'grey',   2020, 1),
    ('SLA1176A', 'F3333666611G', 'silver', 2018, 1),
    ('SLA4490A', 'G3333888811H', 'blue',   2016, 1),
    ('SLS5501R', 'H3333001122J', 'black',  2015, 1),
    ('SLU6620S', 'J3333992211K', 'white',  2019, 1),
    ('SFB2210K', 'K4444555566L', 'grey',   2011, 1),
    ('SFC4422L', 'L4444666677M', 'blue',   2013, 1),
    ('SFD6633M', 'M4444777788N', 'silver', 2014, 1),
    ('SFE8844N', 'N4444888899P', 'black',  2015, 1),
    ('SFF1155P', 'P5555000011Q', 'white',  2016, 1),
    ('SFG2266Q', 'Q5555111122R', 'grey',   2017, 1),
    ('SFH3377R', 'R5555222233S', 'blue',   2018, 1),
    ('SFI4488S', 'S5555333344T', 'silver', 2019, 1),
    ('SFJ5599T', 'T5555444455U', 'black',  2020, 1),
    ('SFK6600U', 'U6666000011V', 'white',  2021, 1),
    ('SFL7711V', 'V6666111122W', 'grey',   2022, 1),
    ('SFM8822W', 'W6666222233X', 'blue',   2023, 1),
    ('SFN9933X', 'X6666333344Y', 'silver', 2010, 0),
    ('SFP0044Y', 'Y7777888899Z', 'white',  2012, 1),
    ('SFQ1156Z', 'Z7777999900A', 'black',  2013, 1);

-- Insert vehicle models into temp table
INSERT INTO #vehicle_model(model, brand, vehicle_type) 
VALUES  
    ('Corolla Altis','Toyota','car'),
    ('Vios','Toyota','car'),
    ('Civic','Honda','car'),
    ('Jazz','Honda','car'),
    ('Avante','Hyundai','car'),
    ('Elantra','Hyundai','car'),
    ('Cerato','Kia','car'),
    ('Mazda 3','Mazda','car'),
    ('Sylphy','Nissan','car'),
    ('Lancer','Mitsubishi','car'),
    ('Golf','Volkswagen','car'),
    ('Impreza','Subaru','car');


--sanity checks
IF OBJECT_ID('tempdb..#people')          IS NULL RAISERROR('#people missing',16,1);
IF OBJECT_ID('tempdb..#vehicle_details') IS NULL RAISERROR('#vehicle_details missing',16,1);
IF OBJECT_ID('tempdb..#vehicle_model')   IS NULL RAISERROR('#vehicle_model missing',16,1);

IF NOT EXISTS (SELECT 1 FROM #people)           RAISERROR('#people empty',16,1);
IF NOT EXISTS (SELECT 1 FROM #vehicle_details)  RAISERROR('#vehicle_details empty',16,1);
IF NOT EXISTS (SELECT 1 FROM #vehicle_model)    RAISERROR('#vehicle_model empty',16,1);

IF OBJECT_ID('tempdb..#people_order')    IS NOT NULL DROP TABLE #people_order;
IF OBJECT_ID('tempdb..#residence_order') IS NOT NULL DROP TABLE #residence_order;
IF OBJECT_ID('tempdb..#person_alloc')    IS NOT NULL DROP TABLE #person_alloc;
IF OBJECT_ID('tempdb..#owner_order')     IS NOT NULL DROP TABLE #owner_order;
IF OBJECT_ID('tempdb..#veh_order')       IS NOT NULL DROP TABLE #veh_order;
IF OBJECT_ID('tempdb..#model_order')     IS NOT NULL DROP TABLE #model_order;
IF OBJECT_ID('tempdb..#veh_first_pass')  IS NOT NULL DROP TABLE #veh_first_pass;
IF OBJECT_ID('tempdb..#veh_second_pass') IS NOT NULL DROP TABLE #veh_second_pass;
IF OBJECT_ID('tempdb..#veh_all')         IS NOT NULL DROP TABLE #veh_all;

-- Temporary tables for processing
CREATE TABLE #people_order (
    nric CHAR(9) PRIMARY KEY, 
    rn   INT NOT NULL
);
CREATE TABLE #residence_order (
    unit_no     VARCHAR(10), 
    postal_code INT,
    rn          INT NOT NULL, 
    PRIMARY KEY(unit_no, postal_code)
);
CREATE TABLE #person_alloc (
    nric        CHAR(9) PRIMARY KEY,
    unit_no     VARCHAR(10) NOT NULL,
    postal_code INT         NOT NULL
);
CREATE TABLE #owner_order (
    nric  CHAR(9) PRIMARY KEY, 
    rn    INT NOT NULL
);
CREATE TABLE #veh_order (
    vrn                VARCHAR(8) PRIMARY KEY,
    obu_id_id          VARCHAR(32) NOT NULL,
    color              VARCHAR(20) NOT NULL,
    year_manufactured  SMALLINT    NOT NULL,
    sg_registered      BIT         NOT NULL,
    rn                 INT         NOT NULL
);
CREATE TABLE #model_order (
    model         VARCHAR(255) NOT NULL,
    brand         VARCHAR(255) NOT NULL,
    vehicle_type  VARCHAR(255) NOT NULL,
    rn            INT          NOT NULL,
    PRIMARY KEY(model, brand, vehicle_type)
);
CREATE TABLE #veh_first_pass (
    vrn                 VARCHAR(8) PRIMARY KEY,
    obu_id_id           VARCHAR(32)   NOT NULL,
    color               VARCHAR(20)   NOT NULL,
    year_manufactured   SMALLINT      NOT NULL,
    sg_registered       BIT           NOT NULL,
    model               VARCHAR(255)  NOT NULL,
    nric                CHAR(9)       NOT NULL
);
CREATE TABLE #veh_second_pass (
    vrn                 VARCHAR(8) PRIMARY KEY,
    obu_id_id           VARCHAR(32)   NOT NULL,
    color               VARCHAR(20)   NOT NULL,
    year_manufactured   SMALLINT      NOT NULL,
    sg_registered       BIT           NOT NULL,
    model               VARCHAR(255)  NOT NULL,
    nric                CHAR(9)       NOT NULL
);
CREATE TABLE #veh_all (
    vrn                 VARCHAR(8) PRIMARY KEY,
    obu_id_id           VARCHAR(32)   NOT NULL,
    color               VARCHAR(20)   NOT NULL,
    year_manufactured   SMALLINT      NOT NULL,
    sg_registered       BIT           NOT NULL,
    model               VARCHAR(255)  NOT NULL,
    nric                CHAR(9)       NOT NULL
);

-- number people and store order
INSERT INTO #people_order(nric, rn)
    SELECT 
        p.nric, 
        ROW_NUMBER() OVER (ORDER BY p.nric)
    FROM #people p;

-- number residences and store order
INSERT INTO #residence_order(unit_no, postal_code, rn)
    SELECT 
        r.unit_no, 
        r.postal_code, 
        ROW_NUMBER() OVER (ORDER BY r.postal_code, r.unit_no)
    FROM residence r; -- use main table (ensures we only allocate to inserted residences)

-- ensure there is at least one residence to allocate
DECLARE @res_count INT = (SELECT COUNT(*) FROM #residence_order);
IF @res_count = 0 RAISERROR('No residences available for allocation.',16,1);

-- allocate residences to people in round-robin fashion
INSERT INTO #person_alloc(nric, unit_no, postal_code)
    SELECT 
        po.nric,
        ro.unit_no,
        ro.postal_code
    FROM #people_order po
    JOIN #residence_order ro
    ON ro.rn = ((po.rn - 1) % @res_count) + 1;

-- Insert people into main PERSON table
INSERT INTO person(nric, [name], email, contact, unit_no, postal_code)
    SELECT 
        p.nric, 
        p.[name], 
        p.email, 
        p.contact, 
        a.unit_no, 
        a.postal_code
    FROM #people p
    JOIN #person_alloc a ON a.nric = p.nric
    WHERE NOT EXISTS (SELECT 1 FROM PERSON x WHERE x.nric = p.nric);

-- Insert vehicle models into main VEHICLE_MODEL table
INSERT INTO VehicleModel(model, brand, vehicle_type)
    SELECT 
        m.model, 
        m.brand, 
        m.vehicle_type
    FROM #vehicle_model m
    WHERE NOT EXISTS (
        SELECT 
            1
        FROM VehicleModel d
        WHERE d.model = m.model
            AND d.brand = m.brand
            AND d.vehicle_type = m.vehicle_type
    );

-- number owners and store order
INSERT INTO #owner_order(nric, rn)
    SELECT 
        p.nric, 
        ROW_NUMBER() OVER (ORDER BY p.nric)
    FROM person p;  -- use main table (ensures we only assign to inserted people)

-- number vehicles and store order
INSERT INTO #veh_order(vrn, obu_id_id, color, year_manufactured, sg_registered, rn)
    SELECT 
        v.vrn, 
        v.obu_id_id, 
        v.color, 
        v.year_manufactured, 
        v.sg_registered,
        ROW_NUMBER() OVER (ORDER BY v.vrn)
    FROM #vehicle_details v;

-- number models and store order
INSERT INTO #model_order(model, brand, vehicle_type, rn)
    SELECT 
        vm.model, 
        vm.brand, 
        vm.vehicle_type,
        ROW_NUMBER() OVER (ORDER BY vm.model, vm.brand, vm.vehicle_type)
    FROM VehicleModel vm; -- use main table (ensures we only assign to inserted models)

-- ensure there is at least one owner to assign vehicles
DECLARE @owner_cnt INT = (SELECT COUNT(*) FROM #owner_order);
IF @owner_cnt = 0 RAISERROR('No owners in PERSON to assign vehicles.',16,1);
-- ensure there are enough vehicles to assign at least one per owner
DECLARE @veh_cnt   INT = (SELECT COUNT(*) FROM #veh_order);
IF @veh_cnt < @owner_cnt
    RAISERROR('Not enough vehicles to assign at least one per person. Vehicles=%d, People=%d', 16, 1, @veh_cnt, @owner_cnt);
-- ensure there is at least one model to assign to vehicles
DECLARE @model_cnt INT = (SELECT COUNT(*) FROM #model_order);
IF @model_cnt = 0 RAISERROR('No models in VEHICLE_MODEL to assign to vehicles.',16,1);

--  First pass: assign vehicles to owners until all owners have at least one vehicle
INSERT INTO #veh_first_pass(vrn, obu_id_id, color, year_manufactured, sg_registered, model, nric)
    SELECT 
        v.vrn, 
        v.obu_id_id, 
        v.color, 
        v.year_manufactured, 
        v.sg_registered,
        mo.model,
        oo.nric
    FROM #veh_order v
    JOIN #owner_order oo
    ON oo.rn = v.rn
    JOIN #model_order mo
    ON mo.rn = ((v.rn - 1) % @model_cnt) + 1
    WHERE v.rn <= @owner_cnt;

--  Second pass: assign remaining vehicles in round-robin fashion
INSERT INTO #veh_second_pass(vrn, obu_id_id, color, year_manufactured, sg_registered, model, nric)
    SELECT 
        v.vrn, 
        v.obu_id_id, 
        v.color, 
        v.year_manufactured, 
        v.sg_registered,
        mo.model, 
        oo.nric
    FROM #veh_order v
    JOIN #owner_order oo
    ON oo.rn = ((v.rn - 1) % @owner_cnt) + 1
    JOIN #model_order mo
    ON mo.rn = ((v.rn - 1) % @model_cnt) + 1
    WHERE v.rn > @owner_cnt;

-- Combine first and second pass vehicles
INSERT INTO #veh_all(vrn, obu_id_id, color, year_manufactured, sg_registered, model, nric)
    SELECT 
        vrn, 
        obu_id_id, 
        color, 
        year_manufactured, 
        sg_registered, 
        model, 
        nric
    FROM #veh_first_pass
    UNION ALL
    SELECT 
        vrn, 
        obu_id_id, 
        color, 
        year_manufactured, 
        sg_registered, 
        model, 
        nric
    FROM #veh_second_pass;

-- Insert into main VEHICLE table
INSERT INTO vehicle(vrn, obu_id_id, color, year_manufactured, sg_registered, model, nric)
    SELECT 
        a.vrn, 
        a.obu_id_id, 
        a.color, 
        a.year_manufactured, 
        a.sg_registered,
        a.model, 
        a.nric
    FROM #veh_all a
    WHERE NOT EXISTS (
        SELECT 
            1 
        FROM VEHICLE d
        WHERE d.vrn = a.vrn
    );

-- Clean up temporary tables
DROP TABLE #people;
DROP TABLE #vehicle_details;
DROP TABLE #vehicle_model;
DROP TABLE #people_order;
DROP TABLE #residence_order;
DROP TABLE #person_alloc;
DROP TABLE #owner_order;
DROP TABLE #veh_order;
DROP TABLE #model_order;
DROP TABLE #veh_first_pass;
DROP TABLE #veh_second_pass;
DROP TABLE #veh_all;


-- 1. Parking records for vehicle: SDB1123M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-14 07:24:00', '2025-10-14 18:57:00', 'SHORTTERM', 12.00, 1, 'B13', 'SDB1123M'),
	('2025-01-23 12:44:00', '2025-01-23 22:19:00', 'SHORTTERM', 11.40, 1, 'B13', 'SDB1123M'),
	('2025-01-07 17:26:00', '2025-01-08 03:19:00', 'SHORTTERM', 11.40, 1, 'W45', 'SDB1123M');

-- Parking Mode: Seasonal


-- 2. Parking records for vehicle: SDE2234P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-01 22:29:00', '2025-07-02 01:37:00', 'SHORTTERM', 3.60, 1, 'A35', 'SDE2234P'),
	('2025-07-31 09:48:00', '2025-07-31 18:25:00', 'SHORTTERM', 10.20, 1, 'W780', 'SDE2234P'),
	('2025-01-05 12:58:00', '2025-01-05 23:37:00', 'SHORTTERM', 12.00, 2, 'W81', 'SDE2234P');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-31 11:29:00', 1, 5);

-- Parking Mode: Seasonal


-- 3. Parking records for vehicle: SDZ4456R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-05 12:54:00', '2025-02-05 18:12:00', 'SHORTTERM', 6.00, 1, 'W81', 'SDZ4456R'),
	('2025-02-14 14:54:00', '2025-02-14 18:37:00', 'SHORTTERM', 4.20, 1, 'SK15', 'SDZ4456R'),
	('2025-05-18 07:34:00', '2025-05-18 08:32:00', 'SHORTTERM', 0.60, 2, 'GE1A', 'SDZ4456R');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-14 15:48:00', 13, 8),
	('2025-05-18 08:01:00', 3, 9);

-- Parking Mode: Seasonal


-- 4. Parking records for vehicle: SFA3301L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-09 06:55:00', '2025-08-09 09:49:00', 'SHORTTERM', 3.00, 2, 'CK25', 'SFA3301L'),
	('2025-09-18 09:38:00', '2025-09-18 11:52:00', 'SHORTTERM', 2.40, 1, 'J80M', 'SFA3301L'),
	('2025-09-16 02:43:00', '2025-09-16 06:04:00', 'SHORTTERM', 3.60, 1, 'W81', 'SFA3301L'),
	('2025-04-12 05:19:00', '2025-04-12 18:37:00', 'SHORTTERM', 12.00, 2, 'SK49', 'SFA3301L'),
	('2025-02-25 07:19:00', '2025-02-25 15:14:00', 'SHORTTERM', 9.00, 1, 'PL90', 'SFA3301L');

-- Parking Mode: Seasonal


-- 5. Parking records for vehicle: SFA7703L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-07 01:01:00', '2025-08-07 13:41:00', 'SHORTTERM', 12.00, 1, 'CK51', 'SFA7703L'),
	('2025-08-02 03:16:00', '2025-08-02 04:06:00', 'SHORTTERM', 0.60, 2, 'SE50', 'SFA7703L'),
	('2025-10-02 12:44:00', '2025-10-02 20:17:00', 'SHORTTERM', 9.00, 1, 'A34', 'SFA7703L'),
	('2025-01-28 02:09:00', '2025-01-28 08:17:00', 'SHORTTERM', 7.20, 1, 'W44', 'SFA7703L'),
	('2025-09-18 05:21:00', '2025-09-18 07:39:00', 'SHORTTERM', 2.40, 1, 'JM24', 'SFA7703L');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-02 15:45:00', 6, 17);

-- Parking Mode: Seasonal


-- 6. Parking records for vehicle: SFA9907L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-19 13:19:00', '2025-04-19 14:55:00', 'SHORTTERM', 1.80, 2, 'CK22', 'SFA9907L'),
	('2025-10-02 03:05:00', '2025-10-02 03:18:00', 'SHORTTERM', 0.00, 1, 'PL90', 'SFA9907L'),
	('2025-11-02 10:02:00', '2025-11-02 17:39:00', 'SHORTTERM', 9.00, 2, 'PM24', 'SFA9907L');

-- Parking Mode: Seasonal


-- 7. Parking records for vehicle: SFB2210K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-29 17:18:00', '2025-08-30 05:40:00', 'SHORTTERM', 14.40, 1, 'PM24', 'SFB2210K'),
	('2025-07-10 23:10:00', '2025-07-11 05:58:00', 'SHORTTERM', 7.20, 1, 'JM25', 'SFB2210K'),
	('2025-04-08 00:21:00', '2025-04-08 13:28:00', 'SHORTTERM', 12.00, 1, 'W780', 'SFB2210K');

-- Parking Mode: Seasonal


-- 8. Parking records for vehicle: SFC4422L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-04 06:46:00', '2025-02-04 14:25:00', 'SHORTTERM', 9.00, 1, 'SE50', 'SFC4422L'),
	('2025-03-17 22:00:00', '2025-03-18 11:37:00', 'SHORTTERM', 14.40, 1, 'PM24', 'SFC4422L'),
	('2025-01-07 21:23:00', '2025-01-08 08:07:00', 'SHORTTERM', 12.60, 1, 'A34', 'SFC4422L');

-- Parking Mode: Seasonal


-- 9. Parking records for vehicle: SFD6633M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-06 03:43:00', '2025-02-06 09:32:00', 'SHORTTERM', 6.60, 1, 'CK22', 'SFD6633M'),
	('2025-03-17 23:27:00', '2025-03-18 01:39:00', 'SHORTTERM', 2.40, 1, 'C28', 'SFD6633M'),
	('2025-06-06 23:01:00', '2025-06-07 08:18:00', 'SHORTTERM', 10.20, 1, 'A36', 'SFD6633M');

-- Parking Mode: Seasonal


-- 10. Parking records for vehicle: SFE8844N
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-24 15:19:00', '2025-05-24 23:48:00', 'SHORTTERM', 9.60, 2, 'SK48', 'SFE8844N'),
	('2025-03-15 06:43:00', '2025-03-15 15:50:00', 'SHORTTERM', 10.80, 2, 'PM23', 'SFE8844N'),
	('2025-06-29 05:12:00', '2025-06-29 06:49:00', 'SHORTTERM', 1.80, 2, 'PM23', 'SFE8844N'),
	('2025-06-02 13:38:00', '2025-06-02 19:17:00', 'SHORTTERM', 6.60, 1, 'SK49', 'SFE8844N');

-- Parking Mode: Seasonal


-- 11. Parking records for vehicle: SFF1155P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-05 16:20:00', '2025-10-06 02:50:00', 'SHORTTERM', 12.00, 2, 'C28', 'SFF1155P'),
	('2025-08-21 03:20:00', '2025-08-21 09:03:00', 'SHORTTERM', 6.60, 1, 'SK15', 'SFF1155P'),
	('2025-01-08 18:43:00', '2025-01-09 05:05:00', 'SHORTTERM', 12.00, 1, 'SK48', 'SFF1155P'),
	('2025-03-16 21:05:00', '2025-03-16 22:28:00', 'SHORTTERM', 1.20, 2, 'SK15', 'SFF1155P');

-- Parking Mode: Seasonal


-- 12. Parking records for vehicle: SFG2266Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-12 03:04:00', '2025-06-12 04:09:00', 'SHORTTERM', 1.20, 1, 'J80M', 'SFG2266Q'),
	('2025-03-02 19:09:00', '2025-03-02 22:24:00', 'SHORTTERM', 3.60, 2, 'C28', 'SFG2266Q'),
	('2025-01-28 02:38:00', '2025-01-28 15:37:00', 'SHORTTERM', 12.00, 1, 'SB23', 'SFG2266Q'),
	('2025-03-01 16:53:00', '2025-03-02 01:53:00', 'SHORTTERM', 10.20, 2, 'JM24', 'SFG2266Q');

-- Parking Mode: Seasonal


-- 13. Parking records for vehicle: SFH3377R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-11 18:53:00', '2025-02-12 07:01:00', 'SHORTTERM', 14.40, 1, 'CK51', 'SFH3377R'),
	('2025-04-03 08:37:00', '2025-04-03 19:13:00', 'SHORTTERM', 12.00, 1, 'SE50', 'SFH3377R'),
	('2025-09-12 07:50:00', '2025-09-12 15:26:00', 'SHORTTERM', 9.00, 1, 'PM24', 'SFH3377R'),
	('2025-09-29 00:10:00', '2025-09-29 09:18:00', 'SHORTTERM', 10.80, 1, 'SK15', 'SFH3377R');

-- Parking Mode: Seasonal


-- 14. Parking records for vehicle: SFI4488S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-11-03 23:17:00', '2025-11-03 23:43:00', 'SHORTTERM', 0.00, 1, 'CK51', 'SFI4488S'),
	('2025-10-27 21:07:00', '2025-10-28 05:12:00', 'SHORTTERM', 9.00, 1, 'CK51', 'SFI4488S'),
	('2025-05-01 18:23:00', '2025-05-02 02:39:00', 'SHORTTERM', 9.60, 1, 'PL90', 'SFI4488S'),
	('2025-08-06 08:25:00', '2025-08-06 20:52:00', 'SHORTTERM', 12.00, 1, 'SK48', 'SFI4488S');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-28 01:02:00', 2, 49);

-- Parking Mode: Seasonal


-- 15. Parking records for vehicle: SFJ5599T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-14 10:39:00', '2025-09-14 13:50:00', 'SHORTTERM', 3.60, 2, 'W81', 'SFJ5599T'),
	('2025-04-19 11:13:00', '2025-04-19 14:14:00', 'SHORTTERM', 3.60, 2, 'SK48', 'SFJ5599T'),
	('2025-08-30 05:15:00', '2025-08-30 11:01:00', 'SHORTTERM', 6.60, 2, 'SK15', 'SFJ5599T'),
	('2025-07-25 14:23:00', '2025-07-26 04:11:00', 'SHORTTERM', 16.20, 1, 'C28', 'SFJ5599T'),
	('2025-01-20 04:20:00', '2025-01-20 04:45:00', 'SHORTTERM', 0.00, 1, 'PM24', 'SFJ5599T');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-20 04:39:00', 12, 56);

-- Parking Mode: Seasonal


-- 16. Parking records for vehicle: SFK6600U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-11 03:15:00', '2025-07-11 16:59:00', 'SHORTTERM', 12.00, 1, 'CK51', 'SFK6600U'),
	('2025-06-26 07:34:00', '2025-06-26 14:47:00', 'SHORTTERM', 8.40, 1, 'SK15', 'SFK6600U'),
	('2025-07-20 11:34:00', '2025-07-20 18:52:00', 'SHORTTERM', 8.40, 2, 'A34', 'SFK6600U'),
	('2025-06-28 18:24:00', '2025-06-29 06:15:00', 'SHORTTERM', 13.80, 2, 'CK25', 'SFK6600U');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-26 12:45:00', 7, 58);

-- Parking Mode: Seasonal


-- 17. Parking records for vehicle: SFL7711V
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-02 15:14:00', '2025-01-03 02:51:00', 'SHORTTERM', 13.20, 1, 'SE50', 'SFL7711V'),
	('2025-09-20 18:17:00', '2025-09-21 07:38:00', 'SHORTTERM', 15.60, 2, 'PL90', 'SFL7711V'),
	('2025-07-22 12:38:00', '2025-07-22 16:49:00', 'SHORTTERM', 4.80, 1, 'SK49', 'SFL7711V'),
	('2025-06-10 11:18:00', '2025-06-10 13:08:00', 'SHORTTERM', 1.80, 1, 'PL90', 'SFL7711V');

-- Parking Mode: Seasonal


-- 18. Parking records for vehicle: SFM8822W
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-28 18:18:00', '2025-10-29 01:26:00', 'SHORTTERM', 7.80, 1, 'W780', 'SFM8822W'),
	('2025-08-20 04:12:00', '2025-08-20 06:14:00', 'SHORTTERM', 2.40, 1, 'W81', 'SFM8822W'),
	('2025-02-11 21:15:00', '2025-02-12 07:50:00', 'SHORTTERM', 12.00, 1, 'A35', 'SFM8822W'),
	('2025-02-15 17:35:00', '2025-02-16 03:00:00', 'SHORTTERM', 10.80, 2, 'GE1A', 'SFM8822W');

-- Parking Mode: Seasonal


-- 19. Parking records for vehicle: SFN9933X
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-19 18:43:00', '2025-05-20 01:27:00', 'SHORTTERM', 7.20, 1, 'JM25', 'SFN9933X'),
	('2025-08-30 23:33:00', '2025-08-31 05:41:00', 'SHORTTERM', 6.60, 2, 'SE50', 'SFN9933X'),
	('2025-01-01 19:44:00', '2025-01-01 22:37:00', 'SHORTTERM', 3.00, 1, 'SK48', 'SFN9933X'),
	('2025-02-04 16:05:00', '2025-02-04 19:35:00', 'SHORTTERM', 4.20, 1, 'CK25', 'SFN9933X');

-- Parking Mode: Seasonal


-- 20. Parking records for vehicle: SFP0044Y
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-01 18:22:00', '2025-07-02 04:23:00', 'SHORTTERM', 11.40, 1, 'B13', 'SFP0044Y'),
	('2025-10-06 05:00:00', '2025-10-06 07:15:00', 'SHORTTERM', 2.40, 1, 'C28', 'SFP0044Y'),
	('2025-10-05 17:26:00', '2025-10-05 20:59:00', 'SHORTTERM', 4.20, 2, 'JM24', 'SFP0044Y');

-- Parking Mode: Seasonal


-- 21. Parking records for vehicle: SFQ1156Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-18 07:26:00', '2025-07-18 17:19:00', 'SHORTTERM', 11.40, 1, 'B13', 'SFQ1156Z'),
	('2025-07-14 06:19:00', '2025-07-14 17:39:00', 'SHORTTERM', 12.00, 1, 'PM24', 'SFQ1156Z'),
	('2025-09-27 12:59:00', '2025-09-28 00:21:00', 'SHORTTERM', 12.00, 2, 'W81', 'SFQ1156Z');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-14 15:28:00', 10, 77);

-- Parking Mode: Seasonal


-- 22. Parking records for vehicle: SGL6619A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-11 22:50:00', '2025-02-12 09:14:00', 'SHORTTERM', 12.00, 1, 'PM24', 'SGL6619A'),
	('2025-08-10 09:50:00', '2025-08-10 11:21:00', 'SHORTTERM', 1.80, 2, 'PL80', 'SGL6619A'),
	('2025-02-04 17:57:00', '2025-02-05 00:53:00', 'SHORTTERM', 7.80, 1, 'PM23', 'SGL6619A'),
	('2025-06-10 19:57:00', '2025-06-11 01:31:00', 'SHORTTERM', 6.60, 1, 'PL90', 'SGL6619A'),
	('2025-10-23 14:30:00', '2025-10-23 20:50:00', 'SHORTTERM', 7.20, 1, 'CK25', 'SGL6619A');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-11 00:14:00', 5, 82);

-- Parking Mode: Seasonal


-- 23. Parking records for vehicle: SGX2201C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-13 16:47:00', '2025-01-13 16:56:00', 'SHORTTERM', 0.00, 1, 'SB23', 'SGX2201C'),
	('2025-05-18 18:12:00', '2025-05-19 04:57:00', 'SHORTTERM', 12.00, 2, 'PM24', 'SGX2201C'),
	('2025-08-28 22:00:00', '2025-08-28 23:26:00', 'SHORTTERM', 1.20, 1, 'SK48', 'SGX2201C'),
	('2025-01-26 18:23:00', '2025-01-27 04:56:00', 'SHORTTERM', 12.00, 2, 'C28', 'SGX2201C'),
	('2025-03-22 16:10:00', '2025-03-23 05:06:00', 'SHORTTERM', 15.00, 2, 'SK48', 'SGX2201C');

-- Parking Mode: Seasonal


-- 24. Parking records for vehicle: SGX4420C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-26 03:41:00', '2025-02-26 13:59:00', 'SHORTTERM', 12.00, 1, 'SK15', 'SGX4420C'),
	('2025-10-06 14:22:00', '2025-10-07 02:49:00', 'SHORTTERM', 14.40, 1, 'A34', 'SGX4420C'),
	('2025-07-09 08:38:00', '2025-07-09 21:15:00', 'SHORTTERM', 12.00, 1, 'PL90', 'SGX4420C'),
	('2025-04-10 21:41:00', '2025-04-10 23:23:00', 'SHORTTERM', 1.80, 1, 'PL90', 'SGX4420C'),
	('2025-07-11 23:02:00', '2025-07-12 10:34:00', 'SHORTTERM', 12.60, 1, 'SK49', 'SGX4420C');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-07 02:31:00', 7, 90);

-- Parking Mode: Seasonal


-- 25. Parking records for vehicle: SGX7722C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-10 12:22:00', '2025-02-10 23:23:00', 'SHORTTERM', 12.00, 1, 'A35', 'SGX7722C'),
	('2025-10-29 20:04:00', '2025-10-30 08:55:00', 'SHORTTERM', 14.40, 1, 'B13', 'SGX7722C'),
	('2025-07-18 00:02:00', '2025-07-18 03:34:00', 'SHORTTERM', 4.20, 1, 'C28', 'SGX7722C'),
	('2025-05-30 11:47:00', '2025-05-30 17:48:00', 'SHORTTERM', 7.20, 1, 'SK48', 'SGX7722C');

-- Parking Mode: Seasonal


-- 26. Parking records for vehicle: SJA1234K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-11 22:14:00', '2025-04-12 04:24:00', 'SHORTTERM', 6.60, 1, 'SE50', 'SJA1234K'),
	('2025-04-17 11:30:00', '2025-04-17 19:08:00', 'SHORTTERM', 9.00, 1, 'JM25', 'SJA1234K'),
	('2025-06-30 21:25:00', '2025-07-01 04:47:00', 'SHORTTERM', 8.40, 1, 'A36', 'SJA1234K'),
	('2025-02-23 20:47:00', '2025-02-24 06:33:00', 'SHORTTERM', 11.40, 2, 'A36', 'SJA1234K'),
	('2025-02-06 04:28:00', '2025-02-06 12:25:00', 'SHORTTERM', 9.00, 1, 'PM23', 'SJA1234K');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-06 11:27:00', 12, 102);

-- Parking Mode: Seasonal


-- 27. Parking records for vehicle: SJJ2208B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-15 07:10:00', '2025-05-15 09:29:00', 'SHORTTERM', 2.40, 1, 'CK22', 'SJJ2208B'),
	('2025-02-17 11:03:00', '2025-02-17 21:23:00', 'SHORTTERM', 12.00, 1, 'JM25', 'SJJ2208B'),
	('2025-08-08 08:27:00', '2025-08-08 18:50:00', 'SHORTTERM', 12.00, 1, 'JM24', 'SJJ2208B');

-- Parking Mode: Seasonal


-- 28. Parking records for vehicle: SJJ8811B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-17 05:05:00', '2025-10-17 18:46:00', 'SHORTTERM', 12.00, 1, 'J80M', 'SJJ8811B'),
	('2025-01-13 19:16:00', '2025-01-14 04:47:00', 'SHORTTERM', 10.80, 1, 'A34', 'SJJ8811B'),
	('2025-01-11 02:39:00', '2025-01-11 05:45:00', 'SHORTTERM', 3.60, 2, 'CK22', 'SJJ8811B'),
	('2025-08-16 03:29:00', '2025-08-16 15:35:00', 'SHORTTERM', 12.00, 2, 'A35', 'SJJ8811B');

-- Parking Mode: Seasonal


-- 29. Parking records for vehicle: SJQ9021M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-01 04:18:00', '2025-06-01 07:52:00', 'SHORTTERM', 4.20, 2, 'PM24', 'SJQ9021M'),
	('2025-05-14 07:41:00', '2025-05-14 12:52:00', 'SHORTTERM', 6.00, 1, 'PL90', 'SJQ9021M'),
	('2025-08-05 12:06:00', '2025-08-05 23:37:00', 'SHORTTERM', 12.00, 1, 'C28', 'SJQ9021M'),
	('2025-08-17 00:12:00', '2025-08-17 12:55:00', 'SHORTTERM', 12.00, 2, 'J80M', 'SJQ9021M');

-- Parking Mode: Seasonal


-- 30. Parking records for vehicle: SKB3310Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-10 04:38:00', '2025-08-10 05:11:00', 'SHORTTERM', 0.60, 2, 'A36', 'SKB3310Z'),
	('2025-08-02 15:22:00', '2025-08-02 23:24:00', 'SHORTTERM', 9.60, 2, 'JM25', 'SKB3310Z'),
	('2025-02-15 14:17:00', '2025-02-16 01:52:00', 'SHORTTERM', 13.20, 2, 'A34', 'SKB3310Z'),
	('2025-06-30 11:52:00', '2025-06-30 12:37:00', 'SHORTTERM', 0.60, 1, 'W780', 'SKB3310Z');

-- Parking Mode: Seasonal


-- 31. Parking records for vehicle: SKE2214T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-28 20:41:00', '2025-01-29 03:27:00', 'SHORTTERM', 7.20, 1, 'SK48', 'SKE2214T'),
	('2025-05-13 08:37:00', '2025-05-13 09:46:00', 'SHORTTERM', 1.20, 1, 'A34', 'SKE2214T'),
	('2025-10-02 06:17:00', '2025-10-02 09:16:00', 'SHORTTERM', 3.00, 1, 'CK22', 'SKE2214T');

-- Parking Mode: Seasonal


-- 32. Parking records for vehicle: SKH7702J
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-16 04:43:00', '2025-07-16 15:31:00', 'SHORTTERM', 12.00, 1, 'SE50', 'SKH7702J'),
	('2025-03-22 08:42:00', '2025-03-22 19:04:00', 'SHORTTERM', 12.00, 2, 'SK48', 'SKH7702J'),
	('2025-04-05 05:50:00', '2025-04-05 18:45:00', 'SHORTTERM', 12.00, 2, 'A36', 'SKH7702J');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-05 08:59:00', 11, 123);

-- Parking Mode: Seasonal


-- 33. Parking records for vehicle: SKZ1144F
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-05 23:16:00', '2025-05-06 05:32:00', 'SHORTTERM', 7.20, 1, 'SK49', 'SKZ1144F'),
	('2025-08-03 08:44:00', '2025-08-03 12:22:00', 'SHORTTERM', 4.20, 2, 'GE1A', 'SKZ1144F'),
	('2025-01-08 05:23:00', '2025-01-08 18:17:00', 'SHORTTERM', 12.00, 1, 'GE1A', 'SKZ1144F'),
	('2025-06-08 02:33:00', '2025-06-08 10:42:00', 'SHORTTERM', 9.60, 2, 'CK25', 'SKZ1144F'),
	('2025-01-10 06:10:00', '2025-01-10 14:24:00', 'SHORTTERM', 9.60, 1, 'C28', 'SKZ1144F');

-- Parking Mode: Seasonal


-- 34. Parking records for vehicle: SKZ7714F
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-28 08:02:00', '2025-08-28 15:17:00', 'SHORTTERM', 8.40, 1, 'CK25', 'SKZ7714F'),
	('2025-06-06 09:40:00', '2025-06-06 15:48:00', 'SHORTTERM', 7.20, 1, 'W780', 'SKZ7714F'),
	('2025-09-18 19:35:00', '2025-09-19 00:14:00', 'SHORTTERM', 4.80, 1, 'PM23', 'SKZ7714F'),
	('2025-07-09 12:08:00', '2025-07-09 19:20:00', 'SHORTTERM', 8.40, 1, 'SK15', 'SKZ7714F');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-18 19:59:00', 12, 131),
	('2025-07-09 14:12:00', 8, 132);

-- Parking Mode: Seasonal


-- 35. Parking records for vehicle: SLA1176A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-09 08:32:00', '2025-04-09 20:47:00', 'SHORTTERM', 12.00, 1, 'A35', 'SLA1176A'),
	('2025-01-11 07:38:00', '2025-01-11 18:11:00', 'SHORTTERM', 12.00, 2, 'W780', 'SLA1176A'),
	('2025-06-28 14:38:00', '2025-06-29 03:36:00', 'SHORTTERM', 15.00, 2, 'SK48', 'SLA1176A'),
	('2025-04-11 14:08:00', '2025-04-11 21:33:00', 'SHORTTERM', 8.40, 1, 'W780', 'SLA1176A'),
	('2025-09-07 06:10:00', '2025-09-07 18:31:00', 'SHORTTERM', 12.00, 2, 'PL90', 'SLA1176A');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-09 20:47:00', 4, 133);

-- Parking Mode: Seasonal


-- 36. Parking records for vehicle: SLA4490A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-21 12:59:00', '2025-10-21 21:09:00', 'SHORTTERM', 9.60, 1, 'SK48', 'SLA4490A'),
	('2025-01-27 00:56:00', '2025-01-27 10:05:00', 'SHORTTERM', 10.80, 1, 'B13', 'SLA4490A'),
	('2025-01-25 07:33:00', '2025-01-25 07:45:00', 'SHORTTERM', 0.00, 2, 'SK49', 'SLA4490A'),
	('2025-09-24 18:40:00', '2025-09-25 04:15:00', 'SHORTTERM', 10.80, 1, 'W44', 'SLA4490A'),
	('2025-09-13 04:54:00', '2025-09-13 16:09:00', 'SHORTTERM', 12.00, 2, 'SK15', 'SLA4490A');

-- Parking Mode: Seasonal


-- 37. Parking records for vehicle: SLH2205U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-05 01:31:00', '2025-10-05 15:12:00', 'SHORTTERM', 12.00, 2, 'A34', 'SLH2205U'),
	('2025-09-04 22:51:00', '2025-09-04 22:53:00', 'SHORTTERM', 0.00, 1, 'SK15', 'SLH2205U'),
	('2025-05-17 06:48:00', '2025-05-17 20:23:00', 'SHORTTERM', 12.00, 2, 'PL80', 'SLH2205U'),
	('2025-06-09 07:07:00', '2025-06-09 19:23:00', 'SHORTTERM', 12.00, 1, 'GE1A', 'SLH2205U');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-05 08:24:00', 6, 143);

-- Parking Mode: Seasonal


-- 38. Parking records for vehicle: SLP4410S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-26 08:22:00', '2025-10-26 22:09:00', 'SHORTTERM', 12.00, 2, 'PM24', 'SLP4410S'),
	('2025-04-03 19:46:00', '2025-04-03 21:08:00', 'SHORTTERM', 1.20, 1, 'PL90', 'SLP4410S'),
	('2025-07-31 20:46:00', '2025-08-01 04:06:00', 'SHORTTERM', 8.40, 1, 'JM25', 'SLP4410S'),
	('2025-07-27 12:42:00', '2025-07-27 23:30:00', 'SHORTTERM', 12.00, 2, 'SK15', 'SLP4410S');

-- Parking Mode: Seasonal


-- 39. Parking records for vehicle: SLS5501R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-01 05:26:00', '2025-01-01 06:39:00', 'SHORTTERM', 1.20, 1, 'J80M', 'SLS5501R'),
	('2025-01-25 16:05:00', '2025-01-25 22:34:00', 'SHORTTERM', 7.20, 2, 'GE1A', 'SLS5501R'),
	('2025-10-05 10:15:00', '2025-10-05 18:19:00', 'SHORTTERM', 9.60, 2, 'W81', 'SLS5501R'),
	('2025-01-30 14:44:00', '2025-01-30 16:08:00', 'SHORTTERM', 1.20, 1, 'SK15', 'SLS5501R');

-- Parking Mode: Seasonal


-- 40. Parking records for vehicle: SLU6620S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-26 13:45:00', '2025-04-26 22:17:00', 'SHORTTERM', 10.20, 2, 'A36', 'SLU6620S'),
	('2025-03-24 19:29:00', '2025-03-24 22:33:00', 'SHORTTERM', 3.60, 1, 'W780', 'SLU6620S'),
	('2025-03-31 02:42:00', '2025-03-31 13:12:00', 'SHORTTERM', 12.00, 1, 'C28', 'SLU6620S'),
	('2025-01-27 06:42:00', '2025-01-27 15:02:00', 'SHORTTERM', 9.60, 1, 'SK48', 'SLU6620S');

-- Parking Mode: Seasonal


-- 41. Parking records for vehicle: SLZ9904D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-22 03:25:00', '2025-03-22 13:46:00', 'SHORTTERM', 12.00, 2, 'PL90', 'SLZ9904D'),
	('2025-03-30 01:22:00', '2025-03-30 06:46:00', 'SHORTTERM', 6.00, 2, 'SK15', 'SLZ9904D'),
	('2025-05-15 21:35:00', '2025-05-16 09:24:00', 'SHORTTERM', 13.20, 1, 'A34', 'SLZ9904D'),
	('2025-05-12 17:17:00', '2025-05-13 06:51:00', 'SHORTTERM', 15.60, 1, 'SK49', 'SLZ9904D'),
	('2025-09-21 20:57:00', '2025-09-22 01:11:00', 'SHORTTERM', 4.80, 2, 'SK48', 'SLZ9904D');

-- Parking Mode: Seasonal


-- 42. Parking records for vehicle: SMC1122H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-05 17:14:00', '2025-03-05 23:30:00', 'SHORTTERM', 7.20, 1, 'W45', 'SMC1122H'),
	('2025-08-07 05:27:00', '2025-08-07 07:46:00', 'SHORTTERM', 2.40, 1, 'SK49', 'SMC1122H'),
	('2025-07-24 14:22:00', '2025-07-24 15:44:00', 'SHORTTERM', 1.20, 1, 'SK48', 'SMC1122H'),
	('2025-01-21 03:27:00', '2025-01-21 15:46:00', 'SHORTTERM', 12.00, 1, 'B13', 'SMC1122H');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-21 03:57:00', 6, 167);

-- Parking Mode: Seasonal


-- 43. Parking records for vehicle: SMC7788H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-14 01:50:00', '2025-06-14 10:36:00', 'SHORTTERM', 10.20, 2, 'CK22', 'SMC7788H'),
	('2025-09-06 08:48:00', '2025-09-06 22:32:00', 'SHORTTERM', 12.00, 2, 'B13', 'SMC7788H'),
	('2025-08-10 08:43:00', '2025-08-10 14:25:00', 'SHORTTERM', 6.60, 2, 'SB23', 'SMC7788H');

-- Parking Mode: Seasonal


-- 44. Parking records for vehicle: SMD4521L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-18 08:09:00', '2025-06-18 11:09:00', 'SHORTTERM', 3.60, 1, 'PL90', 'SMD4521L'),
	('2025-06-20 05:08:00', '2025-06-20 10:39:00', 'SHORTTERM', 6.60, 1, 'J80M', 'SMD4521L'),
	('2025-08-05 01:49:00', '2025-08-05 11:37:00', 'SHORTTERM', 11.40, 1, 'PM23', 'SMD4521L'),
	('2025-07-12 09:10:00', '2025-07-12 12:57:00', 'SHORTTERM', 4.20, 2, 'A35', 'SMD4521L');

-- Parking Mode: Seasonal


-- 45. Parking records for vehicle: SMU7781P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-25 15:14:00', '2025-02-26 01:11:00', 'SHORTTERM', 11.40, 1, 'JM24', 'SMU7781P'),
	('2025-07-12 02:04:00', '2025-07-12 15:36:00', 'SHORTTERM', 12.00, 2, 'C28', 'SMU7781P'),
	('2025-08-28 17:33:00', '2025-08-29 05:35:00', 'SHORTTERM', 13.80, 1, 'JM25', 'SMU7781P'),
	('2025-09-21 09:59:00', '2025-09-21 11:13:00', 'SHORTTERM', 1.20, 2, 'CK25', 'SMU7781P');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-25 19:49:00', 4, 175),
	('2025-09-21 10:39:00', 7, 178);

-- Parking Mode: Seasonal


-- 46. Parking records for vehicle: SNE5528R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-07 07:34:00', '2025-02-07 15:10:00', 'SHORTTERM', 9.00, 1, 'J80M', 'SNE5528R'),
	('2025-01-25 23:54:00', '2025-01-26 09:50:00', 'SHORTTERM', 11.40, 2, 'CK22', 'SNE5528R'),
	('2025-08-30 06:03:00', '2025-08-30 07:59:00', 'SHORTTERM', 1.80, 2, 'PM24', 'SNE5528R');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-07 07:58:00', 10, 179);

-- Parking Mode: Seasonal


-- 47. Parking records for vehicle: SNL9876T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-12 04:31:00', '2025-03-12 12:08:00', 'SHORTTERM', 9.00, 1, 'A34', 'SNL9876T'),
	('2025-07-06 07:19:00', '2025-07-06 12:30:00', 'SHORTTERM', 6.00, 2, 'JM24', 'SNL9876T'),
	('2025-08-07 05:41:00', '2025-08-07 05:46:00', 'SHORTTERM', 0.00, 1, 'SK49', 'SNL9876T');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-12 08:20:00', 2, 182),
	('2025-07-06 07:25:00', 10, 183);

-- Parking Mode: Seasonal


-- 48. Parking records for vehicle: SNY2035D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, exit_datetime, parking_mode, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-06 18:20:00', '2025-07-07 00:27:00', 'SHORTTERM', 6.60, 2, 'W44', 'SNY2035D'),
	('2025-03-23 01:35:00', '2025-03-23 06:15:00', 'SHORTTERM', 5.40, 2, 'A35', 'SNY2035D'),
	('2025-09-13 18:12:00', '2025-09-14 08:01:00', 'SHORTTERM', 16.20, 2, 'A35', 'SNY2035D');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-06 23:52:00', 10, 185);

-- Parking Mode: Seasonal

