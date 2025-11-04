USE tddag1;

IF OBJECT_ID('tempdb..#people') IS NOT NULL DROP TABLE #people;
IF OBJECT_ID('tempdb..#vehicle_details') IS NOT NULL DROP TABLE #vehicle_details;
IF OBJECT_ID('tempdb..#vehicle_model') IS NOT NULL DROP TABLE #vehicle_model;
IF OBJECT_ID('tempdb..#residence') IS NOT NULL DROP TABLE #residence;

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
CREATE TABLE #hdb_block (
	postal_code     CHAR(6)	        NOT NULL,
	block_no        VARCHAR(10)     NOT NULL,
	street_name     VARCHAR(255)    NOT NULL,
	carpark_id      VARCHAR(100)	NOT NULL,
);
CREATE TABLE #residence (
	unit_no         VARCHAR(10)     NOT NULL, -- e.g., '#03-215'
	postal_code     CHAR(6)         NOT NULL 
    PRIMARY KEY(unit_no, postal_code)
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
    ('Impreza','Subaru','car'),
    ('CB400','Honda','motorcycle'),
    ('Wave 125','Honda','motorcycle'),
    ('NMAX 155','Yamaha','motorcycle'),
    ('MT-07','Yamaha','motorcycle'),
    ('Versys 650','Kawasaki','motorcycle'),
    ('Burgman 400','Suzuki','motorcycle'),
    ('Hiace','Toyota','commercial'),
    ('NV350','Nissan','commercial'),
    ('K2500','Kia','commercial'),
    ('H100','Hyundai','commercial'),
    ('Canter','Mitsubishi','commercial'),
    ('Sprinter','Mercedes-Benz','commercial');

-- Insert hdb block details into temp table
INSERT INTO #hdb_block(postal_code, block_no, street_name, carpark_id) 
VALUES
    (560422, '422', 'Ang Mo Kio Ave 3', 'A34'),
    (560426, '426', 'Ang Mo Kio Ave 3', 'A35'),
    (560440, '440', 'Ang Mo Kio Ave 10', 'A36'),
    (550232, '232', 'Serangoon Ave 3', 'SE50'),
    (120204, '204', 'Clementi Ave 6', 'C28'),
    (120205, '205', 'Clementi Ave 6', 'C28'),
    (542319, '319B', 'Anchorvale Dr', 'SK49'),
    (542320, '320B', 'Anchorvale Dr', 'SK48'),
    (543250, '250C', 'Compassvale St', 'SK15'),
    (540252, '252', 'Compassvale St', 'SK15'),
    (821445, '445A', 'New Punggol Rd', 'PL90'),
    (822409, '409B', 'Northshore Dr', 'PL80'),
    (640735, '735', 'Jurong West St 75', 'J80M'),
    (641672, '672A', 'Jurong West St 65', 'JM25'),
    (642654, '654B', 'Jurong West St 61', 'JM24'),
    (642655, '655B', 'Jurong West St 61', 'JM24'),
    (680344, '344', 'Choa Chu Kang Loop', 'CK22'),
    (680354, '354', 'Choa Chu Kang Central', 'CK25'),
    (680618, '618', 'Choa Chu Kang North 7', 'CK51'),
    (730411, '411', 'Woodlands Street 41', 'W44'),
    (730418, '418', 'Woodlands Street 41', 'W45'),
    (730421, '421', 'Woodlands Street 41', 'W45'),
    (735780, '780E', 'Woodlands Cres', 'W780'),
    (735786, '786B', 'Woodlands Drive 60', 'W81'),
    (754354, '354D', 'Admiralty Dr', 'SB23'),
    (510560, '560', 'Pasir Ris Street 51', 'PM24'),
    (510566, '556', 'Pasir Ris Street 51', 'PM23'),
    (460425, '425', 'Bedok North Rd', 'B13'),
    (460426, '426', 'Bedok North Rd', 'B13'),
    (380103, '103', 'Aljunied Cres', 'GE1A');

