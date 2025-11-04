--Carpark data insertion
INSERT INTO Carpark (carpark_id, night_parking, grace_minutes, season_total_quota, season_current_count)
VALUES
  ('A34',  1, 15,  50, 0),
  ('A35',  1, 15,  50, 0),
  ('A36',  1, 15,  50, 0),
  ('SE50', 1, 15, 360, 0),
  ('C28',  1, 15,  50, 0),
  ('SK48', 1, 15, 360, 0),
  ('SK49', 1, 15, 360, 0),
  ('SK15', 1, 15, 390, 0),
  ('PL80', 0,  0,  60, 0),
  ('PL90', 0,  0,  50, 0),
  ('J80M', 1, 15, 330, 0),
  ('JM24', 1, 15, 360, 0),
  ('JM25', 1, 15, 360, 0),
  ('CK22', 0,  0, 330, 0),
  ('CK25', 0,  0,  50, 0),
  ('CK51', 0,  0, 300, 0),
  ('W44',  1, 15, 300, 0),
  ('W45',  1, 15, 300, 0),
  ('W780', 1, 15, 390, 0),
  ('W81',  1, 15, 300, 0),
  ('SB23', 1, 15, 360, 0),
  ('PM23', 1, 15, 330, 0),
  ('PM24', 1, 15, 240, 0),
  ('B13',  1, 15,  50, 0),
  ('GE1A', 1, 15,  50, 0);

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
    ('S7101234E', 'clara phua',       'clara.phua@gmail.com',     '98446655'),
	('S9512345A', 'lim jun jie', 'junjie.lim@gmail.com', '91234567'),
    ('T0123456B', 'siti aishah binte roslan', 'siti.aishah@yahoo.com', '82345678'),
    ('S8901234C', 'karthik S/O suresh', 'karthik.suresh@hotmail.com', '93456789'),
    ('S9876543Z', 'cheryl chan', 'cheryl.chan@gmail.com', '84567890'),
    ('S9234567E', 'muhammad hafiz bin ibrahim', 'hafiz.ibrahim@gmail.com', '95678901'),
    ('S8812345F', 'wang xiu ying', 'xiuying.wang@yahoo.com.sg', '86789012'),
    ('S9098765G', 'Devi D/O Ramachandran', 'devi.r@gmail.com', '97890123'),
    ('T0345678H', 'Bryan Koh', 'bryan.koh88@gmail.com', '88901234'),
    ('S8567890J', 'Fatimah Binte Hassan', 'fatimah.hassan@hotmail.com', '90123456'),
    ('S9456789K', 'Rajesh Kumar', 'rajesh.k@yahoo.com', '81234567'),
    ('T0011223L', 'Ong Wei Ling', 'weiling.ong@gmail.com', '92345678'),
    ('S8765432M', 'Abdul Rahman Bin Ali', 'abdul.rahman@gmail.com', '83456789'),
    ('T0234567N', 'Jaspreet Kaur', 'jaspreet.k@yahoo.com.sg', '94567890'),
    ('S9988776P', 'Melissa Low', 'melissa.low@gmail.com', '85678901'),
    ('S8233445Q', 'Teo Chin Huat', 'chTeo@gmail.com', '96789012'),
    ('S9655443R', 'Nurul Huda Binte Jamil', 'nurul.huda@hotmail.com', '87890123'),
    ('S8199887S', 'Govindasamy Pillai', 'govin.pillai@gmail.com', '98901234'),
    ('T0412345T', 'Jessica Tan', 'jessica.t@yahoo.com', '80123456'),
    ('S9321098U', 'Iskandar Bin Zulkarnain', 'iskandar.zul@gmail.com', '91122334'),
    ('S9787654V', 'Leong Mei Fen', 'meifen.leong@gmail.com', '82233445')

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
    ('SFQ1156Z', 'Z7777999900A', 'black',  2013, 1),
	('SFR2267A', 'A1112223344B', 'red',    2017, 1),
    ('SFS3378B', 'B2223334455C', 'black',  2020, 1),
    ('SFT4489C', 'C3334445566D', 'white',  2018, 1),
    ('SFU5590D', 'D4445556677E', 'blue',   2021, 1),
    ('SFV6601E', 'E5556667788F', 'grey',   2019, 1),
    ('SFW7712F', 'F6667778899G', 'silver', 2022, 1),
    ('SFX8823G', 'G7778889900H', 'red',    2014, 1),
    ('SFY9934H', 'H8889990011J', 'black',  2016, 1),
    ('SFZ0045J', 'J9990001122K', 'white',  2023, 1),
    ('SGA1156K', 'K0001112233L', 'blue',   2011, 0),
    ('SGB2267L', 'L1112223344M', 'grey',   2015, 1),
    ('SGC3378M', 'M2223334455N', 'silver', 2017, 1),
    ('SGD4489N', 'N3334445566P', 'red',    2019, 1),
    ('SGE5590P', 'P4445556677Q', 'black',  2021, 1),
    ('SGF6601Q', 'Q5556667788R', 'white',  2024, 1),
    ('SGG7712R', 'R6667778899S', 'blue',   2012, 1),
    ('SGH8823S', 'S7778889900T', 'grey',   2018, 1),
    ('SGJ9934T', 'T8889990011U', 'silver', 2020, 1),
    ('SGK0045U', 'U9990001122V', 'red',    2022, 1),
    ('SGL1156V', 'V0001112233W', 'black',  2013, 1),
    ('SGM2267W', 'W1112223344X', 'white',  2016, 1),
    ('SGN3378X', 'X2223334455Y', 'blue',   2018, 1),
    ('SGP4489Y', 'Y3334445566Z', 'grey',   2020, 1),
    ('SGQ5590Z', 'Z4445556677A', 'silver', 2022, 1),
    ('SGR6601A', 'A5556667788B', 'red',    2010, 1),
    ('SGS7712B', 'B6667778899C', 'black',  2014, 1),
    ('SGT8823C', 'C7778889900D', 'white',  2017, 0),
    ('SGU9934D', 'D8889990011E', 'blue',   2019, 1),
    ('SGV0045E', 'E9990001122F', 'grey',   2021, 1),
    ('SGW1156F', 'F0001112233G', 'silver', 2023, 1),
    ('SGX2267G', 'G1112223344H', 'red',    2011, 1),
    ('SGY3378H', 'H2223334455J', 'black',  2015, 1),
    ('SGZ4489J', 'J3334445566K', 'white',  2018, 1),
    ('SHA1298K', 'K4445556677L', 'blue',   2020, 1),
    ('SHB2309L', 'L5556667788M', 'grey',   2022, 1),
    ('SHC3410M', 'M6667778899N', 'silver', 2013, 1),
    ('SHD4521N', 'N7778889900P', 'red',    2016, 1),
    ('SHE5632P', 'P8889990011Q', 'black',  2019, 1),
    ('SHF6743Q', 'Q9990001122R', 'white',  2021, 1),
    ('SHG7854R', 'R0001112233S', 'blue',   2024, 1),
    ('SHH8965S', 'S1112223344T', 'grey',   2012, 1),
    ('SHJ9076T', 'T2223334455U', 'silver', 2017, 1),
    ('SHK0187U', 'U3334445566V', 'red',    2019, 1),
    ('SHL1298V', 'V4445556677W', 'black',  2021, 1),
    ('SHM2309W', 'W5556667788X', 'white',  2023, 1),
    ('SHN3410X', 'X6667778899Y', 'blue',   2010, 0),
    ('SHP4521Y', 'Y7778889900Z', 'grey',   2015, 1),
    ('SHQ5632Z', 'Z8889990011A', 'silver', 2018, 1),
    ('SHR6743A', 'A9990001122B', 'red',    2020, 1),
    ('SHS7854B', 'B0001112233C', 'black',  2022, 1);

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
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-29 02:01:01', 1, 'PL80', 'SKB3310Z'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-09-02 17:54:54', 4, 'C28', 'SGV0045E'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-10-29 05:58:35', 1, 'SE50', 'SFG2266Q'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-01-26 04:34:55', 1, 'B13', 'SLA1176A'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-05-31 09:52:51', 1, 'SK49', 'SGJ9934T'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-03-16 13:42:32', 4, 'SE50', 'SHD4521N'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-07-29 21:04:07', 4, 'JM24', 'SFN9933X'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-08-08 01:35:14', 3, 'JM25', 'SFL7711V'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-04-21 22:50:23', 1, 'PM23', 'SLH2205U'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-01-01 09:15:14', 3, 'CK22', 'SGU9934D'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-10-26 04:19:32', 2, 'JM24', 'SHL1298V'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-07-07 19:50:04', 1, 'W81', 'SJJ2208B'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-04-25 21:28:23', 3, 'JM24', 'SNY2035D'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-07-05 10:37:12', 4, 'SK48', 'SFE8844N'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-11-28 10:33:22', 4, 'GE1A', 'SKZ1144F'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-11-13 07:09:40', 3, 'J80M', 'SGQ5590Z'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-02-22 02:21:31', 1, 'C28', 'SGA1156K'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-04-25 22:29:29', 1, 'A36', 'SGP4489Y'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-05-18 23:58:48', 3, 'JM24', 'SGS7712B'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-06 20:18:23', 2, 'SK48', 'SHB2309L'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-15 16:21:47', 1, 'C28', 'SGB2267L'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-09-23 21:40:31', 1, 'PL90', 'SFY9934H'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-01-13 13:55:32', 4, 'A35', 'SGN3378X'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-21 03:39:03', 1, 'W44', 'SHQ5632Z'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-09-09 23:05:51', 4, 'SK15', 'SGZ4489J'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-07-04 09:43:24', 2, 'W44', 'SFS3378B'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-02-14 20:57:28', 1, 'PM24', 'SGF6601Q'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-03-04 18:09:25', 1, 'B13', 'SFA7703L'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-05-18 12:05:24', 3, 'W45', 'SHR6743A'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-04-05 16:45:44', 3, 'CK51', 'SHP4521Y'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-09-05 05:56:15', 3, 'B13', 'SFA3301L'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-01-25 07:47:59', 4, 'B13', 'SGD4489N'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-04-14 04:34:48', 3, 'J80M', 'SHH8965S'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-08-17 13:49:12', 1, 'CK25', 'SFQ1156Z'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-09-27 05:10:22', 3, 'SK49', 'SLS5501R'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-06-13 11:47:25', 4, 'W45', 'SHS7854B'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-01-19 11:57:32', 2, 'A36', 'SMU7781P'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-03-18 22:59:24', 2, 'GE1A', 'SGC3378M'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-11-06 10:37:44', 1, 'SK49', 'SFD6633M'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-03-14 21:25:17', 1, 'PM23', 'SFB2210K'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-14 10:07:20', 2, 'PL90', 'SJQ9021M'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-17 02:17:14', 2, 'CK25', 'SHN3410X'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-06-10 20:58:02', 2, 'PM23', 'SGG7712R'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-11-07 23:51:53', 4, 'B13', 'SGE5590P'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-11-04 14:13:47', 2, 'B13', 'SGX4420C'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-08-24 21:54:16', 4, 'PM24', 'SLA4490A'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-06-19 03:09:25', 1, 'JM24', 'SGT8823C'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-10-04 19:06:48', 1, 'PM24', 'SGX7722C'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-08-02 02:23:20', 2, 'PL80', 'SFZ0045J'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-01-24 14:22:56', 4, 'SK15', 'SGH8823S'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-02-04 06:56:21', 3, 'CK51', 'SFR2267A'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-05-15 22:41:27', 2, 'W45', 'SFU5590D'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-02-27 22:10:43', 1, 'A36', 'SFJ5599T'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-03-09 20:20:57', 1, 'A34', 'SFH3377R'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-08-13 17:32:37', 3, 'SK48', 'SLU6620S'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-24 16:22:21', 2, 'C28', 'SDB1123M'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-08-15 05:00:06', 4, 'A34', 'SGM2267W'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-05-09 05:32:43', 2, 'PM23', 'SGY3378H'),
	('active', '2024-12-31', '2025-12-31', 960.00, 'regular', '2024-09-02 15:45:13', 1, 'SB23', 'SJJ8811B'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-09-18 05:46:56', 2, 'A34', 'SHE5632P'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-12-09 01:19:25', 4, 'SK15', 'SLZ9904D'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-01-08 18:34:46', 2, 'SK15', 'SFC4422L'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-05-15 18:19:56', 4, 'JM24', 'SHK0187U'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-01-10 09:50:02', 3, 'W780', 'SJA1234K'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-11-06 20:47:36', 2, 'B13', 'SGX2267G'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-01-30 09:23:39', 3, 'W780', 'SFV6601E'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-07-21 21:20:27', 2, 'B13', 'SKZ7714F'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-07-31 23:10:26', 3, 'J80M', 'SNE5528R'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-06-27 13:34:02', 3, 'A36', 'SHG7854R'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-02-20 04:34:27', 2, 'PL80', 'SGC3378M'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-06-25 12:17:05', 4, 'A34', 'SFP0044Y'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-11-27 21:26:55', 3, 'GE1A', 'SFL7711V'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-02-10 23:37:20', 3, 'JM25', 'SGW1156F'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-06-27 22:20:08', 2, 'C28', 'SHE5632P'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-26 20:54:12', 2, 'PL90', 'SGX2267G'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-02-20 04:16:03', 2, 'W45', 'SGG7712R'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-11 12:26:47', 2, 'PM23', 'SHC3410M'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-05-10 01:06:22', 2, 'W780', 'SHF6743Q'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-03-06 14:24:05', 2, 'B13', 'SGF6601Q'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-04-12 00:54:44', 4, 'SK48', 'SGE5590P'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-10-09 02:35:07', 3, 'PM24', 'SHP4521Y'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-08 20:23:21', 2, 'C28', 'SLH2205U'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-09-13 14:38:37', 2, 'PM23', 'SJQ9021M'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-06-02 19:37:52', 4, 'SK48', 'SFF1155P'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-03-04 04:40:51', 3, 'CK22', 'SFR2267A'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-01-07 13:56:34', 2, 'SK15', 'SGP4489Y'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-01 10:22:51', 2, 'SB23', 'SGJ9934T'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-09-05 16:20:04', 2, 'C28', 'SGX7722C'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-06-07 07:08:45', 4, 'CK25', 'SGV0045E'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-12-04 18:18:38', 4, 'SB23', 'SGH8823S'),
	('active', '2024-12-31', '2025-12-31', 2220.00, 'regular', '2024-01-02 01:18:25', 4, 'JM24', 'SHA1298K'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-13 04:08:10', 2, 'SK48', 'SFA7703L'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-09-19 03:38:41', 2, 'PM24', 'SKE2214T'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-10-14 21:17:00', 2, 'W45', 'SGT8823C'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-04-22 20:31:23', 2, 'SE50', 'SGA1156K'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-03-03 21:04:26', 3, 'SK49', 'SJA1234K'),
	('active', '2024-12-31', '2025-12-31', 180.00, 'regular', '2024-02-09 22:42:59', 3, 'A34', 'SLS5501R'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-02-20 05:59:34', 2, 'SK48', 'SDB1123M'),
	('active', '2024-12-31', '2025-12-31', 1980.00, 'regular', '2024-11-08 12:00:28', 2, 'SK49', 'SFU5590D');


-- 1. Parking records for vehicle: SKB3310Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-10 04:55:00', 12.00, 1, 'W81', 'SKB3310Z'),
	('2025-01-13 21:09:00', 1.20, 1, 'B13', 'SKB3310Z'),
	('2025-08-04 01:50:00', 9.00, 1, 'SB23', 'SKB3310Z'),
	('2025-03-06 00:34:00', 12.00, 1, 'PL90', 'SKB3310Z'),
	('2025-08-30 03:02:00', 10.20, 2, 'PM23', 'SKB3310Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKB3310Z', 'W81', '2025-03-10 04:55:00', '2025-03-10 17:52:00', 'SHORTTERM'),
	('SKB3310Z', 'B13', '2025-01-13 21:09:00', '2025-01-13 22:33:00', 'SHORTTERM'),
	('SKB3310Z', 'SB23', '2025-08-04 01:50:00', '2025-08-04 09:37:00', 'SHORTTERM'),
	('SKB3310Z', 'PL90', '2025-03-06 00:34:00', '2025-03-06 13:01:00', 'SHORTTERM'),
	('SKB3310Z', 'PM23', '2025-08-30 03:02:00', '2025-08-30 11:32:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-18 20:47:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-01-23 02:56:00', 0, NULL, 'PL80', 'SKB3310Z'),
	('2025-07-14 17:59:00', 0, NULL, 'PL80', 'SKB3310Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKB3310Z', 'PL80', '2025-08-18 20:47:00', '2025-08-19 09:00:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-01-23 02:56:00', '2025-01-23 05:19:00', 'SEASONAL'),
	('SKB3310Z', 'PL80', '2025-07-14 17:59:00', '2025-07-15 07:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-19 07:25:00', 1, 6),
	('2025-01-23 04:28:00', 4, 7),
	('2025-07-15 04:50:00', 15, 8);

-- 2. Parking records for vehicle: SGV0045E
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-27 18:29:00', 0, NULL, 'C28', 'SGV0045E'),
	('2025-04-29 17:52:00', 0, NULL, 'C28', 'SGV0045E'),
	('2025-10-17 01:36:00', 0, NULL, 'C28', 'SGV0045E'),
	('2025-07-31 21:45:00', 0, NULL, 'C28', 'SGV0045E'),
	('2025-03-16 16:27:00', 0, NULL, 'C28', 'SGV0045E');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGV0045E', 'C28', '2025-05-27 18:29:00', '2025-05-27 20:11:00', 'SEASONAL'),
	('SGV0045E', 'C28', '2025-04-29 17:52:00', '2025-04-30 04:33:00', 'SEASONAL'),
	('SGV0045E', 'C28', '2025-10-17 01:36:00', '2025-10-17 12:21:00', 'SEASONAL'),
	('SGV0045E', 'C28', '2025-07-31 21:45:00', '2025-08-01 07:54:00', 'SEASONAL'),
	('SGV0045E', 'C28', '2025-03-16 16:27:00', '2025-03-16 17:17:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-27 19:18:00', 13, 9),
	('2025-04-30 03:57:00', 14, 10),
	('2025-10-17 11:27:00', 9, 11),
	('2025-08-01 06:54:00', 13, 12),
	('2025-03-16 16:29:00', 2, 13);

-- 3. Parking records for vehicle: SFG2266Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-19 20:25:00', 9.60, 2, 'C28', 'SFG2266Q'),
	('2025-09-16 19:30:00', 3.00, 1, 'B13', 'SFG2266Q'),
	('2025-04-20 16:38:00', 9.00, 2, 'W44', 'SFG2266Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFG2266Q', 'C28', '2025-10-19 20:25:00', '2025-10-20 04:57:00', 'SHORTTERM'),
	('SFG2266Q', 'B13', '2025-09-16 19:30:00', '2025-09-16 22:14:00', 'SHORTTERM'),
	('SFG2266Q', 'W44', '2025-04-20 16:38:00', '2025-04-21 00:52:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-01 19:03:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-02-06 07:35:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-10-30 23:06:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-05-29 09:24:00', 0, NULL, 'SE50', 'SFG2266Q'),
	('2025-10-08 01:32:00', 0, NULL, 'SE50', 'SFG2266Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFG2266Q', 'SE50', '2025-05-01 19:03:00', '2025-05-02 07:12:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-02-06 07:35:00', '2025-02-06 20:32:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-10-30 23:06:00', '2025-10-31 09:51:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-05-29 09:24:00', '2025-05-29 16:38:00', 'SEASONAL'),
	('SFG2266Q', 'SE50', '2025-10-08 01:32:00', '2025-10-08 05:19:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-01 23:33:00', 10, 17),
	('2025-02-06 16:34:00', 5, 18),
	('2025-10-31 02:54:00', 10, 19),
	('2025-05-29 11:12:00', 7, 20),
	('2025-10-08 04:15:00', 4, 21);

-- 4. Parking records for vehicle: SLA1176A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-27 21:45:00', 11.40, 2, 'PM23', 'SLA1176A'),
	('2025-08-25 13:33:00', 9.00, 1, 'CK51', 'SLA1176A'),
	('2025-02-10 16:33:00', 3.60, 1, 'SB23', 'SLA1176A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA1176A', 'PM23', '2025-07-27 21:45:00', '2025-07-28 07:53:00', 'SHORTTERM'),
	('SLA1176A', 'CK51', '2025-08-25 13:33:00', '2025-08-25 21:09:00', 'SHORTTERM'),
	('SLA1176A', 'SB23', '2025-02-10 16:33:00', '2025-02-10 19:59:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-25 13:34:00', 10, 23),
	('2025-02-10 17:53:00', 15, 24);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-08 12:48:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-01-10 12:54:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-06-04 03:02:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-03-12 02:51:00', 0, NULL, 'B13', 'SLA1176A'),
	('2025-04-18 05:45:00', 0, NULL, 'B13', 'SLA1176A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA1176A', 'B13', '2025-02-08 12:48:00', '2025-02-09 01:26:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-01-10 12:54:00', '2025-01-10 23:44:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-06-04 03:02:00', '2025-06-04 16:17:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-03-12 02:51:00', '2025-03-12 12:02:00', 'SEASONAL'),
	('SLA1176A', 'B13', '2025-04-18 05:45:00', '2025-04-18 11:56:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-08 13:24:00', 14, 25),
	('2025-01-10 17:55:00', 1, 26),
	('2025-06-04 16:05:00', 3, 27),
	('2025-03-12 09:39:00', 11, 28),
	('2025-04-18 07:45:00', 4, 29);

-- 5. Parking records for vehicle: SGJ9934T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-04 09:01:00', 10.20, 1, 'J80M', 'SGJ9934T'),
	('2025-07-21 18:22:00', 0.00, 1, 'JM25', 'SGJ9934T'),
	('2025-06-05 10:16:00', 4.80, 1, 'PL90', 'SGJ9934T'),
	('2025-07-09 05:02:00', 11.40, 1, 'CK25', 'SGJ9934T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGJ9934T', 'J80M', '2025-07-04 09:01:00', '2025-07-04 17:54:00', 'SHORTTERM'),
	('SGJ9934T', 'JM25', '2025-07-21 18:22:00', '2025-07-21 18:33:00', 'SHORTTERM'),
	('SGJ9934T', 'PL90', '2025-06-05 10:16:00', '2025-06-05 14:40:00', 'SHORTTERM'),
	('SGJ9934T', 'CK25', '2025-07-09 05:02:00', '2025-07-09 14:49:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-07 05:29:00', 0, NULL, 'SK49', 'SGJ9934T'),
	('2025-04-30 03:56:00', 0, NULL, 'SK49', 'SGJ9934T'),
	('2025-08-16 10:12:00', 0, NULL, 'SK49', 'SGJ9934T'),
	('2025-01-24 23:20:00', 0, NULL, 'SK49', 'SGJ9934T'),
	('2025-07-06 20:15:00', 0, NULL, 'SK49', 'SGJ9934T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGJ9934T', 'SK49', '2025-07-07 05:29:00', '2025-07-07 09:16:00', 'SEASONAL'),
	('SGJ9934T', 'SK49', '2025-04-30 03:56:00', '2025-04-30 07:53:00', 'SEASONAL'),
	('SGJ9934T', 'SK49', '2025-08-16 10:12:00', '2025-08-16 13:22:00', 'SEASONAL'),
	('SGJ9934T', 'SK49', '2025-01-24 23:20:00', '2025-01-25 01:55:00', 'SEASONAL'),
	('SGJ9934T', 'SK49', '2025-07-06 20:15:00', '2025-07-07 02:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-07 07:13:00', 13, 34),
	('2025-04-30 05:30:00', 5, 35),
	('2025-08-16 10:46:00', 5, 36),
	('2025-01-25 00:33:00', 8, 37),
	('2025-07-06 23:01:00', 2, 38);

-- 6. Parking records for vehicle: SHD4521N
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-12 13:02:00', 0, NULL, 'SE50', 'SHD4521N'),
	('2025-04-06 19:59:00', 0, NULL, 'SE50', 'SHD4521N'),
	('2025-05-15 02:08:00', 0, NULL, 'SE50', 'SHD4521N');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHD4521N', 'SE50', '2025-03-12 13:02:00', '2025-03-13 02:42:00', 'SEASONAL'),
	('SHD4521N', 'SE50', '2025-04-06 19:59:00', '2025-04-06 22:07:00', 'SEASONAL'),
	('SHD4521N', 'SE50', '2025-05-15 02:08:00', '2025-05-15 06:32:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-12 22:52:00', 9, 39),
	('2025-04-06 21:27:00', 1, 40),
	('2025-05-15 03:07:00', 10, 41);

-- 7. Parking records for vehicle: SFN9933X
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-24 22:26:00', 0, NULL, 'JM24', 'SFN9933X'),
	('2025-09-08 06:37:00', 0, NULL, 'JM24', 'SFN9933X'),
	('2025-10-18 23:23:00', 0, NULL, 'JM24', 'SFN9933X'),
	('2025-03-04 12:51:00', 0, NULL, 'JM24', 'SFN9933X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFN9933X', 'JM24', '2025-07-24 22:26:00', '2025-07-25 08:09:00', 'SEASONAL'),
	('SFN9933X', 'JM24', '2025-09-08 06:37:00', '2025-09-08 09:08:00', 'SEASONAL'),
	('SFN9933X', 'JM24', '2025-10-18 23:23:00', '2025-10-19 00:33:00', 'SEASONAL'),
	('SFN9933X', 'JM24', '2025-03-04 12:51:00', '2025-03-04 23:50:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-25 04:52:00', 3, 42),
	('2025-09-08 06:46:00', 6, 43),
	('2025-10-19 00:22:00', 6, 44),
	('2025-03-04 20:00:00', 12, 45);

-- 8. Parking records for vehicle: SFL7711V
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-12 14:49:00', 0, NULL, 'JM25', 'SFL7711V'),
	('2025-10-24 13:41:00', 0, NULL, 'JM25', 'SFL7711V'),
	('2025-01-25 19:38:00', 0, NULL, 'JM25', 'SFL7711V'),
	('2025-01-31 21:33:00', 0, NULL, 'JM25', 'SFL7711V'),
	('2025-09-03 19:53:00', 0, NULL, 'JM25', 'SFL7711V');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFL7711V', 'JM25', '2025-03-12 14:49:00', '2025-03-13 01:42:00', 'SEASONAL'),
	('SFL7711V', 'JM25', '2025-10-24 13:41:00', '2025-10-24 15:51:00', 'SEASONAL'),
	('SFL7711V', 'JM25', '2025-01-25 19:38:00', '2025-01-26 08:36:00', 'SEASONAL'),
	('SFL7711V', 'JM25', '2025-01-31 21:33:00', '2025-02-01 03:58:00', 'SEASONAL'),
	('SFL7711V', 'JM25', '2025-09-03 19:53:00', '2025-09-04 07:38:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-12 23:21:00', 3, 46),
	('2025-10-24 14:14:00', 2, 47),
	('2025-01-26 00:12:00', 5, 48),
	('2025-01-31 21:48:00', 5, 49),
	('2025-09-04 06:58:00', 6, 50);

-- 9. Parking records for vehicle: SLH2205U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-05 08:59:00', 10.80, 1, 'A34', 'SLH2205U'),
	('2025-05-15 17:24:00', 6.00, 1, 'SK15', 'SLH2205U'),
	('2025-08-24 22:01:00', 10.80, 2, 'SK15', 'SLH2205U'),
	('2025-01-26 09:41:00', 10.80, 2, 'C28', 'SLH2205U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLH2205U', 'A34', '2025-08-05 08:59:00', '2025-08-05 18:04:00', 'SHORTTERM'),
	('SLH2205U', 'SK15', '2025-05-15 17:24:00', '2025-05-15 22:41:00', 'SHORTTERM'),
	('SLH2205U', 'SK15', '2025-08-24 22:01:00', '2025-08-25 07:54:00', 'SHORTTERM'),
	('SLH2205U', 'C28', '2025-01-26 09:41:00', '2025-01-26 18:56:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-26 03:47:00', 0, NULL, 'PM23', 'SLH2205U'),
	('2025-06-20 23:29:00', 0, NULL, 'PM23', 'SLH2205U'),
	('2025-09-10 22:48:00', 0, NULL, 'PM23', 'SLH2205U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLH2205U', 'PM23', '2025-07-26 03:47:00', '2025-07-26 06:55:00', 'SEASONAL'),
	('SLH2205U', 'PM23', '2025-06-20 23:29:00', '2025-06-21 05:32:00', 'SEASONAL'),
	('SLH2205U', 'PM23', '2025-09-10 22:48:00', '2025-09-11 08:25:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-26 05:59:00', 2, 55),
	('2025-06-20 23:29:00', 6, 56),
	('2025-09-11 06:58:00', 12, 57);

-- 10. Parking records for vehicle: SGU9934D
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-22 12:21:00', 0, NULL, 'CK22', 'SGU9934D'),
	('2025-06-29 21:29:00', 0, NULL, 'CK22', 'SGU9934D'),
	('2025-07-10 16:53:00', 0, NULL, 'CK22', 'SGU9934D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGU9934D', 'CK22', '2025-04-22 12:21:00', '2025-04-23 02:12:00', 'SEASONAL'),
	('SGU9934D', 'CK22', '2025-06-29 21:29:00', '2025-06-30 09:44:00', 'SEASONAL'),
	('SGU9934D', 'CK22', '2025-07-10 16:53:00', '2025-07-10 20:37:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-22 15:54:00', 1, 58),
	('2025-06-30 05:56:00', 4, 59),
	('2025-07-10 19:34:00', 8, 60);

-- 11. Parking records for vehicle: SHL1298V
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-18 06:49:00', 1.20, 1, 'J80M', 'SHL1298V'),
	('2025-08-18 09:51:00', 12.00, 1, 'CK51', 'SHL1298V'),
	('2025-06-19 08:00:00', 12.00, 1, 'PL90', 'SHL1298V');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHL1298V', 'J80M', '2025-07-18 06:49:00', '2025-07-18 08:14:00', 'SHORTTERM'),
	('SHL1298V', 'CK51', '2025-08-18 09:51:00', '2025-08-18 23:36:00', 'SHORTTERM'),
	('SHL1298V', 'PL90', '2025-06-19 08:00:00', '2025-06-19 20:04:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-25 10:12:00', 0, NULL, 'JM24', 'SHL1298V'),
	('2025-07-28 07:24:00', 0, NULL, 'JM24', 'SHL1298V'),
	('2025-10-18 05:01:00', 0, NULL, 'JM24', 'SHL1298V'),
	('2025-04-02 21:54:00', 0, NULL, 'JM24', 'SHL1298V'),
	('2025-02-06 18:00:00', 0, NULL, 'JM24', 'SHL1298V');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHL1298V', 'JM24', '2025-08-25 10:12:00', '2025-08-25 13:15:00', 'SEASONAL'),
	('SHL1298V', 'JM24', '2025-07-28 07:24:00', '2025-07-28 16:36:00', 'SEASONAL'),
	('SHL1298V', 'JM24', '2025-10-18 05:01:00', '2025-10-18 09:50:00', 'SEASONAL'),
	('SHL1298V', 'JM24', '2025-04-02 21:54:00', '2025-04-03 04:14:00', 'SEASONAL'),
	('SHL1298V', 'JM24', '2025-02-06 18:00:00', '2025-02-06 23:38:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-25 10:35:00', 2, 64),
	('2025-07-28 12:53:00', 3, 65),
	('2025-10-18 09:21:00', 10, 66),
	('2025-04-02 23:27:00', 1, 67),
	('2025-02-06 23:22:00', 12, 68);

-- 12. Parking records for vehicle: SJJ2208B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-23 22:46:00', 13.20, 1, 'B13', 'SJJ2208B'),
	('2025-03-20 16:08:00', 10.80, 1, 'JM24', 'SJJ2208B'),
	('2025-06-05 19:38:00', 12.60, 1, 'W780', 'SJJ2208B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ2208B', 'B13', '2025-09-23 22:46:00', '2025-09-24 12:40:00', 'SHORTTERM'),
	('SJJ2208B', 'JM24', '2025-03-20 16:08:00', '2025-03-21 01:38:00', 'SHORTTERM'),
	('SJJ2208B', 'W780', '2025-06-05 19:38:00', '2025-06-06 06:32:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-02 20:37:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-02-28 14:59:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-08-12 05:50:00', 0, NULL, 'W81', 'SJJ2208B'),
	('2025-03-27 10:15:00', 0, NULL, 'W81', 'SJJ2208B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ2208B', 'W81', '2025-03-02 20:37:00', '2025-03-02 22:58:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-02-28 14:59:00', '2025-02-28 20:57:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-08-12 05:50:00', '2025-08-12 15:48:00', 'SEASONAL'),
	('SJJ2208B', 'W81', '2025-03-27 10:15:00', '2025-03-27 12:51:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-02 22:28:00', 4, 72),
	('2025-02-28 16:12:00', 2, 73),
	('2025-08-12 08:56:00', 6, 74),
	('2025-03-27 10:43:00', 6, 75);

-- 13. Parking records for vehicle: SNY2035D
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-19 11:14:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-04-28 13:41:00', 0, NULL, 'JM24', 'SNY2035D'),
	('2025-07-22 16:27:00', 0, NULL, 'JM24', 'SNY2035D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNY2035D', 'JM24', '2025-02-19 11:14:00', '2025-02-19 23:07:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-04-28 13:41:00', '2025-04-29 03:27:00', 'SEASONAL'),
	('SNY2035D', 'JM24', '2025-07-22 16:27:00', '2025-07-22 23:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-19 18:13:00', 8, 76),
	('2025-04-28 18:39:00', 10, 77),
	('2025-07-22 22:36:00', 3, 78);

-- 14. Parking records for vehicle: SFE8844N
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-14 20:06:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-08-25 23:34:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-09-29 06:34:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-07-01 14:54:00', 0, NULL, 'SK48', 'SFE8844N'),
	('2025-10-13 17:34:00', 0, NULL, 'SK48', 'SFE8844N');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFE8844N', 'SK48', '2025-06-14 20:06:00', '2025-06-15 03:50:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-08-25 23:34:00', '2025-08-26 13:04:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-09-29 06:34:00', '2025-09-29 10:32:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-07-01 14:54:00', '2025-07-01 21:14:00', 'SEASONAL'),
	('SFE8844N', 'SK48', '2025-10-13 17:34:00', '2025-10-13 21:00:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-15 02:59:00', 3, 79),
	('2025-08-26 01:48:00', 2, 80),
	('2025-09-29 07:51:00', 2, 81),
	('2025-07-01 16:41:00', 12, 82),
	('2025-10-13 20:08:00', 7, 83);

-- 15. Parking records for vehicle: SKZ1144F
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-24 17:14:00', 0, NULL, 'GE1A', 'SKZ1144F'),
	('2025-05-30 10:40:00', 0, NULL, 'GE1A', 'SKZ1144F'),
	('2025-09-06 14:41:00', 0, NULL, 'GE1A', 'SKZ1144F'),
	('2025-04-18 02:11:00', 0, NULL, 'GE1A', 'SKZ1144F'),
	('2025-08-12 04:29:00', 0, NULL, 'GE1A', 'SKZ1144F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ1144F', 'GE1A', '2025-07-24 17:14:00', '2025-07-25 04:59:00', 'SEASONAL'),
	('SKZ1144F', 'GE1A', '2025-05-30 10:40:00', '2025-05-30 14:55:00', 'SEASONAL'),
	('SKZ1144F', 'GE1A', '2025-09-06 14:41:00', '2025-09-06 23:40:00', 'SEASONAL'),
	('SKZ1144F', 'GE1A', '2025-04-18 02:11:00', '2025-04-18 05:35:00', 'SEASONAL'),
	('SKZ1144F', 'GE1A', '2025-08-12 04:29:00', '2025-08-12 04:39:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-24 23:05:00', 4, 84),
	('2025-05-30 11:14:00', 1, 85),
	('2025-09-06 19:48:00', 14, 86),
	('2025-04-18 02:29:00', 11, 87),
	('2025-08-12 04:33:00', 3, 88);

-- 16. Parking records for vehicle: SGQ5590Z
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-08 08:39:00', 0, NULL, 'J80M', 'SGQ5590Z'),
	('2025-07-19 03:33:00', 0, NULL, 'J80M', 'SGQ5590Z'),
	('2025-01-09 20:36:00', 0, NULL, 'J80M', 'SGQ5590Z'),
	('2025-02-09 09:11:00', 0, NULL, 'J80M', 'SGQ5590Z'),
	('2025-01-25 12:15:00', 0, NULL, 'J80M', 'SGQ5590Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGQ5590Z', 'J80M', '2025-02-08 08:39:00', '2025-02-08 15:32:00', 'SEASONAL'),
	('SGQ5590Z', 'J80M', '2025-07-19 03:33:00', '2025-07-19 06:02:00', 'SEASONAL'),
	('SGQ5590Z', 'J80M', '2025-01-09 20:36:00', '2025-01-10 00:26:00', 'SEASONAL'),
	('SGQ5590Z', 'J80M', '2025-02-09 09:11:00', '2025-02-09 18:48:00', 'SEASONAL'),
	('SGQ5590Z', 'J80M', '2025-01-25 12:15:00', '2025-01-26 01:18:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-08 12:13:00', 7, 89),
	('2025-07-19 04:39:00', 11, 90),
	('2025-01-09 22:44:00', 12, 91),
	('2025-02-09 10:43:00', 1, 92),
	('2025-01-25 17:50:00', 5, 93);

-- 17. Parking records for vehicle: SGA1156K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-07 02:50:00', 12.00, 2, 'CK25', 'SGA1156K'),
	('2025-07-06 23:42:00', 2.40, 2, 'A35', 'SGA1156K'),
	('2025-04-04 22:57:00', 11.40, 1, 'SE50', 'SGA1156K'),
	('2025-08-09 22:44:00', 6.60, 2, 'W45', 'SGA1156K'),
	('2025-06-01 04:04:00', 7.80, 2, 'W780', 'SGA1156K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGA1156K', 'CK25', '2025-09-07 02:50:00', '2025-09-07 14:46:00', 'SHORTTERM'),
	('SGA1156K', 'A35', '2025-07-06 23:42:00', '2025-07-07 02:25:00', 'SHORTTERM'),
	('SGA1156K', 'SE50', '2025-04-04 22:57:00', '2025-04-05 08:38:00', 'SHORTTERM'),
	('SGA1156K', 'W45', '2025-08-09 22:44:00', '2025-08-10 04:50:00', 'SHORTTERM'),
	('SGA1156K', 'W780', '2025-06-01 04:04:00', '2025-06-01 10:43:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-12 14:00:00', 0, NULL, 'C28', 'SGA1156K'),
	('2025-07-23 01:25:00', 0, NULL, 'C28', 'SGA1156K'),
	('2025-08-15 13:44:00', 0, NULL, 'C28', 'SGA1156K'),
	('2025-05-14 10:00:00', 0, NULL, 'C28', 'SGA1156K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGA1156K', 'C28', '2025-02-12 14:00:00', '2025-02-13 01:56:00', 'SEASONAL'),
	('SGA1156K', 'C28', '2025-07-23 01:25:00', '2025-07-23 01:57:00', 'SEASONAL'),
	('SGA1156K', 'C28', '2025-08-15 13:44:00', '2025-08-15 17:30:00', 'SEASONAL'),
	('SGA1156K', 'C28', '2025-05-14 10:00:00', '2025-05-14 18:16:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-12 21:20:00', 3, 99),
	('2025-07-23 01:54:00', 4, 100),
	('2025-08-15 14:23:00', 7, 101),
	('2025-05-14 12:52:00', 12, 102);

-- 18. Parking records for vehicle: SGP4489Y
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-30 19:45:00', 0.60, 1, 'PL90', 'SGP4489Y'),
	('2025-10-18 04:22:00', 12.00, 2, 'PM23', 'SGP4489Y'),
	('2025-01-01 14:14:00', 11.40, 1, 'J80M', 'SGP4489Y'),
	('2025-08-21 18:24:00', 2.40, 1, 'CK25', 'SGP4489Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGP4489Y', 'PL90', '2025-09-30 19:45:00', '2025-09-30 20:31:00', 'SHORTTERM'),
	('SGP4489Y', 'PM23', '2025-10-18 04:22:00', '2025-10-18 15:47:00', 'SHORTTERM'),
	('SGP4489Y', 'J80M', '2025-01-01 14:14:00', '2025-01-01 23:50:00', 'SHORTTERM'),
	('SGP4489Y', 'CK25', '2025-08-21 18:24:00', '2025-08-21 20:28:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-31 10:22:00', 0, NULL, 'A36', 'SGP4489Y'),
	('2025-02-15 00:08:00', 0, NULL, 'A36', 'SGP4489Y'),
	('2025-07-26 01:14:00', 0, NULL, 'A36', 'SGP4489Y'),
	('2025-02-03 07:59:00', 0, NULL, 'A36', 'SGP4489Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGP4489Y', 'A36', '2025-08-31 10:22:00', '2025-08-31 20:24:00', 'SEASONAL'),
	('SGP4489Y', 'A36', '2025-02-15 00:08:00', '2025-02-15 05:36:00', 'SEASONAL'),
	('SGP4489Y', 'A36', '2025-07-26 01:14:00', '2025-07-26 15:02:00', 'SEASONAL'),
	('SGP4489Y', 'A36', '2025-02-03 07:59:00', '2025-02-03 11:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-31 18:45:00', 13, 107),
	('2025-02-15 00:14:00', 1, 108),
	('2025-07-26 06:47:00', 7, 109),
	('2025-02-03 08:50:00', 14, 110);

-- 19. Parking records for vehicle: SGS7712B
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-05 05:49:00', 0, NULL, 'JM24', 'SGS7712B'),
	('2025-03-20 03:11:00', 0, NULL, 'JM24', 'SGS7712B'),
	('2025-06-02 16:26:00', 0, NULL, 'JM24', 'SGS7712B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGS7712B', 'JM24', '2025-06-05 05:49:00', '2025-06-05 16:55:00', 'SEASONAL'),
	('SGS7712B', 'JM24', '2025-03-20 03:11:00', '2025-03-20 07:31:00', 'SEASONAL'),
	('SGS7712B', 'JM24', '2025-06-02 16:26:00', '2025-06-02 23:33:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-05 14:33:00', 8, 111),
	('2025-03-20 05:29:00', 7, 112),
	('2025-06-02 17:59:00', 7, 113);

-- 20. Parking records for vehicle: SHB2309L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-08 15:04:00', 6.00, 1, 'C28', 'SHB2309L'),
	('2025-04-21 14:56:00', 1.80, 1, 'GE1A', 'SHB2309L'),
	('2025-01-22 08:43:00', 9.60, 1, 'PL90', 'SHB2309L'),
	('2025-05-28 08:21:00', 12.00, 1, 'JM25', 'SHB2309L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHB2309L', 'C28', '2025-10-08 15:04:00', '2025-10-08 20:30:00', 'SHORTTERM'),
	('SHB2309L', 'GE1A', '2025-04-21 14:56:00', '2025-04-21 16:46:00', 'SHORTTERM'),
	('SHB2309L', 'PL90', '2025-01-22 08:43:00', '2025-01-22 16:54:00', 'SHORTTERM'),
	('SHB2309L', 'JM25', '2025-05-28 08:21:00', '2025-05-28 20:52:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-22 14:35:00', 6, 116);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-04 04:24:00', 0, NULL, 'SK48', 'SHB2309L'),
	('2025-02-02 23:02:00', 0, NULL, 'SK48', 'SHB2309L'),
	('2025-08-23 02:46:00', 0, NULL, 'SK48', 'SHB2309L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHB2309L', 'SK48', '2025-10-04 04:24:00', '2025-10-04 18:17:00', 'SEASONAL'),
	('SHB2309L', 'SK48', '2025-02-02 23:02:00', '2025-02-03 00:03:00', 'SEASONAL'),
	('SHB2309L', 'SK48', '2025-08-23 02:46:00', '2025-08-23 12:52:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-04 08:31:00', 3, 118),
	('2025-02-02 23:07:00', 2, 119),
	('2025-08-23 08:32:00', 7, 120);

-- 21. Parking records for vehicle: SGB2267L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-05 14:40:00', 7.80, 1, 'J80M', 'SGB2267L'),
	('2025-06-02 23:01:00', 12.60, 1, 'PM24', 'SGB2267L'),
	('2025-10-30 15:37:00', 15.60, 1, 'CK51', 'SGB2267L'),
	('2025-09-10 04:23:00', 10.20, 1, 'A34', 'SGB2267L'),
	('2025-02-04 09:16:00', 9.00, 1, 'SE50', 'SGB2267L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGB2267L', 'J80M', '2025-02-05 14:40:00', '2025-02-05 21:33:00', 'SHORTTERM'),
	('SGB2267L', 'PM24', '2025-06-02 23:01:00', '2025-06-03 11:26:00', 'SHORTTERM'),
	('SGB2267L', 'CK51', '2025-10-30 15:37:00', '2025-10-31 05:14:00', 'SHORTTERM'),
	('SGB2267L', 'A34', '2025-09-10 04:23:00', '2025-09-10 13:04:00', 'SHORTTERM'),
	('SGB2267L', 'SE50', '2025-02-04 09:16:00', '2025-02-04 17:02:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-12 07:46:00', 0, NULL, 'C28', 'SGB2267L'),
	('2025-03-27 23:52:00', 0, NULL, 'C28', 'SGB2267L'),
	('2025-02-04 05:11:00', 0, NULL, 'C28', 'SGB2267L'),
	('2025-09-21 11:44:00', 0, NULL, 'C28', 'SGB2267L'),
	('2025-01-15 14:36:00', 0, NULL, 'C28', 'SGB2267L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGB2267L', 'C28', '2025-01-12 07:46:00', '2025-01-12 10:43:00', 'SEASONAL'),
	('SGB2267L', 'C28', '2025-03-27 23:52:00', '2025-03-28 12:02:00', 'SEASONAL'),
	('SGB2267L', 'C28', '2025-02-04 05:11:00', '2025-02-04 07:46:00', 'SEASONAL'),
	('SGB2267L', 'C28', '2025-09-21 11:44:00', '2025-09-21 17:43:00', 'SEASONAL'),
	('SGB2267L', 'C28', '2025-01-15 14:36:00', '2025-01-15 19:45:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-12 10:27:00', 15, 126),
	('2025-03-28 03:36:00', 1, 127),
	('2025-02-04 05:57:00', 2, 128),
	('2025-09-21 17:24:00', 1, 129),
	('2025-01-15 16:13:00', 1, 130);

-- 22. Parking records for vehicle: SFY9934H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-05 17:29:00', 4.20, 1, 'SE50', 'SFY9934H'),
	('2025-01-01 02:19:00', 12.00, 1, 'C28', 'SFY9934H'),
	('2025-09-08 04:11:00', 2.40, 1, 'B13', 'SFY9934H'),
	('2025-06-22 06:08:00', 12.00, 2, 'W45', 'SFY9934H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFY9934H', 'SE50', '2025-09-05 17:29:00', '2025-09-05 21:11:00', 'SHORTTERM'),
	('SFY9934H', 'C28', '2025-01-01 02:19:00', '2025-01-01 16:07:00', 'SHORTTERM'),
	('SFY9934H', 'B13', '2025-09-08 04:11:00', '2025-09-08 06:26:00', 'SHORTTERM'),
	('SFY9934H', 'W45', '2025-06-22 06:08:00', '2025-06-22 18:09:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-13 12:33:00', 0, NULL, 'PL90', 'SFY9934H'),
	('2025-02-05 08:54:00', 0, NULL, 'PL90', 'SFY9934H'),
	('2025-06-15 20:22:00', 0, NULL, 'PL90', 'SFY9934H'),
	('2025-05-22 04:18:00', 0, NULL, 'PL90', 'SFY9934H'),
	('2025-06-02 16:53:00', 0, NULL, 'PL90', 'SFY9934H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFY9934H', 'PL90', '2025-10-13 12:33:00', '2025-10-13 20:31:00', 'SEASONAL'),
	('SFY9934H', 'PL90', '2025-02-05 08:54:00', '2025-02-05 18:46:00', 'SEASONAL'),
	('SFY9934H', 'PL90', '2025-06-15 20:22:00', '2025-06-15 22:21:00', 'SEASONAL'),
	('SFY9934H', 'PL90', '2025-05-22 04:18:00', '2025-05-22 05:35:00', 'SEASONAL'),
	('SFY9934H', 'PL90', '2025-06-02 16:53:00', '2025-06-02 17:01:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-13 17:26:00', 13, 135),
	('2025-02-05 16:36:00', 5, 136),
	('2025-06-15 20:49:00', 3, 137),
	('2025-05-22 04:34:00', 9, 138),
	('2025-06-02 17:01:00', 12, 139);

-- 23. Parking records for vehicle: SGN3378X
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-06 10:31:00', 0, NULL, 'A35', 'SGN3378X'),
	('2025-08-03 21:50:00', 0, NULL, 'A35', 'SGN3378X'),
	('2025-09-09 11:12:00', 0, NULL, 'A35', 'SGN3378X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGN3378X', 'A35', '2025-07-06 10:31:00', '2025-07-06 17:36:00', 'SEASONAL'),
	('SGN3378X', 'A35', '2025-08-03 21:50:00', '2025-08-04 04:33:00', 'SEASONAL'),
	('SGN3378X', 'A35', '2025-09-09 11:12:00', '2025-09-09 17:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-06 16:44:00', 2, 140),
	('2025-08-04 04:24:00', 9, 141),
	('2025-09-09 17:40:00', 15, 142);

-- 24. Parking records for vehicle: SHQ5632Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-25 12:21:00', 7.80, 1, 'SK15', 'SHQ5632Z'),
	('2025-01-19 13:37:00', 0.00, 2, 'PM23', 'SHQ5632Z'),
	('2025-05-19 01:37:00', 1.80, 1, 'C28', 'SHQ5632Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHQ5632Z', 'SK15', '2025-02-25 12:21:00', '2025-02-25 19:05:00', 'SHORTTERM'),
	('SHQ5632Z', 'PM23', '2025-01-19 13:37:00', '2025-01-19 13:58:00', 'SHORTTERM'),
	('SHQ5632Z', 'C28', '2025-05-19 01:37:00', '2025-05-19 03:10:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-22 16:28:00', 0, NULL, 'W44', 'SHQ5632Z'),
	('2025-03-26 22:20:00', 0, NULL, 'W44', 'SHQ5632Z'),
	('2025-05-12 01:01:00', 0, NULL, 'W44', 'SHQ5632Z'),
	('2025-01-10 08:02:00', 0, NULL, 'W44', 'SHQ5632Z'),
	('2025-07-03 19:31:00', 0, NULL, 'W44', 'SHQ5632Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHQ5632Z', 'W44', '2025-10-22 16:28:00', '2025-10-23 05:29:00', 'SEASONAL'),
	('SHQ5632Z', 'W44', '2025-03-26 22:20:00', '2025-03-27 11:36:00', 'SEASONAL'),
	('SHQ5632Z', 'W44', '2025-05-12 01:01:00', '2025-05-12 11:48:00', 'SEASONAL'),
	('SHQ5632Z', 'W44', '2025-01-10 08:02:00', '2025-01-10 10:20:00', 'SEASONAL'),
	('SHQ5632Z', 'W44', '2025-07-03 19:31:00', '2025-07-04 03:04:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-22 18:00:00', 3, 146),
	('2025-03-27 08:12:00', 8, 147),
	('2025-05-12 10:16:00', 10, 148),
	('2025-01-10 08:14:00', 10, 149),
	('2025-07-03 19:35:00', 9, 150);

-- 25. Parking records for vehicle: SGZ4489J
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-25 10:42:00', 0, NULL, 'SK15', 'SGZ4489J'),
	('2025-08-13 05:16:00', 0, NULL, 'SK15', 'SGZ4489J'),
	('2025-05-15 14:52:00', 0, NULL, 'SK15', 'SGZ4489J'),
	('2025-01-04 02:35:00', 0, NULL, 'SK15', 'SGZ4489J'),
	('2025-08-27 11:26:00', 0, NULL, 'SK15', 'SGZ4489J');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGZ4489J', 'SK15', '2025-06-25 10:42:00', '2025-06-26 00:37:00', 'SEASONAL'),
	('SGZ4489J', 'SK15', '2025-08-13 05:16:00', '2025-08-13 10:57:00', 'SEASONAL'),
	('SGZ4489J', 'SK15', '2025-05-15 14:52:00', '2025-05-16 02:40:00', 'SEASONAL'),
	('SGZ4489J', 'SK15', '2025-01-04 02:35:00', '2025-01-04 05:48:00', 'SEASONAL'),
	('SGZ4489J', 'SK15', '2025-08-27 11:26:00', '2025-08-27 15:49:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-25 23:47:00', 2, 151),
	('2025-08-13 07:37:00', 10, 152),
	('2025-05-16 00:23:00', 8, 153),
	('2025-01-04 05:02:00', 12, 154),
	('2025-08-27 11:38:00', 3, 155);

-- 26. Parking records for vehicle: SFS3378B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-06 04:33:00', 6.00, 1, 'GE1A', 'SFS3378B'),
	('2025-03-01 16:38:00', 11.40, 2, 'W81', 'SFS3378B'),
	('2025-07-12 08:53:00', 10.80, 2, 'SK15', 'SFS3378B'),
	('2025-06-17 00:35:00', 9.00, 1, 'PL90', 'SFS3378B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFS3378B', 'GE1A', '2025-05-06 04:33:00', '2025-05-06 10:00:00', 'SHORTTERM'),
	('SFS3378B', 'W81', '2025-03-01 16:38:00', '2025-03-02 02:40:00', 'SHORTTERM'),
	('SFS3378B', 'SK15', '2025-07-12 08:53:00', '2025-07-12 18:05:00', 'SHORTTERM'),
	('SFS3378B', 'PL90', '2025-06-17 00:35:00', '2025-06-17 08:21:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-10 10:24:00', 0, NULL, 'W44', 'SFS3378B'),
	('2025-07-20 16:29:00', 0, NULL, 'W44', 'SFS3378B'),
	('2025-06-15 06:02:00', 0, NULL, 'W44', 'SFS3378B'),
	('2025-06-26 14:18:00', 0, NULL, 'W44', 'SFS3378B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFS3378B', 'W44', '2025-10-10 10:24:00', '2025-10-10 14:36:00', 'SEASONAL'),
	('SFS3378B', 'W44', '2025-07-20 16:29:00', '2025-07-20 18:11:00', 'SEASONAL'),
	('SFS3378B', 'W44', '2025-06-15 06:02:00', '2025-06-15 12:20:00', 'SEASONAL'),
	('SFS3378B', 'W44', '2025-06-26 14:18:00', '2025-06-27 01:01:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-10 13:02:00', 4, 160),
	('2025-07-20 16:49:00', 1, 161),
	('2025-06-15 08:25:00', 12, 162),
	('2025-06-26 16:56:00', 3, 163);

-- 27. Parking records for vehicle: SGF6601Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-18 19:42:00', 2.40, 2, 'SE50', 'SGF6601Q'),
	('2025-06-26 22:07:00', 8.40, 1, 'C28', 'SGF6601Q'),
	('2025-01-15 03:47:00', 7.20, 1, 'PM23', 'SGF6601Q'),
	('2025-06-03 22:12:00', 7.20, 1, 'W45', 'SGF6601Q'),
	('2025-07-14 07:07:00', 10.20, 1, 'SK15', 'SGF6601Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGF6601Q', 'SE50', '2025-10-18 19:42:00', '2025-10-18 22:03:00', 'SHORTTERM'),
	('SGF6601Q', 'C28', '2025-06-26 22:07:00', '2025-06-27 05:48:00', 'SHORTTERM'),
	('SGF6601Q', 'PM23', '2025-01-15 03:47:00', '2025-01-15 10:05:00', 'SHORTTERM'),
	('SGF6601Q', 'W45', '2025-06-03 22:12:00', '2025-06-04 04:41:00', 'SHORTTERM'),
	('SGF6601Q', 'SK15', '2025-07-14 07:07:00', '2025-07-14 15:41:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-07 19:50:00', 0, NULL, 'PM24', 'SGF6601Q'),
	('2025-08-19 05:23:00', 0, NULL, 'PM24', 'SGF6601Q'),
	('2025-01-08 21:35:00', 0, NULL, 'PM24', 'SGF6601Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGF6601Q', 'PM24', '2025-09-07 19:50:00', '2025-09-07 21:53:00', 'SEASONAL'),
	('SGF6601Q', 'PM24', '2025-08-19 05:23:00', '2025-08-19 07:48:00', 'SEASONAL'),
	('SGF6601Q', 'PM24', '2025-01-08 21:35:00', '2025-01-09 07:11:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-07 21:11:00', 13, 169),
	('2025-08-19 07:03:00', 8, 170),
	('2025-01-09 05:24:00', 3, 171);

-- 28. Parking records for vehicle: SFA7703L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-11 19:56:00', 9.00, 2, 'J80M', 'SFA7703L'),
	('2025-10-08 12:05:00', 6.60, 1, 'PM23', 'SFA7703L'),
	('2025-08-22 08:13:00', 12.00, 1, 'PL80', 'SFA7703L'),
	('2025-07-30 21:22:00', 2.40, 1, 'J80M', 'SFA7703L'),
	('2025-03-24 03:53:00', 6.00, 1, 'SK49', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'J80M', '2025-10-11 19:56:00', '2025-10-12 03:53:00', 'SHORTTERM'),
	('SFA7703L', 'PM23', '2025-10-08 12:05:00', '2025-10-08 17:42:00', 'SHORTTERM'),
	('SFA7703L', 'PL80', '2025-08-22 08:13:00', '2025-08-22 19:42:00', 'SHORTTERM'),
	('SFA7703L', 'J80M', '2025-07-30 21:22:00', '2025-07-30 23:23:00', 'SHORTTERM'),
	('SFA7703L', 'SK49', '2025-03-24 03:53:00', '2025-03-24 09:20:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-17 00:12:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-10-10 04:31:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-09-22 07:32:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-03-17 21:25:00', 0, NULL, 'B13', 'SFA7703L'),
	('2025-03-22 01:50:00', 0, NULL, 'B13', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'B13', '2025-08-17 00:12:00', '2025-08-17 13:39:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-10-10 04:31:00', '2025-10-10 13:31:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-09-22 07:32:00', '2025-09-22 18:54:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-03-17 21:25:00', '2025-03-17 21:27:00', 'SEASONAL'),
	('SFA7703L', 'B13', '2025-03-22 01:50:00', '2025-03-22 12:57:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-17 12:16:00', 9, 177),
	('2025-10-10 06:17:00', 11, 178),
	('2025-09-22 13:58:00', 9, 179),
	('2025-03-17 21:26:00', 8, 180),
	('2025-03-22 08:50:00', 11, 181);

-- 29. Parking records for vehicle: SHR6743A
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-19 12:58:00', 0, NULL, 'W45', 'SHR6743A'),
	('2025-07-25 21:48:00', 0, NULL, 'W45', 'SHR6743A'),
	('2025-06-19 10:52:00', 0, NULL, 'W45', 'SHR6743A'),
	('2025-09-21 07:18:00', 0, NULL, 'W45', 'SHR6743A'),
	('2025-04-10 11:26:00', 0, NULL, 'W45', 'SHR6743A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHR6743A', 'W45', '2025-07-19 12:58:00', '2025-07-20 01:49:00', 'SEASONAL'),
	('SHR6743A', 'W45', '2025-07-25 21:48:00', '2025-07-26 01:51:00', 'SEASONAL'),
	('SHR6743A', 'W45', '2025-06-19 10:52:00', '2025-06-19 11:33:00', 'SEASONAL'),
	('SHR6743A', 'W45', '2025-09-21 07:18:00', '2025-09-21 21:12:00', 'SEASONAL'),
	('SHR6743A', 'W45', '2025-04-10 11:26:00', '2025-04-10 19:03:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-20 01:36:00', 12, 182),
	('2025-07-25 23:58:00', 14, 183),
	('2025-06-19 11:15:00', 4, 184),
	('2025-09-21 16:41:00', 9, 185),
	('2025-04-10 13:00:00', 5, 186);

-- 30. Parking records for vehicle: SHP4521Y
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-28 18:19:00', 0, NULL, 'CK51', 'SHP4521Y'),
	('2025-09-03 05:17:00', 0, NULL, 'CK51', 'SHP4521Y'),
	('2025-08-28 15:27:00', 0, NULL, 'CK51', 'SHP4521Y'),
	('2025-10-27 22:49:00', 0, NULL, 'CK51', 'SHP4521Y'),
	('2025-01-15 03:45:00', 0, NULL, 'CK51', 'SHP4521Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHP4521Y', 'CK51', '2025-05-28 18:19:00', '2025-05-29 04:08:00', 'SEASONAL'),
	('SHP4521Y', 'CK51', '2025-09-03 05:17:00', '2025-09-03 18:22:00', 'SEASONAL'),
	('SHP4521Y', 'CK51', '2025-08-28 15:27:00', '2025-08-29 04:39:00', 'SEASONAL'),
	('SHP4521Y', 'CK51', '2025-10-27 22:49:00', '2025-10-28 05:35:00', 'SEASONAL'),
	('SHP4521Y', 'CK51', '2025-01-15 03:45:00', '2025-01-15 04:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-28 18:35:00', 2, 187),
	('2025-09-03 13:34:00', 10, 188),
	('2025-08-29 03:14:00', 13, 189),
	('2025-10-28 01:47:00', 1, 190),
	('2025-01-15 03:56:00', 4, 191);

-- 31. Parking records for vehicle: SFA3301L
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-27 20:29:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-03-18 07:12:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-09-05 14:16:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-07-31 03:54:00', 0, NULL, 'B13', 'SFA3301L'),
	('2025-03-30 09:18:00', 0, NULL, 'B13', 'SFA3301L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA3301L', 'B13', '2025-09-27 20:29:00', '2025-09-27 22:18:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-03-18 07:12:00', '2025-03-18 07:55:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-09-05 14:16:00', '2025-09-05 17:06:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-07-31 03:54:00', '2025-07-31 16:37:00', 'SEASONAL'),
	('SFA3301L', 'B13', '2025-03-30 09:18:00', '2025-03-30 13:58:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-27 21:14:00', 10, 192),
	('2025-03-18 07:28:00', 15, 193),
	('2025-09-05 16:38:00', 2, 194),
	('2025-07-31 13:40:00', 11, 195),
	('2025-03-30 12:44:00', 4, 196);

-- 32. Parking records for vehicle: SGD4489N
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-04 21:35:00', 0, NULL, 'B13', 'SGD4489N'),
	('2025-04-14 20:40:00', 0, NULL, 'B13', 'SGD4489N'),
	('2025-04-10 13:30:00', 0, NULL, 'B13', 'SGD4489N'),
	('2025-04-30 14:43:00', 0, NULL, 'B13', 'SGD4489N'),
	('2025-08-28 12:02:00', 0, NULL, 'B13', 'SGD4489N');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGD4489N', 'B13', '2025-01-04 21:35:00', '2025-01-05 05:32:00', 'SEASONAL'),
	('SGD4489N', 'B13', '2025-04-14 20:40:00', '2025-04-14 23:20:00', 'SEASONAL'),
	('SGD4489N', 'B13', '2025-04-10 13:30:00', '2025-04-10 19:12:00', 'SEASONAL'),
	('SGD4489N', 'B13', '2025-04-30 14:43:00', '2025-04-30 16:23:00', 'SEASONAL'),
	('SGD4489N', 'B13', '2025-08-28 12:02:00', '2025-08-28 17:37:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-05 00:00:00', 2, 197),
	('2025-04-14 22:45:00', 15, 198),
	('2025-04-10 16:52:00', 5, 199),
	('2025-04-30 16:10:00', 12, 200),
	('2025-08-28 17:21:00', 15, 201);

-- 33. Parking records for vehicle: SHH8965S
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-29 15:38:00', 0, NULL, 'J80M', 'SHH8965S'),
	('2025-07-31 17:14:00', 0, NULL, 'J80M', 'SHH8965S'),
	('2025-08-25 02:41:00', 0, NULL, 'J80M', 'SHH8965S'),
	('2025-08-01 03:49:00', 0, NULL, 'J80M', 'SHH8965S'),
	('2025-04-23 02:51:00', 0, NULL, 'J80M', 'SHH8965S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHH8965S', 'J80M', '2025-09-29 15:38:00', '2025-09-29 20:28:00', 'SEASONAL'),
	('SHH8965S', 'J80M', '2025-07-31 17:14:00', '2025-07-31 17:37:00', 'SEASONAL'),
	('SHH8965S', 'J80M', '2025-08-25 02:41:00', '2025-08-25 07:29:00', 'SEASONAL'),
	('SHH8965S', 'J80M', '2025-08-01 03:49:00', '2025-08-01 09:56:00', 'SEASONAL'),
	('SHH8965S', 'J80M', '2025-04-23 02:51:00', '2025-04-23 16:02:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-29 17:48:00', 10, 202),
	('2025-07-31 17:22:00', 8, 203),
	('2025-08-25 06:25:00', 15, 204),
	('2025-08-01 06:34:00', 2, 205),
	('2025-04-23 04:32:00', 11, 206);

-- 34. Parking records for vehicle: SFQ1156Z
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-11 04:14:00', 4.20, 1, 'SB23', 'SFQ1156Z'),
	('2025-10-23 17:59:00', 4.20, 1, 'J80M', 'SFQ1156Z'),
	('2025-01-02 05:09:00', 0.00, 1, 'SE50', 'SFQ1156Z'),
	('2025-10-14 11:00:00', 12.00, 1, 'PL90', 'SFQ1156Z'),
	('2025-09-08 22:44:00', 4.80, 1, 'C28', 'SFQ1156Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFQ1156Z', 'SB23', '2025-06-11 04:14:00', '2025-06-11 08:02:00', 'SHORTTERM'),
	('SFQ1156Z', 'J80M', '2025-10-23 17:59:00', '2025-10-23 21:50:00', 'SHORTTERM'),
	('SFQ1156Z', 'SE50', '2025-01-02 05:09:00', '2025-01-02 05:16:00', 'SHORTTERM'),
	('SFQ1156Z', 'PL90', '2025-10-14 11:00:00', '2025-10-14 21:09:00', 'SHORTTERM'),
	('SFQ1156Z', 'C28', '2025-09-08 22:44:00', '2025-09-09 03:27:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-18 04:18:00', 0, NULL, 'CK25', 'SFQ1156Z'),
	('2025-09-16 09:19:00', 0, NULL, 'CK25', 'SFQ1156Z'),
	('2025-09-19 17:55:00', 0, NULL, 'CK25', 'SFQ1156Z'),
	('2025-07-09 03:52:00', 0, NULL, 'CK25', 'SFQ1156Z'),
	('2025-03-28 13:04:00', 0, NULL, 'CK25', 'SFQ1156Z');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFQ1156Z', 'CK25', '2025-02-18 04:18:00', '2025-02-18 17:58:00', 'SEASONAL'),
	('SFQ1156Z', 'CK25', '2025-09-16 09:19:00', '2025-09-16 20:09:00', 'SEASONAL'),
	('SFQ1156Z', 'CK25', '2025-09-19 17:55:00', '2025-09-20 03:12:00', 'SEASONAL'),
	('SFQ1156Z', 'CK25', '2025-07-09 03:52:00', '2025-07-09 14:04:00', 'SEASONAL'),
	('SFQ1156Z', 'CK25', '2025-03-28 13:04:00', '2025-03-29 02:01:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-18 08:45:00', 4, 212),
	('2025-09-16 17:39:00', 13, 213),
	('2025-09-19 19:30:00', 5, 214),
	('2025-07-09 09:14:00', 6, 215),
	('2025-03-28 18:23:00', 10, 216);

-- 35. Parking records for vehicle: SLS5501R
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-02 08:51:00', 0, NULL, 'SK49', 'SLS5501R'),
	('2025-07-07 13:51:00', 0, NULL, 'SK49', 'SLS5501R'),
	('2025-06-15 03:19:00', 0, NULL, 'SK49', 'SLS5501R'),
	('2025-02-24 09:14:00', 0, NULL, 'SK49', 'SLS5501R'),
	('2025-09-06 21:08:00', 0, NULL, 'SK49', 'SLS5501R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLS5501R', 'SK49', '2025-07-02 08:51:00', '2025-07-02 15:31:00', 'SEASONAL'),
	('SLS5501R', 'SK49', '2025-07-07 13:51:00', '2025-07-08 01:08:00', 'SEASONAL'),
	('SLS5501R', 'SK49', '2025-06-15 03:19:00', '2025-06-15 15:12:00', 'SEASONAL'),
	('SLS5501R', 'SK49', '2025-02-24 09:14:00', '2025-02-24 22:47:00', 'SEASONAL'),
	('SLS5501R', 'SK49', '2025-09-06 21:08:00', '2025-09-07 08:54:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-02 10:16:00', 7, 217),
	('2025-07-07 18:48:00', 3, 218),
	('2025-06-15 08:11:00', 9, 219),
	('2025-02-24 10:04:00', 9, 220),
	('2025-09-07 06:00:00', 3, 221);

-- 36. Parking records for vehicle: SHS7854B
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-30 13:24:00', 0, NULL, 'W45', 'SHS7854B'),
	('2025-09-19 06:54:00', 0, NULL, 'W45', 'SHS7854B'),
	('2025-09-24 12:26:00', 0, NULL, 'W45', 'SHS7854B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHS7854B', 'W45', '2025-01-30 13:24:00', '2025-01-31 01:31:00', 'SEASONAL'),
	('SHS7854B', 'W45', '2025-09-19 06:54:00', '2025-09-19 09:10:00', 'SEASONAL'),
	('SHS7854B', 'W45', '2025-09-24 12:26:00', '2025-09-24 13:03:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-30 15:25:00', 3, 222),
	('2025-09-19 09:01:00', 2, 223),
	('2025-09-24 12:37:00', 13, 224);

-- 37. Parking records for vehicle: SMU7781P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-04 12:04:00', 4.20, 2, 'SK15', 'SMU7781P'),
	('2025-09-03 05:32:00', 0.00, 1, 'PM23', 'SMU7781P'),
	('2025-06-17 00:44:00', 12.00, 1, 'SK49', 'SMU7781P'),
	('2025-08-05 18:01:00', 13.80, 1, 'PM23', 'SMU7781P'),
	('2025-05-31 15:25:00', 15.60, 2, 'PL80', 'SMU7781P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMU7781P', 'SK15', '2025-05-04 12:04:00', '2025-05-04 15:55:00', 'SHORTTERM'),
	('SMU7781P', 'PM23', '2025-09-03 05:32:00', '2025-09-03 05:44:00', 'SHORTTERM'),
	('SMU7781P', 'SK49', '2025-06-17 00:44:00', '2025-06-17 13:59:00', 'SHORTTERM'),
	('SMU7781P', 'PM23', '2025-08-05 18:01:00', '2025-08-06 06:14:00', 'SHORTTERM'),
	('SMU7781P', 'PL80', '2025-05-31 15:25:00', '2025-06-01 04:37:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-18 03:13:00', 0, NULL, 'A36', 'SMU7781P'),
	('2025-07-31 20:43:00', 0, NULL, 'A36', 'SMU7781P'),
	('2025-10-03 21:41:00', 0, NULL, 'A36', 'SMU7781P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMU7781P', 'A36', '2025-08-18 03:13:00', '2025-08-18 14:30:00', 'SEASONAL'),
	('SMU7781P', 'A36', '2025-07-31 20:43:00', '2025-07-31 21:56:00', 'SEASONAL'),
	('SMU7781P', 'A36', '2025-10-03 21:41:00', '2025-10-03 21:57:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-18 09:23:00', 10, 230),
	('2025-07-31 21:19:00', 5, 231),
	('2025-10-03 21:44:00', 5, 232);

-- 38. Parking records for vehicle: SGC3378M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-24 19:48:00', 13.20, 1, 'A36', 'SGC3378M'),
	('2025-08-15 03:54:00', 9.00, 1, 'SK15', 'SGC3378M'),
	('2025-09-12 23:59:00', 6.00, 1, 'PL80', 'SGC3378M'),
	('2025-01-04 21:01:00', 9.60, 2, 'A35', 'SGC3378M'),
	('2025-08-07 20:56:00', 6.60, 1, 'B13', 'SGC3378M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGC3378M', 'A36', '2025-03-24 19:48:00', '2025-03-25 07:02:00', 'SHORTTERM'),
	('SGC3378M', 'SK15', '2025-08-15 03:54:00', '2025-08-15 11:26:00', 'SHORTTERM'),
	('SGC3378M', 'PL80', '2025-09-12 23:59:00', '2025-09-13 05:24:00', 'SHORTTERM'),
	('SGC3378M', 'A35', '2025-01-04 21:01:00', '2025-01-05 05:44:00', 'SHORTTERM'),
	('SGC3378M', 'B13', '2025-08-07 20:56:00', '2025-08-08 02:31:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-23 20:07:00', 0, NULL, 'GE1A', 'SGC3378M'),
	('2025-07-13 19:25:00', 0, NULL, 'GE1A', 'SGC3378M'),
	('2025-03-13 03:14:00', 0, NULL, 'GE1A', 'SGC3378M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGC3378M', 'GE1A', '2025-09-23 20:07:00', '2025-09-23 20:34:00', 'SEASONAL'),
	('SGC3378M', 'GE1A', '2025-07-13 19:25:00', '2025-07-13 20:55:00', 'SEASONAL'),
	('SGC3378M', 'GE1A', '2025-03-13 03:14:00', '2025-03-13 05:10:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-23 20:17:00', 6, 238),
	('2025-07-13 19:58:00', 11, 239),
	('2025-03-13 04:08:00', 13, 240);

-- 39. Parking records for vehicle: SFD6633M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-26 14:14:00', 16.20, 2, 'CK51', 'SFD6633M'),
	('2025-07-06 04:06:00', 2.40, 2, 'PL90', 'SFD6633M'),
	('2025-04-06 00:47:00', 1.80, 2, 'B13', 'SFD6633M'),
	('2025-03-16 03:52:00', 12.00, 2, 'PM23', 'SFD6633M'),
	('2025-09-17 11:01:00', 12.00, 1, 'SB23', 'SFD6633M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFD6633M', 'CK51', '2025-07-26 14:14:00', '2025-07-27 04:09:00', 'SHORTTERM'),
	('SFD6633M', 'PL90', '2025-07-06 04:06:00', '2025-07-06 06:08:00', 'SHORTTERM'),
	('SFD6633M', 'B13', '2025-04-06 00:47:00', '2025-04-06 02:44:00', 'SHORTTERM'),
	('SFD6633M', 'PM23', '2025-03-16 03:52:00', '2025-03-16 14:48:00', 'SHORTTERM'),
	('SFD6633M', 'SB23', '2025-09-17 11:01:00', '2025-09-17 21:15:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-29 13:46:00', 0, NULL, 'SK49', 'SFD6633M'),
	('2025-08-11 23:27:00', 0, NULL, 'SK49', 'SFD6633M'),
	('2025-05-10 13:53:00', 0, NULL, 'SK49', 'SFD6633M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFD6633M', 'SK49', '2025-03-29 13:46:00', '2025-03-29 19:42:00', 'SEASONAL'),
	('SFD6633M', 'SK49', '2025-08-11 23:27:00', '2025-08-12 09:15:00', 'SEASONAL'),
	('SFD6633M', 'SK49', '2025-05-10 13:53:00', '2025-05-10 15:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-29 15:39:00', 10, 246),
	('2025-08-12 09:02:00', 10, 247),
	('2025-05-10 15:07:00', 5, 248);

-- 40. Parking records for vehicle: SFB2210K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-28 07:45:00', 12.00, 1, 'A34', 'SFB2210K'),
	('2025-08-18 02:37:00', 10.80, 1, 'PM24', 'SFB2210K'),
	('2025-01-02 22:08:00', 13.80, 1, 'SK15', 'SFB2210K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFB2210K', 'A34', '2025-02-28 07:45:00', '2025-02-28 19:10:00', 'SHORTTERM'),
	('SFB2210K', 'PM24', '2025-08-18 02:37:00', '2025-08-18 11:40:00', 'SHORTTERM'),
	('SFB2210K', 'SK15', '2025-01-02 22:08:00', '2025-01-03 10:01:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-15 20:26:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-10-11 16:56:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-10-04 10:05:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-06-06 15:51:00', 0, NULL, 'PM23', 'SFB2210K'),
	('2025-03-13 10:08:00', 0, NULL, 'PM23', 'SFB2210K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFB2210K', 'PM23', '2025-06-15 20:26:00', '2025-06-15 23:37:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-10-11 16:56:00', '2025-10-12 05:17:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-10-04 10:05:00', '2025-10-04 19:46:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-06-06 15:51:00', '2025-06-06 21:22:00', 'SEASONAL'),
	('SFB2210K', 'PM23', '2025-03-13 10:08:00', '2025-03-13 23:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-15 23:23:00', 14, 252),
	('2025-10-12 03:19:00', 3, 253),
	('2025-10-04 12:18:00', 5, 254),
	('2025-06-06 20:59:00', 11, 255),
	('2025-03-13 14:28:00', 6, 256);

-- 41. Parking records for vehicle: SJQ9021M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-06 03:09:00', 10.80, 1, 'SB23', 'SJQ9021M'),
	('2025-05-28 02:42:00', 12.00, 1, 'A35', 'SJQ9021M'),
	('2025-08-08 14:09:00', 11.40, 1, 'SK48', 'SJQ9021M'),
	('2025-10-13 15:05:00', 16.20, 1, 'PM23', 'SJQ9021M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJQ9021M', 'SB23', '2025-08-06 03:09:00', '2025-08-06 12:15:00', 'SHORTTERM'),
	('SJQ9021M', 'A35', '2025-05-28 02:42:00', '2025-05-28 15:13:00', 'SHORTTERM'),
	('SJQ9021M', 'SK48', '2025-08-08 14:09:00', '2025-08-09 00:00:00', 'SHORTTERM'),
	('SJQ9021M', 'PM23', '2025-10-13 15:05:00', '2025-10-14 05:00:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-06 09:03:00', 5, 257);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-27 02:04:00', 0, NULL, 'PL90', 'SJQ9021M'),
	('2025-10-08 08:33:00', 0, NULL, 'PL90', 'SJQ9021M'),
	('2025-05-20 09:34:00', 0, NULL, 'PL90', 'SJQ9021M'),
	('2025-03-13 06:20:00', 0, NULL, 'PL90', 'SJQ9021M'),
	('2025-07-20 19:25:00', 0, NULL, 'PL90', 'SJQ9021M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJQ9021M', 'PL90', '2025-01-27 02:04:00', '2025-01-27 12:12:00', 'SEASONAL'),
	('SJQ9021M', 'PL90', '2025-10-08 08:33:00', '2025-10-08 22:08:00', 'SEASONAL'),
	('SJQ9021M', 'PL90', '2025-05-20 09:34:00', '2025-05-20 20:09:00', 'SEASONAL'),
	('SJQ9021M', 'PL90', '2025-03-13 06:20:00', '2025-03-13 16:24:00', 'SEASONAL'),
	('SJQ9021M', 'PL90', '2025-07-20 19:25:00', '2025-07-21 00:00:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-27 09:17:00', 11, 261),
	('2025-10-08 10:34:00', 14, 262),
	('2025-05-20 16:00:00', 3, 263),
	('2025-03-13 07:44:00', 14, 264),
	('2025-07-20 22:22:00', 5, 265);

-- 42. Parking records for vehicle: SHN3410X
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-24 11:30:00', 9.00, 1, 'SK48', 'SHN3410X'),
	('2025-04-14 02:01:00', 6.00, 1, 'W45', 'SHN3410X'),
	('2025-02-03 07:48:00', 12.00, 1, 'SE50', 'SHN3410X'),
	('2025-06-04 20:54:00', 6.60, 1, 'SK48', 'SHN3410X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHN3410X', 'SK48', '2025-04-24 11:30:00', '2025-04-24 19:24:00', 'SHORTTERM'),
	('SHN3410X', 'W45', '2025-04-14 02:01:00', '2025-04-14 07:30:00', 'SHORTTERM'),
	('SHN3410X', 'SE50', '2025-02-03 07:48:00', '2025-02-03 21:02:00', 'SHORTTERM'),
	('SHN3410X', 'SK48', '2025-06-04 20:54:00', '2025-06-05 02:58:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-24 11:07:00', 0, NULL, 'CK25', 'SHN3410X'),
	('2025-01-05 14:10:00', 0, NULL, 'CK25', 'SHN3410X'),
	('2025-02-06 18:38:00', 0, NULL, 'CK25', 'SHN3410X');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHN3410X', 'CK25', '2025-07-24 11:07:00', '2025-07-24 21:02:00', 'SEASONAL'),
	('SHN3410X', 'CK25', '2025-01-05 14:10:00', '2025-01-05 19:26:00', 'SEASONAL'),
	('SHN3410X', 'CK25', '2025-02-06 18:38:00', '2025-02-07 06:28:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-24 14:46:00', 6, 270),
	('2025-01-05 16:25:00', 1, 271),
	('2025-02-07 05:29:00', 2, 272);

-- 43. Parking records for vehicle: SGG7712R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-19 15:21:00', 0.60, 1, 'JM24', 'SGG7712R'),
	('2025-05-21 17:37:00', 14.40, 1, 'PL80', 'SGG7712R'),
	('2025-08-12 00:53:00', 12.00, 1, 'SK15', 'SGG7712R'),
	('2025-01-05 03:02:00', 12.00, 2, 'W780', 'SGG7712R'),
	('2025-03-06 19:37:00', 12.60, 1, 'SB23', 'SGG7712R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGG7712R', 'JM24', '2025-06-19 15:21:00', '2025-06-19 16:08:00', 'SHORTTERM'),
	('SGG7712R', 'PL80', '2025-05-21 17:37:00', '2025-05-22 06:08:00', 'SHORTTERM'),
	('SGG7712R', 'SK15', '2025-08-12 00:53:00', '2025-08-12 13:37:00', 'SHORTTERM'),
	('SGG7712R', 'W780', '2025-01-05 03:02:00', '2025-01-05 14:27:00', 'SHORTTERM'),
	('SGG7712R', 'SB23', '2025-03-06 19:37:00', '2025-03-07 06:57:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-21 23:35:00', 12, 274);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-20 17:05:00', 0, NULL, 'PM23', 'SGG7712R'),
	('2025-10-06 05:51:00', 0, NULL, 'PM23', 'SGG7712R'),
	('2025-10-11 18:50:00', 0, NULL, 'PM23', 'SGG7712R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGG7712R', 'PM23', '2025-02-20 17:05:00', '2025-02-20 17:09:00', 'SEASONAL'),
	('SGG7712R', 'PM23', '2025-10-06 05:51:00', '2025-10-06 10:48:00', 'SEASONAL'),
	('SGG7712R', 'PM23', '2025-10-11 18:50:00', '2025-10-11 19:31:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-20 17:09:00', 2, 278),
	('2025-10-06 05:57:00', 13, 279),
	('2025-10-11 19:31:00', 6, 280);

-- 44. Parking records for vehicle: SGE5590P
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-08 01:21:00', 0, NULL, 'B13', 'SGE5590P'),
	('2025-08-26 16:15:00', 0, NULL, 'B13', 'SGE5590P'),
	('2025-01-14 06:52:00', 0, NULL, 'B13', 'SGE5590P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGE5590P', 'B13', '2025-04-08 01:21:00', '2025-04-08 01:56:00', 'SEASONAL'),
	('SGE5590P', 'B13', '2025-08-26 16:15:00', '2025-08-26 17:00:00', 'SEASONAL'),
	('SGE5590P', 'B13', '2025-01-14 06:52:00', '2025-01-14 17:27:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-08 01:28:00', 13, 281),
	('2025-08-26 16:39:00', 7, 282),
	('2025-01-14 16:35:00', 8, 283);

-- 45. Parking records for vehicle: SGX4420C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-26 18:58:00', 1.20, 1, 'PL80', 'SGX4420C'),
	('2025-05-06 20:25:00', 12.60, 1, 'C28', 'SGX4420C'),
	('2025-11-01 08:58:00', 4.20, 2, 'JM24', 'SGX4420C'),
	('2025-09-30 00:12:00', 9.60, 1, 'PM23', 'SGX4420C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX4420C', 'PL80', '2025-06-26 18:58:00', '2025-06-26 19:58:00', 'SHORTTERM'),
	('SGX4420C', 'C28', '2025-05-06 20:25:00', '2025-05-07 07:09:00', 'SHORTTERM'),
	('SGX4420C', 'JM24', '2025-11-01 08:58:00', '2025-11-01 12:44:00', 'SHORTTERM'),
	('SGX4420C', 'PM23', '2025-09-30 00:12:00', '2025-09-30 08:20:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-10 23:41:00', 0, NULL, 'B13', 'SGX4420C'),
	('2025-06-28 11:19:00', 0, NULL, 'B13', 'SGX4420C'),
	('2025-02-17 15:59:00', 0, NULL, 'B13', 'SGX4420C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX4420C', 'B13', '2025-05-10 23:41:00', '2025-05-11 03:24:00', 'SEASONAL'),
	('SGX4420C', 'B13', '2025-06-28 11:19:00', '2025-06-28 23:32:00', 'SEASONAL'),
	('SGX4420C', 'B13', '2025-02-17 15:59:00', '2025-02-17 16:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-10 23:44:00', 8, 288),
	('2025-06-28 12:38:00', 8, 289),
	('2025-02-17 16:23:00', 7, 290);

-- 46. Parking records for vehicle: SLA4490A
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-07 07:45:00', 0, NULL, 'PM24', 'SLA4490A'),
	('2025-06-02 04:43:00', 0, NULL, 'PM24', 'SLA4490A'),
	('2025-06-02 19:42:00', 0, NULL, 'PM24', 'SLA4490A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLA4490A', 'PM24', '2025-06-07 07:45:00', '2025-06-07 20:42:00', 'SEASONAL'),
	('SLA4490A', 'PM24', '2025-06-02 04:43:00', '2025-06-02 08:10:00', 'SEASONAL'),
	('SLA4490A', 'PM24', '2025-06-02 19:42:00', '2025-06-03 08:18:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-07 16:23:00', 1, 291),
	('2025-06-02 06:18:00', 10, 292),
	('2025-06-03 00:16:00', 5, 293);

-- 47. Parking records for vehicle: SGT8823C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-18 10:46:00', 11.40, 2, 'B13', 'SGT8823C'),
	('2025-02-16 09:56:00', 10.20, 2, 'SK15', 'SGT8823C'),
	('2025-03-08 02:47:00', 12.00, 2, 'CK22', 'SGT8823C'),
	('2025-10-13 12:23:00', 12.00, 1, 'W45', 'SGT8823C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGT8823C', 'B13', '2025-10-18 10:46:00', '2025-10-18 20:31:00', 'SHORTTERM'),
	('SGT8823C', 'SK15', '2025-02-16 09:56:00', '2025-02-16 18:39:00', 'SHORTTERM'),
	('SGT8823C', 'CK22', '2025-03-08 02:47:00', '2025-03-08 15:23:00', 'SHORTTERM'),
	('SGT8823C', 'W45', '2025-10-13 12:23:00', '2025-10-14 00:26:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-15 02:05:00', 0, NULL, 'JM24', 'SGT8823C'),
	('2025-06-20 14:41:00', 0, NULL, 'JM24', 'SGT8823C'),
	('2025-03-05 06:28:00', 0, NULL, 'JM24', 'SGT8823C'),
	('2025-04-01 01:26:00', 0, NULL, 'JM24', 'SGT8823C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGT8823C', 'JM24', '2025-07-15 02:05:00', '2025-07-15 11:41:00', 'SEASONAL'),
	('SGT8823C', 'JM24', '2025-06-20 14:41:00', '2025-06-21 02:57:00', 'SEASONAL'),
	('SGT8823C', 'JM24', '2025-03-05 06:28:00', '2025-03-05 13:40:00', 'SEASONAL'),
	('SGT8823C', 'JM24', '2025-04-01 01:26:00', '2025-04-01 07:32:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-15 11:03:00', 8, 298),
	('2025-06-20 17:50:00', 12, 299),
	('2025-03-05 06:51:00', 10, 300),
	('2025-04-01 06:57:00', 4, 301);

-- 48. Parking records for vehicle: SGX7722C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-21 10:21:00', 9.60, 1, 'A36', 'SGX7722C'),
	('2025-09-24 22:31:00', 12.00, 1, 'SB23', 'SGX7722C'),
	('2025-01-08 19:09:00', 6.00, 1, 'PL90', 'SGX7722C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX7722C', 'A36', '2025-07-21 10:21:00', '2025-07-21 18:24:00', 'SHORTTERM'),
	('SGX7722C', 'SB23', '2025-09-24 22:31:00', '2025-09-25 09:13:00', 'SHORTTERM'),
	('SGX7722C', 'PL90', '2025-01-08 19:09:00', '2025-01-09 00:52:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-24 23:29:00', 10, 303);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-07 10:15:00', 0, NULL, 'PM24', 'SGX7722C'),
	('2025-10-20 18:36:00', 0, NULL, 'PM24', 'SGX7722C'),
	('2025-08-20 01:26:00', 0, NULL, 'PM24', 'SGX7722C'),
	('2025-01-20 09:50:00', 0, NULL, 'PM24', 'SGX7722C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX7722C', 'PM24', '2025-04-07 10:15:00', '2025-04-07 12:18:00', 'SEASONAL'),
	('SGX7722C', 'PM24', '2025-10-20 18:36:00', '2025-10-20 18:51:00', 'SEASONAL'),
	('SGX7722C', 'PM24', '2025-08-20 01:26:00', '2025-08-20 01:29:00', 'SEASONAL'),
	('SGX7722C', 'PM24', '2025-01-20 09:50:00', '2025-01-20 12:22:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-07 11:28:00', 14, 305),
	('2025-10-20 18:41:00', 11, 306),
	('2025-08-20 01:28:00', 7, 307),
	('2025-01-20 09:52:00', 15, 308);

-- 49. Parking records for vehicle: SFZ0045J
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-23 18:55:00', 14.40, 1, 'A36', 'SFZ0045J'),
	('2025-07-21 22:19:00', 8.40, 1, 'PM23', 'SFZ0045J'),
	('2025-04-29 13:57:00', 5.40, 1, 'B13', 'SFZ0045J'),
	('2025-11-04 02:57:00', 12.00, 1, 'SK49', 'SFZ0045J'),
	('2025-08-22 12:28:00', 11.40, 1, 'W780', 'SFZ0045J');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFZ0045J', 'A36', '2025-04-23 18:55:00', '2025-04-24 07:09:00', 'SHORTTERM'),
	('SFZ0045J', 'PM23', '2025-07-21 22:19:00', '2025-07-22 05:43:00', 'SHORTTERM'),
	('SFZ0045J', 'B13', '2025-04-29 13:57:00', '2025-04-29 18:56:00', 'SHORTTERM'),
	('SFZ0045J', 'SK49', '2025-11-04 02:57:00', '2025-11-04 15:43:00', 'SHORTTERM'),
	('SFZ0045J', 'W780', '2025-08-22 12:28:00', '2025-08-22 22:20:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-17 12:20:00', 0, NULL, 'PL80', 'SFZ0045J'),
	('2025-06-25 21:07:00', 0, NULL, 'PL80', 'SFZ0045J'),
	('2025-08-27 07:44:00', 0, NULL, 'PL80', 'SFZ0045J'),
	('2025-02-18 08:56:00', 0, NULL, 'PL80', 'SFZ0045J'),
	('2025-01-09 11:35:00', 0, NULL, 'PL80', 'SFZ0045J');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFZ0045J', 'PL80', '2025-02-17 12:20:00', '2025-02-17 21:45:00', 'SEASONAL'),
	('SFZ0045J', 'PL80', '2025-06-25 21:07:00', '2025-06-26 05:06:00', 'SEASONAL'),
	('SFZ0045J', 'PL80', '2025-08-27 07:44:00', '2025-08-27 17:55:00', 'SEASONAL'),
	('SFZ0045J', 'PL80', '2025-02-18 08:56:00', '2025-02-18 16:01:00', 'SEASONAL'),
	('SFZ0045J', 'PL80', '2025-01-09 11:35:00', '2025-01-09 20:49:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-17 14:38:00', 14, 314),
	('2025-06-26 01:15:00', 6, 315),
	('2025-08-27 13:57:00', 2, 316),
	('2025-02-18 09:29:00', 3, 317),
	('2025-01-09 18:43:00', 12, 318);

-- 50. Parking records for vehicle: SGH8823S
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-01 22:25:00', 0, NULL, 'SK15', 'SGH8823S'),
	('2025-07-04 06:24:00', 0, NULL, 'SK15', 'SGH8823S'),
	('2025-08-14 21:49:00', 0, NULL, 'SK15', 'SGH8823S'),
	('2025-01-13 19:12:00', 0, NULL, 'SK15', 'SGH8823S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGH8823S', 'SK15', '2025-06-01 22:25:00', '2025-06-02 05:56:00', 'SEASONAL'),
	('SGH8823S', 'SK15', '2025-07-04 06:24:00', '2025-07-04 06:51:00', 'SEASONAL'),
	('SGH8823S', 'SK15', '2025-08-14 21:49:00', '2025-08-14 22:05:00', 'SEASONAL'),
	('SGH8823S', 'SK15', '2025-01-13 19:12:00', '2025-01-13 22:29:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-02 05:42:00', 12, 319),
	('2025-07-04 06:42:00', 3, 320),
	('2025-08-14 21:53:00', 4, 321),
	('2025-01-13 21:25:00', 14, 322);

-- 51. Parking records for vehicle: SFR2267A
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-12 23:13:00', 0, NULL, 'CK51', 'SFR2267A'),
	('2025-08-05 16:54:00', 0, NULL, 'CK51', 'SFR2267A'),
	('2025-01-05 05:39:00', 0, NULL, 'CK51', 'SFR2267A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFR2267A', 'CK51', '2025-09-12 23:13:00', '2025-09-13 06:21:00', 'SEASONAL'),
	('SFR2267A', 'CK51', '2025-08-05 16:54:00', '2025-08-06 01:02:00', 'SEASONAL'),
	('SFR2267A', 'CK51', '2025-01-05 05:39:00', '2025-01-05 08:05:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-13 02:33:00', 8, 323),
	('2025-08-05 20:00:00', 11, 324),
	('2025-01-05 06:45:00', 6, 325);

-- 52. Parking records for vehicle: SFU5590D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-06 22:24:00', 7.20, 1, 'CK25', 'SFU5590D'),
	('2025-08-02 16:49:00', 10.80, 2, 'PM23', 'SFU5590D'),
	('2025-06-17 18:32:00', 4.80, 1, 'W44', 'SFU5590D'),
	('2025-08-30 13:50:00', 5.40, 2, 'SB23', 'SFU5590D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFU5590D', 'CK25', '2025-08-06 22:24:00', '2025-08-07 04:45:00', 'SHORTTERM'),
	('SFU5590D', 'PM23', '2025-08-02 16:49:00', '2025-08-03 02:03:00', 'SHORTTERM'),
	('SFU5590D', 'W44', '2025-06-17 18:32:00', '2025-06-17 22:47:00', 'SHORTTERM'),
	('SFU5590D', 'SB23', '2025-08-30 13:50:00', '2025-08-30 18:35:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-11 14:43:00', 0, NULL, 'W45', 'SFU5590D'),
	('2025-03-12 22:10:00', 0, NULL, 'W45', 'SFU5590D'),
	('2025-05-21 09:51:00', 0, NULL, 'W45', 'SFU5590D'),
	('2025-10-23 00:24:00', 0, NULL, 'W45', 'SFU5590D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFU5590D', 'W45', '2025-10-11 14:43:00', '2025-10-12 00:57:00', 'SEASONAL'),
	('SFU5590D', 'W45', '2025-03-12 22:10:00', '2025-03-13 06:21:00', 'SEASONAL'),
	('SFU5590D', 'W45', '2025-05-21 09:51:00', '2025-05-21 14:51:00', 'SEASONAL'),
	('SFU5590D', 'W45', '2025-10-23 00:24:00', '2025-10-23 08:59:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-11 22:06:00', 9, 330),
	('2025-03-13 04:33:00', 5, 331),
	('2025-05-21 11:19:00', 5, 332),
	('2025-10-23 07:46:00', 14, 333);

-- 53. Parking records for vehicle: SFJ5599T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-16 07:19:00', 4.20, 2, 'PM24', 'SFJ5599T'),
	('2025-01-28 13:39:00', 6.60, 1, 'J80M', 'SFJ5599T'),
	('2025-07-25 05:39:00', 10.20, 1, 'PM23', 'SFJ5599T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFJ5599T', 'PM24', '2025-08-16 07:19:00', '2025-08-16 11:06:00', 'SHORTTERM'),
	('SFJ5599T', 'J80M', '2025-01-28 13:39:00', '2025-01-28 19:25:00', 'SHORTTERM'),
	('SFJ5599T', 'PM23', '2025-07-25 05:39:00', '2025-07-25 14:36:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-22 09:10:00', 0, NULL, 'A36', 'SFJ5599T'),
	('2025-09-20 11:44:00', 0, NULL, 'A36', 'SFJ5599T'),
	('2025-08-05 03:03:00', 0, NULL, 'A36', 'SFJ5599T'),
	('2025-06-09 10:19:00', 0, NULL, 'A36', 'SFJ5599T'),
	('2025-01-11 21:39:00', 0, NULL, 'A36', 'SFJ5599T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFJ5599T', 'A36', '2025-02-22 09:10:00', '2025-02-22 21:02:00', 'SEASONAL'),
	('SFJ5599T', 'A36', '2025-09-20 11:44:00', '2025-09-20 21:41:00', 'SEASONAL'),
	('SFJ5599T', 'A36', '2025-08-05 03:03:00', '2025-08-05 15:54:00', 'SEASONAL'),
	('SFJ5599T', 'A36', '2025-06-09 10:19:00', '2025-06-09 14:49:00', 'SEASONAL'),
	('SFJ5599T', 'A36', '2025-01-11 21:39:00', '2025-01-12 08:38:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-22 15:11:00', 9, 337),
	('2025-09-20 17:56:00', 6, 338),
	('2025-08-05 13:51:00', 2, 339),
	('2025-06-09 14:05:00', 1, 340),
	('2025-01-12 02:30:00', 6, 341);

-- 54. Parking records for vehicle: SFH3377R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-02 10:55:00', 7.80, 2, 'PL80', 'SFH3377R'),
	('2025-06-11 13:28:00', 1.20, 1, 'SK48', 'SFH3377R'),
	('2025-08-30 00:49:00', 1.20, 2, 'A35', 'SFH3377R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFH3377R', 'PL80', '2025-03-02 10:55:00', '2025-03-02 17:40:00', 'SHORTTERM'),
	('SFH3377R', 'SK48', '2025-06-11 13:28:00', '2025-06-11 14:30:00', 'SHORTTERM'),
	('SFH3377R', 'A35', '2025-08-30 00:49:00', '2025-08-30 02:13:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-30 01:44:00', 1, 344);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-02 03:37:00', 0, NULL, 'A34', 'SFH3377R'),
	('2025-04-13 16:25:00', 0, NULL, 'A34', 'SFH3377R'),
	('2025-02-03 12:36:00', 0, NULL, 'A34', 'SFH3377R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFH3377R', 'A34', '2025-10-02 03:37:00', '2025-10-02 07:20:00', 'SEASONAL'),
	('SFH3377R', 'A34', '2025-04-13 16:25:00', '2025-04-14 01:05:00', 'SEASONAL'),
	('SFH3377R', 'A34', '2025-02-03 12:36:00', '2025-02-03 21:44:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-02 04:00:00', 13, 345),
	('2025-04-13 17:12:00', 2, 346),
	('2025-02-03 15:56:00', 3, 347);

-- 55. Parking records for vehicle: SLU6620S
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-20 01:37:00', 0, NULL, 'SK48', 'SLU6620S'),
	('2025-01-29 06:50:00', 0, NULL, 'SK48', 'SLU6620S'),
	('2025-10-21 06:15:00', 0, NULL, 'SK48', 'SLU6620S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLU6620S', 'SK48', '2025-04-20 01:37:00', '2025-04-20 02:15:00', 'SEASONAL'),
	('SLU6620S', 'SK48', '2025-01-29 06:50:00', '2025-01-29 15:28:00', 'SEASONAL'),
	('SLU6620S', 'SK48', '2025-10-21 06:15:00', '2025-10-21 17:33:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-20 01:43:00', 11, 348),
	('2025-01-29 10:07:00', 8, 349),
	('2025-10-21 08:19:00', 6, 350);

-- 56. Parking records for vehicle: SDB1123M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-18 01:32:00', 6.60, 2, 'PL80', 'SDB1123M'),
	('2025-07-20 22:52:00', 0.60, 2, 'JM25', 'SDB1123M'),
	('2025-07-08 20:24:00', 9.60, 1, 'JM24', 'SDB1123M'),
	('2025-10-17 03:31:00', 6.60, 1, 'SB23', 'SDB1123M'),
	('2025-07-09 06:17:00', 6.60, 1, 'JM25', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'PL80', '2025-05-18 01:32:00', '2025-05-18 07:12:00', 'SHORTTERM'),
	('SDB1123M', 'JM25', '2025-07-20 22:52:00', '2025-07-20 23:27:00', 'SHORTTERM'),
	('SDB1123M', 'JM24', '2025-07-08 20:24:00', '2025-07-09 04:34:00', 'SHORTTERM'),
	('SDB1123M', 'SB23', '2025-10-17 03:31:00', '2025-10-17 09:12:00', 'SHORTTERM'),
	('SDB1123M', 'JM25', '2025-07-09 06:17:00', '2025-07-09 18:09:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-27 08:53:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-08-23 15:28:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-05-09 07:37:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-09-15 19:25:00', 0, NULL, 'C28', 'SDB1123M'),
	('2025-10-21 23:07:00', 0, NULL, 'C28', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'C28', '2025-03-27 08:53:00', '2025-03-27 15:21:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-08-23 15:28:00', '2025-08-23 21:32:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-05-09 07:37:00', '2025-05-09 16:18:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-09-15 19:25:00', '2025-09-16 05:21:00', 'SEASONAL'),
	('SDB1123M', 'C28', '2025-10-21 23:07:00', '2025-10-22 06:03:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-27 13:41:00', 10, 356),
	('2025-08-23 21:17:00', 6, 357),
	('2025-05-09 13:20:00', 9, 358),
	('2025-09-16 03:44:00', 6, 359),
	('2025-10-22 03:19:00', 2, 360);

-- 57. Parking records for vehicle: SGM2267W
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-09 16:18:00', 0, NULL, 'A34', 'SGM2267W'),
	('2025-01-10 02:08:00', 0, NULL, 'A34', 'SGM2267W'),
	('2025-09-10 00:24:00', 0, NULL, 'A34', 'SGM2267W'),
	('2025-01-08 19:17:00', 0, NULL, 'A34', 'SGM2267W');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGM2267W', 'A34', '2025-02-09 16:18:00', '2025-02-09 23:56:00', 'SEASONAL'),
	('SGM2267W', 'A34', '2025-01-10 02:08:00', '2025-01-10 07:49:00', 'SEASONAL'),
	('SGM2267W', 'A34', '2025-09-10 00:24:00', '2025-09-10 01:32:00', 'SEASONAL'),
	('SGM2267W', 'A34', '2025-01-08 19:17:00', '2025-01-09 01:17:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-09 23:49:00', 13, 361),
	('2025-01-10 06:43:00', 8, 362),
	('2025-09-10 00:45:00', 15, 363),
	('2025-01-08 20:44:00', 9, 364);

-- 58. Parking records for vehicle: SGY3378H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-04 08:54:00', 7.80, 1, 'PM24', 'SGY3378H'),
	('2025-05-14 13:22:00', 13.80, 1, 'GE1A', 'SGY3378H'),
	('2025-06-04 00:13:00', 12.00, 1, 'J80M', 'SGY3378H'),
	('2025-09-30 06:30:00', 6.00, 1, 'SK48', 'SGY3378H'),
	('2025-02-22 08:47:00', 7.20, 2, 'SK48', 'SGY3378H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGY3378H', 'PM24', '2025-02-04 08:54:00', '2025-02-04 15:43:00', 'SHORTTERM'),
	('SGY3378H', 'GE1A', '2025-05-14 13:22:00', '2025-05-15 01:31:00', 'SHORTTERM'),
	('SGY3378H', 'J80M', '2025-06-04 00:13:00', '2025-06-04 14:12:00', 'SHORTTERM'),
	('SGY3378H', 'SK48', '2025-09-30 06:30:00', '2025-09-30 11:35:00', 'SHORTTERM'),
	('SGY3378H', 'SK48', '2025-02-22 08:47:00', '2025-02-22 14:57:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-02 21:03:00', 0, NULL, 'PM23', 'SGY3378H'),
	('2025-06-29 07:33:00', 0, NULL, 'PM23', 'SGY3378H'),
	('2025-10-28 09:37:00', 0, NULL, 'PM23', 'SGY3378H'),
	('2025-10-27 10:53:00', 0, NULL, 'PM23', 'SGY3378H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGY3378H', 'PM23', '2025-03-02 21:03:00', '2025-03-02 22:16:00', 'SEASONAL'),
	('SGY3378H', 'PM23', '2025-06-29 07:33:00', '2025-06-29 19:00:00', 'SEASONAL'),
	('SGY3378H', 'PM23', '2025-10-28 09:37:00', '2025-10-28 10:33:00', 'SEASONAL'),
	('SGY3378H', 'PM23', '2025-10-27 10:53:00', '2025-10-27 15:40:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-02 21:23:00', 9, 370),
	('2025-06-29 12:22:00', 8, 371),
	('2025-10-28 09:55:00', 8, 372),
	('2025-10-27 12:53:00', 5, 373);

-- 59. Parking records for vehicle: SJJ8811B
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-30 19:50:00', 6.00, 2, 'W45', 'SJJ8811B'),
	('2025-10-03 06:28:00', 1.80, 1, 'SK48', 'SJJ8811B'),
	('2025-02-12 12:20:00', 7.80, 1, 'W45', 'SJJ8811B'),
	('2025-09-13 12:11:00', 7.80, 2, 'A36', 'SJJ8811B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ8811B', 'W45', '2025-08-30 19:50:00', '2025-08-31 01:06:00', 'SHORTTERM'),
	('SJJ8811B', 'SK48', '2025-10-03 06:28:00', '2025-10-03 07:58:00', 'SHORTTERM'),
	('SJJ8811B', 'W45', '2025-02-12 12:20:00', '2025-02-12 18:52:00', 'SHORTTERM'),
	('SJJ8811B', 'A36', '2025-09-13 12:11:00', '2025-09-13 19:04:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-14 20:01:00', 0, NULL, 'SB23', 'SJJ8811B'),
	('2025-02-20 07:30:00', 0, NULL, 'SB23', 'SJJ8811B'),
	('2025-09-19 15:52:00', 0, NULL, 'SB23', 'SJJ8811B'),
	('2025-02-07 16:30:00', 0, NULL, 'SB23', 'SJJ8811B'),
	('2025-10-16 03:57:00', 0, NULL, 'SB23', 'SJJ8811B');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJJ8811B', 'SB23', '2025-01-14 20:01:00', '2025-01-15 00:33:00', 'SEASONAL'),
	('SJJ8811B', 'SB23', '2025-02-20 07:30:00', '2025-02-20 16:07:00', 'SEASONAL'),
	('SJJ8811B', 'SB23', '2025-09-19 15:52:00', '2025-09-19 19:56:00', 'SEASONAL'),
	('SJJ8811B', 'SB23', '2025-02-07 16:30:00', '2025-02-08 02:58:00', 'SEASONAL'),
	('SJJ8811B', 'SB23', '2025-10-16 03:57:00', '2025-10-16 04:26:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-14 21:41:00', 13, 378),
	('2025-02-20 13:01:00', 10, 379),
	('2025-09-19 16:58:00', 10, 380),
	('2025-02-07 20:51:00', 8, 381),
	('2025-10-16 04:25:00', 6, 382);

-- 60. Parking records for vehicle: SHE5632P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-01 00:15:00', 5.40, 1, 'W780', 'SHE5632P'),
	('2025-07-01 15:37:00', 4.20, 1, 'PM23', 'SHE5632P'),
	('2025-07-07 15:59:00', 11.40, 1, 'PL80', 'SHE5632P'),
	('2025-07-12 02:41:00', 2.40, 2, 'SB23', 'SHE5632P'),
	('2025-06-25 07:23:00', 12.00, 1, 'PL80', 'SHE5632P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHE5632P', 'W780', '2025-05-01 00:15:00', '2025-05-01 05:13:00', 'SHORTTERM'),
	('SHE5632P', 'PM23', '2025-07-01 15:37:00', '2025-07-01 19:09:00', 'SHORTTERM'),
	('SHE5632P', 'PL80', '2025-07-07 15:59:00', '2025-07-08 01:39:00', 'SHORTTERM'),
	('SHE5632P', 'SB23', '2025-07-12 02:41:00', '2025-07-12 05:01:00', 'SHORTTERM'),
	('SHE5632P', 'PL80', '2025-06-25 07:23:00', '2025-06-25 17:50:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-24 05:42:00', 0, NULL, 'A34', 'SHE5632P'),
	('2025-04-18 01:20:00', 0, NULL, 'A34', 'SHE5632P'),
	('2025-09-10 11:58:00', 0, NULL, 'A34', 'SHE5632P'),
	('2025-06-24 13:51:00', 0, NULL, 'A34', 'SHE5632P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHE5632P', 'A34', '2025-02-24 05:42:00', '2025-02-24 14:43:00', 'SEASONAL'),
	('SHE5632P', 'A34', '2025-04-18 01:20:00', '2025-04-18 10:42:00', 'SEASONAL'),
	('SHE5632P', 'A34', '2025-09-10 11:58:00', '2025-09-11 00:44:00', 'SEASONAL'),
	('SHE5632P', 'A34', '2025-06-24 13:51:00', '2025-06-24 14:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-24 11:17:00', 11, 388),
	('2025-04-18 06:58:00', 1, 389),
	('2025-09-10 20:50:00', 4, 390),
	('2025-06-24 14:25:00', 3, 391);

-- 61. Parking records for vehicle: SLZ9904D
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-06 07:17:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-01-21 20:56:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-02-13 16:19:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-10-30 12:57:00', 0, NULL, 'SK15', 'SLZ9904D'),
	('2025-10-09 17:10:00', 0, NULL, 'SK15', 'SLZ9904D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLZ9904D', 'SK15', '2025-04-06 07:17:00', '2025-04-06 20:11:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-01-21 20:56:00', '2025-01-21 23:19:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-02-13 16:19:00', '2025-02-13 18:31:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-10-30 12:57:00', '2025-10-30 21:10:00', 'SEASONAL'),
	('SLZ9904D', 'SK15', '2025-10-09 17:10:00', '2025-10-10 02:03:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-06 10:52:00', 14, 392),
	('2025-01-21 21:30:00', 15, 393),
	('2025-02-13 16:22:00', 9, 394),
	('2025-10-30 16:04:00', 5, 395),
	('2025-10-09 22:45:00', 13, 396);

-- 62. Parking records for vehicle: SFC4422L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-14 23:52:00', 1.20, 1, 'B13', 'SFC4422L'),
	('2025-05-09 13:17:00', 5.40, 1, 'JM24', 'SFC4422L'),
	('2025-05-17 07:41:00', 12.00, 2, 'PM23', 'SFC4422L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFC4422L', 'B13', '2025-07-14 23:52:00', '2025-07-15 01:12:00', 'SHORTTERM'),
	('SFC4422L', 'JM24', '2025-05-09 13:17:00', '2025-05-09 18:10:00', 'SHORTTERM'),
	('SFC4422L', 'PM23', '2025-05-17 07:41:00', '2025-05-17 18:48:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-17 18:36:00', 7, 399);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-03 16:48:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-05-09 07:10:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-05-20 19:57:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-08-03 17:48:00', 0, NULL, 'SK15', 'SFC4422L'),
	('2025-06-21 10:53:00', 0, NULL, 'SK15', 'SFC4422L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFC4422L', 'SK15', '2025-09-03 16:48:00', '2025-09-04 05:30:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-05-09 07:10:00', '2025-05-09 09:18:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-05-20 19:57:00', '2025-05-21 08:23:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-08-03 17:48:00', '2025-08-03 22:10:00', 'SEASONAL'),
	('SFC4422L', 'SK15', '2025-06-21 10:53:00', '2025-06-21 23:59:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-03 22:43:00', 4, 400),
	('2025-05-09 08:06:00', 2, 401),
	('2025-05-20 20:06:00', 5, 402),
	('2025-08-03 20:25:00', 12, 403),
	('2025-06-21 20:35:00', 14, 404);

-- 63. Parking records for vehicle: SHK0187U
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-22 11:09:00', 0, NULL, 'JM24', 'SHK0187U'),
	('2025-08-24 22:08:00', 0, NULL, 'JM24', 'SHK0187U'),
	('2025-04-03 16:09:00', 0, NULL, 'JM24', 'SHK0187U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHK0187U', 'JM24', '2025-10-22 11:09:00', '2025-10-22 17:50:00', 'SEASONAL'),
	('SHK0187U', 'JM24', '2025-08-24 22:08:00', '2025-08-25 01:24:00', 'SEASONAL'),
	('SHK0187U', 'JM24', '2025-04-03 16:09:00', '2025-04-04 02:29:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-22 15:23:00', 1, 405),
	('2025-08-24 22:39:00', 14, 406),
	('2025-04-03 23:10:00', 14, 407);

-- 64. Parking records for vehicle: SJA1234K
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-01 04:11:00', 0, NULL, 'W780', 'SJA1234K'),
	('2025-08-26 19:42:00', 0, NULL, 'W780', 'SJA1234K'),
	('2025-09-22 06:21:00', 0, NULL, 'W780', 'SJA1234K'),
	('2025-05-31 08:47:00', 0, NULL, 'W780', 'SJA1234K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJA1234K', 'W780', '2025-03-01 04:11:00', '2025-03-01 14:08:00', 'SEASONAL'),
	('SJA1234K', 'W780', '2025-08-26 19:42:00', '2025-08-26 21:59:00', 'SEASONAL'),
	('SJA1234K', 'W780', '2025-09-22 06:21:00', '2025-09-22 12:41:00', 'SEASONAL'),
	('SJA1234K', 'W780', '2025-05-31 08:47:00', '2025-05-31 17:21:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-01 07:25:00', 3, 408),
	('2025-08-26 21:06:00', 1, 409),
	('2025-09-22 11:19:00', 8, 410),
	('2025-05-31 08:58:00', 13, 411);

-- 65. Parking records for vehicle: SGX2267G
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-22 10:46:00', 8.40, 1, 'JM24', 'SGX2267G'),
	('2025-09-17 17:00:00', 12.60, 1, 'W44', 'SGX2267G'),
	('2025-10-14 18:46:00', 6.00, 1, 'J80M', 'SGX2267G'),
	('2025-01-24 18:25:00', 11.40, 1, 'SB23', 'SGX2267G');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2267G', 'JM24', '2025-01-22 10:46:00', '2025-01-22 17:57:00', 'SHORTTERM'),
	('SGX2267G', 'W44', '2025-09-17 17:00:00', '2025-09-18 03:30:00', 'SHORTTERM'),
	('SGX2267G', 'J80M', '2025-10-14 18:46:00', '2025-10-15 00:15:00', 'SHORTTERM'),
	('SGX2267G', 'SB23', '2025-01-24 18:25:00', '2025-01-25 04:26:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-22 15:18:00', 4, 412);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-04 08:28:00', 0, NULL, 'B13', 'SGX2267G'),
	('2025-09-18 09:43:00', 0, NULL, 'B13', 'SGX2267G'),
	('2025-02-09 01:30:00', 0, NULL, 'B13', 'SGX2267G'),
	('2025-04-08 08:09:00', 0, NULL, 'B13', 'SGX2267G');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2267G', 'B13', '2025-05-04 08:28:00', '2025-05-04 13:59:00', 'SEASONAL'),
	('SGX2267G', 'B13', '2025-09-18 09:43:00', '2025-09-18 10:02:00', 'SEASONAL'),
	('SGX2267G', 'B13', '2025-02-09 01:30:00', '2025-02-09 09:12:00', 'SEASONAL'),
	('SGX2267G', 'B13', '2025-04-08 08:09:00', '2025-04-08 16:18:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-04 10:54:00', 3, 416),
	('2025-09-18 09:46:00', 4, 417),
	('2025-02-09 04:01:00', 2, 418),
	('2025-04-08 11:33:00', 12, 419);

-- 66. Parking records for vehicle: SFV6601E
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-13 08:35:00', 0, NULL, 'W780', 'SFV6601E'),
	('2025-01-20 01:03:00', 0, NULL, 'W780', 'SFV6601E'),
	('2025-09-12 21:15:00', 0, NULL, 'W780', 'SFV6601E');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFV6601E', 'W780', '2025-09-13 08:35:00', '2025-09-13 18:30:00', 'SEASONAL'),
	('SFV6601E', 'W780', '2025-01-20 01:03:00', '2025-01-20 06:45:00', 'SEASONAL'),
	('SFV6601E', 'W780', '2025-09-12 21:15:00', '2025-09-12 23:33:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-13 17:08:00', 3, 420),
	('2025-01-20 03:26:00', 10, 421),
	('2025-09-12 21:50:00', 4, 422);

-- 67. Parking records for vehicle: SKZ7714F
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-17 14:05:00', 5.40, 1, 'A35', 'SKZ7714F'),
	('2025-03-22 17:43:00', 13.20, 2, 'PL90', 'SKZ7714F'),
	('2025-04-10 23:56:00', 6.60, 1, 'JM24', 'SKZ7714F'),
	('2025-05-30 04:30:00', 12.00, 1, 'W45', 'SKZ7714F'),
	('2025-09-01 13:39:00', 7.80, 1, 'SE50', 'SKZ7714F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ7714F', 'A35', '2025-10-17 14:05:00', '2025-10-17 19:01:00', 'SHORTTERM'),
	('SKZ7714F', 'PL90', '2025-03-22 17:43:00', '2025-03-23 05:22:00', 'SHORTTERM'),
	('SKZ7714F', 'JM24', '2025-04-10 23:56:00', '2025-04-11 05:50:00', 'SHORTTERM'),
	('SKZ7714F', 'W45', '2025-05-30 04:30:00', '2025-05-30 17:18:00', 'SHORTTERM'),
	('SKZ7714F', 'SE50', '2025-09-01 13:39:00', '2025-09-01 20:15:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-22 22:22:00', 4, 424);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-06 01:41:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-08-27 18:20:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-01-18 22:41:00', 0, NULL, 'B13', 'SKZ7714F'),
	('2025-04-25 16:18:00', 0, NULL, 'B13', 'SKZ7714F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKZ7714F', 'B13', '2025-07-06 01:41:00', '2025-07-06 05:33:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-08-27 18:20:00', '2025-08-28 05:31:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-01-18 22:41:00', '2025-01-19 01:00:00', 'SEASONAL'),
	('SKZ7714F', 'B13', '2025-04-25 16:18:00', '2025-04-25 18:48:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-06 05:31:00', 2, 428),
	('2025-08-28 00:17:00', 4, 429),
	('2025-01-18 22:42:00', 7, 430),
	('2025-04-25 18:43:00', 7, 431);

-- 68. Parking records for vehicle: SNE5528R
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-31 02:38:00', 0, NULL, 'J80M', 'SNE5528R'),
	('2025-05-22 11:38:00', 0, NULL, 'J80M', 'SNE5528R'),
	('2025-02-09 13:13:00', 0, NULL, 'J80M', 'SNE5528R'),
	('2025-06-09 08:59:00', 0, NULL, 'J80M', 'SNE5528R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNE5528R', 'J80M', '2025-07-31 02:38:00', '2025-07-31 09:04:00', 'SEASONAL'),
	('SNE5528R', 'J80M', '2025-05-22 11:38:00', '2025-05-22 13:30:00', 'SEASONAL'),
	('SNE5528R', 'J80M', '2025-02-09 13:13:00', '2025-02-09 19:38:00', 'SEASONAL'),
	('SNE5528R', 'J80M', '2025-06-09 08:59:00', '2025-06-09 18:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-31 08:24:00', 15, 432),
	('2025-05-22 13:29:00', 15, 433),
	('2025-02-09 19:07:00', 2, 434),
	('2025-06-09 17:09:00', 14, 435);

-- 69. Parking records for vehicle: SHG7854R
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-10 04:39:00', 0, NULL, 'A36', 'SHG7854R'),
	('2025-03-18 02:31:00', 0, NULL, 'A36', 'SHG7854R'),
	('2025-05-11 03:51:00', 0, NULL, 'A36', 'SHG7854R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHG7854R', 'A36', '2025-05-10 04:39:00', '2025-05-10 06:46:00', 'SEASONAL'),
	('SHG7854R', 'A36', '2025-03-18 02:31:00', '2025-03-18 10:23:00', 'SEASONAL'),
	('SHG7854R', 'A36', '2025-05-11 03:51:00', '2025-05-11 14:12:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-10 06:05:00', 10, 436),
	('2025-03-18 05:19:00', 9, 437),
	('2025-05-11 05:11:00', 1, 438);

-- 70. Parking records for vehicle: SGC3378M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-15 03:10:00', 3.60, 1, 'SK15', 'SGC3378M'),
	('2025-10-06 01:38:00', 7.80, 1, 'A35', 'SGC3378M'),
	('2025-06-04 08:28:00', 12.00, 1, 'CK22', 'SGC3378M'),
	('2025-02-16 18:17:00', 4.20, 2, 'A35', 'SGC3378M'),
	('2025-09-18 13:06:00', 1.80, 1, 'W45', 'SGC3378M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGC3378M', 'SK15', '2025-09-15 03:10:00', '2025-09-15 06:15:00', 'SHORTTERM'),
	('SGC3378M', 'A35', '2025-10-06 01:38:00', '2025-10-06 08:21:00', 'SHORTTERM'),
	('SGC3378M', 'CK22', '2025-06-04 08:28:00', '2025-06-04 22:03:00', 'SHORTTERM'),
	('SGC3378M', 'A35', '2025-02-16 18:17:00', '2025-02-16 22:01:00', 'SHORTTERM'),
	('SGC3378M', 'W45', '2025-09-18 13:06:00', '2025-09-18 14:57:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-25 16:13:00', 0, NULL, 'PL80', 'SGC3378M'),
	('2025-02-01 04:51:00', 0, NULL, 'PL80', 'SGC3378M'),
	('2025-08-21 02:18:00', 0, NULL, 'PL80', 'SGC3378M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGC3378M', 'PL80', '2025-08-25 16:13:00', '2025-08-26 03:46:00', 'SEASONAL'),
	('SGC3378M', 'PL80', '2025-02-01 04:51:00', '2025-02-01 13:41:00', 'SEASONAL'),
	('SGC3378M', 'PL80', '2025-08-21 02:18:00', '2025-08-21 08:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-25 18:16:00', 14, 444),
	('2025-02-01 04:57:00', 12, 445),
	('2025-08-21 07:24:00', 1, 446);

-- 71. Parking records for vehicle: SFP0044Y
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-11 08:22:00', 0, NULL, 'A34', 'SFP0044Y'),
	('2025-07-07 00:11:00', 0, NULL, 'A34', 'SFP0044Y'),
	('2025-10-30 21:59:00', 0, NULL, 'A34', 'SFP0044Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFP0044Y', 'A34', '2025-10-11 08:22:00', '2025-10-11 20:31:00', 'SEASONAL'),
	('SFP0044Y', 'A34', '2025-07-07 00:11:00', '2025-07-07 03:18:00', 'SEASONAL'),
	('SFP0044Y', 'A34', '2025-10-30 21:59:00', '2025-10-31 02:46:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-11 13:06:00', 14, 447),
	('2025-07-07 00:34:00', 7, 448),
	('2025-10-31 01:37:00', 9, 449);

-- 72. Parking records for vehicle: SFL7711V
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-26 22:18:00', 0, NULL, 'GE1A', 'SFL7711V'),
	('2025-06-01 03:05:00', 0, NULL, 'GE1A', 'SFL7711V'),
	('2025-03-21 18:39:00', 0, NULL, 'GE1A', 'SFL7711V');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFL7711V', 'GE1A', '2025-03-26 22:18:00', '2025-03-27 11:16:00', 'SEASONAL'),
	('SFL7711V', 'GE1A', '2025-06-01 03:05:00', '2025-06-01 14:33:00', 'SEASONAL'),
	('SFL7711V', 'GE1A', '2025-03-21 18:39:00', '2025-03-22 06:04:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-27 06:48:00', 12, 450),
	('2025-06-01 11:12:00', 15, 451),
	('2025-03-22 03:55:00', 14, 452);

-- 73. Parking records for vehicle: SGW1156F
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-07 12:51:00', 0, NULL, 'JM25', 'SGW1156F'),
	('2025-09-02 13:18:00', 0, NULL, 'JM25', 'SGW1156F'),
	('2025-01-19 03:16:00', 0, NULL, 'JM25', 'SGW1156F'),
	('2025-07-09 18:46:00', 0, NULL, 'JM25', 'SGW1156F'),
	('2025-06-28 20:01:00', 0, NULL, 'JM25', 'SGW1156F');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGW1156F', 'JM25', '2025-05-07 12:51:00', '2025-05-07 17:19:00', 'SEASONAL'),
	('SGW1156F', 'JM25', '2025-09-02 13:18:00', '2025-09-03 03:11:00', 'SEASONAL'),
	('SGW1156F', 'JM25', '2025-01-19 03:16:00', '2025-01-19 13:59:00', 'SEASONAL'),
	('SGW1156F', 'JM25', '2025-07-09 18:46:00', '2025-07-10 06:28:00', 'SEASONAL'),
	('SGW1156F', 'JM25', '2025-06-28 20:01:00', '2025-06-28 20:16:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-07 15:58:00', 12, 453),
	('2025-09-02 14:45:00', 9, 454),
	('2025-01-19 08:08:00', 2, 455),
	('2025-07-10 02:32:00', 5, 456),
	('2025-06-28 20:12:00', 6, 457);

-- 74. Parking records for vehicle: SHE5632P
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-07 01:18:00', 10.20, 1, 'CK22', 'SHE5632P'),
	('2025-05-07 21:22:00', 0.60, 1, 'SK49', 'SHE5632P'),
	('2025-01-08 18:20:00', 10.20, 1, 'J80M', 'SHE5632P'),
	('2025-06-01 16:52:00', 13.20, 2, 'PL80', 'SHE5632P'),
	('2025-03-27 04:38:00', 12.00, 1, 'CK25', 'SHE5632P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHE5632P', 'CK22', '2025-08-07 01:18:00', '2025-08-07 10:14:00', 'SHORTTERM'),
	('SHE5632P', 'SK49', '2025-05-07 21:22:00', '2025-05-07 21:52:00', 'SHORTTERM'),
	('SHE5632P', 'J80M', '2025-01-08 18:20:00', '2025-01-09 03:01:00', 'SHORTTERM'),
	('SHE5632P', 'PL80', '2025-06-01 16:52:00', '2025-06-02 04:26:00', 'SHORTTERM'),
	('SHE5632P', 'CK25', '2025-03-27 04:38:00', '2025-03-27 16:37:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-18 13:31:00', 0, NULL, 'C28', 'SHE5632P'),
	('2025-03-31 00:07:00', 0, NULL, 'C28', 'SHE5632P'),
	('2025-06-22 13:22:00', 0, NULL, 'C28', 'SHE5632P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHE5632P', 'C28', '2025-02-18 13:31:00', '2025-02-18 20:11:00', 'SEASONAL'),
	('SHE5632P', 'C28', '2025-03-31 00:07:00', '2025-03-31 01:38:00', 'SEASONAL'),
	('SHE5632P', 'C28', '2025-06-22 13:22:00', '2025-06-22 23:43:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-18 16:08:00', 2, 463),
	('2025-03-31 01:00:00', 3, 464),
	('2025-06-22 18:31:00', 5, 465);

-- 75. Parking records for vehicle: SGX2267G
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-03 09:07:00', 11.40, 1, 'PM23', 'SGX2267G'),
	('2025-08-16 06:36:00', 7.80, 2, 'B13', 'SGX2267G'),
	('2025-01-30 08:51:00', 12.00, 1, 'A34', 'SGX2267G');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2267G', 'PM23', '2025-04-03 09:07:00', '2025-04-03 18:57:00', 'SHORTTERM'),
	('SGX2267G', 'B13', '2025-08-16 06:36:00', '2025-08-16 13:31:00', 'SHORTTERM'),
	('SGX2267G', 'A34', '2025-01-30 08:51:00', '2025-01-30 19:03:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-28 07:40:00', 0, NULL, 'PL90', 'SGX2267G'),
	('2025-10-02 18:01:00', 0, NULL, 'PL90', 'SGX2267G'),
	('2025-02-01 22:17:00', 0, NULL, 'PL90', 'SGX2267G'),
	('2025-05-17 18:27:00', 0, NULL, 'PL90', 'SGX2267G'),
	('2025-01-03 00:29:00', 0, NULL, 'PL90', 'SGX2267G');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2267G', 'PL90', '2025-04-28 07:40:00', '2025-04-28 14:21:00', 'SEASONAL'),
	('SGX2267G', 'PL90', '2025-10-02 18:01:00', '2025-10-03 06:31:00', 'SEASONAL'),
	('SGX2267G', 'PL90', '2025-02-01 22:17:00', '2025-02-02 03:43:00', 'SEASONAL'),
	('SGX2267G', 'PL90', '2025-05-17 18:27:00', '2025-05-18 08:24:00', 'SEASONAL'),
	('SGX2267G', 'PL90', '2025-01-03 00:29:00', '2025-01-03 00:40:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-28 10:24:00', 7, 469),
	('2025-10-03 02:04:00', 15, 470),
	('2025-02-02 03:40:00', 9, 471),
	('2025-05-18 02:16:00', 8, 472),
	('2025-01-03 00:34:00', 2, 473);

-- 76. Parking records for vehicle: SGG7712R
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-31 12:11:00', 11.40, 1, 'CK22', 'SGG7712R'),
	('2025-10-30 19:44:00', 7.20, 1, 'A36', 'SGG7712R'),
	('2025-03-30 21:22:00', 3.60, 2, 'SK48', 'SGG7712R'),
	('2025-09-04 08:51:00', 12.00, 1, 'C28', 'SGG7712R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGG7712R', 'CK22', '2025-07-31 12:11:00', '2025-07-31 21:43:00', 'SHORTTERM'),
	('SGG7712R', 'A36', '2025-10-30 19:44:00', '2025-10-31 02:21:00', 'SHORTTERM'),
	('SGG7712R', 'SK48', '2025-03-30 21:22:00', '2025-03-31 00:44:00', 'SHORTTERM'),
	('SGG7712R', 'C28', '2025-09-04 08:51:00', '2025-09-04 19:37:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-30 22:04:00', 10, 476);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-20 03:25:00', 0, NULL, 'W45', 'SGG7712R'),
	('2025-03-22 08:20:00', 0, NULL, 'W45', 'SGG7712R'),
	('2025-02-13 01:09:00', 0, NULL, 'W45', 'SGG7712R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGG7712R', 'W45', '2025-01-20 03:25:00', '2025-01-20 15:47:00', 'SEASONAL'),
	('SGG7712R', 'W45', '2025-03-22 08:20:00', '2025-03-22 18:25:00', 'SEASONAL'),
	('SGG7712R', 'W45', '2025-02-13 01:09:00', '2025-02-13 12:19:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-20 11:39:00', 3, 478),
	('2025-03-22 14:40:00', 13, 479),
	('2025-02-13 10:03:00', 8, 480);

-- 77. Parking records for vehicle: SHC3410M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-07 02:08:00', 3.00, 1, 'B13', 'SHC3410M'),
	('2025-08-25 18:21:00', 15.00, 1, 'A34', 'SHC3410M'),
	('2025-02-23 21:54:00', 0.00, 2, 'A34', 'SHC3410M'),
	('2025-05-12 09:30:00', 6.60, 1, 'CK22', 'SHC3410M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHC3410M', 'B13', '2025-05-07 02:08:00', '2025-05-07 04:49:00', 'SHORTTERM'),
	('SHC3410M', 'A34', '2025-08-25 18:21:00', '2025-08-26 07:02:00', 'SHORTTERM'),
	('SHC3410M', 'A34', '2025-02-23 21:54:00', '2025-02-23 22:12:00', 'SHORTTERM'),
	('SHC3410M', 'CK22', '2025-05-12 09:30:00', '2025-05-12 15:08:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-25 05:03:00', 0, NULL, 'PM23', 'SHC3410M'),
	('2025-04-05 18:05:00', 0, NULL, 'PM23', 'SHC3410M'),
	('2025-10-13 22:15:00', 0, NULL, 'PM23', 'SHC3410M'),
	('2025-02-06 07:20:00', 0, NULL, 'PM23', 'SHC3410M'),
	('2025-05-08 09:32:00', 0, NULL, 'PM23', 'SHC3410M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHC3410M', 'PM23', '2025-10-25 05:03:00', '2025-10-25 09:48:00', 'SEASONAL'),
	('SHC3410M', 'PM23', '2025-04-05 18:05:00', '2025-04-05 19:48:00', 'SEASONAL'),
	('SHC3410M', 'PM23', '2025-10-13 22:15:00', '2025-10-14 09:13:00', 'SEASONAL'),
	('SHC3410M', 'PM23', '2025-02-06 07:20:00', '2025-02-06 19:19:00', 'SEASONAL'),
	('SHC3410M', 'PM23', '2025-05-08 09:32:00', '2025-05-08 12:10:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-25 09:40:00', 10, 485),
	('2025-04-05 18:43:00', 10, 486),
	('2025-10-14 04:04:00', 12, 487),
	('2025-02-06 14:53:00', 4, 488),
	('2025-05-08 09:55:00', 9, 489);

-- 78. Parking records for vehicle: SHF6743Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-28 15:31:00', 7.20, 2, 'SK48', 'SHF6743Q'),
	('2025-02-02 12:01:00', 7.80, 2, 'J80M', 'SHF6743Q'),
	('2025-02-26 14:33:00', 14.40, 1, 'PM24', 'SHF6743Q'),
	('2025-09-04 17:47:00', 4.20, 1, 'PM23', 'SHF6743Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHF6743Q', 'SK48', '2025-09-28 15:31:00', '2025-09-28 21:38:00', 'SHORTTERM'),
	('SHF6743Q', 'J80M', '2025-02-02 12:01:00', '2025-02-02 18:42:00', 'SHORTTERM'),
	('SHF6743Q', 'PM24', '2025-02-26 14:33:00', '2025-02-27 03:01:00', 'SHORTTERM'),
	('SHF6743Q', 'PM23', '2025-09-04 17:47:00', '2025-09-04 21:36:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-09 10:31:00', 0, NULL, 'W780', 'SHF6743Q'),
	('2025-05-13 08:21:00', 0, NULL, 'W780', 'SHF6743Q'),
	('2025-05-05 12:44:00', 0, NULL, 'W780', 'SHF6743Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHF6743Q', 'W780', '2025-05-09 10:31:00', '2025-05-10 00:23:00', 'SEASONAL'),
	('SHF6743Q', 'W780', '2025-05-13 08:21:00', '2025-05-13 17:12:00', 'SEASONAL'),
	('SHF6743Q', 'W780', '2025-05-05 12:44:00', '2025-05-05 17:16:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-09 23:15:00', 14, 494),
	('2025-05-13 15:53:00', 10, 495),
	('2025-05-05 17:08:00', 13, 496);

-- 79. Parking records for vehicle: SGF6601Q
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-22 06:13:00', 5.40, 1, 'SE50', 'SGF6601Q'),
	('2025-10-21 15:01:00', 10.20, 1, 'PM24', 'SGF6601Q'),
	('2025-04-09 09:18:00', 3.60, 1, 'GE1A', 'SGF6601Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGF6601Q', 'SE50', '2025-10-22 06:13:00', '2025-10-22 10:59:00', 'SHORTTERM'),
	('SGF6601Q', 'PM24', '2025-10-21 15:01:00', '2025-10-21 23:49:00', 'SHORTTERM'),
	('SGF6601Q', 'GE1A', '2025-04-09 09:18:00', '2025-04-09 12:28:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-10 23:47:00', 0, NULL, 'B13', 'SGF6601Q'),
	('2025-10-22 22:17:00', 0, NULL, 'B13', 'SGF6601Q'),
	('2025-04-08 00:14:00', 0, NULL, 'B13', 'SGF6601Q'),
	('2025-01-22 01:55:00', 0, NULL, 'B13', 'SGF6601Q'),
	('2025-10-26 22:30:00', 0, NULL, 'B13', 'SGF6601Q');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGF6601Q', 'B13', '2025-01-10 23:47:00', '2025-01-11 05:45:00', 'SEASONAL'),
	('SGF6601Q', 'B13', '2025-10-22 22:17:00', '2025-10-22 22:40:00', 'SEASONAL'),
	('SGF6601Q', 'B13', '2025-04-08 00:14:00', '2025-04-08 03:39:00', 'SEASONAL'),
	('SGF6601Q', 'B13', '2025-01-22 01:55:00', '2025-01-22 09:35:00', 'SEASONAL'),
	('SGF6601Q', 'B13', '2025-10-26 22:30:00', '2025-10-27 01:34:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-11 03:51:00', 9, 500),
	('2025-10-22 22:17:00', 11, 501),
	('2025-04-08 02:30:00', 12, 502),
	('2025-01-22 08:05:00', 4, 503),
	('2025-10-26 23:05:00', 12, 504);

-- 80. Parking records for vehicle: SGE5590P
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-12 19:00:00', 0, NULL, 'SK48', 'SGE5590P'),
	('2025-05-03 09:18:00', 0, NULL, 'SK48', 'SGE5590P'),
	('2025-07-30 21:41:00', 0, NULL, 'SK48', 'SGE5590P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGE5590P', 'SK48', '2025-05-12 19:00:00', '2025-05-13 07:05:00', 'SEASONAL'),
	('SGE5590P', 'SK48', '2025-05-03 09:18:00', '2025-05-03 13:56:00', 'SEASONAL'),
	('SGE5590P', 'SK48', '2025-07-30 21:41:00', '2025-07-31 05:10:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-12 20:21:00', 3, 505),
	('2025-05-03 13:51:00', 4, 506),
	('2025-07-30 22:31:00', 5, 507);

-- 81. Parking records for vehicle: SHP4521Y
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-08 16:16:00', 0, NULL, 'PM24', 'SHP4521Y'),
	('2025-01-23 16:06:00', 0, NULL, 'PM24', 'SHP4521Y'),
	('2025-03-31 09:33:00', 0, NULL, 'PM24', 'SHP4521Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHP4521Y', 'PM24', '2025-02-08 16:16:00', '2025-02-08 17:31:00', 'SEASONAL'),
	('SHP4521Y', 'PM24', '2025-01-23 16:06:00', '2025-01-23 18:33:00', 'SEASONAL'),
	('SHP4521Y', 'PM24', '2025-03-31 09:33:00', '2025-03-31 15:01:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-02-08 17:15:00', 14, 508),
	('2025-01-23 17:26:00', 11, 509),
	('2025-03-31 14:23:00', 2, 510);

-- 82. Parking records for vehicle: SLH2205U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-06 07:21:00', 2.40, 1, 'W81', 'SLH2205U'),
	('2025-07-25 15:11:00', 14.40, 1, 'SK49', 'SLH2205U'),
	('2025-10-01 23:14:00', 6.60, 1, 'W44', 'SLH2205U'),
	('2025-01-12 15:02:00', 4.80, 2, 'GE1A', 'SLH2205U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLH2205U', 'W81', '2025-10-06 07:21:00', '2025-10-06 09:47:00', 'SHORTTERM'),
	('SLH2205U', 'SK49', '2025-07-25 15:11:00', '2025-07-26 03:51:00', 'SHORTTERM'),
	('SLH2205U', 'W44', '2025-10-01 23:14:00', '2025-10-02 05:25:00', 'SHORTTERM'),
	('SLH2205U', 'GE1A', '2025-01-12 15:02:00', '2025-01-12 19:05:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-21 07:35:00', 0, NULL, 'C28', 'SLH2205U'),
	('2025-07-27 20:17:00', 0, NULL, 'C28', 'SLH2205U'),
	('2025-11-04 14:15:00', 0, NULL, 'C28', 'SLH2205U'),
	('2025-08-30 01:13:00', 0, NULL, 'C28', 'SLH2205U'),
	('2025-06-16 21:50:00', 0, NULL, 'C28', 'SLH2205U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLH2205U', 'C28', '2025-10-21 07:35:00', '2025-10-21 20:22:00', 'SEASONAL'),
	('SLH2205U', 'C28', '2025-07-27 20:17:00', '2025-07-27 22:23:00', 'SEASONAL'),
	('SLH2205U', 'C28', '2025-11-04 14:15:00', '2025-11-04 14:18:00', 'SEASONAL'),
	('SLH2205U', 'C28', '2025-08-30 01:13:00', '2025-08-30 14:35:00', 'SEASONAL'),
	('SLH2205U', 'C28', '2025-06-16 21:50:00', '2025-06-17 04:04:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-21 10:18:00', 8, 515),
	('2025-07-27 21:01:00', 11, 516),
	('2025-11-04 14:17:00', 10, 517),
	('2025-08-30 01:21:00', 13, 518),
	('2025-06-17 03:56:00', 14, 519);

-- 83. Parking records for vehicle: SJQ9021M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-31 13:39:00', 12.00, 2, 'SK15', 'SJQ9021M'),
	('2025-07-30 06:08:00', 11.40, 1, 'PL90', 'SJQ9021M'),
	('2025-10-18 01:50:00', 11.40, 2, 'JM24', 'SJQ9021M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJQ9021M', 'SK15', '2025-08-31 13:39:00', '2025-08-31 23:46:00', 'SHORTTERM'),
	('SJQ9021M', 'PL90', '2025-07-30 06:08:00', '2025-07-30 16:06:00', 'SHORTTERM'),
	('SJQ9021M', 'JM24', '2025-10-18 01:50:00', '2025-10-18 11:33:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-20 07:30:00', 0, NULL, 'PM23', 'SJQ9021M'),
	('2025-08-29 16:38:00', 0, NULL, 'PM23', 'SJQ9021M'),
	('2025-06-11 01:30:00', 0, NULL, 'PM23', 'SJQ9021M'),
	('2025-05-25 22:20:00', 0, NULL, 'PM23', 'SJQ9021M'),
	('2025-10-27 03:12:00', 0, NULL, 'PM23', 'SJQ9021M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJQ9021M', 'PM23', '2025-07-20 07:30:00', '2025-07-20 11:30:00', 'SEASONAL'),
	('SJQ9021M', 'PM23', '2025-08-29 16:38:00', '2025-08-30 03:13:00', 'SEASONAL'),
	('SJQ9021M', 'PM23', '2025-06-11 01:30:00', '2025-06-11 03:43:00', 'SEASONAL'),
	('SJQ9021M', 'PM23', '2025-05-25 22:20:00', '2025-05-26 04:33:00', 'SEASONAL'),
	('SJQ9021M', 'PM23', '2025-10-27 03:12:00', '2025-10-27 16:53:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-20 10:41:00', 11, 523),
	('2025-08-29 22:13:00', 7, 524),
	('2025-06-11 02:41:00', 6, 525),
	('2025-05-26 01:22:00', 3, 526),
	('2025-10-27 13:54:00', 10, 527);

-- 84. Parking records for vehicle: SFF1155P
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-05 10:27:00', 0, NULL, 'SK48', 'SFF1155P'),
	('2025-03-16 12:09:00', 0, NULL, 'SK48', 'SFF1155P'),
	('2025-06-30 00:33:00', 0, NULL, 'SK48', 'SFF1155P'),
	('2025-07-30 12:41:00', 0, NULL, 'SK48', 'SFF1155P'),
	('2025-09-30 15:49:00', 0, NULL, 'SK48', 'SFF1155P');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFF1155P', 'SK48', '2025-07-05 10:27:00', '2025-07-05 15:54:00', 'SEASONAL'),
	('SFF1155P', 'SK48', '2025-03-16 12:09:00', '2025-03-16 17:26:00', 'SEASONAL'),
	('SFF1155P', 'SK48', '2025-06-30 00:33:00', '2025-06-30 05:23:00', 'SEASONAL'),
	('SFF1155P', 'SK48', '2025-07-30 12:41:00', '2025-07-30 22:09:00', 'SEASONAL'),
	('SFF1155P', 'SK48', '2025-09-30 15:49:00', '2025-10-01 01:42:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-05 15:06:00', 1, 528),
	('2025-03-16 15:30:00', 9, 529),
	('2025-06-30 05:10:00', 4, 530),
	('2025-07-30 16:50:00', 4, 531),
	('2025-09-30 21:52:00', 3, 532);

-- 85. Parking records for vehicle: SFR2267A
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-22 16:58:00', 0, NULL, 'CK22', 'SFR2267A'),
	('2025-03-10 08:32:00', 0, NULL, 'CK22', 'SFR2267A'),
	('2025-03-25 02:57:00', 0, NULL, 'CK22', 'SFR2267A'),
	('2025-06-01 05:15:00', 0, NULL, 'CK22', 'SFR2267A'),
	('2025-05-15 07:53:00', 0, NULL, 'CK22', 'SFR2267A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFR2267A', 'CK22', '2025-07-22 16:58:00', '2025-07-23 01:14:00', 'SEASONAL'),
	('SFR2267A', 'CK22', '2025-03-10 08:32:00', '2025-03-10 13:12:00', 'SEASONAL'),
	('SFR2267A', 'CK22', '2025-03-25 02:57:00', '2025-03-25 12:33:00', 'SEASONAL'),
	('SFR2267A', 'CK22', '2025-06-01 05:15:00', '2025-06-01 11:22:00', 'SEASONAL'),
	('SFR2267A', 'CK22', '2025-05-15 07:53:00', '2025-05-15 16:59:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-07-22 18:50:00', 11, 533),
	('2025-03-10 13:07:00', 7, 534),
	('2025-03-25 06:40:00', 13, 535),
	('2025-06-01 11:18:00', 3, 536),
	('2025-05-15 08:32:00', 6, 537);

-- 86. Parking records for vehicle: SGP4489Y
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-18 18:06:00', 6.60, 1, 'A36', 'SGP4489Y'),
	('2025-06-15 01:31:00', 2.40, 2, 'C28', 'SGP4489Y'),
	('2025-04-19 11:51:00', 6.00, 2, 'W45', 'SGP4489Y'),
	('2025-02-27 10:24:00', 4.20, 1, 'PM24', 'SGP4489Y'),
	('2025-10-02 05:45:00', 12.00, 1, 'B13', 'SGP4489Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGP4489Y', 'A36', '2025-09-18 18:06:00', '2025-09-19 00:26:00', 'SHORTTERM'),
	('SGP4489Y', 'C28', '2025-06-15 01:31:00', '2025-06-15 03:31:00', 'SHORTTERM'),
	('SGP4489Y', 'W45', '2025-04-19 11:51:00', '2025-04-19 17:07:00', 'SHORTTERM'),
	('SGP4489Y', 'PM24', '2025-02-27 10:24:00', '2025-02-27 14:17:00', 'SHORTTERM'),
	('SGP4489Y', 'B13', '2025-10-02 05:45:00', '2025-10-02 18:59:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-19 15:21:00', 8, 540);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-30 14:32:00', 0, NULL, 'SK15', 'SGP4489Y'),
	('2025-06-05 18:51:00', 0, NULL, 'SK15', 'SGP4489Y'),
	('2025-07-17 02:07:00', 0, NULL, 'SK15', 'SGP4489Y'),
	('2025-03-15 17:39:00', 0, NULL, 'SK15', 'SGP4489Y');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGP4489Y', 'SK15', '2025-08-30 14:32:00', '2025-08-30 19:37:00', 'SEASONAL'),
	('SGP4489Y', 'SK15', '2025-06-05 18:51:00', '2025-06-05 20:46:00', 'SEASONAL'),
	('SGP4489Y', 'SK15', '2025-07-17 02:07:00', '2025-07-17 14:38:00', 'SEASONAL'),
	('SGP4489Y', 'SK15', '2025-03-15 17:39:00', '2025-03-15 19:02:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-30 19:02:00', 9, 543),
	('2025-06-05 20:20:00', 5, 544),
	('2025-07-17 06:00:00', 3, 545),
	('2025-03-15 18:54:00', 2, 546);

-- 87. Parking records for vehicle: SGJ9934T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-07-02 20:43:00', 10.80, 1, 'W44', 'SGJ9934T'),
	('2025-02-05 06:32:00', 0.00, 1, 'C28', 'SGJ9934T'),
	('2025-02-10 03:33:00', 12.00, 1, 'A36', 'SGJ9934T'),
	('2025-05-29 04:49:00', 9.00, 1, 'CK22', 'SGJ9934T'),
	('2025-10-26 07:38:00', 10.20, 2, 'SK48', 'SGJ9934T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGJ9934T', 'W44', '2025-07-02 20:43:00', '2025-07-03 06:28:00', 'SHORTTERM'),
	('SGJ9934T', 'C28', '2025-02-05 06:32:00', '2025-02-05 06:36:00', 'SHORTTERM'),
	('SGJ9934T', 'A36', '2025-02-10 03:33:00', '2025-02-10 14:58:00', 'SHORTTERM'),
	('SGJ9934T', 'CK22', '2025-05-29 04:49:00', '2025-05-29 12:34:00', 'SHORTTERM'),
	('SGJ9934T', 'SK48', '2025-10-26 07:38:00', '2025-10-26 16:22:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-15 09:54:00', 0, NULL, 'SB23', 'SGJ9934T'),
	('2025-06-11 15:26:00', 0, NULL, 'SB23', 'SGJ9934T'),
	('2025-08-24 05:12:00', 0, NULL, 'SB23', 'SGJ9934T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGJ9934T', 'SB23', '2025-03-15 09:54:00', '2025-03-15 23:32:00', 'SEASONAL'),
	('SGJ9934T', 'SB23', '2025-06-11 15:26:00', '2025-06-11 21:38:00', 'SEASONAL'),
	('SGJ9934T', 'SB23', '2025-08-24 05:12:00', '2025-08-24 10:11:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-15 18:17:00', 13, 552),
	('2025-06-11 15:26:00', 7, 553),
	('2025-08-24 06:20:00', 3, 554);

-- 88. Parking records for vehicle: SGX7722C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-10 01:09:00', 12.00, 1, 'SB23', 'SGX7722C'),
	('2025-10-20 14:47:00', 4.20, 1, 'W44', 'SGX7722C'),
	('2025-04-26 23:30:00', 6.00, 2, 'CK25', 'SGX7722C'),
	('2025-03-20 12:31:00', 13.20, 1, 'W45', 'SGX7722C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX7722C', 'SB23', '2025-06-10 01:09:00', '2025-06-10 13:17:00', 'SHORTTERM'),
	('SGX7722C', 'W44', '2025-10-20 14:47:00', '2025-10-20 18:29:00', 'SHORTTERM'),
	('SGX7722C', 'CK25', '2025-04-26 23:30:00', '2025-04-27 04:54:00', 'SHORTTERM'),
	('SGX7722C', 'W45', '2025-03-20 12:31:00', '2025-03-21 01:13:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-27 18:30:00', 0, NULL, 'C28', 'SGX7722C'),
	('2025-10-17 06:58:00', 0, NULL, 'C28', 'SGX7722C'),
	('2025-02-10 08:25:00', 0, NULL, 'C28', 'SGX7722C'),
	('2025-10-20 08:34:00', 0, NULL, 'C28', 'SGX7722C'),
	('2025-05-02 08:54:00', 0, NULL, 'C28', 'SGX7722C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX7722C', 'C28', '2025-10-27 18:30:00', '2025-10-27 20:41:00', 'SEASONAL'),
	('SGX7722C', 'C28', '2025-10-17 06:58:00', '2025-10-17 19:09:00', 'SEASONAL'),
	('SGX7722C', 'C28', '2025-02-10 08:25:00', '2025-02-10 13:17:00', 'SEASONAL'),
	('SGX7722C', 'C28', '2025-10-20 08:34:00', '2025-10-20 09:25:00', 'SEASONAL'),
	('SGX7722C', 'C28', '2025-05-02 08:54:00', '2025-05-02 18:35:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-27 20:32:00', 15, 559),
	('2025-10-17 14:31:00', 9, 560),
	('2025-02-10 09:02:00', 1, 561),
	('2025-10-20 09:17:00', 11, 562),
	('2025-05-02 09:25:00', 12, 563);

-- 89. Parking records for vehicle: SGV0045E
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-04 22:01:00', 0, NULL, 'CK25', 'SGV0045E'),
	('2025-05-13 02:33:00', 0, NULL, 'CK25', 'SGV0045E'),
	('2025-06-13 17:44:00', 0, NULL, 'CK25', 'SGV0045E'),
	('2025-02-22 01:25:00', 0, NULL, 'CK25', 'SGV0045E'),
	('2025-09-30 06:48:00', 0, NULL, 'CK25', 'SGV0045E');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGV0045E', 'CK25', '2025-01-04 22:01:00', '2025-01-05 08:28:00', 'SEASONAL'),
	('SGV0045E', 'CK25', '2025-05-13 02:33:00', '2025-05-13 08:42:00', 'SEASONAL'),
	('SGV0045E', 'CK25', '2025-06-13 17:44:00', '2025-06-13 18:41:00', 'SEASONAL'),
	('SGV0045E', 'CK25', '2025-02-22 01:25:00', '2025-02-22 05:17:00', 'SEASONAL'),
	('SGV0045E', 'CK25', '2025-09-30 06:48:00', '2025-09-30 17:50:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-05 02:10:00', 15, 564),
	('2025-05-13 08:30:00', 3, 565),
	('2025-06-13 18:36:00', 14, 566),
	('2025-02-22 04:06:00', 5, 567),
	('2025-09-30 09:28:00', 8, 568);

-- 90. Parking records for vehicle: SGH8823S
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-09 18:37:00', 0, NULL, 'SB23', 'SGH8823S'),
	('2025-06-26 00:59:00', 0, NULL, 'SB23', 'SGH8823S'),
	('2025-09-28 11:12:00', 0, NULL, 'SB23', 'SGH8823S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGH8823S', 'SB23', '2025-08-09 18:37:00', '2025-08-10 01:31:00', 'SEASONAL'),
	('SGH8823S', 'SB23', '2025-06-26 00:59:00', '2025-06-26 06:24:00', 'SEASONAL'),
	('SGH8823S', 'SB23', '2025-09-28 11:12:00', '2025-09-28 20:31:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-09 23:13:00', 6, 569),
	('2025-06-26 05:24:00', 13, 570),
	('2025-09-28 15:45:00', 5, 571);

-- 91. Parking records for vehicle: SHA1298K
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-07 19:33:00', 0, NULL, 'JM24', 'SHA1298K'),
	('2025-07-30 07:06:00', 0, NULL, 'JM24', 'SHA1298K'),
	('2025-06-19 06:11:00', 0, NULL, 'JM24', 'SHA1298K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SHA1298K', 'JM24', '2025-01-07 19:33:00', '2025-01-08 03:32:00', 'SEASONAL'),
	('SHA1298K', 'JM24', '2025-07-30 07:06:00', '2025-07-30 16:40:00', 'SEASONAL'),
	('SHA1298K', 'JM24', '2025-06-19 06:11:00', '2025-06-19 09:54:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-01-07 20:32:00', 14, 572),
	('2025-07-30 11:33:00', 6, 573),
	('2025-06-19 07:01:00', 14, 574);

-- 92. Parking records for vehicle: SFA7703L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-05 13:44:00', 12.00, 1, 'CK22', 'SFA7703L'),
	('2025-11-01 07:18:00', 0.60, 2, 'B13', 'SFA7703L'),
	('2025-06-19 08:49:00', 3.60, 1, 'CK22', 'SFA7703L'),
	('2025-01-19 12:16:00', 7.80, 2, 'J80M', 'SFA7703L'),
	('2025-06-25 19:40:00', 10.20, 1, 'B13', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'CK22', '2025-08-05 13:44:00', '2025-08-05 23:55:00', 'SHORTTERM'),
	('SFA7703L', 'B13', '2025-11-01 07:18:00', '2025-11-01 08:03:00', 'SHORTTERM'),
	('SFA7703L', 'CK22', '2025-06-19 08:49:00', '2025-06-19 11:51:00', 'SHORTTERM'),
	('SFA7703L', 'J80M', '2025-01-19 12:16:00', '2025-01-19 19:07:00', 'SHORTTERM'),
	('SFA7703L', 'B13', '2025-06-25 19:40:00', '2025-06-26 04:59:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-06-19 11:16:00', 14, 577);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-23 20:36:00', 0, NULL, 'SK48', 'SFA7703L'),
	('2025-07-28 07:46:00', 0, NULL, 'SK48', 'SFA7703L'),
	('2025-07-03 07:32:00', 0, NULL, 'SK48', 'SFA7703L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA7703L', 'SK48', '2025-05-23 20:36:00', '2025-05-24 00:23:00', 'SEASONAL'),
	('SFA7703L', 'SK48', '2025-07-28 07:46:00', '2025-07-28 15:18:00', 'SEASONAL'),
	('SFA7703L', 'SK48', '2025-07-03 07:32:00', '2025-07-03 15:52:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-23 21:37:00', 8, 580),
	('2025-07-28 12:11:00', 4, 581),
	('2025-07-03 14:03:00', 2, 582);

-- 93. Parking records for vehicle: SKE2214T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-25 10:11:00', 12.00, 1, 'B13', 'SKE2214T'),
	('2025-06-08 21:04:00', 7.20, 2, 'SB23', 'SKE2214T'),
	('2025-04-17 19:59:00', 1.80, 1, 'JM24', 'SKE2214T'),
	('2025-09-12 19:15:00', 7.80, 1, 'PL90', 'SKE2214T'),
	('2025-07-12 01:48:00', 11.40, 2, 'CK25', 'SKE2214T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKE2214T', 'B13', '2025-02-25 10:11:00', '2025-02-25 23:49:00', 'SHORTTERM'),
	('SKE2214T', 'SB23', '2025-06-08 21:04:00', '2025-06-09 03:49:00', 'SHORTTERM'),
	('SKE2214T', 'JM24', '2025-04-17 19:59:00', '2025-04-17 21:29:00', 'SHORTTERM'),
	('SKE2214T', 'PL90', '2025-09-12 19:15:00', '2025-09-13 02:10:00', 'SHORTTERM'),
	('SKE2214T', 'CK25', '2025-07-12 01:48:00', '2025-07-12 11:42:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-10-24 10:39:00', 0, NULL, 'PM24', 'SKE2214T'),
	('2025-01-04 19:15:00', 0, NULL, 'PM24', 'SKE2214T'),
	('2025-10-17 20:33:00', 0, NULL, 'PM24', 'SKE2214T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SKE2214T', 'PM24', '2025-10-24 10:39:00', '2025-10-24 14:01:00', 'SEASONAL'),
	('SKE2214T', 'PM24', '2025-01-04 19:15:00', '2025-01-05 05:20:00', 'SEASONAL'),
	('SKE2214T', 'PM24', '2025-10-17 20:33:00', '2025-10-18 01:56:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-10-24 12:53:00', 13, 588),
	('2025-01-04 21:09:00', 11, 589),
	('2025-10-17 22:34:00', 7, 590);

-- 94. Parking records for vehicle: SGT8823C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-07 18:57:00', 4.80, 1, 'SE50', 'SGT8823C'),
	('2025-11-04 15:49:00', 4.20, 1, 'JM24', 'SGT8823C'),
	('2025-04-25 16:09:00', 9.00, 1, 'W44', 'SGT8823C'),
	('2025-10-21 20:59:00', 1.80, 1, 'JM24', 'SGT8823C'),
	('2025-03-30 01:35:00', 0.60, 2, 'W81', 'SGT8823C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGT8823C', 'SE50', '2025-02-07 18:57:00', '2025-02-07 22:57:00', 'SHORTTERM'),
	('SGT8823C', 'JM24', '2025-11-04 15:49:00', '2025-11-04 19:35:00', 'SHORTTERM'),
	('SGT8823C', 'W44', '2025-04-25 16:09:00', '2025-04-25 23:48:00', 'SHORTTERM'),
	('SGT8823C', 'JM24', '2025-10-21 20:59:00', '2025-10-21 22:33:00', 'SHORTTERM'),
	('SGT8823C', 'W81', '2025-03-30 01:35:00', '2025-03-30 02:30:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-25 17:36:00', 5, 593);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-03-30 17:08:00', 0, NULL, 'W45', 'SGT8823C'),
	('2025-08-11 19:54:00', 0, NULL, 'W45', 'SGT8823C'),
	('2025-05-30 06:29:00', 0, NULL, 'W45', 'SGT8823C'),
	('2025-10-25 05:53:00', 0, NULL, 'W45', 'SGT8823C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGT8823C', 'W45', '2025-03-30 17:08:00', '2025-03-30 23:18:00', 'SEASONAL'),
	('SGT8823C', 'W45', '2025-08-11 19:54:00', '2025-08-11 23:40:00', 'SEASONAL'),
	('SGT8823C', 'W45', '2025-05-30 06:29:00', '2025-05-30 16:45:00', 'SEASONAL'),
	('SGT8823C', 'W45', '2025-10-25 05:53:00', '2025-10-25 14:49:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-30 22:43:00', 5, 596),
	('2025-08-11 22:06:00', 3, 597),
	('2025-05-30 07:32:00', 14, 598),
	('2025-10-25 11:44:00', 3, 599);

-- 95. Parking records for vehicle: SGA1156K
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-23 18:45:00', 1.20, 1, 'JM25', 'SGA1156K'),
	('2025-07-02 22:13:00', 1.20, 1, 'PM23', 'SGA1156K'),
	('2025-04-26 09:54:00', 12.00, 2, 'GE1A', 'SGA1156K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGA1156K', 'JM25', '2025-04-23 18:45:00', '2025-04-23 20:06:00', 'SHORTTERM'),
	('SGA1156K', 'PM23', '2025-07-02 22:13:00', '2025-07-02 23:17:00', 'SHORTTERM'),
	('SGA1156K', 'GE1A', '2025-04-26 09:54:00', '2025-04-26 21:10:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-23 19:13:00', 9, 600);

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-10 06:10:00', 0, NULL, 'SE50', 'SGA1156K'),
	('2025-05-06 00:26:00', 0, NULL, 'SE50', 'SGA1156K'),
	('2025-08-20 00:15:00', 0, NULL, 'SE50', 'SGA1156K'),
	('2025-04-22 22:42:00', 0, NULL, 'SE50', 'SGA1156K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGA1156K', 'SE50', '2025-05-10 06:10:00', '2025-05-10 16:17:00', 'SEASONAL'),
	('SGA1156K', 'SE50', '2025-05-06 00:26:00', '2025-05-06 06:08:00', 'SEASONAL'),
	('SGA1156K', 'SE50', '2025-08-20 00:15:00', '2025-08-20 03:12:00', 'SEASONAL'),
	('SGA1156K', 'SE50', '2025-04-22 22:42:00', '2025-04-23 11:04:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-10 14:55:00', 12, 603),
	('2025-05-06 04:49:00', 12, 604),
	('2025-08-20 00:36:00', 2, 605),
	('2025-04-23 07:15:00', 13, 606);

-- 96. Parking records for vehicle: SJA1234K
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-11-01 22:15:00', 0, NULL, 'SK49', 'SJA1234K'),
	('2025-10-08 22:50:00', 0, NULL, 'SK49', 'SJA1234K'),
	('2025-01-28 05:59:00', 0, NULL, 'SK49', 'SJA1234K'),
	('2025-02-21 22:38:00', 0, NULL, 'SK49', 'SJA1234K');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SJA1234K', 'SK49', '2025-11-01 22:15:00', '2025-11-02 05:14:00', 'SEASONAL'),
	('SJA1234K', 'SK49', '2025-10-08 22:50:00', '2025-10-09 11:39:00', 'SEASONAL'),
	('SJA1234K', 'SK49', '2025-01-28 05:59:00', '2025-01-28 14:51:00', 'SEASONAL'),
	('SJA1234K', 'SK49', '2025-02-21 22:38:00', '2025-02-22 09:07:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-11-02 04:27:00', 13, 607),
	('2025-10-09 02:20:00', 2, 608),
	('2025-01-28 07:08:00', 14, 609),
	('2025-02-22 02:34:00', 11, 610);

-- 97. Parking records for vehicle: SLS5501R
-- Parking Mode: Short Term


-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-05-11 03:20:00', 0, NULL, 'A34', 'SLS5501R'),
	('2025-09-20 05:43:00', 0, NULL, 'A34', 'SLS5501R'),
	('2025-01-14 13:31:00', 0, NULL, 'A34', 'SLS5501R'),
	('2025-07-10 19:15:00', 0, NULL, 'A34', 'SLS5501R'),
	('2025-09-02 13:31:00', 0, NULL, 'A34', 'SLS5501R');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLS5501R', 'A34', '2025-05-11 03:20:00', '2025-05-11 16:33:00', 'SEASONAL'),
	('SLS5501R', 'A34', '2025-09-20 05:43:00', '2025-09-20 11:25:00', 'SEASONAL'),
	('SLS5501R', 'A34', '2025-01-14 13:31:00', '2025-01-15 00:48:00', 'SEASONAL'),
	('SLS5501R', 'A34', '2025-07-10 19:15:00', '2025-07-10 23:20:00', 'SEASONAL'),
	('SLS5501R', 'A34', '2025-09-02 13:31:00', '2025-09-03 03:30:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-05-11 12:02:00', 13, 611),
	('2025-09-20 10:17:00', 4, 612),
	('2025-01-14 13:48:00', 11, 613),
	('2025-07-10 22:59:00', 13, 614),
	('2025-09-02 19:12:00', 14, 615);

-- 98. Parking records for vehicle: SDB1123M
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-24 01:59:00', 9.00, 1, 'SE50', 'SDB1123M'),
	('2025-07-04 20:34:00', 1.20, 1, 'W44', 'SDB1123M'),
	('2025-04-14 05:50:00', 12.00, 1, 'B13', 'SDB1123M'),
	('2025-09-07 11:29:00', 3.00, 2, 'CK51', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'SE50', '2025-09-24 01:59:00', '2025-09-24 09:56:00', 'SHORTTERM'),
	('SDB1123M', 'W44', '2025-07-04 20:34:00', '2025-07-04 21:48:00', 'SHORTTERM'),
	('SDB1123M', 'B13', '2025-04-14 05:50:00', '2025-04-14 16:50:00', 'SHORTTERM'),
	('SDB1123M', 'CK51', '2025-09-07 11:29:00', '2025-09-07 13:59:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-29 07:52:00', 0, NULL, 'SK48', 'SDB1123M'),
	('2025-06-03 20:57:00', 0, NULL, 'SK48', 'SDB1123M'),
	('2025-10-22 01:23:00', 0, NULL, 'SK48', 'SDB1123M'),
	('2025-07-20 02:29:00', 0, NULL, 'SK48', 'SDB1123M'),
	('2025-07-06 09:29:00', 0, NULL, 'SK48', 'SDB1123M');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SDB1123M', 'SK48', '2025-09-29 07:52:00', '2025-09-29 13:47:00', 'SEASONAL'),
	('SDB1123M', 'SK48', '2025-06-03 20:57:00', '2025-06-04 06:08:00', 'SEASONAL'),
	('SDB1123M', 'SK48', '2025-10-22 01:23:00', '2025-10-22 06:34:00', 'SEASONAL'),
	('SDB1123M', 'SK48', '2025-07-20 02:29:00', '2025-07-20 12:01:00', 'SEASONAL'),
	('SDB1123M', 'SK48', '2025-07-06 09:29:00', '2025-07-06 20:07:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-09-29 10:14:00', 9, 620),
	('2025-06-03 23:31:00', 15, 621),
	('2025-10-22 02:26:00', 14, 622),
	('2025-07-20 08:06:00', 1, 623),
	('2025-07-06 13:43:00', 15, 624);

-- 99. Parking records for vehicle: SFU5590D
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-08 21:57:00', 2.40, 1, 'W45', 'SFU5590D'),
	('2025-06-08 18:22:00', 1.20, 2, 'SB23', 'SFU5590D'),
	('2025-02-14 07:40:00', 8.40, 1, 'JM24', 'SFU5590D'),
	('2025-04-26 08:59:00', 3.00, 2, 'W45', 'SFU5590D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFU5590D', 'W45', '2025-08-08 21:57:00', '2025-08-09 00:11:00', 'SHORTTERM'),
	('SFU5590D', 'SB23', '2025-06-08 18:22:00', '2025-06-08 19:26:00', 'SHORTTERM'),
	('SFU5590D', 'JM24', '2025-02-14 07:40:00', '2025-02-14 14:47:00', 'SHORTTERM'),
	('SFU5590D', 'W45', '2025-04-26 08:59:00', '2025-04-26 11:38:00', 'SHORTTERM');

-- Parking Mode: Seasonal
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-13 10:07:00', 0, NULL, 'SK49', 'SFU5590D'),
	('2025-01-06 15:39:00', 0, NULL, 'SK49', 'SFU5590D'),
	('2025-07-27 03:21:00', 0, NULL, 'SK49', 'SFU5590D'),
	('2025-09-18 13:25:00', 0, NULL, 'SK49', 'SFU5590D'),
	('2025-08-25 11:32:00', 0, NULL, 'SK49', 'SFU5590D');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFU5590D', 'SK49', '2025-04-13 10:07:00', '2025-04-13 21:39:00', 'SEASONAL'),
	('SFU5590D', 'SK49', '2025-01-06 15:39:00', '2025-01-07 04:36:00', 'SEASONAL'),
	('SFU5590D', 'SK49', '2025-07-27 03:21:00', '2025-07-27 12:13:00', 'SEASONAL'),
	('SFU5590D', 'SK49', '2025-09-18 13:25:00', '2025-09-18 13:56:00', 'SEASONAL'),
	('SFU5590D', 'SK49', '2025-08-25 11:32:00', '2025-08-25 17:45:00', 'SEASONAL');
-- Seasonal Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-04-13 18:34:00', 12, 629),
	('2025-01-06 20:32:00', 10, 630),
	('2025-07-27 09:02:00', 1, 631),
	('2025-09-18 13:51:00', 10, 632),
	('2025-08-25 11:52:00', 9, 633);

-- 100. Parking records for vehicle: SGX2201C
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-20 23:51:00', 9.60, 1, 'SK15', 'SGX2201C'),
	('2025-03-10 07:51:00', 12.00, 1, 'W780', 'SGX2201C'),
	('2025-03-29 23:31:00', 7.80, 2, 'GE1A', 'SGX2201C');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGX2201C', 'SK15', '2025-08-20 23:51:00', '2025-08-21 08:22:00', 'SHORTTERM'),
	('SGX2201C', 'W780', '2025-03-10 07:51:00', '2025-03-10 18:53:00', 'SHORTTERM'),
	('SGX2201C', 'GE1A', '2025-03-29 23:31:00', '2025-03-30 06:50:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-03-30 06:02:00', 4, 636);

-- Parking Mode: Seasonal


-- 101. Parking records for vehicle: SGR6601A
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-06-01 11:44:00', 13.20, 2, 'CK22', 'SGR6601A'),
	('2025-03-04 17:47:00', 13.20, 1, 'W44', 'SGR6601A'),
	('2025-05-06 09:16:00', 8.40, 1, 'W44', 'SGR6601A');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGR6601A', 'CK22', '2025-06-01 11:44:00', '2025-06-02 01:11:00', 'SHORTTERM'),
	('SGR6601A', 'W44', '2025-03-04 17:47:00', '2025-03-05 05:29:00', 'SHORTTERM'),
	('SGR6601A', 'W44', '2025-05-06 09:16:00', '2025-05-06 16:23:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 102. Parking records for vehicle: SNL9876T
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-04-25 13:42:00', 15.00, 1, 'JM24', 'SNL9876T'),
	('2025-09-26 21:05:00', 6.00, 1, 'SK49', 'SNL9876T'),
	('2025-10-05 18:53:00', 15.00, 2, 'A34', 'SNL9876T');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SNL9876T', 'JM24', '2025-04-25 13:42:00', '2025-04-26 02:33:00', 'SHORTTERM'),
	('SNL9876T', 'SK49', '2025-09-26 21:05:00', '2025-09-27 02:53:00', 'SHORTTERM'),
	('SNL9876T', 'A34', '2025-10-05 18:53:00', '2025-10-06 07:33:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 103. Parking records for vehicle: SGL6619A
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 104. Parking records for vehicle: SFM8822W
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 105. Parking records for vehicle: SGL1156V
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 106. Parking records for vehicle: SHM2309W
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 107. Parking records for vehicle: SMC1122H
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 108. Parking records for vehicle: SLP4410S
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-15 07:40:00', 3.60, 1, 'W81', 'SLP4410S'),
	('2025-06-09 19:17:00', 12.00, 1, 'SB23', 'SLP4410S'),
	('2025-04-18 11:16:00', 3.00, 1, 'B13', 'SLP4410S');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SLP4410S', 'W81', '2025-09-15 07:40:00', '2025-09-15 11:05:00', 'SHORTTERM'),
	('SLP4410S', 'SB23', '2025-06-09 19:17:00', '2025-06-10 05:43:00', 'SHORTTERM'),
	('SLP4410S', 'B13', '2025-04-18 11:16:00', '2025-04-18 14:15:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 109. Parking records for vehicle: SDE2234P
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 110. Parking records for vehicle: SMD4521L
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 111. Parking records for vehicle: SGK0045U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-09-02 22:37:00', 13.20, 1, 'GE1A', 'SGK0045U'),
	('2025-05-02 19:54:00', 16.20, 1, 'PL90', 'SGK0045U'),
	('2025-09-17 15:46:00', 15.60, 1, 'W81', 'SGK0045U'),
	('2025-06-27 15:35:00', 4.20, 1, 'A34', 'SGK0045U'),
	('2025-01-29 08:35:00', 6.60, 1, 'C28', 'SGK0045U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SGK0045U', 'GE1A', '2025-09-02 22:37:00', '2025-09-03 10:08:00', 'SHORTTERM'),
	('SGK0045U', 'PL90', '2025-05-02 19:54:00', '2025-05-03 09:32:00', 'SHORTTERM'),
	('SGK0045U', 'W81', '2025-09-17 15:46:00', '2025-09-18 05:20:00', 'SHORTTERM'),
	('SGK0045U', 'A34', '2025-06-27 15:35:00', '2025-06-27 19:31:00', 'SHORTTERM'),
	('SGK0045U', 'C28', '2025-01-29 08:35:00', '2025-01-29 14:12:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 112. Parking records for vehicle: SFA9907L
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-08-17 02:18:00', 12.00, 2, 'JM24', 'SFA9907L'),
	('2025-03-24 19:09:00', 6.00, 1, 'CK22', 'SFA9907L'),
	('2025-01-12 07:54:00', 12.00, 2, 'PL80', 'SFA9907L');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFA9907L', 'JM24', '2025-08-17 02:18:00', '2025-08-17 13:24:00', 'SHORTTERM'),
	('SFA9907L', 'CK22', '2025-03-24 19:09:00', '2025-03-25 00:34:00', 'SHORTTERM'),
	('SFA9907L', 'PL80', '2025-01-12 07:54:00', '2025-01-12 20:37:00', 'SHORTTERM');
-- Short Term Offences
INSERT INTO Offence (offense_datetime, rule_id, session_id)
VALUES
	('2025-08-17 07:07:00', 4, 651);

-- Parking Mode: Seasonal


-- 113. Parking records for vehicle: SKH7702J
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 114. Parking records for vehicle: SDZ4456R
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 115. Parking records for vehicle: SFK6600U
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-01-07 16:09:00', 11.40, 1, 'W44', 'SFK6600U'),
	('2025-05-02 22:20:00', 13.80, 1, 'SK15', 'SFK6600U'),
	('2025-08-05 02:28:00', 12.00, 1, 'CK25', 'SFK6600U');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SFK6600U', 'W44', '2025-01-07 16:09:00', '2025-01-08 02:14:00', 'SHORTTERM'),
	('SFK6600U', 'SK15', '2025-05-02 22:20:00', '2025-05-03 11:45:00', 'SHORTTERM'),
	('SFK6600U', 'CK25', '2025-08-05 02:28:00', '2025-08-05 15:38:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 116. Parking records for vehicle: SFT4489C
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 117. Parking records for vehicle: SFW7712F
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 118. Parking records for vehicle: SFX8823G
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 119. Parking records for vehicle: SMC7788H
-- Parking Mode: Short Term
INSERT INTO ParkingSession (entry_datetime, amount_paid, rate_id, carpark_id, vrn)
VALUES
	('2025-02-27 23:20:00', 0.60, 1, 'PL90', 'SMC7788H'),
	('2025-01-17 01:44:00', 7.80, 1, 'JM25', 'SMC7788H'),
	('2025-05-25 01:41:00', 6.00, 2, 'A35', 'SMC7788H'),
	('2025-08-18 07:07:00', 12.00, 1, 'JM25', 'SMC7788H'),
	('2025-02-06 00:36:00', 11.40, 1, 'SE50', 'SMC7788H');
INSERT INTO EntryExitMode (vrn, carpark_id, entry_datetime, exit_datetime, parking_mode)
VALUES
	('SMC7788H', 'PL90', '2025-02-27 23:20:00', '2025-02-27 23:54:00', 'SHORTTERM'),
	('SMC7788H', 'JM25', '2025-01-17 01:44:00', '2025-01-17 08:43:00', 'SHORTTERM'),
	('SMC7788H', 'A35', '2025-05-25 01:41:00', '2025-05-25 06:57:00', 'SHORTTERM'),
	('SMC7788H', 'JM25', '2025-08-18 07:07:00', '2025-08-18 19:38:00', 'SHORTTERM'),
	('SMC7788H', 'SE50', '2025-02-06 00:36:00', '2025-02-06 10:06:00', 'SHORTTERM');

-- Parking Mode: Seasonal


-- 120. Parking records for vehicle: SHJ9076T
-- Parking Mode: Short Term


-- Parking Mode: Seasonal


-- 121. Parking records for vehicle: SFI4488S
-- Parking Mode: Short Term


-- Parking Mode: Seasonal

