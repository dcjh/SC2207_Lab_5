USE tddag1;

IF OBJECT_ID('tempdb..#people') IS NOT NULL DROP TABLE #people;
IF OBJECT_ID('tempdb..#vehicle_details') IS NOT NULL DROP TABLE #vehicle;
IF OBJECT_ID('tempdb..#vehicle_model') IS NOT NULL DROP TABLE #vehicle_model;

-- temp tables allow for data manipulation before inserting into actual tables

CREATE TABLE #people (
  nric          CHAR(9)      NOT NULL PRIMARY KEY,
  [name]        VARCHAR(100) NOT NULL,
  email         VARCHAR(255) NOT NULL,
  contact       VARCHAR(16)  NOT NULL,
);

CREATE TABLE #vehicle_details (
  vrn               VARCHAR(8)   NOT NULL PRIMARY KEY,
  obu_id_id         VARCHAR(32)  NOT NULL,
  model             VARCHAR(255) NOT NULL,
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
	unit_no         VARCHAR(10)     NOT NULL PRIMARY KEY, -- e.g., '#03-215'
	postal_code     INT             NOT NULL PRIMARY KEY
);

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

-- Clean up temporary tables
DROP TABLE #people;
DROP TABLE #vehicle_details;
DROP TABLE #vehicle_model;