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

CREATE TABLE #residence (
	unit_no         VARCHAR(10)     NOT NULL, -- e.g., '#03-215'
	postal_code     INT             NOT NULL 
    PRIMARY KEY(unit_no, postal_code)
);

-- Insert residence details into temp table
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

-- number residences and store order
INSERT INTO #residence_order(unit_no, postal_code, rn)
    SELECT 
        r.unit_no, 
        r.postal_code, 
        ROW_NUMBER() OVER (ORDER BY r.postal_code, r.unit_no)
    FROM #residence r;

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

-- Insert vehicles into main VEHICLE table
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
    FROM PERSON p;  -- use main table (ensures we only assign to inserted people)

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
    FROM vehicle_model vm;

-- ensure there is at least one owner to assign vehicles
DECLARE @owner_cnt INT = (SELECT COUNT(*) FROM #owner_order);
IF @owner_cnt = 0 RAISERROR('No owners in PERSON to assign vehicles.',16,1);
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

-- Insert into main VEHICLE table (idempotent by VRN)
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