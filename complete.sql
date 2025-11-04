USE tddag1;

DROP TABLE IF EXISTS CarparkLot;
DROP TABLE IF EXISTS LotType;
DROP TABLE IF EXISTS SeasonalPass;
DROP TABLE IF EXISTS Offence;
DROP TABLE IF EXISTS EntryExitMode;
DROP TABLE IF EXISTS ParkingSession;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Residence;
DROP TABLE IF EXISTS HdbBlock;
DROP TABLE IF EXISTS VehicleModel;
DROP TABLE IF EXISTS ShortTermRates;
DROP TABLE IF EXISTS RuleFines;
DROP TABLE IF EXISTS ParkingRule;
DROP TABLE IF EXISTS SeasonRate;
DROP TABLE IF EXISTS MSCP;
DROP TABLE IF EXISTS Carpark;

USE tddag1;

CREATE TABLE Carpark(
	carpark_id            VARCHAR(100)		NOT NULL,
	night_parking         BIT DEFAULT 0     NOT NULL,
	grace_minutes         INT DEFAULT 0     NOT NULL,
	season_total_quota    INT               NOT NULL,
	season_current_count  INT DEFAULT 0     NOT NULL,

	PRIMARY KEY (carpark_id),
	CHECK (season_current_count <= season_total_quota)
); 

CREATE TABLE MSCP (
    carpark_id        VARCHAR(100)   NOT NULL,
    clearance_height  DECIMAL(3,2) NOT NULL,
    deck_count        INT   NOT NULL,

	PRIMARY KEY (carpark_id),
    FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id)
		ON DELETE CASCADE,
);

CREATE TABLE SeasonRate(
	season_rate_id   INT IDENTITY(1,1)              NOT NULL,
	monthly_charges  MONEY                          NOT NULL,
	tier             INT                            NOT NULL,
	carpark_type     VARCHAR(50) DEFAULT 'Normal'   NOT NULL,
	vehicle_type     VARCHAR(255)                   NOT NULL,

	PRIMARY KEY (season_rate_id),
);

CREATE TABLE ParkingRule (
    rule_id INT IDENTITY(1, 1) NOT NULL,
    rule_desc VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (rule_id)
);

CREATE TABLE RuleFines (
    rule_id INT NOT NULL,
    vehicle_type VARCHAR(255) NOT NULL,
    fine_amount MONEY NOT NULL,
    PRIMARY KEY (rule_id, vehicle_type),
    FOREIGN KEY (rule_id) REFERENCES ParkingRule(rule_id)
		ON DELETE CASCADE
);



CREATE TABLE ShortTermRates(
	rate_id         INT IDENTITY(1, 1)  NOT NULL,
	vehicle_type    VARCHAR(255)        NOT NULL,
	price           MONEY               NOT NULL,
	start_time      TIME(0)             NOT NULL,
	end_time        TIME(0)             NOT NULL,
	day_type        VARCHAR(255)        NOT NULL,
	cap_amount      MONEY               NOT NULL,
	cap_scope       VARCHAR(255)        NOT NULL,

	PRIMARY KEY (rate_id),
);

CREATE TABLE VehicleModel (
	model           VARCHAR(255)        NOT NULL,
	brand           VARCHAR(255)        NOT NULL,
	vehicle_type    VARCHAR(255)        NOT NULL,

	PRIMARY KEY (model),
);

CREATE TABLE HdbBlock(
	postal_code     CHAR(6)			NOT NULL, -- preserve leading zeros
	block_no        VARCHAR(10)     NOT NULL,
	street_name     VARCHAR(255)    NOT NULL,
	carpark_id      VARCHAR(100)	NOT NULL,

	PRIMARY KEY (postal_code),
    CHECK (postal_code LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'), 
	FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id)
);

CREATE TABLE Residence(
	unit_no         VARCHAR(10)     	NOT NULL, -- e.g., '#03-215'
	postal_code     CHAR(6)             NOT NULL,

	PRIMARY KEY (unit_no, postal_code),
	FOREIGN KEY (postal_code) REFERENCES HdbBlock(postal_code)
);

