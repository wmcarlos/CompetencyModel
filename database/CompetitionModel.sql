CREATE DATABASE competitionmodel;

USE competitionmodel;

CREATE TABLE cm_company(
	company_id INT AUTO_INCREMENT NOT NULL,
	value VARCHAR(15) NOT NULL,
	name VARCHAR(60) NOT NULL,
	brand VARCHAR(100) NULL,
	phone VARCHAR(15) NULL,
	email VARCHAR(255) NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_company_id PRIMARY KEY (company_id)
)ENGINE = INNODB;

CREATE TABLE cm_role(
	role_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_role_id PRIMARY KEY (role_id),
	CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_service(
	service_id INT NOT NULL AUTO_INCREMENT,
	company_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	servicetype CHAR(2) NOT NULL DEFAULT 'FO',
	position INT NOT NULL DEFAULT 1,
	issumary CHAR(1) NOT NULL DEFAULT 'N',
	service_parent_id INT NULL,
	url VARCHAR(255) NOT NULL,
	icon_class VARCHAR(100) NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_service_id PRIMARY KEY(service_id),
	CONSTRAINT fk_company_id01 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT 
)ENGINE = INNODB;

CREATE TABLE cm_user(
	user_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	role_id INT NOT NULL,
	value VARCHAR(15) NOT NULL,
	name VARCHAR(60) NOT NULL,
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(15) NULL,
	password VARCHAR(15) NOT NULL,
	avatar VARCHAR(100) NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_user_id PRIMARY KEY (user_id),
	CONSTRAINT fk_company_id02 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_role_id FOREIGN KEY (role_id) REFERENCES cm_role (role_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_access(
	access_id INT AUTO_INCREMENT NOT NULL,
	role_id INT NOT NULL,
	service_id INT NOT NULL,
	CONSTRAINT pk_access_id PRIMARY KEY (access_id),
	CONSTRAINT fk_role_id01 FOREIGN KEY (role_id) REFERENCES cm_role (role_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES cm_service (service_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_departament(
	departament_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	issumary CHAR(1) NOT NULL DEFAULT 'N',
	departament_parent_id INT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_departament_id PRIMARY KEY (departament_id),
	CONSTRAINT fk_company_id03 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge_level(
	charge_level_id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(30) NOT NULL,
	company_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_level PRIMARY KEY (charge_level_id),
	CONSTRAINT fk_company_id05 FOREIGN KEY (company_id) REFERENCES cm_company (comapny_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge(
	charge_id INT AUTO_INCREMENT NOT NULL,
	departament_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	issumary CHAR(1) NOT NULL DEFAULT 'N',
	charge_parent_id INT NULL,
	charge_level_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_id PRIMARY KEY (charge_id),
	CONSTRAINT fk_departament_id FOREIGN KEY (departament_id) REFERENCES cm_departament (departament_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_level_id FOREIGN KEY (charge_level_id) REFERENCES cm_charge_level (charge_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge_assigned(
	charge_assigned_id INT AUTO_INCREMENT NOT NULL,
	user_id INT NOT NULL,
	charge_id INT NOT NULL,
	startdate DATE NOT NULL,
	enddate NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_assigned_id PRIMARY KEY (charge_assigned_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES cm_user (user_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_id FOREIGN KEY (charge_id) REFERENCES cm_charge_id (charge_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;