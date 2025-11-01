USE tddag1;

CREATE TABLE Carpark(
	carpark_id INT IDENTITY(1, 1) NOT NULL,
	night_parking BIT DEFAULT 0 NOT NULL,
	grace_minutes INT DEFAULT 0 NOT NULL,
	season_total_quota INT NOT NULL,
	season_current_count INT DEFAULT 0 NOT NULL,

	PRIMARY KEY (carpark_id),
); 

CREATE TABLE MSCP (
    carpark_id INT NOT NULL,
    clearance_height FLOAT NOT NULL,
    deck_count INT NOT NULL,
	PRIMARY KEY (carpark_id),
    FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id),
);

CREATE TABLE SeasonRate(
	season_rate_id INT IDENTITY(1, 1) NOT NULL,
	monthly_charges MONEY NOT NULL,
	tier INT NOT NULL,
	carpark_type VARCHAR(50) DEFAULT 'Normal' NOT NULL,
	vehicle_type VARCHAR(255) NOT NULL,

	PRIMARY KEY (season_rate_id),
);

CREATE TABLE ParkingRule(
	rule_id INT IDENTITY(1, 1) NOT NULL,
	rule_desc VARCHAR(255) NOT NULL,
	fine_amount MONEY NOT NULL,

	PRIMARY KEY (rule_id),
);

CREATE TABLE ShortTermRates(
	rate_id INT IDENTITY(1, 1) NOT NULL,
	vehicle_type VARCHAR(255) NOT NULL,
	price MONEY NOT NULL,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	day_type VARCHAR(255) NOT NULL,
	cap_amount MONEY NOT NULL,
	cap_scope VARCHAR(255) NOT NULL,

	PRIMARY KEY (rate_id),
);

CREATE TABLE VehicleModel (
	model_id INT IDENTITY(1, 1) NOT NULL,
	model VARCHAR(255) NOT NULL,
	brand VARCHAR(255) NOT NULL,
	vehicle_type VARCHAR(255) NOT NULL,

	PRIMARY KEY (model_id),
);

CREATE TABLE HDBBlock(
	postal_code INT NOT NULL,
	block_no INT NOT NULL,
	street_name VARCHAR(255) NOT NULL,
	carpark_id int NOT NULL,

	PRIMARY KEY (postal_code),
	FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id),
);

CREATE TABLE Residence(
	unit_no INT NOT NULL,
	postal_code int NOT NULL,

	PRIMARY KEY (unit_no, postal_code),
	FOREIGN KEY (postal_code) REFERENCES HDBBlock(postal_code)
);

CREATE TABLE Person(
	nric VARCHAR(9) NOT NULL,
	email varchar(255),
	contact varchar(8),
	unit_no int NOT NULL,
	postal_code int NOT NULL,

	PRIMARY KEY (nric),
	FOREIGN KEY (unit_no, postal_code) REFERENCES Residence(unit_no, postal_code),
);

CREATE TABLE Vehicle(
	vrn VARCHAR(10) NOT NULL,
	obu_id_id varchar(100) NOT NULL UNIQUE,
	color varchar(100) NOT NULL,
	year_manufactured INT NOT NULL,
	sg_registered BIT DEFAULT 1 NOT NULL,
	model_id INT NOT NULL,
	nric VARCHAR(9) NOT NULL,

	PRIMARY KEY (vrn),
	FOREIGN KEY (model_id) REFERENCES VehicleModel(model_id),
	FOREIGN KEY (nric) REFERENCES Person(nric),
);

CREATE TABLE ParkingSession(
	session_id INT IDENTITY(1, 1) NOT NULL,
	entry_datetime DATETIME NOT NULL,
	exit_datetime DATETIME,
	parking_mode VARCHAR(255) NOT NULL,
	amount_paid MONEY,
	rate_id INT,
	carpark_id INT NOT NULL,
	vrn VARCHAR(10) NOT NULL,

	PRIMARY KEY (session_id),
	FOREIGN KEY (rate_id) REFERENCES ShortTermRates(rate_id),
	FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id),
	FOREIGN KEY (vrn) REFERENCES Vehicle(vrn),
);

CREATE TABLE Offence(
	offense_id INT IDENTITY(1, 1) NOT NULL,
	offense_datetime DATETIME NOT NULL,
	rule_id INT NOT NULL,
	session_id INT NOT NULL,

	PRIMARY KEY (offense_id),
	FOREIGN KEY (rule_id) REFERENCES ParkingRule(rule_id),
	FOREIGN KEY (session_id) REFERENCES ParkingSession(session_id),
);

CREATE TABLE SeasonalPass(
	season_utr INT NOT NULL,
	status VARCHAR(255) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	amount_paid MONEY NOT NULL,
	pass_type VARCHAR(255) NOT NULL,
	purchase_datetime DATETIME NOT NULL,
	season_rate_id INT NOT NULL,
	carpark_id INT NOT NULL,
	vrn VARCHAR(10) NOT NULL,

	PRIMARY KEY (season_utr),
	FOREIGN KEY (carpark_id) REFERENCES Carpark(carpark_id),
	FOREIGN KEY (season_rate_id) REFERENCES SeasonRate(season_rate_id),
	FOREIGN KEY (vrn) REFERENCES Vehicle(vrn),
);

CREATE TABLE LotType(
	lot_id INT IDENTITY(1, 1) NOT NULL,
	color varchar(255) NOT NULL,

	PRIMARY KEY (lot_id),
);

CREATE TABLE CarparkLot(
	lot_id INT NOT NULL,
	carpark_id INT NOT NULL,

	PRIMARY KEY(carpark_id, lot_id)
);