CREATE TABLE Person(
	nric            CHAR(9)         NOT NULL, -- S/T/F/G + 7 digits + letter
    [name]          VARCHAR(255)    NOT NULL,
	email           VARCHAR(255)    NOT NULL,
	contact         VARCHAR(16)     NOT NULL, -- allows +65
	unit_no         VARCHAR(10)     NOT NULL,
	postal_code     CHAR(6)         NOT NULL,

	PRIMARY KEY (nric),
	FOREIGN KEY (unit_no, postal_code) REFERENCES residence(unit_no, postal_code),
    CHECK (nric LIKE '[STFG][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
    CHECK (contact LIKE '[89]_______' OR contact LIKE '+65[89]_______'),
    CHECK (postal_code LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE Vehicle(
	vrn                 VARCHAR(10)     NOT NULL,
	obu_id_id           VARCHAR(32)     NOT NULL UNIQUE, -- 10–32 alphanumeric
	color               VARCHAR(100)    NOT NULL,
	year_manufactured   INT             NOT NULL,
	sg_registered       BIT DEFAULT 1   NOT NULL,
	model               VARCHAR(255)    NOT NULL,
	nric                CHAR(9)         NOT NULL,

	PRIMARY KEY (vrn),
	FOREIGN KEY (model)  REFERENCES VehicleModel(model),
	FOREIGN KEY (nric)      REFERENCES Person(nric),
    CHECK (LEN(obu_id_id) BETWEEN 10 AND 32 AND obu_id_id NOT LIKE '%[^0-9A-Za-z]%')
);

CREATE TABLE ParkingSession(
	session_id      INT IDENTITY(1, 1)  NOT NULL,
    vrn             VARCHAR(10)         NOT NULL,
    carpark_id      VARCHAR(100)		NOT NULL,
	entry_datetime  DATETIME            NOT NULL,
	rate_id         INT,
	amount_paid     MONEY,


	PRIMARY KEY (session_id),
	FOREIGN KEY (rate_id)       REFERENCES ShortTermRates(rate_id) 
		ON DELETE SET NULL,
    FOREIGN KEY (carpark_id)    REFERENCES Carpark(carpark_id),
	FOREIGN KEY (vrn)           REFERENCES Vehicle(vrn),
);

CREATE TABLE EntryExitMode(
    vrn             VARCHAR(10)   NOT NULL,
    carpark_id      VARCHAR(100)  NOT NULL,
	entry_datetime  DATETIME      NOT NULL,
	exit_datetime   DATETIME      NOT NULL,
	parking_mode    VARCHAR(255)  NOT NULL,

    PRIMARY KEY (vrn, carpark_id, entry_datetime),
    FOREIGN KEY (vrn) REFERENCES Vehicle(vrn),
    FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id)
);

CREATE TABLE Offence(
	offense_id          INT IDENTITY(1, 1)  NOT NULL,
	offense_datetime    DATETIME            NOT NULL,
	rule_id             INT                 NOT NULL,
	session_id          INT                 NOT NULL,

	PRIMARY KEY (offense_id),
	FOREIGN KEY (rule_id)       REFERENCES ParkingRule(rule_id),
    FOREIGN KEY (session_id)    REFERENCES ParkingSession(session_id)
		ON DELETE CASCADE
);

CREATE TABLE SeasonalPass(
	season_utr          INT IDENTITY(1, 1)	NOT NULL,
	status              VARCHAR(255)		NOT NULL,
	start_date          DATE				NOT NULL,
	end_date            DATE				NOT NULL,
	amount_paid         MONEY				NOT NULL,
	pass_type           VARCHAR(255)		NOT NULL,
	purchase_datetime   DATETIME			NOT NULL,
	season_rate_id      INT				    NOT NULL,
	carpark_id          VARCHAR(100)		NOT NULL,
	vrn                 VARCHAR(10)			NOT NULL,

	PRIMARY KEY (season_utr),
    FOREIGN KEY (season_rate_id)    REFERENCES SeasonRate(season_rate_id),
	FOREIGN KEY (carpark_id)        REFERENCES Carpark(carpark_id),
	FOREIGN KEY (vrn)               REFERENCES Vehicle(vrn),
);

CREATE TABLE LotType(
	lot_id  INT IDENTITY(1, 1)	NOT NULL,
	color   VARCHAR(255)		NOT NULL,

	PRIMARY KEY (lot_id),
);

CREATE TABLE CarparkLot(
	lot_id      INT				NOT NULL,
	carpark_id  VARCHAR(100)	NOT NULL,

	PRIMARY KEY(carpark_id, lot_id),
	FOREIGN KEY (carpark_id)		REFERENCES Carpark(carpark_id)
		ON DELETE CASCADE
);

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

INSERT INTO CarparkLot (lot_id, carpark_id) VALUES
    (1, 'A34'),
    (2, 'A34'),
    (3, 'A34'),
    (1, 'A35'),
    (2, 'A35'),
    (3, 'A35'),
    (1, 'A36'),
    (2, 'A36'),
    (3, 'A36'),
    (1, 'SE50'),
    (2, 'SE50'),
    (3, 'SE50'),
    (1, 'C28'),
    (2, 'C28'),
    (3, 'C28'),
    (1, 'SK48'),
    (2, 'SK48'),
    (3, 'SK48'),
    (1, 'SK49'),
    (2, 'SK49'),
    (3, 'SK49'),
    (1, 'SK15'),
    (2, 'SK15'),
    (3, 'SK15'),
    (1, 'PL80'),
    (2, 'PL80'),
    (3, 'PL80'),
    (1, 'PL90'),
    (2, 'PL90'),
    (3, 'PL90'),
    (1, 'J80M'),
    (2, 'J80M'),
    (3, 'J80M'),
    (1, 'JM24'),
    (2, 'JM24'),
    (3, 'JM24'),
    (1, 'JM25'),
    (2, 'JM25'),
    (3, 'JM25'),
    (1, 'CK22'),
    (2, 'CK22'),
    (3, 'CK22'),
    (1, 'CK25'),
    (2, 'CK25'),
    (3, 'CK25'),
    (1, 'CK51'),
    (2, 'CK51'),
    (3, 'CK51'),
    (1, 'W44'),
    (2, 'W44'),
    (3, 'W44'),
    (1, 'W45'),
    (2, 'W45'),
    (3, 'W45'),
    (1, 'W780'),
    (2, 'W780'),
    (3, 'W780'),
    (1, 'W81'),
    (2, 'W81'),
    (3, 'W81'),
    (1, 'SB23'),
    (2, 'SB23'),
    (3, 'SB23'),
    (1, 'PM23'),
    (2, 'PM23'),
    (3, 'PM23'),
    (1, 'PM24'),
    (2, 'PM24'),
    (3, 'PM24'),
    (1, 'B13'),
    (2, 'B13'),
    (3, 'B13'),
    (1, 'GE1A'),
    (2, 'GE1A'),
    (3, 'GE1A');

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
    (1, 'motorcycle', 35.00),
    (1, 'car', 70.00),
    (1, 'commercial', 100.00),
    (2, 'motorcycle', 80.00),
    (2, 'car', 80.00),
    (2, 'commercial', 80.00),
    (3, 'motorcycle', 35.00),
    (3, 'car', 70.00),
    (3, 'commercial', 100.00),
    (4, 'motorcycle', 35.00),
    (4, 'car', 70.00),
    (4, 'commercial', 100.00),
    (5, 'motorcycle', 35.00),
    (5, 'car', 70.00),
    (5, 'commercial', 100.00),
    (6, 'motorcycle', 35.00),
    (6, 'car', 70.00),
    (6, 'commercial', 100.00),
    (7, 'motorcycle', 35.00),
    (7, 'car', 70.00),
    (7, 'commercial', 100.00),
    (8, 'motorcycle', 80.00),
    (8, 'car', 80.00),
    (8, 'commercial', 80.00),
    (9, 'motorcycle', 35.00),
    (9, 'car', 70.00),
    (9, 'commercial', 100.00),
    (10, 'motorcycle', 35.00),
    (10, 'car', 70.00),
    (10, 'commercial', 100.00),
    (11, 'motorcycle', 35.00),
    (11, 'car', 70.00),
    (11, 'commercial', 100.00),
    (12, 'motorcycle', 300.00),
    (12, 'car', 300.00),
    (12, 'commercial', 300.00),
    (13, 'motorcycle', 8.00),
    (13, 'car', 40.00),
    (13, 'commercial', 50.00),
    (14, 'motorcycle', 8.00),
    (14, 'car', 40.00),
    (14, 'commercial', 50.00),
    (15, 'motorcycle', 100.00),
    (15, 'car', 100.00),
    (15, 'commercial', 100.00);

    
INSERT INTO ShortTermRates (vehicle_type, price, start_time, end_time, day_type, cap_amount, cap_scope) VALUES 
     ('car', 0.60, '00:00:00', '23:59:59', 'Weekday', 12, 'Day'),
     ('car', 0.60, '00:00:00', '23:59:59', 'Weekend', 12, 'Day'),
     ('motorcycle', 0.65, '07:00:00', '22:30:00', 'DaySession', 5, 'Day'),
     ('motorcycle', 0.65, '22:30:01', '06:59:59', 'NightSession', 5, 'Day'),
     ('commercial', 1.20, '00:00:00', '23:59:59', 'AllDays', 12, 'Day');

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

INSERT INTO SeasonalPass (status, start_date, end_date, amount_paid, pass_type, purchase_datetime, season_rate_id, carpark_id, vrn)
VALUES
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-10-27 23:35:33', 1, 'A34', 'SFH3377R'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-05-31 14:24:49', 1, 'C28', 'SKE2214T'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-09-29 12:32:18', 1, 'PM24', 'SLA4490A'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-10-27 01:56:26', 2, 'A34', 'SMC7788H'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-06 18:53:15', 1, 'C28', 'SKH7702J'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-12-03 12:02:58', 1, 'SK49', 'SFD6633M'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-09-30 06:41:52', 1, 'B13', 'SFA3301L'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-12-17 23:08:59', 1, 'GE1A', 'SDZ4456R'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-09-27 18:47:02', 2, 'C28', 'SDB1123M'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-09 17:46:42', 1, 'J80M', 'SFK6600U'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-06-13 11:32:13', 1, 'A35', 'SMD4521L'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-12-09 04:47:02', 1, 'JM24', 'SFM8822W'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-10-14 08:31:15', 1, 'SK48', 'SFE8844N'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-10-28 02:10:28', 1, 'PL80', 'SKB3310Z'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-02-13 13:13:43', 1, 'W44', 'SGX2201C'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-03-08 03:19:39', 2, 'SK48', 'SLU6620S'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-08-15 05:40:37', 1, 'JM25', 'SNL9876T'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-12-30 23:21:44', 1, 'JM24', 'SFN9933X'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-04 19:52:55', 2, 'C28', 'SDE2234P'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-12 05:59:07', 1, 'B13', 'SLA1176A'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-06-30 10:20:22', 2, 'J80M', 'SNE5528R'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-02-23 04:04:43', 2, 'PM24', 'SFA9907L'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-06-27 14:10:43', 2, 'B13', 'SKZ7714F'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-04-10 23:57:45', 1, 'SK15', 'SLP4410S'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-07-06 17:43:49', 1, 'SE50', 'SFG2266Q'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-10-08 13:21:51', 2, 'SK15', 'SFC4422L'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-05-13 05:00:55', 1, 'SK15', 'SLZ9904D'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-01-26 13:12:12', 1, 'A36', 'SMU7781P'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-03-10 22:06:58', 2, 'JM24', 'SNY2035D'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-12-16 20:01:45', 1, 'PM23', 'SFB2210K'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-29 08:02:14', 1, 'W81', 'SJJ2208B'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-06-19 20:45:00', 2, 'B13', 'SFA7703L'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-10-26 07:19:43', 2, 'A35', 'SFI4488S'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-22 09:09:18', 2, 'SE50', 'SMC1122H');


-- 1. Parking records for vehicle: SDB1123M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-07 22:16:00', 6.00, 1, 'B13', 'SDB1123M'),
	('2025-05-05 22:32:00', 4.80, 1, 'A35', 'SDB1123M'),
	('2025-07-26 14:12:00', 11.40, 2, 'PL80', 'SDB1123M'),
	('2025-02-07 12:31:00', 12.00, 1, 'A34', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'B13', '2025-01-07 22:16:00', '2025-01-08 03:50:00', 'SHORTTERM'),
	('SDB1123M', 'A35', '2025-05-05 22:32:00', '2025-05-06 03:28:00', 'SHORTTERM'),
	('SDB1123M', 'PL80', '2025-07-26 14:12:00', '2025-07-27 00:19:00', 'SHORTTERM'),
	('SDB1123M', 'A34', '2025-02-07 12:31:00', '2025-02-07 22:57:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-11 22:33:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-08-30 23:33:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-09-29 12:39:00', 0, NULL, 'C28', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'C28', '2025-10-11 22:33:00', '2025-10-12 00:24:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-08-30 23:33:00', '2025-08-30 23:45:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-09-29 12:39:00', '2025-09-29 16:13:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-11 23:27:00', 13, 5),
	('2025-08-30 23:41:00', 3, 6),
	('2025-09-29 14:09:00', 11, 7);

-- 2. Parking records for vehicle: SDE2234P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-15 00:14:00', 9.60, 1, 'CK51', 'SDE2234P'),
	('2025-07-25 22:44:00', 7.80, 1, 'W81', 'SDE2234P'),
	('2025-02-21 18:29:00', 11.40, 1, 'CK22', 'SDE2234P'),
	('2025-02-11 19:18:00', 3.60, 1, 'A35', 'SDE2234P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDE2234P', 'CK51', '2025-05-15 00:14:00', '2025-05-15 08:22:00', 'SHORTTERM'),
	('SDE2234P', 'W81', '2025-07-25 22:44:00', '2025-07-26 05:57:00', 'SHORTTERM'),
	('SDE2234P', 'CK22', '2025-02-21 18:29:00', '2025-02-22 04:01:00', 'SHORTTERM'),
	('SDE2234P', 'A35', '2025-02-11 19:18:00', '2025-02-11 22:37:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-16 05:26:00', 0, NULL, 'C28', 'SDE2234P'),
	('2025-05-30 07:02:00', 0, NULL, 'C28', 'SDE2234P'),
	('2025-05-10 04:21:00', 0, NULL, 'C28', 'SDE2234P'),
	('2025-05-27 18:01:00', 0, NULL, 'C28', 'SDE2234P'),
	('2025-08-05 03:12:00', 0, NULL, 'C28', 'SDE2234P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDE2234P', 'C28', '2025-07-16 05:26:00', '2025-07-16 18:53:00', 'SEASONAL'),
	('SDE2234P', 'C28', '2025-05-30 07:02:00', '2025-05-30 17:24:00', 'SEASONAL'),
	('SDE2234P', 'C28', '2025-05-10 04:21:00', '2025-05-10 08:42:00', 'SEASONAL'),
	('SDE2234P', 'C28', '2025-05-27 18:01:00', '2025-05-28 04:45:00', 'SEASONAL'),
	('SDE2234P', 'C28', '2025-08-05 03:12:00', '2025-08-05 14:13:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-16 13:59:00', 4, 12),
	('2025-05-30 13:49:00', 1, 13),
	('2025-05-10 08:22:00', 8, 14),
	('2025-05-28 01:18:00', 1, 15),
	('2025-08-05 03:43:00', 1, 16);

-- 3. Parking records for vehicle: SDZ4456R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-22 16:43:00', 7.20, 1, 'W780', 'SDZ4456R'),
	('2025-01-08 11:57:00', 12.00, 1, 'SB23', 'SDZ4456R'),
	('2025-05-26 11:40:00', 4.20, 1, 'PM24', 'SDZ4456R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDZ4456R', 'W780', '2025-07-22 16:43:00', '2025-07-22 23:04:00', 'SHORTTERM'),
	('SDZ4456R', 'SB23', '2025-01-08 11:57:00', '2025-01-09 00:24:00', 'SHORTTERM'),
	('SDZ4456R', 'PM24', '2025-05-26 11:40:00', '2025-05-26 15:16:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-22 18:08:00', 10, 17),
	('2025-01-09 00:12:00', 12, 18);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-24 12:19:00', 0, NULL, 'GE1A', 'SDZ4456R'),
	('2025-04-28 16:14:00', 0, NULL, 'GE1A', 'SDZ4456R'),
	('2025-02-01 15:07:00', 0, NULL, 'GE1A', 'SDZ4456R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDZ4456R', 'GE1A', '2025-08-24 12:19:00', '2025-08-24 19:48:00', 'SEASONAL'),
	('SDZ4456R', 'GE1A', '2025-04-28 16:14:00', '2025-04-28 16:45:00', 'SEASONAL'),
	('SDZ4456R', 'GE1A', '2025-02-01 15:07:00', '2025-02-01 17:58:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-24 14:23:00', 14, 20),
	('2025-04-28 16:39:00', 1, 21),
	('2025-02-01 17:26:00', 11, 22);

-- 4. Parking records for vehicle: SFA3301L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-20 19:28:00', 11.40, 1, 'W81', 'SFA3301L'),
	('2025-07-22 11:40:00', 5.40, 1, 'CK51', 'SFA3301L'),
	('2025-01-01 18:43:00', 1.20, 1, 'W81', 'SFA3301L'),
	('2025-04-26 17:13:00', 15.60, 2, 'J80M', 'SFA3301L'),
	('2025-02-08 20:15:00', 6.00, 2, 'SK49', 'SFA3301L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA3301L', 'W81', '2025-06-20 19:28:00', '2025-06-21 05:01:00', 'SHORTTERM'),
	('SFA3301L', 'CK51', '2025-07-22 11:40:00', '2025-07-22 16:11:00', 'SHORTTERM'),
	('SFA3301L', 'W81', '2025-01-01 18:43:00', '2025-01-01 20:06:00', 'SHORTTERM'),
	('SFA3301L', 'J80M', '2025-04-26 17:13:00', '2025-04-27 06:48:00', 'SHORTTERM'),
	('SFA3301L', 'SK49', '2025-02-08 20:15:00', '2025-02-09 01:48:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-08 03:54:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-10-17 21:03:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-06-24 07:18:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-07-05 11:05:00', 0, NULL, 'B13', 'SFA3301L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA3301L', 'B13', '2025-03-08 03:54:00', '2025-03-08 09:14:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-10-17 21:03:00', '2025-10-18 02:09:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-06-24 07:18:00', '2025-06-24 07:24:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-07-05 11:05:00', '2025-07-05 21:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-08 05:14:00', 7, 28),
	('2025-10-18 00:49:00', 10, 29),
	('2025-06-24 07:23:00', 13, 30),
	('2025-07-05 21:46:00', 7, 31);

-- 5. Parking records for vehicle: SFA7703L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-18 11:07:00', 6.60, 1, 'SE50', 'SFA7703L'),
	('2025-01-11 17:15:00', 9.60, 2, 'SK15', 'SFA7703L'),
	('2025-01-18 13:03:00', 7.20, 2, 'W45', 'SFA7703L'),
	('2025-01-08 16:49:00', 15.60, 1, 'W780', 'SFA7703L'),
	('2025-08-21 00:33:00', 5.40, 1, 'CK25', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'SE50', '2025-06-18 11:07:00', '2025-06-18 17:01:00', 'SHORTTERM'),
	('SFA7703L', 'SK15', '2025-01-11 17:15:00', '2025-01-12 01:47:00', 'SHORTTERM'),
	('SFA7703L', 'W45', '2025-01-18 13:03:00', '2025-01-18 19:04:00', 'SHORTTERM'),
	('SFA7703L', 'W780', '2025-01-08 16:49:00', '2025-01-09 06:10:00', 'SHORTTERM'),
	('SFA7703L', 'CK25', '2025-08-21 00:33:00', '2025-08-21 05:06:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-21 16:24:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-08-12 18:12:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-02-09 20:56:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-03-31 11:08:00', 0, NULL, 'B13', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'B13', '2025-01-21 16:24:00', '2025-01-22 03:58:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-08-12 18:12:00', '2025-08-12 23:56:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-02-09 20:56:00', '2025-02-10 01:44:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-03-31 11:08:00', '2025-03-31 12:37:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-22 01:37:00', 3, 37),
	('2025-08-12 19:21:00', 12, 38),
	('2025-02-09 21:38:00', 11, 39),
	('2025-03-31 12:37:00', 7, 40);

-- 6. Parking records for vehicle: SFA9907L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-23 17:35:00', 2.40, 1, 'SK48', 'SFA9907L'),
	('2025-04-26 19:22:00', 10.20, 2, 'PL80', 'SFA9907L'),
	('2025-07-11 05:34:00', 12.00, 1, 'PM23', 'SFA9907L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA9907L', 'SK48', '2025-06-23 17:35:00', '2025-06-23 19:37:00', 'SHORTTERM'),
	('SFA9907L', 'PL80', '2025-04-26 19:22:00', '2025-04-27 04:13:00', 'SHORTTERM'),
	('SFA9907L', 'PM23', '2025-07-11 05:34:00', '2025-07-11 19:32:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-26 01:57:00', 0, NULL, 'PM24', 'SFA9907L'),
	('2025-08-05 02:00:00', 0, NULL, 'PM24', 'SFA9907L'),
	('2025-06-11 04:49:00', 0, NULL, 'PM24', 'SFA9907L'),
	('2025-04-14 03:52:00', 0, NULL, 'PM24', 'SFA9907L'),
	('2025-07-04 21:03:00', 0, NULL, 'PM24', 'SFA9907L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA9907L', 'PM24', '2025-09-26 01:57:00', '2025-09-26 02:04:00', 'SEASONAL'),
	('SFA9907L', 'PM24', '2025-08-05 02:00:00', '2025-08-05 13:21:00', 'SEASONAL'),
	('SFA9907L', 'PM24', '2025-06-11 04:49:00', '2025-06-11 17:59:00', 'SEASONAL'),
	('SFA9907L', 'PM24', '2025-04-14 03:52:00', '2025-04-14 15:10:00', 'SEASONAL'),
	('SFA9907L', 'PM24', '2025-07-04 21:03:00', '2025-07-05 10:42:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-26 02:03:00', 14, 44),
	('2025-08-05 03:45:00', 3, 45),
	('2025-06-11 14:35:00', 4, 46),
	('2025-04-14 10:12:00', 12, 47),
	('2025-07-05 08:08:00', 10, 48);

-- 7. Parking records for vehicle: SFB2210K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-01 07:07:00', 12.00, 1, 'SK49', 'SFB2210K'),
	('2025-06-26 22:32:00', 3.00, 1, 'W81', 'SFB2210K'),
	('2025-05-21 13:09:00', 15.00, 1, 'SB23', 'SFB2210K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFB2210K', 'SK49', '2025-10-01 07:07:00', '2025-10-01 18:24:00', 'SHORTTERM'),
	('SFB2210K', 'W81', '2025-06-26 22:32:00', '2025-06-27 01:56:00', 'SHORTTERM'),
	('SFB2210K', 'SB23', '2025-05-21 13:09:00', '2025-05-22 02:52:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-29 08:55:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-06-14 16:17:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-06-14 07:55:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-04-21 18:59:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-02-02 00:46:00', 0, NULL, 'PM23', 'SFB2210K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFB2210K', 'PM23', '2025-03-29 08:55:00', '2025-03-29 19:15:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-06-14 16:17:00', '2025-06-15 00:34:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-06-14 07:55:00', '2025-06-14 09:46:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-04-21 18:59:00', '2025-04-22 03:43:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-02-02 00:46:00', '2025-02-02 05:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-29 13:27:00', 1, 52),
	('2025-06-14 23:24:00', 8, 53),
	('2025-06-14 09:23:00', 8, 54),
	('2025-04-21 23:23:00', 10, 55),
	('2025-02-02 02:46:00', 6, 56);

-- 8. Parking records for vehicle: SFC4422L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-05 17:15:00', 6.60, 1, 'GE1A', 'SFC4422L'),
	('2025-04-04 09:26:00', 1.20, 1, 'PM23', 'SFC4422L'),
	('2025-02-09 06:41:00', 7.80, 2, 'CK51', 'SFC4422L'),
	('2025-08-03 16:26:00', 1.80, 2, 'SE50', 'SFC4422L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFC4422L', 'GE1A', '2025-09-05 17:15:00', '2025-09-05 22:55:00', 'SHORTTERM'),
	('SFC4422L', 'PM23', '2025-04-04 09:26:00', '2025-04-04 10:30:00', 'SHORTTERM'),
	('SFC4422L', 'CK51', '2025-02-09 06:41:00', '2025-02-09 13:34:00', 'SHORTTERM'),
	('SFC4422L', 'SE50', '2025-08-03 16:26:00', '2025-08-03 18:18:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-09 07:39:00', 8, 59);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-28 10:33:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-07-19 18:45:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-04-08 11:25:00', 0, NULL, 'SK15', 'SFC4422L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFC4422L', 'SK15', '2025-02-28 10:33:00', '2025-02-28 17:56:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-07-19 18:45:00', '2025-07-19 20:03:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-04-08 11:25:00', '2025-04-08 15:19:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-28 13:51:00', 3, 61),
	('2025-07-19 19:02:00', 11, 62),
	('2025-04-08 12:53:00', 6, 63);

-- 9. Parking records for vehicle: SFD6633M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-20 00:18:00', 3.00, 1, 'A36', 'SFD6633M'),
	('2025-02-18 14:35:00', 9.00, 1, 'J80M', 'SFD6633M'),
	('2025-04-12 21:33:00', 9.60, 2, 'PL90', 'SFD6633M'),
	('2025-07-10 12:23:00', 3.00, 1, 'SE50', 'SFD6633M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFD6633M', 'A36', '2025-03-20 00:18:00', '2025-03-20 02:55:00', 'SHORTTERM'),
	('SFD6633M', 'J80M', '2025-02-18 14:35:00', '2025-02-18 22:07:00', 'SHORTTERM'),
	('SFD6633M', 'PL90', '2025-04-12 21:33:00', '2025-04-13 06:11:00', 'SHORTTERM'),
	('SFD6633M', 'SE50', '2025-07-10 12:23:00', '2025-07-10 15:17:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-13 02:31:00', 1, 66);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-19 01:18:00', 0, NULL, 'SK49', 'SFD6633M'),
	('2025-06-13 07:12:00', 0, NULL, 'SK49', 'SFD6633M'),
	('2025-09-12 07:56:00', 0, NULL, 'SK49', 'SFD6633M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFD6633M', 'SK49', '2025-01-19 01:18:00', '2025-01-19 03:58:00', 'SEASONAL'),
	('SFD6633M', 'SK49', '2025-06-13 07:12:00', '2025-06-13 16:57:00', 'SEASONAL'),
	('SFD6633M', 'SK49', '2025-09-12 07:56:00', '2025-09-12 18:10:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-19 03:25:00', 8, 68),
	('2025-06-13 14:49:00', 10, 69),
	('2025-09-12 16:25:00', 5, 70);

-- 10. Parking records for vehicle: SFE8844N
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-04 20:56:00', 4.80, 1, 'C28', 'SFE8844N'),
	('2025-06-10 10:35:00', 2.40, 1, 'SK49', 'SFE8844N'),
	('2025-01-20 19:35:00', 5.40, 1, 'C28', 'SFE8844N'),
	('2025-02-20 03:59:00', 8.40, 1, 'PL90', 'SFE8844N');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFE8844N', 'C28', '2025-08-04 20:56:00', '2025-08-05 01:27:00', 'SHORTTERM'),
	('SFE8844N', 'SK49', '2025-06-10 10:35:00', '2025-06-10 12:48:00', 'SHORTTERM'),
	('SFE8844N', 'C28', '2025-01-20 19:35:00', '2025-01-21 00:37:00', 'SHORTTERM'),
	('SFE8844N', 'PL90', '2025-02-20 03:59:00', '2025-02-20 11:13:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-22 06:28:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-05-22 04:01:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-07-21 11:28:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-01-31 06:53:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-01-03 05:55:00', 0, NULL, 'SK48', 'SFE8844N');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFE8844N', 'SK48', '2025-05-22 06:28:00', '2025-05-22 11:22:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-05-22 04:01:00', '2025-05-22 06:16:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-07-21 11:28:00', '2025-07-21 19:25:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-01-31 06:53:00', '2025-01-31 20:01:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-01-03 05:55:00', '2025-01-03 11:31:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-22 10:42:00', 8, 75),
	('2025-05-22 06:11:00', 11, 76),
	('2025-07-21 13:46:00', 9, 77),
	('2025-01-31 08:24:00', 15, 78),
	('2025-01-03 08:15:00', 6, 79);

-- 11. Parking records for vehicle: SFF1155P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-27 09:22:00', 12.00, 2, 'SK48', 'SFF1155P'),
	('2025-08-20 20:33:00', 11.40, 1, 'J80M', 'SFF1155P'),
	('2025-06-18 03:14:00', 12.00, 1, 'PM23', 'SFF1155P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFF1155P', 'SK48', '2025-04-27 09:22:00', '2025-04-27 23:02:00', 'SHORTTERM'),
	('SFF1155P', 'J80M', '2025-08-20 20:33:00', '2025-08-21 06:48:00', 'SHORTTERM'),
	('SFF1155P', 'PM23', '2025-06-18 03:14:00', '2025-06-18 15:03:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 12. Parking records for vehicle: SFG2266Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-18 05:21:00', 9.60, 1, 'JM24', 'SFG2266Q'),
	('2025-03-22 22:50:00', 1.80, 2, 'W44', 'SFG2266Q'),
	('2025-02-10 02:20:00', 12.00, 1, 'PL90', 'SFG2266Q'),
	('2025-03-30 21:35:00', 14.40, 2, 'A35', 'SFG2266Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFG2266Q', 'JM24', '2025-04-18 05:21:00', '2025-04-18 13:40:00', 'SHORTTERM'),
	('SFG2266Q', 'W44', '2025-03-22 22:50:00', '2025-03-23 00:57:00', 'SHORTTERM'),
	('SFG2266Q', 'PL90', '2025-02-10 02:20:00', '2025-02-10 15:13:00', 'SHORTTERM'),
	('SFG2266Q', 'A35', '2025-03-30 21:35:00', '2025-03-31 10:24:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-18 12:11:00', 8, 83),
	('2025-03-23 00:43:00', 1, 84);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-25 11:43:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-06-27 08:01:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-06-13 00:02:00', 0, NULL, 'SE50', 'SFG2266Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFG2266Q', 'SE50', '2025-04-25 11:43:00', '2025-04-25 20:47:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-06-27 08:01:00', '2025-06-27 20:09:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-06-13 00:02:00', '2025-06-13 05:09:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-25 18:26:00', 12, 87),
	('2025-06-27 09:45:00', 13, 88),
	('2025-06-13 02:50:00', 9, 89);

-- 13. Parking records for vehicle: SFH3377R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-30 13:57:00', 0.60, 1, 'SK48', 'SFH3377R'),
	('2025-07-12 14:23:00', 3.60, 2, 'W44', 'SFH3377R'),
	('2025-04-19 08:40:00', 1.80, 2, 'C28', 'SFH3377R'),
	('2025-01-05 19:50:00', 5.40, 2, 'CK22', 'SFH3377R'),
	('2025-05-19 15:17:00', 12.60, 1, 'CK22', 'SFH3377R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFH3377R', 'SK48', '2025-01-30 13:57:00', '2025-01-30 14:55:00', 'SHORTTERM'),
	('SFH3377R', 'W44', '2025-07-12 14:23:00', '2025-07-12 17:27:00', 'SHORTTERM'),
	('SFH3377R', 'C28', '2025-04-19 08:40:00', '2025-04-19 10:19:00', 'SHORTTERM'),
	('SFH3377R', 'CK22', '2025-01-05 19:50:00', '2025-01-06 00:56:00', 'SHORTTERM'),
	('SFH3377R', 'CK22', '2025-05-19 15:17:00', '2025-05-20 02:17:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-30 11:27:00', 0, NULL, 'A34', 'SFH3377R'),
	('2025-08-29 12:13:00', 0, NULL, 'A34', 'SFH3377R'),
	('2025-01-10 19:21:00', 0, NULL, 'A34', 'SFH3377R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFH3377R', 'A34', '2025-04-30 11:27:00', '2025-05-01 01:11:00', 'SEASONAL'),
	('SFH3377R', 'A34', '2025-08-29 12:13:00', '2025-08-30 01:47:00', 'SEASONAL'),
	('SFH3377R', 'A34', '2025-01-10 19:21:00', '2025-01-11 08:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-30 11:59:00', 8, 95),
	('2025-08-29 14:00:00', 12, 96),
	('2025-01-11 03:33:00', 13, 97);

-- 14. Parking records for vehicle: SFI4488S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-16 17:05:00', 1.80, 2, 'SK15', 'SFI4488S'),
	('2025-07-09 16:13:00', 9.00, 1, 'W44', 'SFI4488S'),
	('2025-05-21 07:27:00', 12.00, 1, 'B13', 'SFI4488S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFI4488S', 'SK15', '2025-02-16 17:05:00', '2025-02-16 18:54:00', 'SHORTTERM'),
	('SFI4488S', 'W44', '2025-07-09 16:13:00', '2025-07-09 23:47:00', 'SHORTTERM'),
	('SFI4488S', 'B13', '2025-05-21 07:27:00', '2025-05-21 20:55:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-27 22:46:00', 0, NULL, 'A35', 'SFI4488S'),
	('2025-05-23 06:30:00', 0, NULL, 'A35', 'SFI4488S'),
	('2025-09-06 15:22:00', 0, NULL, 'A35', 'SFI4488S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFI4488S', 'A35', '2025-09-27 22:46:00', '2025-09-28 10:14:00', 'SEASONAL'),
	('SFI4488S', 'A35', '2025-05-23 06:30:00', '2025-05-23 14:35:00', 'SEASONAL'),
	('SFI4488S', 'A35', '2025-09-06 15:22:00', '2025-09-06 17:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-28 06:57:00', 3, 101),
	('2025-05-23 12:44:00', 10, 102),
	('2025-09-06 16:53:00', 8, 103);

-- 15. Parking records for vehicle: SFJ5599T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-03 04:18:00', 12.00, 1, 'CK25', 'SFJ5599T'),
	('2025-10-14 02:13:00', 12.00, 1, 'SK48', 'SFJ5599T'),
	('2025-10-23 23:32:00', 12.00, 1, 'GE1A', 'SFJ5599T'),
	('2025-08-27 22:55:00', 7.80, 1, 'PM23', 'SFJ5599T'),
	('2025-07-14 02:59:00', 0.00, 1, 'W81', 'SFJ5599T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFJ5599T', 'CK25', '2025-04-03 04:18:00', '2025-04-03 16:01:00', 'SHORTTERM'),
	('SFJ5599T', 'SK48', '2025-10-14 02:13:00', '2025-10-14 14:03:00', 'SHORTTERM'),
	('SFJ5599T', 'GE1A', '2025-10-23 23:32:00', '2025-10-24 12:45:00', 'SHORTTERM'),
	('SFJ5599T', 'PM23', '2025-08-27 22:55:00', '2025-08-28 05:55:00', 'SHORTTERM'),
	('SFJ5599T', 'W81', '2025-07-14 02:59:00', '2025-07-14 03:08:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 16. Parking records for vehicle: SFK6600U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-24 22:25:00', 4.80, 1, 'SK49', 'SFK6600U'),
	('2025-07-10 16:31:00', 9.60, 1, 'W45', 'SFK6600U'),
	('2025-07-14 21:54:00', 9.00, 1, 'SK15', 'SFK6600U'),
	('2025-04-22 11:53:00', 10.20, 1, 'CK22', 'SFK6600U'),
	('2025-07-28 19:39:00', 1.20, 1, 'CK51', 'SFK6600U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFK6600U', 'SK49', '2025-03-24 22:25:00', '2025-03-25 02:52:00', 'SHORTTERM'),
	('SFK6600U', 'W45', '2025-07-10 16:31:00', '2025-07-11 01:18:00', 'SHORTTERM'),
	('SFK6600U', 'SK15', '2025-07-14 21:54:00', '2025-07-15 05:34:00', 'SHORTTERM'),
	('SFK6600U', 'CK22', '2025-04-22 11:53:00', '2025-04-22 20:26:00', 'SHORTTERM'),
	('SFK6600U', 'CK51', '2025-07-28 19:39:00', '2025-07-28 20:53:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-26 22:21:00', 0, NULL, 'J80M', 'SFK6600U'),
	('2025-03-15 23:04:00', 0, NULL, 'J80M', 'SFK6600U'),
	('2025-07-19 17:36:00', 0, NULL, 'J80M', 'SFK6600U'),
	('2025-08-01 12:23:00', 0, NULL, 'J80M', 'SFK6600U'),
	('2025-06-14 16:27:00', 0, NULL, 'J80M', 'SFK6600U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFK6600U', 'J80M', '2025-01-26 22:21:00', '2025-01-27 07:06:00', 'SEASONAL'),
	('SFK6600U', 'J80M', '2025-03-15 23:04:00', '2025-03-15 23:40:00', 'SEASONAL'),
	('SFK6600U', 'J80M', '2025-07-19 17:36:00', '2025-07-19 19:21:00', 'SEASONAL'),
	('SFK6600U', 'J80M', '2025-08-01 12:23:00', '2025-08-01 15:05:00', 'SEASONAL'),
	('SFK6600U', 'J80M', '2025-06-14 16:27:00', '2025-06-15 00:03:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-27 00:19:00', 2, 114),
	('2025-03-15 23:32:00', 6, 115),
	('2025-07-19 19:15:00', 7, 116),
	('2025-08-01 12:36:00', 13, 117),
	('2025-06-14 22:55:00', 13, 118);

-- 17. Parking records for vehicle: SFL7711V
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-10 00:35:00', 3.00, 1, 'A34', 'SFL7711V'),
	('2025-08-04 15:46:00', 3.60, 1, 'GE1A', 'SFL7711V'),
	('2025-09-04 09:21:00', 12.00, 1, 'A36', 'SFL7711V');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFL7711V', 'A34', '2025-07-10 00:35:00', '2025-07-10 03:16:00', 'SHORTTERM'),
	('SFL7711V', 'GE1A', '2025-08-04 15:46:00', '2025-08-04 19:01:00', 'SHORTTERM'),
	('SFL7711V', 'A36', '2025-09-04 09:21:00', '2025-09-04 20:22:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 18. Parking records for vehicle: SFM8822W
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-23 20:30:00', 5.40, 1, 'W44', 'SFM8822W'),
	('2025-05-18 00:18:00', 3.00, 2, 'CK25', 'SFM8822W'),
	('2025-06-28 18:01:00', 1.20, 2, 'CK22', 'SFM8822W'),
	('2025-03-26 08:06:00', 12.00, 1, 'J80M', 'SFM8822W'),
	('2025-01-14 10:35:00', 6.00, 1, 'B13', 'SFM8822W');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFM8822W', 'W44', '2025-05-23 20:30:00', '2025-05-24 01:06:00', 'SHORTTERM'),
	('SFM8822W', 'CK25', '2025-05-18 00:18:00', '2025-05-18 03:15:00', 'SHORTTERM'),
	('SFM8822W', 'CK22', '2025-06-28 18:01:00', '2025-06-28 19:05:00', 'SHORTTERM'),
	('SFM8822W', 'J80M', '2025-03-26 08:06:00', '2025-03-26 20:17:00', 'SHORTTERM'),
	('SFM8822W', 'B13', '2025-01-14 10:35:00', '2025-01-14 15:55:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-25 05:08:00', 0, NULL, 'JM24', 'SFM8822W'),
	('2025-04-30 09:17:00', 0, NULL, 'JM24', 'SFM8822W'),
	('2025-11-04 01:51:00', 0, NULL, 'JM24', 'SFM8822W');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFM8822W', 'JM24', '2025-10-25 05:08:00', '2025-10-25 06:32:00', 'SEASONAL'),
	('SFM8822W', 'JM24', '2025-04-30 09:17:00', '2025-04-30 12:45:00', 'SEASONAL'),
	('SFM8822W', 'JM24', '2025-11-04 01:51:00', '2025-11-04 07:21:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-25 05:10:00', 15, 127),
	('2025-04-30 12:08:00', 6, 128),
	('2025-11-04 05:51:00', 1, 129);

-- 19. Parking records for vehicle: SFN9933X
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-14 04:43:00', 2.40, 1, 'CK25', 'SFN9933X'),
	('2025-01-04 05:19:00', 10.20, 2, 'CK25', 'SFN9933X'),
	('2025-02-23 17:12:00', 5.40, 2, 'SK15', 'SFN9933X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFN9933X', 'CK25', '2025-04-14 04:43:00', '2025-04-14 06:57:00', 'SHORTTERM'),
	('SFN9933X', 'CK25', '2025-01-04 05:19:00', '2025-01-04 14:17:00', 'SHORTTERM'),
	('SFN9933X', 'SK15', '2025-02-23 17:12:00', '2025-02-23 21:53:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-22 12:03:00', 0, NULL, 'JM24', 'SFN9933X'),
	('2025-10-25 13:52:00', 0, NULL, 'JM24', 'SFN9933X'),
	('2025-08-03 11:09:00', 0, NULL, 'JM24', 'SFN9933X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFN9933X', 'JM24', '2025-06-22 12:03:00', '2025-06-22 15:42:00', 'SEASONAL'),
	('SFN9933X', 'JM24', '2025-10-25 13:52:00', '2025-10-25 23:20:00', 'SEASONAL'),
	('SFN9933X', 'JM24', '2025-08-03 11:09:00', '2025-08-03 19:07:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-22 15:42:00', 6, 133),
	('2025-10-25 15:27:00', 3, 134),
	('2025-08-03 12:28:00', 8, 135);

-- 20. Parking records for vehicle: SFP0044Y
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-02 12:39:00', 0.60, 1, 'A36', 'SFP0044Y'),
	('2025-10-20 05:40:00', 8.40, 1, 'PM24', 'SFP0044Y'),
	('2025-10-03 13:53:00', 2.40, 1, 'W44', 'SFP0044Y'),
	('2025-05-27 20:57:00', 13.20, 1, 'PM23', 'SFP0044Y'),
	('2025-10-30 11:06:00', 9.00, 1, 'W81', 'SFP0044Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFP0044Y', 'A36', '2025-09-02 12:39:00', '2025-09-02 13:37:00', 'SHORTTERM'),
	('SFP0044Y', 'PM24', '2025-10-20 05:40:00', '2025-10-20 12:56:00', 'SHORTTERM'),
	('SFP0044Y', 'W44', '2025-10-03 13:53:00', '2025-10-03 16:19:00', 'SHORTTERM'),
	('SFP0044Y', 'PM23', '2025-05-27 20:57:00', '2025-05-28 08:22:00', 'SHORTTERM'),
	('SFP0044Y', 'W81', '2025-10-30 11:06:00', '2025-10-30 19:00:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-03 15:07:00', 14, 138),
	('2025-10-30 15:10:00', 9, 140);

-- Parking Mode: Seasonal


-- 21. Parking records for vehicle: SFQ1156Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-11 12:13:00', 0.00, 1, 'PL80', 'SFQ1156Z'),
	('2025-01-19 23:17:00', 10.80, 2, 'SK48', 'SFQ1156Z'),
	('2025-02-18 21:54:00', 1.20, 1, 'CK51', 'SFQ1156Z'),
	('2025-10-24 03:35:00', 9.60, 1, 'PL80', 'SFQ1156Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFQ1156Z', 'PL80', '2025-07-11 12:13:00', '2025-07-11 12:36:00', 'SHORTTERM'),
	('SFQ1156Z', 'SK48', '2025-01-19 23:17:00', '2025-01-20 08:54:00', 'SHORTTERM'),
	('SFQ1156Z', 'CK51', '2025-02-18 21:54:00', '2025-02-18 23:11:00', 'SHORTTERM'),
	('SFQ1156Z', 'PL80', '2025-10-24 03:35:00', '2025-10-24 11:41:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 22. Parking records for vehicle: SGL6619A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-22 07:12:00', 12.00, 1, 'JM25', 'SGL6619A'),
	('2025-05-08 19:24:00', 5.40, 1, 'SK15', 'SGL6619A'),
	('2025-01-20 04:02:00', 9.00, 1, 'A35', 'SGL6619A'),
	('2025-04-17 17:08:00', 15.00, 1, 'SK49', 'SGL6619A'),
	('2025-07-17 07:20:00', 3.60, 1, 'W780', 'SGL6619A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGL6619A', 'JM25', '2025-10-22 07:12:00', '2025-10-22 19:16:00', 'SHORTTERM'),
	('SGL6619A', 'SK15', '2025-05-08 19:24:00', '2025-05-09 00:08:00', 'SHORTTERM'),
	('SGL6619A', 'A35', '2025-01-20 04:02:00', '2025-01-20 11:51:00', 'SHORTTERM'),
	('SGL6619A', 'SK49', '2025-04-17 17:08:00', '2025-04-18 06:29:00', 'SHORTTERM'),
	('SGL6619A', 'W780', '2025-07-17 07:20:00', '2025-07-17 10:41:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-17 07:40:00', 1, 149);

-- Parking Mode: Seasonal


-- 23. Parking records for vehicle: SGX2201C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-14 11:57:00', 12.00, 2, 'GE1A', 'SGX2201C'),
	('2025-09-01 11:28:00', 4.80, 1, 'W81', 'SGX2201C'),
	('2025-07-12 07:49:00', 1.20, 2, 'W81', 'SGX2201C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2201C', 'GE1A', '2025-09-14 11:57:00', '2025-09-14 23:22:00', 'SHORTTERM'),
	('SGX2201C', 'W81', '2025-09-01 11:28:00', '2025-09-01 15:37:00', 'SHORTTERM'),
	('SGX2201C', 'W81', '2025-07-12 07:49:00', '2025-07-12 09:00:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-26 18:21:00', 0, NULL, 'W44', 'SGX2201C'),
	('2025-03-08 21:26:00', 0, NULL, 'W44', 'SGX2201C'),
	('2025-10-20 22:27:00', 0, NULL, 'W44', 'SGX2201C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2201C', 'W44', '2025-09-26 18:21:00', '2025-09-27 04:18:00', 'SEASONAL'),
	('SGX2201C', 'W44', '2025-03-08 21:26:00', '2025-03-09 01:42:00', 'SEASONAL'),
	('SGX2201C', 'W44', '2025-10-20 22:27:00', '2025-10-21 10:26:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-26 19:59:00', 5, 153),
	('2025-03-08 22:04:00', 5, 154),
	('2025-10-21 09:11:00', 10, 155);

-- 24. Parking records for vehicle: SGX4420C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-05 00:57:00', 12.00, 2, 'CK22', 'SGX4420C'),
	('2025-10-16 07:40:00', 5.40, 1, 'PL80', 'SGX4420C'),
	('2025-10-18 17:59:00', 7.20, 2, 'CK22', 'SGX4420C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX4420C', 'CK22', '2025-01-05 00:57:00', '2025-01-05 12:18:00', 'SHORTTERM'),
	('SGX4420C', 'PL80', '2025-10-16 07:40:00', '2025-10-16 12:24:00', 'SHORTTERM'),
	('SGX4420C', 'CK22', '2025-10-18 17:59:00', '2025-10-19 00:14:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-18 18:53:00', 6, 158);

-- Parking Mode: Seasonal


-- 25. Parking records for vehicle: SGX7722C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-05 02:58:00', 3.60, 1, 'CK25', 'SGX7722C'),
	('2025-01-08 14:02:00', 0.60, 1, 'A36', 'SGX7722C'),
	('2025-06-06 22:33:00', 8.40, 1, 'SK15', 'SGX7722C'),
	('2025-09-10 03:10:00', 12.00, 1, 'C28', 'SGX7722C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX7722C', 'CK25', '2025-03-05 02:58:00', '2025-03-05 06:07:00', 'SHORTTERM'),
	('SGX7722C', 'A36', '2025-01-08 14:02:00', '2025-01-08 14:49:00', 'SHORTTERM'),
	('SGX7722C', 'SK15', '2025-06-06 22:33:00', '2025-06-07 06:07:00', 'SHORTTERM'),
	('SGX7722C', 'C28', '2025-09-10 03:10:00', '2025-09-10 13:26:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 26. Parking records for vehicle: SJA1234K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-27 18:33:00', 15.00, 1, 'W81', 'SJA1234K'),
	('2025-03-04 21:18:00', 9.60, 1, 'JM25', 'SJA1234K'),
	('2025-01-25 21:09:00', 9.00, 2, 'B13', 'SJA1234K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJA1234K', 'W81', '2025-01-27 18:33:00', '2025-01-28 07:36:00', 'SHORTTERM'),
	('SJA1234K', 'JM25', '2025-03-04 21:18:00', '2025-03-05 05:50:00', 'SHORTTERM'),
	('SJA1234K', 'B13', '2025-01-25 21:09:00', '2025-01-26 05:23:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 27. Parking records for vehicle: SJJ2208B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-11 16:09:00', 13.80, 1, 'PL90', 'SJJ2208B'),
	('2025-01-26 01:54:00', 9.60, 2, 'SK15', 'SJJ2208B'),
	('2025-07-30 03:17:00', 7.80, 1, 'PM23', 'SJJ2208B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ2208B', 'PL90', '2025-03-11 16:09:00', '2025-03-12 04:09:00', 'SHORTTERM'),
	('SJJ2208B', 'SK15', '2025-01-26 01:54:00', '2025-01-26 10:14:00', 'SHORTTERM'),
	('SJJ2208B', 'PM23', '2025-07-30 03:17:00', '2025-07-30 09:57:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-30 09:07:00', 8, 168);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-04 16:13:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-10-17 17:17:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-08-16 06:44:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-07-01 18:52:00', 0, NULL, 'W81', 'SJJ2208B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ2208B', 'W81', '2025-02-04 16:13:00', '2025-02-04 17:01:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-10-17 17:17:00', '2025-10-18 00:54:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-08-16 06:44:00', '2025-08-16 08:28:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-07-01 18:52:00', '2025-07-02 08:21:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-04 16:43:00', 14, 169),
	('2025-10-17 20:48:00', 14, 170),
	('2025-08-16 08:24:00', 15, 171),
	('2025-07-02 00:40:00', 3, 172);

-- 28. Parking records for vehicle: SJJ8811B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-13 01:33:00', 12.00, 2, 'CK51', 'SJJ8811B'),
	('2025-06-27 02:19:00', 8.40, 1, 'SK49', 'SJJ8811B'),
	('2025-09-12 19:26:00', 13.80, 1, 'W45', 'SJJ8811B'),
	('2025-06-01 02:38:00', 12.00, 2, 'GE1A', 'SJJ8811B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ8811B', 'CK51', '2025-04-13 01:33:00', '2025-04-13 14:50:00', 'SHORTTERM'),
	('SJJ8811B', 'SK49', '2025-06-27 02:19:00', '2025-06-27 09:26:00', 'SHORTTERM'),
	('SJJ8811B', 'W45', '2025-09-12 19:26:00', '2025-09-13 07:02:00', 'SHORTTERM'),
	('SJJ8811B', 'GE1A', '2025-06-01 02:38:00', '2025-06-01 14:00:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 29. Parking records for vehicle: SJQ9021M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-28 02:44:00', 8.40, 2, 'W780', 'SJQ9021M'),
	('2025-06-02 06:18:00', 6.00, 1, 'W780', 'SJQ9021M'),
	('2025-03-04 12:44:00', 12.00, 1, 'CK22', 'SJQ9021M'),
	('2025-05-30 01:01:00', 0.00, 1, 'SK49', 'SJQ9021M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJQ9021M', 'W780', '2025-09-28 02:44:00', '2025-09-28 09:45:00', 'SHORTTERM'),
	('SJQ9021M', 'W780', '2025-06-02 06:18:00', '2025-06-02 11:42:00', 'SHORTTERM'),
	('SJQ9021M', 'CK22', '2025-03-04 12:44:00', '2025-03-04 23:12:00', 'SHORTTERM'),
	('SJQ9021M', 'SK49', '2025-05-30 01:01:00', '2025-05-30 01:20:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-04 14:54:00', 1, 179);

-- Parking Mode: Seasonal


-- 30. Parking records for vehicle: SKB3310Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-14 22:47:00', 11.40, 2, 'SK48', 'SKB3310Z'),
	('2025-01-27 17:01:00', 9.60, 1, 'W44', 'SKB3310Z'),
	('2025-07-28 18:56:00', 7.20, 1, 'CK22', 'SKB3310Z'),
	('2025-02-16 09:21:00', 12.00, 2, 'A36', 'SKB3310Z'),
	('2025-11-01 22:33:00', 13.20, 2, 'A35', 'SKB3310Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKB3310Z', 'SK48', '2025-06-14 22:47:00', '2025-06-15 08:48:00', 'SHORTTERM'),
	('SKB3310Z', 'W44', '2025-01-27 17:01:00', '2025-01-28 01:30:00', 'SHORTTERM'),
	('SKB3310Z', 'CK22', '2025-07-28 18:56:00', '2025-07-29 01:26:00', 'SHORTTERM'),
	('SKB3310Z', 'A36', '2025-02-16 09:21:00', '2025-02-16 23:04:00', 'SHORTTERM'),
	('SKB3310Z', 'A35', '2025-11-01 22:33:00', '2025-11-02 10:49:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-28 21:31:00', 2, 183);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-01 01:38:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-02-12 02:51:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-06-16 07:39:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-09-08 04:15:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-09-16 09:08:00', 0, NULL, 'PL80', 'SKB3310Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKB3310Z', 'PL80', '2025-06-01 01:38:00', '2025-06-01 15:21:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-02-12 02:51:00', '2025-02-12 16:24:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-06-16 07:39:00', '2025-06-16 15:28:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-09-08 04:15:00', '2025-09-08 12:24:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-09-16 09:08:00', '2025-09-16 18:20:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-01 04:56:00', 14, 186),
	('2025-02-12 05:57:00', 12, 187),
	('2025-06-16 10:09:00', 9, 188),
	('2025-09-08 05:09:00', 11, 189),
	('2025-09-16 10:05:00', 11, 190);

-- 31. Parking records for vehicle: SKE2214T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-10 16:34:00', 12.60, 1, 'J80M', 'SKE2214T'),
	('2025-07-31 09:43:00', 4.20, 1, 'W780', 'SKE2214T'),
	('2025-08-30 19:57:00', 1.20, 2, 'A35', 'SKE2214T'),
	('2025-09-20 23:24:00', 12.00, 2, 'A34', 'SKE2214T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKE2214T', 'J80M', '2025-01-10 16:34:00', '2025-01-11 03:52:00', 'SHORTTERM'),
	('SKE2214T', 'W780', '2025-07-31 09:43:00', '2025-07-31 13:37:00', 'SHORTTERM'),
	('SKE2214T', 'A35', '2025-08-30 19:57:00', '2025-08-30 21:11:00', 'SHORTTERM'),
	('SKE2214T', 'A34', '2025-09-20 23:24:00', '2025-09-21 09:38:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-11 03:22:00', 2, 191);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-27 02:44:00', 0, NULL, 'C28', 'SKE2214T'),
	('2025-02-08 22:48:00', 0, NULL, 'C28', 'SKE2214T'),
	('2025-03-26 12:21:00', 0, NULL, 'C28', 'SKE2214T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKE2214T', 'C28', '2025-08-27 02:44:00', '2025-08-27 09:52:00', 'SEASONAL'),
	('SKE2214T', 'C28', '2025-02-08 22:48:00', '2025-02-09 02:49:00', 'SEASONAL'),
	('SKE2214T', 'C28', '2025-03-26 12:21:00', '2025-03-26 13:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-27 06:53:00', 13, 195),
	('2025-02-09 02:17:00', 3, 196),
	('2025-03-26 12:51:00', 2, 197);

-- 32. Parking records for vehicle: SKH7702J
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-05 09:43:00', 4.20, 2, 'JM25', 'SKH7702J'),
	('2025-03-10 05:42:00', 6.60, 1, 'CK25', 'SKH7702J'),
	('2025-04-10 16:44:00', 6.60, 1, 'SK15', 'SKH7702J'),
	('2025-09-13 10:34:00', 9.60, 2, 'GE1A', 'SKH7702J'),
	('2025-09-18 03:10:00', 3.00, 1, 'B13', 'SKH7702J');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKH7702J', 'JM25', '2025-07-05 09:43:00', '2025-07-05 13:34:00', 'SHORTTERM'),
	('SKH7702J', 'CK25', '2025-03-10 05:42:00', '2025-03-10 11:27:00', 'SHORTTERM'),
	('SKH7702J', 'SK15', '2025-04-10 16:44:00', '2025-04-10 22:42:00', 'SHORTTERM'),
	('SKH7702J', 'GE1A', '2025-09-13 10:34:00', '2025-09-13 18:34:00', 'SHORTTERM'),
	('SKH7702J', 'B13', '2025-09-18 03:10:00', '2025-09-18 05:40:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-01 18:51:00', 0, NULL, 'C28', 'SKH7702J'),
	('2025-01-12 07:31:00', 0, NULL, 'C28', 'SKH7702J'),
	('2025-10-03 07:45:00', 0, NULL, 'C28', 'SKH7702J'),
	('2025-09-23 23:40:00', 0, NULL, 'C28', 'SKH7702J');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKH7702J', 'C28', '2025-06-01 18:51:00', '2025-06-02 07:37:00', 'SEASONAL'),
	('SKH7702J', 'C28', '2025-01-12 07:31:00', '2025-01-12 11:51:00', 'SEASONAL'),
	('SKH7702J', 'C28', '2025-10-03 07:45:00', '2025-10-03 09:16:00', 'SEASONAL'),
	('SKH7702J', 'C28', '2025-09-23 23:40:00', '2025-09-24 10:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-01 22:14:00', 3, 203),
	('2025-01-12 10:30:00', 12, 204),
	('2025-10-03 08:56:00', 3, 205),
	('2025-09-24 04:18:00', 11, 206);

-- 33. Parking records for vehicle: SKZ1144F
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-27 10:56:00', 12.00, 1, 'SK15', 'SKZ1144F'),
	('2025-04-02 13:14:00', 7.80, 1, 'A34', 'SKZ1144F'),
	('2025-06-29 00:03:00', 10.20, 2, 'SE50', 'SKZ1144F'),
	('2025-06-23 04:23:00', 10.20, 1, 'JM25', 'SKZ1144F'),
	('2025-01-10 22:50:00', 8.40, 1, 'B13', 'SKZ1144F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ1144F', 'SK15', '2025-08-27 10:56:00', '2025-08-28 00:13:00', 'SHORTTERM'),
	('SKZ1144F', 'A34', '2025-04-02 13:14:00', '2025-04-02 20:10:00', 'SHORTTERM'),
	('SKZ1144F', 'SE50', '2025-06-29 00:03:00', '2025-06-29 08:58:00', 'SHORTTERM'),
	('SKZ1144F', 'JM25', '2025-06-23 04:23:00', '2025-06-23 13:19:00', 'SHORTTERM'),
	('SKZ1144F', 'B13', '2025-01-10 22:50:00', '2025-01-11 06:10:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-02 17:58:00', 9, 208);

-- Parking Mode: Seasonal


-- 34. Parking records for vehicle: SKZ7714F
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-24 12:35:00', 12.60, 1, 'JM24', 'SKZ7714F'),
	('2025-05-29 15:11:00', 6.00, 1, 'PM24', 'SKZ7714F'),
	('2025-04-08 19:24:00', 1.80, 1, 'JM25', 'SKZ7714F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ7714F', 'JM24', '2025-10-24 12:35:00', '2025-10-25 00:32:00', 'SHORTTERM'),
	('SKZ7714F', 'PM24', '2025-05-29 15:11:00', '2025-05-29 20:37:00', 'SHORTTERM'),
	('SKZ7714F', 'JM25', '2025-04-08 19:24:00', '2025-04-08 20:54:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-29 18:11:00', 15, 213);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-28 16:53:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-02-27 20:20:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-05-25 18:54:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-06-27 23:56:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-10-11 05:42:00', 0, NULL, 'B13', 'SKZ7714F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ7714F', 'B13', '2025-09-28 16:53:00', '2025-09-28 23:18:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-02-27 20:20:00', '2025-02-28 06:47:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-05-25 18:54:00', '2025-05-26 07:33:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-06-27 23:56:00', '2025-06-28 09:02:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-10-11 05:42:00', '2025-10-11 06:19:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-28 18:14:00', 10, 215),
	('2025-02-28 05:42:00', 4, 216),
	('2025-05-25 20:44:00', 10, 217),
	('2025-06-28 08:41:00', 14, 218),
	('2025-10-11 06:18:00', 15, 219);

-- 35. Parking records for vehicle: SLA1176A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-09 14:55:00', 10.80, 1, 'SK49', 'SLA1176A'),
	('2025-08-03 04:50:00', 1.80, 2, 'A35', 'SLA1176A'),
	('2025-01-28 14:41:00', 15.00, 1, 'SE50', 'SLA1176A'),
	('2025-08-25 21:03:00', 13.80, 1, 'A35', 'SLA1176A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA1176A', 'SK49', '2025-01-09 14:55:00', '2025-01-10 00:00:00', 'SHORTTERM'),
	('SLA1176A', 'A35', '2025-08-03 04:50:00', '2025-08-03 06:47:00', 'SHORTTERM'),
	('SLA1176A', 'SE50', '2025-01-28 14:41:00', '2025-01-29 03:45:00', 'SHORTTERM'),
	('SLA1176A', 'A35', '2025-08-25 21:03:00', '2025-08-26 09:20:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-24 06:14:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-02-06 00:14:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-07-17 01:48:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-02-06 14:26:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-09-28 14:22:00', 0, NULL, 'B13', 'SLA1176A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA1176A', 'B13', '2025-10-24 06:14:00', '2025-10-24 13:33:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-02-06 00:14:00', '2025-02-06 01:19:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-07-17 01:48:00', '2025-07-17 09:42:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-02-06 14:26:00', '2025-02-07 01:46:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-09-28 14:22:00', '2025-09-29 00:51:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-24 10:34:00', 14, 224),
	('2025-02-06 00:55:00', 5, 225),
	('2025-07-17 08:35:00', 12, 226),
	('2025-02-06 16:57:00', 1, 227),
	('2025-09-28 20:22:00', 7, 228);

-- 36. Parking records for vehicle: SLA4490A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-17 13:44:00', 0.00, 1, 'CK51', 'SLA4490A'),
	('2025-02-12 16:18:00', 6.60, 1, 'SK48', 'SLA4490A'),
	('2025-06-05 10:58:00', 4.80, 1, 'SE50', 'SLA4490A'),
	('2025-06-06 04:03:00', 6.60, 1, 'JM24', 'SLA4490A'),
	('2025-11-01 05:25:00', 1.80, 2, 'PM23', 'SLA4490A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA4490A', 'CK51', '2025-01-17 13:44:00', '2025-01-17 13:45:00', 'SHORTTERM'),
	('SLA4490A', 'SK48', '2025-02-12 16:18:00', '2025-02-12 22:16:00', 'SHORTTERM'),
	('SLA4490A', 'SE50', '2025-06-05 10:58:00', '2025-06-05 15:27:00', 'SHORTTERM'),
	('SLA4490A', 'JM24', '2025-06-06 04:03:00', '2025-06-06 09:35:00', 'SHORTTERM'),
	('SLA4490A', 'PM23', '2025-11-01 05:25:00', '2025-11-01 07:02:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-12 20:33:00', 4, 230);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-07 14:00:00', 0, NULL, 'PM24', 'SLA4490A'),
	('2025-10-10 01:30:00', 0, NULL, 'PM24', 'SLA4490A'),
	('2025-04-18 14:46:00', 0, NULL, 'PM24', 'SLA4490A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA4490A', 'PM24', '2025-03-07 14:00:00', '2025-03-07 17:28:00', 'SEASONAL'),
	('SLA4490A', 'PM24', '2025-10-10 01:30:00', '2025-10-10 03:07:00', 'SEASONAL'),
	('SLA4490A', 'PM24', '2025-04-18 14:46:00', '2025-04-19 00:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-07 14:30:00', 10, 234),
	('2025-10-10 03:06:00', 4, 235),
	('2025-04-18 18:37:00', 6, 236);

-- 37. Parking records for vehicle: SLH2205U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-07 03:05:00', 1.20, 1, 'CK51', 'SLH2205U'),
	('2025-01-28 17:19:00', 14.40, 1, 'PL90', 'SLH2205U'),
	('2025-01-06 19:42:00', 10.80, 1, 'B13', 'SLH2205U'),
	('2025-09-18 17:10:00', 5.40, 1, 'JM24', 'SLH2205U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLH2205U', 'CK51', '2025-10-07 03:05:00', '2025-10-07 04:15:00', 'SHORTTERM'),
	('SLH2205U', 'PL90', '2025-01-28 17:19:00', '2025-01-29 05:53:00', 'SHORTTERM'),
	('SLH2205U', 'B13', '2025-01-06 19:42:00', '2025-01-07 05:19:00', 'SHORTTERM'),
	('SLH2205U', 'JM24', '2025-09-18 17:10:00', '2025-09-18 21:42:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 38. Parking records for vehicle: SLP4410S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-30 11:28:00', 12.00, 2, 'A35', 'SLP4410S'),
	('2025-03-06 02:12:00', 5.40, 1, 'J80M', 'SLP4410S'),
	('2025-10-16 22:17:00', 9.00, 1, 'CK22', 'SLP4410S'),
	('2025-05-10 08:27:00', 11.40, 2, 'A36', 'SLP4410S'),
	('2025-05-09 04:01:00', 4.80, 1, 'JM24', 'SLP4410S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLP4410S', 'A35', '2025-03-30 11:28:00', '2025-03-30 22:34:00', 'SHORTTERM'),
	('SLP4410S', 'J80M', '2025-03-06 02:12:00', '2025-03-06 06:46:00', 'SHORTTERM'),
	('SLP4410S', 'CK22', '2025-10-16 22:17:00', '2025-10-17 06:15:00', 'SHORTTERM'),
	('SLP4410S', 'A36', '2025-05-10 08:27:00', '2025-05-10 18:08:00', 'SHORTTERM'),
	('SLP4410S', 'JM24', '2025-05-09 04:01:00', '2025-05-09 08:30:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-17 12:46:00', 0, NULL, 'SK15', 'SLP4410S'),
	('2025-02-07 10:42:00', 0, NULL, 'SK15', 'SLP4410S'),
	('2025-09-05 07:03:00', 0, NULL, 'SK15', 'SLP4410S'),
	('2025-01-20 18:14:00', 0, NULL, 'SK15', 'SLP4410S'),
	('2025-07-22 17:40:00', 0, NULL, 'SK15', 'SLP4410S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLP4410S', 'SK15', '2025-03-17 12:46:00', '2025-03-17 20:05:00', 'SEASONAL'),
	('SLP4410S', 'SK15', '2025-02-07 10:42:00', '2025-02-07 14:56:00', 'SEASONAL'),
	('SLP4410S', 'SK15', '2025-09-05 07:03:00', '2025-09-05 17:39:00', 'SEASONAL'),
	('SLP4410S', 'SK15', '2025-01-20 18:14:00', '2025-01-21 01:26:00', 'SEASONAL'),
	('SLP4410S', 'SK15', '2025-07-22 17:40:00', '2025-07-23 06:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-17 19:30:00', 15, 246),
	('2025-02-07 12:01:00', 2, 247),
	('2025-09-05 07:17:00', 12, 248),
	('2025-01-21 00:04:00', 11, 249),
	('2025-07-23 04:01:00', 9, 250);

-- 39. Parking records for vehicle: SLS5501R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-20 09:04:00', 12.00, 2, 'JM25', 'SLS5501R'),
	('2025-10-13 23:03:00', 2.40, 1, 'W780', 'SLS5501R'),
	('2025-07-24 22:19:00', 10.80, 1, 'SK15', 'SLS5501R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLS5501R', 'JM25', '2025-07-20 09:04:00', '2025-07-20 22:26:00', 'SHORTTERM'),
	('SLS5501R', 'W780', '2025-10-13 23:03:00', '2025-10-14 01:32:00', 'SHORTTERM'),
	('SLS5501R', 'SK15', '2025-07-24 22:19:00', '2025-07-25 07:57:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 40. Parking records for vehicle: SLU6620S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-05 22:42:00', 12.00, 1, 'SK15', 'SLU6620S'),
	('2025-10-04 03:17:00', 7.20, 2, 'JM25', 'SLU6620S'),
	('2025-11-01 09:31:00', 12.00, 2, 'SB23', 'SLU6620S'),
	('2025-01-28 03:31:00', 3.60, 1, 'A34', 'SLU6620S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLU6620S', 'SK15', '2025-06-05 22:42:00', '2025-06-06 09:28:00', 'SHORTTERM'),
	('SLU6620S', 'JM25', '2025-10-04 03:17:00', '2025-10-04 09:40:00', 'SHORTTERM'),
	('SLU6620S', 'SB23', '2025-11-01 09:31:00', '2025-11-01 19:47:00', 'SHORTTERM'),
	('SLU6620S', 'A34', '2025-01-28 03:31:00', '2025-01-28 06:45:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-19 16:17:00', 0, NULL, 'SK48', 'SLU6620S'),
	('2025-08-12 09:39:00', 0, NULL, 'SK48', 'SLU6620S'),
	('2025-03-18 07:56:00', 0, NULL, 'SK48', 'SLU6620S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLU6620S', 'SK48', '2025-09-19 16:17:00', '2025-09-19 22:45:00', 'SEASONAL'),
	('SLU6620S', 'SK48', '2025-08-12 09:39:00', '2025-08-12 23:29:00', 'SEASONAL'),
	('SLU6620S', 'SK48', '2025-03-18 07:56:00', '2025-03-18 11:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-19 21:22:00', 10, 258),
	('2025-08-12 21:22:00', 14, 259),
	('2025-03-18 09:46:00', 4, 260);

-- 41. Parking records for vehicle: SLZ9904D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-23 14:51:00', 12.00, 1, 'W44', 'SLZ9904D'),
	('2025-06-23 05:09:00', 7.20, 1, 'PL80', 'SLZ9904D'),
	('2025-06-01 17:30:00', 7.80, 2, 'SK49', 'SLZ9904D'),
	('2025-08-30 04:55:00', 10.20, 2, 'SK49', 'SLZ9904D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLZ9904D', 'W44', '2025-01-23 14:51:00', '2025-01-24 01:13:00', 'SHORTTERM'),
	('SLZ9904D', 'PL80', '2025-06-23 05:09:00', '2025-06-23 11:18:00', 'SHORTTERM'),
	('SLZ9904D', 'SK49', '2025-06-01 17:30:00', '2025-06-02 00:07:00', 'SHORTTERM'),
	('SLZ9904D', 'SK49', '2025-08-30 04:55:00', '2025-08-30 13:45:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-23 06:18:00', 3, 262);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-10 20:38:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-07-31 18:36:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-01-31 07:44:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-04-02 05:41:00', 0, NULL, 'SK15', 'SLZ9904D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLZ9904D', 'SK15', '2025-10-10 20:38:00', '2025-10-10 21:28:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-07-31 18:36:00', '2025-08-01 04:25:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-01-31 07:44:00', '2025-01-31 10:25:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-04-02 05:41:00', '2025-04-02 08:16:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-10 20:42:00', 3, 265),
	('2025-08-01 00:52:00', 2, 266),
	('2025-01-31 09:33:00', 3, 267),
	('2025-04-02 07:35:00', 7, 268);

-- 42. Parking records for vehicle: SMC1122H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-04 05:27:00', 10.20, 2, 'GE1A', 'SMC1122H'),
	('2025-05-14 10:04:00', 12.00, 1, 'W45', 'SMC1122H'),
	('2025-08-20 06:28:00', 8.40, 1, 'SK49', 'SMC1122H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMC1122H', 'GE1A', '2025-10-04 05:27:00', '2025-10-04 14:12:00', 'SHORTTERM'),
	('SMC1122H', 'W45', '2025-05-14 10:04:00', '2025-05-14 21:55:00', 'SHORTTERM'),
	('SMC1122H', 'SK49', '2025-08-20 06:28:00', '2025-08-20 13:30:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-16 00:58:00', 0, NULL, 'SE50', 'SMC1122H'),
	('2025-04-17 08:33:00', 0, NULL, 'SE50', 'SMC1122H'),
	('2025-06-04 18:33:00', 0, NULL, 'SE50', 'SMC1122H'),
	('2025-05-17 00:53:00', 0, NULL, 'SE50', 'SMC1122H'),
	('2025-08-15 20:55:00', 0, NULL, 'SE50', 'SMC1122H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMC1122H', 'SE50', '2025-03-16 00:58:00', '2025-03-16 10:13:00', 'SEASONAL'),
	('SMC1122H', 'SE50', '2025-04-17 08:33:00', '2025-04-17 14:08:00', 'SEASONAL'),
	('SMC1122H', 'SE50', '2025-06-04 18:33:00', '2025-06-04 22:10:00', 'SEASONAL'),
	('SMC1122H', 'SE50', '2025-05-17 00:53:00', '2025-05-17 06:47:00', 'SEASONAL'),
	('SMC1122H', 'SE50', '2025-08-15 20:55:00', '2025-08-15 22:21:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-16 04:09:00', 14, 272),
	('2025-04-17 11:30:00', 10, 273),
	('2025-06-04 19:35:00', 4, 274),
	('2025-05-17 05:17:00', 6, 275),
	('2025-08-15 22:01:00', 14, 276);

-- 43. Parking records for vehicle: SMC7788H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-31 14:37:00', 15.60, 1, 'A36', 'SMC7788H'),
	('2025-03-15 11:30:00', 1.20, 2, 'W780', 'SMC7788H'),
	('2025-04-27 07:24:00', 10.20, 2, 'PM23', 'SMC7788H'),
	('2025-06-27 10:29:00', 8.40, 1, 'GE1A', 'SMC7788H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMC7788H', 'A36', '2025-03-31 14:37:00', '2025-04-01 04:13:00', 'SHORTTERM'),
	('SMC7788H', 'W780', '2025-03-15 11:30:00', '2025-03-15 12:54:00', 'SHORTTERM'),
	('SMC7788H', 'PM23', '2025-04-27 07:24:00', '2025-04-27 16:16:00', 'SHORTTERM'),
	('SMC7788H', 'GE1A', '2025-06-27 10:29:00', '2025-06-27 17:50:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-23 19:56:00', 0, NULL, 'A34', 'SMC7788H'),
	('2025-04-22 20:35:00', 0, NULL, 'A34', 'SMC7788H'),
	('2025-08-22 21:42:00', 0, NULL, 'A34', 'SMC7788H'),
	('2025-01-02 00:53:00', 0, NULL, 'A34', 'SMC7788H'),
	('2025-10-05 21:35:00', 0, NULL, 'A34', 'SMC7788H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMC7788H', 'A34', '2025-05-23 19:56:00', '2025-05-23 22:09:00', 'SEASONAL'),
	('SMC7788H', 'A34', '2025-04-22 20:35:00', '2025-04-23 02:06:00', 'SEASONAL'),
	('SMC7788H', 'A34', '2025-08-22 21:42:00', '2025-08-23 00:53:00', 'SEASONAL'),
	('SMC7788H', 'A34', '2025-01-02 00:53:00', '2025-01-02 01:21:00', 'SEASONAL'),
	('SMC7788H', 'A34', '2025-10-05 21:35:00', '2025-10-06 01:01:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-23 21:16:00', 4, 281),
	('2025-04-22 23:22:00', 9, 282),
	('2025-08-22 22:55:00', 12, 283),
	('2025-01-02 00:58:00', 5, 284),
	('2025-10-05 23:08:00', 14, 285);

-- 44. Parking records for vehicle: SMD4521L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-17 12:42:00', 10.80, 1, 'SK15', 'SMD4521L'),
	('2025-07-24 15:44:00', 12.00, 1, 'SB23', 'SMD4521L'),
	('2025-08-22 08:36:00', 12.00, 1, 'PL80', 'SMD4521L'),
	('2025-04-28 17:46:00', 11.40, 1, 'SE50', 'SMD4521L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMD4521L', 'SK15', '2025-07-17 12:42:00', '2025-07-17 21:56:00', 'SHORTTERM'),
	('SMD4521L', 'SB23', '2025-07-24 15:44:00', '2025-07-25 02:03:00', 'SHORTTERM'),
	('SMD4521L', 'PL80', '2025-08-22 08:36:00', '2025-08-22 19:03:00', 'SHORTTERM'),
	('SMD4521L', 'SE50', '2025-04-28 17:46:00', '2025-04-29 03:46:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-24 18:34:00', 0, NULL, 'A35', 'SMD4521L'),
	('2025-05-06 11:55:00', 0, NULL, 'A35', 'SMD4521L'),
	('2025-02-24 09:27:00', 0, NULL, 'A35', 'SMD4521L'),
	('2025-05-07 20:25:00', 0, NULL, 'A35', 'SMD4521L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMD4521L', 'A35', '2025-04-24 18:34:00', '2025-04-25 01:51:00', 'SEASONAL'),
	('SMD4521L', 'A35', '2025-05-06 11:55:00', '2025-05-06 23:31:00', 'SEASONAL'),
	('SMD4521L', 'A35', '2025-02-24 09:27:00', '2025-02-24 14:43:00', 'SEASONAL'),
	('SMD4521L', 'A35', '2025-05-07 20:25:00', '2025-05-08 08:15:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-24 22:22:00', 11, 290),
	('2025-05-06 21:56:00', 1, 291),
	('2025-02-24 12:39:00', 7, 292),
	('2025-05-08 03:34:00', 1, 293);

-- 45. Parking records for vehicle: SMU7781P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-28 09:21:00', 12.00, 2, 'SB23', 'SMU7781P'),
	('2025-03-15 21:38:00', 14.40, 2, 'W44', 'SMU7781P'),
	('2025-02-13 06:10:00', 3.00, 1, 'W44', 'SMU7781P'),
	('2025-01-12 05:28:00', 0.60, 2, 'C28', 'SMU7781P'),
	('2025-05-05 07:55:00', 9.00, 1, 'CK22', 'SMU7781P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMU7781P', 'SB23', '2025-06-28 09:21:00', '2025-06-28 22:34:00', 'SHORTTERM'),
	('SMU7781P', 'W44', '2025-03-15 21:38:00', '2025-03-16 10:21:00', 'SHORTTERM'),
	('SMU7781P', 'W44', '2025-02-13 06:10:00', '2025-02-13 08:44:00', 'SHORTTERM'),
	('SMU7781P', 'C28', '2025-01-12 05:28:00', '2025-01-12 06:26:00', 'SHORTTERM'),
	('SMU7781P', 'CK22', '2025-05-05 07:55:00', '2025-05-05 15:26:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-16 20:47:00', 0, NULL, 'A36', 'SMU7781P'),
	('2025-02-18 12:52:00', 0, NULL, 'A36', 'SMU7781P'),
	('2025-07-01 19:22:00', 0, NULL, 'A36', 'SMU7781P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMU7781P', 'A36', '2025-08-16 20:47:00', '2025-08-17 06:17:00', 'SEASONAL'),
	('SMU7781P', 'A36', '2025-02-18 12:52:00', '2025-02-18 17:47:00', 'SEASONAL'),
	('SMU7781P', 'A36', '2025-07-01 19:22:00', '2025-07-02 02:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-17 00:34:00', 15, 299),
	('2025-02-18 13:07:00', 3, 300),
	('2025-07-01 23:35:00', 14, 301);

-- 46. Parking records for vehicle: SNE5528R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-16 05:52:00', 12.00, 2, 'W81', 'SNE5528R'),
	('2025-01-30 21:07:00', 14.40, 1, 'A36', 'SNE5528R'),
	('2025-04-28 04:38:00', 1.80, 1, 'W45', 'SNE5528R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNE5528R', 'W81', '2025-08-16 05:52:00', '2025-08-16 18:14:00', 'SHORTTERM'),
	('SNE5528R', 'A36', '2025-01-30 21:07:00', '2025-01-31 09:40:00', 'SHORTTERM'),
	('SNE5528R', 'W45', '2025-04-28 04:38:00', '2025-04-28 06:30:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-05 00:49:00', 0, NULL, 'J80M', 'SNE5528R'),
	('2025-03-02 10:33:00', 0, NULL, 'J80M', 'SNE5528R'),
	('2025-04-07 01:07:00', 0, NULL, 'J80M', 'SNE5528R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNE5528R', 'J80M', '2025-09-05 00:49:00', '2025-09-05 10:08:00', 'SEASONAL'),
	('SNE5528R', 'J80M', '2025-03-02 10:33:00', '2025-03-02 17:43:00', 'SEASONAL'),
	('SNE5528R', 'J80M', '2025-04-07 01:07:00', '2025-04-07 07:11:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-05 04:54:00', 7, 305),
	('2025-03-02 14:19:00', 6, 306),
	('2025-04-07 04:28:00', 3, 307);

-- 47. Parking records for vehicle: SNL9876T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-09 06:13:00', 10.20, 2, 'C28', 'SNL9876T'),
	('2025-04-05 09:15:00', 12.00, 2, 'W780', 'SNL9876T'),
	('2025-10-05 12:09:00', 4.80, 2, 'PL80', 'SNL9876T'),
	('2025-01-27 22:17:00', 1.80, 1, 'SB23', 'SNL9876T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNL9876T', 'C28', '2025-02-09 06:13:00', '2025-02-09 14:44:00', 'SHORTTERM'),
	('SNL9876T', 'W780', '2025-04-05 09:15:00', '2025-04-05 20:01:00', 'SHORTTERM'),
	('SNL9876T', 'PL80', '2025-10-05 12:09:00', '2025-10-05 16:11:00', 'SHORTTERM'),
	('SNL9876T', 'SB23', '2025-01-27 22:17:00', '2025-01-28 00:02:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-11 05:22:00', 0, NULL, 'JM25', 'SNL9876T'),
	('2025-02-01 22:18:00', 0, NULL, 'JM25', 'SNL9876T'),
	('2025-02-01 01:37:00', 0, NULL, 'JM25', 'SNL9876T'),
	('2025-01-01 10:30:00', 0, NULL, 'JM25', 'SNL9876T'),
	('2025-10-12 05:31:00', 0, NULL, 'JM25', 'SNL9876T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNL9876T', 'JM25', '2025-02-11 05:22:00', '2025-02-11 09:30:00', 'SEASONAL'),
	('SNL9876T', 'JM25', '2025-02-01 22:18:00', '2025-02-02 07:26:00', 'SEASONAL'),
	('SNL9876T', 'JM25', '2025-02-01 01:37:00', '2025-02-01 11:36:00', 'SEASONAL'),
	('SNL9876T', 'JM25', '2025-01-01 10:30:00', '2025-01-01 15:13:00', 'SEASONAL'),
	('SNL9876T', 'JM25', '2025-10-12 05:31:00', '2025-10-12 06:22:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-11 06:46:00', 15, 312),
	('2025-02-01 22:43:00', 11, 313),
	('2025-02-01 09:33:00', 7, 314),
	('2025-01-01 14:00:00', 9, 315),
	('2025-10-12 06:20:00', 11, 316);

-- 48. Parking records for vehicle: SNY2035D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-23 21:01:00', 15.00, 1, 'GE1A', 'SNY2035D'),
	('2025-01-22 10:29:00', 8.40, 1, 'GE1A', 'SNY2035D'),
	('2025-07-12 08:12:00', 12.00, 2, 'SK49', 'SNY2035D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNY2035D', 'GE1A', '2025-10-23 21:01:00', '2025-10-24 10:50:00', 'SHORTTERM'),
	('SNY2035D', 'GE1A', '2025-01-22 10:29:00', '2025-01-22 17:56:00', 'SHORTTERM'),
	('SNY2035D', 'SK49', '2025-07-12 08:12:00', '2025-07-12 18:53:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-17 14:38:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-07-08 04:43:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-06-08 06:06:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-05-26 15:58:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-05-08 01:19:00', 0, NULL, 'JM24', 'SNY2035D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNY2035D', 'JM24', '2025-02-17 14:38:00', '2025-02-17 22:17:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-07-08 04:43:00', '2025-07-08 08:30:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-06-08 06:06:00', '2025-06-08 12:56:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-05-26 15:58:00', '2025-05-26 21:31:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-05-08 01:19:00', '2025-05-08 01:28:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-17 17:46:00', 13, 320),
	('2025-07-08 07:14:00', 5, 321),
	('2025-06-08 09:36:00', 3, 322),
	('2025-05-26 16:46:00', 10, 323),
	('2025-05-08 01:28:00', 7, 324);