-- Insert residence details into temp table
INSERT INTO #residence(unit_no, postal_code) 
VALUES
    ('#02-53', 560422),
    ('#03-54', 560426),
    ('#04-215', 560444),
    ('#05-26', 550232),
    ('#09-03', 120204),
    ('#10-03', 120205),
    ('#05-25', 542319),
    ('#06-152', 542320),
    ('#11-143', 543250),
    ('#13-29', 543252),
    ('#27-47', 821445),
    ('#12-45', 822409),
    ('#31-134', 640735),
    ('#15-26', 641672),
    ('#07-02', 642654),
    ('#08-07', 642655),
    ('#11-54', 680344),
    ('#12-29', 680354),
    ('#25-42', 680618),
    ('#27-31', 730411),
    ('#11-111', 730418),
    ('#22-12', 730420),
    ('#28-191', 735780),
    ('#02-57', 735786),
    ('#04-211', 754354),
    ('#30-112', 510560),
    ('#33-134', 520566),
    ('#07-101', 460425),
    ('#09-105', 460426),
    ('#10-121', 380103);

--sanity checks
IF OBJECT_ID('tempdb..#people')          IS NULL RAISERROR('#people missing',16,1);
IF OBJECT_ID('tempdb..#vehicle_details') IS NULL RAISERROR('#vehicle_details missing',16,1);
IF OBJECT_ID('tempdb..#vehicle_model')   IS NULL RAISERROR('#vehicle_model missing',16,1);
IF OBJECT_ID('tempdb..#residence')       IS NULL RAISERROR('#residence missing',16,1);

