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
)

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