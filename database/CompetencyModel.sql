CREATE DATABASE competency_model;

USE competency_model;

CREATE TABLE cm_company(
	company_id INT AUTO_INCREMENT NOT NULL,
	value VARCHAR(15) NOT NULL,
	name VARCHAR(60) NOT NULL,
	short_name VARCHAR(3) NULL,
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
	updated TIMESTAMP NULL,
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
	password VARCHAR(100) NOT NULL,
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
	departament_parent_id INT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_departament_id PRIMARY KEY (departament_id),
	CONSTRAINT fk_company_id03 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge_level(
	charge_level_id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(60) NOT NULL,
	company_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_level PRIMARY KEY (charge_level_id),
	CONSTRAINT fk_company_id05 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge(
	charge_id INT AUTO_INCREMENT NOT NULL,
	departament_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	charge_parent_id INT NULL,
	charge_level_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_id PRIMARY KEY (charge_id),
	CONSTRAINT fk_departament_id FOREIGN KEY (departament_id) REFERENCES cm_departament (departament_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_level_id04 FOREIGN KEY (charge_level_id) REFERENCES cm_charge_level (charge_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_charge_assigned(
	charge_assigned_id INT AUTO_INCREMENT NOT NULL,
	user_id INT NOT NULL,
	charge_id INT NOT NULL,
	startdate DATE NOT NULL,
	enddate DATE NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_charge_assigned_id PRIMARY KEY (charge_assigned_id),
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES cm_user (user_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_id FOREIGN KEY (charge_id) REFERENCES cm_charge (charge_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_domain_level(
	domain_level_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	scale VARCHAR(5) NOT NULL,
	position INT NOT NULL DEFAULT 1,
	value NUMERIC NOT NULL DEFAULT 0,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_domain_level_id PRIMARY KEY (domain_level_id),
	CONSTRAINT fk_company_id04 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_development_level(
	development_level_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	name VARCHAR(60) NOT NULL,
	position INT NOT NULL DEFAULT 1,
	value NUMERIC NOT NULL DEFAULT 0,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_development_level_id PRIMARY KEY (development_level_id),
	CONSTRAINT fk_company_id06 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_competency(
	competency_id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(255) NOT NULL,
	definition TEXT NULL,
	company_id INT NOT NULL,
	charge_level_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_competency_id PRIMARY KEY (competency_id),
	CONSTRAINT fk_company_id07 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_level_id03 FOREIGN KEY (charge_level_id) REFERENCES cm_charge_level (charge_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_behavioral_indicator(
	behavioral_indicator_id INT AUTO_INCREMENT NOT NULL,
	competency_id INT NOT NULL,
	description TEXT NOT NULL,
	development_level_id INT NOT NULL,
	position INT NOT NULL DEFAULT 1,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_behavioral_indicator PRIMARY KEY (behavioral_indicator_id),
	CONSTRAINT fk_competency_id FOREIGN KEY (competency_id) REFERENCES cm_competency (competency_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_development_level_id FOREIGN KEY (development_level_id) REFERENCES cm_development_level (development_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_period(
	period_id INT AUTO_INCREMENT NOT NULL,
	name VARCHAR(100) NOT NULL,
	startdate DATE NOT NULL,
	enddate DATE NOT NULL,
	company_id INT NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_period_id PRIMARY KEY (period_id),
	CONSTRAINT fk_company_id09 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_instrument_of_evaluation(
	instrument_of_evaluation_id INT AUTO_INCREMENT NOT NULL,
	company_id INT NOT NULL,
	name VARCHAR(150) NOT NULL,
	description TEXT NULL,
	instructions TEXT NULL,
	evaluationtype CHAR(2) NOT NULL DEFAULT 'UC',
	charge_level_id INT NOT NULL,
	status CHAR(2) NOT NULL DEFAULT 'DR',
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_instrument_of_evaluation_id PRIMARY KEY (instrument_of_evaluation_id),
	CONSTRAINT fk_company_id08 FOREIGN KEY (company_id) REFERENCES cm_company (company_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_level_id01 FOREIGN KEY (charge_level_id) REFERENCES cm_charge_level (charge_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_ponderation_charge_level(
	ponderation_charge_level_id INT AUTO_INCREMENT NOT NULL,
	instrument_of_evaluation_id INT NOT NULL,
	charge_level_id INT NOT NULL,
	value NUMERIC NOT NULL DEFAULT 0.0,
	CONSTRAINT pk_ponderation_charge_level_id PRIMARY KEY (ponderation_charge_level_id),
	CONSTRAINT fk_instrument_of_evaluation_id FOREIGN KEY (instrument_of_evaluation_id) REFERENCES cm_instrument_of_evaluation (instrument_of_evaluation_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_charge_level_id02 FOREIGN KEY (charge_level_id) REFERENCES cm_charge_level (charge_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_competency_instrument(
	competency_instrument_id INT AUTO_INCREMENT NOT NULL,
	instrument_of_evaluation_id INT NOT NULL,
	competency_id INT NOT NULL,
	position INT NOT NULL DEFAULT 1,
	CONSTRAINT pk_competency_instrument_id PRIMARY KEY (competency_instrument_id),
	CONSTRAINT fk_instrument_of_evaluation_id01 FOREIGN KEY (instrument_of_evaluation_id) REFERENCES cm_instrument_of_evaluation (instrument_of_evaluation_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_competency_id01 FOREIGN KEY (competency_id) REFERENCES cm_competency (competency_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_instrument_period(
	instrument_period_id INT AUTO_INCREMENT NOT NULL,
	instrument_of_evaluation_id INT NOT NULL,
	period_id INT NOT NULL,
	CONSTRAINT pk_instrument_period_id PRIMARY KEY (instrument_period_id),
	CONSTRAINT fk_period_id FOREIGN KEY (period_id) REFERENCES cm_period (period_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_instrument_of_evaluation_id03 FOREIGN KEY (instrument_of_evaluation_id) REFERENCES cm_instrument_of_evaluation (instrument_of_evaluation_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_user_instrument(
	user_instrument_id INT AUTO_INCREMENT NOT NULL,
	instrument_of_evaluation_id INT NOT NULL,
	user_evaluated_id INT NOT NULL,
	user_evaluator_id INT NOT NULL,
	evaluationdate DATE NULL,
	status CHAR(2) NOT NULL DEFAULT 'DR',
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NULL,
	isactive CHAR(1) NOT NULL DEFAULT 'Y',
	CONSTRAINT pk_user_instrument_id PRIMARY KEY (user_instrument_id),
	CONSTRAINT fk_instrument_of_evaluation_id04 FOREIGN KEY (instrument_of_evaluation_id) REFERENCES cm_instrument_of_evaluation (instrument_of_evaluation_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_user_evaluated_id FOREIGN KEY (user_evaluated_id) REFERENCES cm_user (user_id) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_user_evaluator_id FOREIGN KEY (user_evaluator_id) REFERENCES cm_user (user_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;

CREATE TABLE cm_user_instrument_answer(
	user_instrument_answer_id INT AUTO_INCREMENT NOT NULL,
	user_instrument_id INT NOT NULL,
	behavioral_indicator_id INT NOT NULL,
	domain_level_id INT NOT NULL,
 	CONSTRAINT pk_user_instrument_answer_id PRIMARY KEY (user_instrument_answer_id),
 	CONSTRAINT fk_user_instrument_id FOREIGN KEY (user_instrument_id) REFERENCES cm_user_instrument (user_instrument_id) ON UPDATE CASCADE ON DELETE RESTRICT,
 	CONSTRAINT fk_behavioral_indicator_id FOREIGN KEY (behavioral_indicator_id) REFERENCES cm_behavioral_indicator (behavioral_indicator_id) ON UPDATE CASCADE ON DELETE RESTRICT,
 	CONSTRAINT fk_domain_level_id FOREIGN KEY (domain_level_id) REFERENCES cm_domain_level (domain_level_id) ON UPDATE CASCADE ON DELETE RESTRICT
)ENGINE = INNODB;


INSERT INTO cm_company (company_id,value,name,short_name,phone,email) VALUES (0,'J00000000','GLOBAL','GBL','00000000000','SUPERADMIN@GLOBAL.COM');
INSERT INTO cm_role (role_id,company_id, name) VALUES (0,0,'SUPER ADMIN');
INSERT INTO cm_user (user_id,company_id, role_id, value, name, email, phone, password) VALUES (0,0,0,'V00000000','SUPER ADMIN','SUPERADMIN@GLOBAL.COM','00000000000',MD5('5up3r4dm1n'));

INSERT INTO cm_service (company_id,name,servicetype,position,url,icon_class) VALUES 
/* 
	GESTION DE COMPANIA
*/
(0,'ESCRITORIO','FO',1,'Mains','fa fa-dashboard'),
(0,'COMPANIAS','FO',2,'Companies','fa fa-building'),
(0,'DEPARTAMENTOS','FO',3,'Departaments','fa fa-home'),
(0,'NIVELES DE CARGO','FO',4,'Chargelevels','fa fa-level-up'),
(0,'CARGOS','FO',5,'Charges','fa fa-address-card'),
/* 
	GESTION DE SEGURIDAD Y CONFIGURACION DE SITIO
*/
(0,'SERVICIOS','FO',6,'Services','fa fa-link'),
(0,'ROLES','FO',7,'Roles','fa fa-universal-access'),
(0,'USUARIOS','FO',8,'Users','fa fa-user'),
/* 
	GESTION DE LA EVALUACION
*/
(0,'NIV. DE DOMINIOS','FO',9,'Domainlevels','fa fa-hand-pointer-o'),
(0,'NIV. DE DESARROLLO','FO',10,'Developmentlevels','fa fa-bar-chart'),
(0,'COMPETENCIAS','FO',11,'Competencies','fa fa-car'),
(0,'INST. DE EVALUACION','FO',12,'Instrumentofevaluations','fa fa-file-text'),
(0,'PERIODOS','FO',13,'Periods','fa fa-calendar');

INSERT INTO cm_access (role_id,service_id) VALUES 
(0,1),
(0,2),
(0,3),
(0,4),
(0,5),
(0,6),
(0,7),
(0,8),
(0,9),
(0,10),
(0,11),
(0,12),
(0,13);