IF NOT EXISTS (SELECT 1 FROM #people)           RAISERROR('#people empty',16,1);
IF NOT EXISTS (SELECT 1 FROM #vehicle_details)  RAISERROR('#vehicle_details empty',16,1);
IF NOT EXISTS (SELECT 1 FROM #vehicle_model)    RAISERROR('#vehicle_model empty',16,1);
IF NOT EXISTS (SELECT 1 FROM #residence)        RAISERROR('#residence empty',16,1);

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

-- Insert residences into main RESIDENCE table
INSERT INTO residence(unit_no, postal_code)
    SELECT DISTINCT 
        r.unit_no, 
        r.postal_code
    FROM #residence r
    WHERE NOT EXISTS (
        SELECT 
            1 
        FROM residence x
        WHERE x.unit_no = r.unit_no AND x.postal_code = r.postal_code
    );

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
INSERT INTO vehicle_model(model, brand, vehicle_type)
    SELECT 
        m.model, 
        m.brand, 
        m.vehicle_type
    FROM #vehicle_model m
    WHERE NOT EXISTS (
        SELECT 
            1
        FROM vehicle_model d
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
    FROM vehicle_model vm; -- use main table (ensures we only assign to inserted models)

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

-- Insert data into season_rate
INSERT INTO SeasonRate (monthly_charges, tier, carpark_type, vehicle_type)
VALUES
	(80.00, 1, 'surface', 'car'),
	(165.00, 2, 'surface', 'car'),
	(15.00, 0, 'surface', 'motorcycle'),
	(185.00, 0, 'surface', 'commercial'),
	(110.00, 1, 'sheltered', 'car'),
	(190.00, 2, 'sheltered', 'car'),
	(17.00, 0, 'sheltered', 'motorcycle'),
	(185.00, 0, 'sheltered', 'commercial');

CREATE TABLE #season_pass_dates (
	start_date DATE,
	end_date DATE,
	purchase_datetime DATETIME
	);

INSERT INTO #season_pass_dates (start_date, end_date, purchase_datetime)
VALUES
	('2025-11-01', '2025-11-30', '2025-10-27 09:00:00'),
	('2025-11-01', '2025-11-30', '2025-10-27 13:00:00'),
	('2025-11-01', '2025-11-30', '2025-10-28 10:10:00'),
	('2025-11-01', '2025-11-30', '2025-10-28 15:00:00'),
	('2025-11-01', '2025-11-30', '2025-10-29 14:05:00'),
	('2025-11-01', '2025-11-30', '2025-10-29 14:10:00'),
	('2025-11-01', '2025-11-30', '2025-10-30 14:05:00'),
	('2025-11-01', '2025-11-30', '2025-10-30 11:40:00'),
	('2025-11-01', '2025-11-30', '2025-10-30 12:15:00'),
	('2025-11-01', '2025-11-30', '2025-10-30 16:15:00'),
	('2025-12-01', '2025-12-31', '2025-11-28 10:00:00'),
	('2025-12-01', '2025-12-31', '2025-11-28 12:00:00'),
	('2025-12-01', '2025-12-31', '2025-11-29 11:20:00'),
	('2025-12-01', '2025-12-31', '2025-11-30 15:05:00'),
	('2025-12-01', '2025-12-31', '2025-11-30 10:20:00'),
	('2025-01-01', '2026-01-31', '2025-12-28 16:00:00'),
	('2025-01-01', '2026-01-31', '2025-12-29 11:10:00'),
	('2025-01-01', '2026-01-31', '2025-12-30 13:00:00'),
	('2025-01-01', '2026-01-31', '2025-12-30 14:05:00'),
	('2025-01-01', '2026-01-31', '2025-12-31 15:35:00'),
	('2025-02-01', '2026-02-28', '2026-01-28 16:30:00'),
	('2025-02-01', '2026-02-28', '2026-01-29 12:30:00'),
	('2025-02-01', '2026-02-28', '2026-01-29 11:00:00'),
	('2025-02-01', '2026-02-28', '2026-01-30 10:15:00'),
	('2025-02-01', '2026-02-28', '2026-01-31 13:35:00'),
	('2025-03-01', '2026-03-31', '2026-02-27 13:30:00'),
	('2025-03-01', '2026-03-31', '2026-02-27 11:05:00'),
	('2025-03-01', '2026-03-31', '2026-02-28 14:45:00'),
	('2025-03-01', '2026-03-31', '2026-02-28 10:25:00'),
	('2025-03-01', '2026-03-31', '2026-02-28 13:05:00');

INSERT INTO SeasonalPass (status, start_date, end_date, amount_paid, pass_type, purchase_datetime, season_rate_id, carpark_id, vrn)
	SELECT TOP (30)
		'Active' AS status,
		s.start_date,
		s.end_date,
		sr.monthly_charges AS amount_paid,
		CASE WHEN RAND(CHECKSUM(NEWID())) < 0.6 THEN 'Resident' ELSE 'Non-Resident' END AS pass_type,
		s.purchase_datetime,
		sr.season_rate_id,
		c.carpark_id,
		v.vrn
	FROM #season_pass_dates
	CROSS APPLY (
		SELECT TOP 1 v.vrn, v.vehicle_type
		FROM Vehicle v
		ORDER BY NEWID()
	) v
	CROSS APPLY (
		SELECT TOP 1 c.carpark_id, c.season_total_quota
		FROM Carpark c
		ORDER BY NEWID()
	) c
	JOIN SeasonRate sr
		ON sr.vehicle_type = v.vehicle_type
		AND sr.carpark_type = CASE WHEN c.carpark_id LIKE 'TWM%' THEN 'sheltered' ELSE 'surface' END
	ORDER BY s.purchase_datetime;

DROP TABLE #season_pass_dates

-- Insert data into lot_type
INSERT INTO LotType (color)
VALUES 
	('Red'),
	('Red_white'),
	('White'),
	('Yellow');

-- Cars
INSERT INTO ShortTermRates 
(vehicle_type, price, start_time, end_time, day_type, cap_amount, cap_scope)
VALUES
('Car', 1.20, '07:00', '17:00', 'Weekday', 20.00, 'Per Day'),
('Car', 0.60, '17:00', '22:30', 'Weekday', 10.00, 'Per Day'),
('Car', 0.80, '07:00', '22:30', 'Weekend/Public Holiday', 12.00, 'Per Day'),
('Car', 0.70, '22:30', '07:00', 'All', 5.00, 'Per Entry');

-- Motorcycles
INSERT INTO ShortTermRates 
(vehicle_type, price, start_time, end_time, day_type, cap_amount, cap_scope)
VALUES
('Motorcycle', 0.65, '07:00', '22:30', 'All', 0.65, 'Per Lot'),
('Motorcycle', 0.30, '22:30', '07:00', 'All', 0.65, 'Per Lot');

-- Commercial Vehicles (Lorries, Vans, Trucks)
INSERT INTO ShortTermRates 
(vehicle_type, price, start_time, end_time, day_type, cap_amount, cap_scope)
VALUES
('Commercial', 1.20, '07:00', '22:30', 'Weekday', 40.00, 'Per Day'),
('Commercial', 1.00, '07:00', '22:30', 'Weekend/Public Holiday', 30.00, 'Per Day'),
('Commercial', 0.80, '22:30', '07:00', 'All', 25.00, 'Per Entry');



INSERT INTO ParkingRule (rule_desc)
VALUES
('Parking in a place other than in a parking lot.'),
('Using a parking place for unauthorised purpose.'),
('Failure to pay parking charge prior to leaving a parking place.'),
('Parking in a parking place not designated for use by that class of vehicle.'),
('Drawing, driving, pushing, or parking a vehicle in a disorderly manner.'),
('Pushing or removing a motor vehicle without owner or driver permission.'),
('Parking against traffic flow.'),
('Failure to obey signs exhibited in the parking place.'),
('Parking beyond the boundaries of the parking lot causing obstruction.'),
('Entering a parking place other than through the proper access.'),
('Leaving a parking place other than through the proper exit.'),
('Repairing or allowing repairs to a motor vehicle in a parking place.'),
('Using a motor vehicle in a parking place to sell or promote goods.'),
('Causing or allowing a vehicle to be washed in a parking place.'),
('Failure to obey lawful directions given by parking wardens.'),
('Parking in a season parking place without valid season parking.'),
('Unauthorised parking in reserved lot or without displaying authorised label.'),
('Displaying altered or tampered authorisation label.'),
('Failure to produce authorisation on demand for inspection.'),
('No parking coupon or session.'),
('Selecting wrong car park of a lower charge.'),
('Selecting wrong vehicle class of a lower charge.'),
('Parking after expiry of session (half hour or less).'),
('Parking after expiry of session (half to one hour).'),
('Parking after expiry of session (exceeds one hour).'),
('Parking without displaying valid parking coupons or displaying insufficient amount.'),
('Parking and displaying invalid parking coupons.'),
('Parking coupon not clearly displayed.'),
('Displaying coupon with time later than actual parking time.'),
('Displaying altered or tampered parking coupon.'),
('Parking after expiry of coupon validity (half hour or less).'),
('Parking after expiry of coupon validity (half to one hour).'),
('Parking after expiry of coupon validity (exceeds one hour).'),
('Failing to produce coupon on demand for inspection.'),
('Illegal parking in common property.');

INSERT INTO RuleFines (rule_id, vehicle_type, fine_amount)
VALUES
(1, 'All', 70.00),
(2, 'All', 80.00),
(3, 'All', 70.00),
(4, 'All', 70.00),
(5, 'All', 70.00),
(6, 'All', 70.00),
(7, 'All', 70.00),
(8, 'All', 70.00),
(9, 'All', 70.00),
(10, 'All', 70.00),
(11, 'All', 70.00),
(12, 'All', 80.00),
(13, 'All', 80.00),
(14, 'All', 80.00),
(15, 'All', 70.00),
(16, 'All', 70.00),
(17, 'All', 70.00),
(18, 'All', 300.00),
(19, 'All', 300.00),
(20, 'All', 40.00),
(21, 'All', 40.00),
(22, 'All', 40.00),
(23, 'All', 8.00),
(24, 'All', 12.00),
(25, 'All', 24.00),
(26, 'All', 40.00),
(27, 'All', 40.00),
(28, 'All', 40.00),
(29, 'All', 40.00),
(30, 'All', 80.00),
(31, 'All', 8.00),
(32, 'All', 12.00),
(33, 'All', 24.00),
(34, 'All', 400.00),
(35, 'All', 100.00);

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

INSERT INTO LotType(color)
VALUES
    ('Red'),
    ('Red-With-White'),
    ('White');
INSERT INTO CarparkLot (lot_id, carpark_id)
    SELECT lt.lot_id, c.carpark_id
    FROM LotType AS lt
    CROSS JOIN Carpark AS c
    WHERE NOT EXISTS 
    (
        SELECT 1
        FROM CarparkLot cl
        WHERE cl.lot_id = lt.lot_id
        AND cl.carpark_id = c.carpark_id
    );

-- Clean up temporary tables
DROP TABLE #people;
DROP TABLE #vehicle_details;
DROP TABLE #vehicle_model;
DROP TABLE #residence;
DROP TABLE #people_order;
DROP TABLE #residence_order;
DROP TABLE #person_alloc;
DROP TABLE #owner_order;
DROP TABLE #veh_order;
DROP TABLE #model_order;
DROP TABLE #veh_first_pass;
DROP TABLE #veh_second_pass;
DROP TABLE #veh_all;
