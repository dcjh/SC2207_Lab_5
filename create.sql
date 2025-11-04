USE tddag1;

CREATE TABLE carpark(
	carpark_id            INT IDENTITY(1,1) NOT NULL,
	night_parking         BIT DEFAULT 0     NOT NULL,
	grace_minutes         INT DEFAULT 0     NOT NULL,
	season_total_quota    INT               NOT NULL,
	season_current_count  INT DEFAULT 0     NOT NULL,

	PRIMARY KEY (carpark_id),
); 

CREATE TABLE mscp (
    carpark_id        INT   NOT NULL,
    clearance_height  DECIMAL(3,2) NOT NULL,
    deck_count        INT   NOT NULL,

	PRIMARY KEY (carpark_id),
    FOREIGN KEY (carpark_id) REFERENCES carpark(carpark_id),
);

CREATE TABLE season_rate(
	season_rate_id   INT IDENTITY(1,1)              NOT NULL,
	monthly_charges  MONEY                          NOT NULL,
	tier             INT                            NOT NULL,
	carpark_type     VARCHAR(50) DEFAULT 'Normal'   NOT NULL,
	vehicle_type     VARCHAR(255)                   NOT NULL,

	PRIMARY KEY (season_rate_id),
);

CREATE TABLE parking_rule(
	rule_id         INT IDENTITY(1, 1)  NOT NULL,
	rule_desc       VARCHAR(255)        NOT NULL,
	fine_amount     MONEY               NOT NULL,

	PRIMARY KEY (rule_id),
);

CREATE TABLE short_term_rates(
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

CREATE TABLE vehicle_model (
	model           VARCHAR(255)        NOT NULL,
	brand           VARCHAR(255)        NOT NULL,
	vehicle_type    VARCHAR(255)        NOT NULL,

	PRIMARY KEY (model_id),
);

CREATE TABLE hdb_block(
	postal_code     CHAR(6)         NOT NULL, -- preserve leading zeros
	block_no        VARCHAR(10)     NOT NULL,
	street_name     VARCHAR(255)    NOT NULL,
	carpark_id      INT             NOT NULL,

	PRIMARY KEY (postal_code),
    CHECK (postal_code LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]'), 
	FOREIGN KEY (carpark_id) REFERENCES carpark(carpark_id),
);

CREATE TABLE residence(
	unit_no         VARCHAR(10)     NOT NULL, -- e.g., '#03-215'
	postal_code     INT             NOT NULL,

	PRIMARY KEY (unit_no, postal_code),
	FOREIGN KEY (postal_code) REFERENCES hdb_block(postal_code)
);

CREATE TABLE person(
	nric            CHAR(9)         NOT NULL, -- S/T/F/G + 7 digits + letter
    [name]          VARCHAR(255)    NOT NULL,
	email           VARCHAR(255)    NOT NULL,
	contact         VARCHAR(16)     NOT NULL, -- allows +65
	unit_no         VARCHAR(10)     NOT NULL,
	postal_code     INT             NOT NULL,

	PRIMARY KEY (nric),
	FOREIGN KEY (unit_no, postal_code) REFERENCES residence(unit_no, postal_code),
    CHECK (nric LIKE '[STFG][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'),
    CHECK (contact LIKE '[89]_______' OR contact LIKE '+65[89]_______'),
    CHECK (postal_code LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE vehicle(
	vrn                 VARCHAR(8)      NOT NULL,
	obu_id_id           VARCHAR(32)     NOT NULL UNIQUE, -- 10–32 alphanumeric
	color               VARCHAR(100)    NOT NULL,
	year_manufactured   INT             NOT NULL,
	sg_registered       BIT DEFAULT 1   NOT NULL,
	model               VARCHAR(255)    NOT NULL,
	nric                CHAR(9)         NOT NULL,

	PRIMARY KEY (vrn),
	FOREIGN KEY (model_id)  REFERENCES vehicle_model(model_id),
	FOREIGN KEY (nric)      REFERENCES person(nric),
    CHECK (LEN(obu_id_id) BETWEEN 10 AND 32 AND obu_id_id NOT LIKE '%[^0-9A-Za-z]%')
);

CREATE TABLE parking_session(
	session_id      INT IDENTITY(1, 1)  NOT NULL,
	entry_datetime  DATETIME            NOT NULL,
	exit_datetime   DATETIME,
	parking_mode    VARCHAR(255)        NOT NULL,
	amount_paid     MONEY,
	rate_id         INT,
	carpark_id      INT                 NOT NULL,
	vrn             VARCHAR(10)         NOT NULL,

	PRIMARY KEY (session_id),
	FOREIGN KEY (rate_id)       REFERENCES short_term_rates(rate_id),
    FOREIGN KEY (carpark_id)    REFERENCES carpark(carpark_id),
	FOREIGN KEY (vrn)           REFERENCES vehicle(vrn),
);

CREATE TABLE offence(
	offense_id          INT IDENTITY(1, 1)  NOT NULL,
	offense_datetime    DATETIME            NOT NULL,
	rule_id             INT                 NOT NULL,
	session_id          INT                 NOT NULL,

	PRIMARY KEY (offense_id),
	FOREIGN KEY (rule_id)       REFERENCES parking_rule(rule_id),
    FOREIGN KEY (session_id)    REFERENCES parking_session(session_id),
);

CREATE TABLE seasonal_pass(
	season_utr          INT             NOT NULL,
	status              VARCHAR(255)    NOT NULL,
	start_date          DATE            NOT NULL,
	end_date            DATE            NOT NULL,
	amount_paid         MONEY           NOT NULL,
	pass_type           VARCHAR(255)    NOT NULL,
	purchase_datetime   DATETIME        NOT NULL,
	season_rate_id      INT             NOT NULL,
	carpark_id          INT             NOT NULL,
	vrn                 VARCHAR(10)     NOT NULL,

	PRIMARY KEY (season_utr),
    FOREIGN KEY (season_rate_id)    REFERENCES season_rate(season_rate_id),
	FOREIGN KEY (carpark_id)        REFERENCES carpark(carpark_id),
	FOREIGN KEY (vrn)               REFERENCES vehicle(vrn),
);

CREATE TABLE lot_type(
	lot_id  INT IDENTITY(1, 1)  NOT NULL,
	color   VARCHAR(255)        NOT NULL,

	PRIMARY KEY (lot_id),
);

CREATE TABLE carpark_lot(
	lot_id      INT NOT NULL,
	carpark_id  INT NOT NULL,

	PRIMARY KEY(carpark_id, lot_id)
);