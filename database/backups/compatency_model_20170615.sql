-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2017 a las 07:23:27
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `competency_model`
--
CREATE DATABASE `competency_model` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `competency_model`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_access`
--

CREATE TABLE IF NOT EXISTS `cm_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  PRIMARY KEY (`access_id`),
  KEY `fk_role_id01` (`role_id`),
  KEY `fk_service_id` (`service_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Volcado de datos para la tabla `cm_access`
--

INSERT INTO `cm_access` (`access_id`, `role_id`, `service_id`) VALUES
(63, 1, 1),
(64, 1, 2),
(65, 1, 3),
(66, 1, 4),
(67, 1, 5),
(68, 1, 6),
(69, 1, 7),
(70, 1, 8),
(71, 1, 9),
(72, 1, 10),
(73, 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_behavioral_indicator`
--

CREATE TABLE IF NOT EXISTS `cm_behavioral_indicator` (
  `behavioral_indicator_id` int(11) NOT NULL AUTO_INCREMENT,
  `competency_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `development_level_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`behavioral_indicator_id`),
  KEY `fk_competency_id` (`competency_id`),
  KEY `fk_development_level_id` (`development_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_charge`
--

CREATE TABLE IF NOT EXISTS `cm_charge` (
  `charge_id` int(11) NOT NULL AUTO_INCREMENT,
  `departament_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `charge_parent_id` int(11) DEFAULT NULL,
  `charge_level_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`charge_id`),
  KEY `fk_departament_id` (`departament_id`),
  KEY `fk_charge_level_id04` (`charge_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_charge`
--

INSERT INTO `cm_charge` (`charge_id`, `departament_id`, `name`, `charge_parent_id`, `charge_level_id`, `created`, `updated`, `isactive`) VALUES
(1, 3, 'GERENTE TI', 0, 2, '2017-06-14 21:27:12', NULL, 'Y'),
(2, 3, 'PROGRAMADOR', 1, 1, '2017-06-14 21:50:29', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_charge_assigned`
--

CREATE TABLE IF NOT EXISTS `cm_charge_assigned` (
  `charge_assigned_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `charge_id` int(11) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`charge_assigned_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_charge_id` (`charge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_charge_level`
--

CREATE TABLE IF NOT EXISTS `cm_charge_level` (
  `charge_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `company_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`charge_level_id`),
  KEY `fk_company_id05` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cm_charge_level`
--

INSERT INTO `cm_charge_level` (`charge_level_id`, `name`, `company_id`, `created`, `updated`, `isactive`) VALUES
(1, 'GENERAL', 1, '2017-06-14 20:49:34', NULL, 'Y'),
(2, 'GERENCIAL Y SUPERVISORIA', 1, '2017-06-14 20:53:20', NULL, 'Y'),
(3, 'DIRECTIVA', 1, '2017-06-14 20:53:29', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_company`
--

CREATE TABLE IF NOT EXISTS `cm_company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(15) NOT NULL,
  `name` varchar(60) NOT NULL,
  `short_name` varchar(3) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cm_company`
--

INSERT INTO `cm_company` (`company_id`, `value`, `name`, `short_name`, `phone`, `email`, `created`, `updated`, `isactive`) VALUES
(1, 'J407008544', 'FRONTUARI', 'FTI', '02556217144', 'ADMINISTRADOR@FRONTUARI.COM', '2017-06-14 19:35:56', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_competency`
--

CREATE TABLE IF NOT EXISTS `cm_competency` (
  `competency_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `definition` text,
  `company_id` int(11) NOT NULL,
  `charge_level_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`competency_id`),
  KEY `fk_company_id07` (`company_id`),
  KEY `fk_charge_level_id03` (`charge_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_departament`
--

CREATE TABLE IF NOT EXISTS `cm_departament` (
  `departament_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `departament_parent_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`departament_id`),
  KEY `fk_company_id03` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cm_departament`
--

INSERT INTO `cm_departament` (`departament_id`, `company_id`, `name`, `departament_parent_id`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'DIRECTIVA', 0, '2017-06-14 20:17:18', NULL, 'Y'),
(2, 1, 'ADMINISTRACION', 1, '2017-06-14 20:17:33', NULL, 'Y'),
(3, 1, 'INFORMATICA', 2, '2017-06-14 21:26:29', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_development_level`
--

CREATE TABLE IF NOT EXISTS `cm_development_level` (
  `development_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `value` decimal(10,0) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`development_level_id`),
  KEY `fk_company_id06` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cm_development_level`
--

INSERT INTO `cm_development_level` (`development_level_id`, `company_id`, `name`, `position`, `value`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'NIVEL 1', 1, 1, '2017-06-15 04:55:55', NULL, 'Y'),
(2, 1, 'NIVEL 2', 2, 2, '2017-06-15 04:56:09', NULL, 'Y'),
(3, 1, 'NIVEL 3', 3, 3, '2017-06-15 04:56:22', NULL, 'Y'),
(4, 1, 'NIVEL 4', 4, 4, '2017-06-15 04:56:38', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_domain_level`
--

CREATE TABLE IF NOT EXISTS `cm_domain_level` (
  `domain_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `scale` varchar(5) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `value` decimal(10,0) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`domain_level_id`),
  KEY `fk_company_id04` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cm_domain_level`
--

INSERT INTO `cm_domain_level` (`domain_level_id`, `company_id`, `name`, `scale`, `position`, `value`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'CASI NUNCA', '1', 1, 1, '2017-06-14 22:29:41', NULL, 'Y'),
(2, 1, 'AVECES', '2', 2, 2, '2017-06-14 22:30:03', NULL, 'Y'),
(3, 1, 'FRECUENTEMENTE', '3', 3, 3, '2017-06-14 22:30:21', NULL, 'Y'),
(4, 1, 'SIEMPRE', '4', 4, 4, '2017-06-14 22:30:37', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_instrument_of_evaluation`
--

CREATE TABLE IF NOT EXISTS `cm_instrument_of_evaluation` (
  `instrument_of_evaluation_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `instructions` text,
  `evaluationtype` char(2) NOT NULL DEFAULT 'UC',
  `charge_level_id` int(11) NOT NULL,
  `status` char(2) NOT NULL DEFAULT 'DR',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`instrument_of_evaluation_id`),
  KEY `fk_company_id08` (`company_id`),
  KEY `fk_charge_level_id01` (`charge_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_instrument_period`
--

CREATE TABLE IF NOT EXISTS `cm_instrument_period` (
  `instrument_period_id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_of_evaluation_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  PRIMARY KEY (`instrument_period_id`),
  KEY `fk_period_id` (`period_id`),
  KEY `fk_instrument_of_evaluation_id03` (`instrument_of_evaluation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_period`
--

CREATE TABLE IF NOT EXISTS `cm_period` (
  `period_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `company_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`period_id`),
  KEY `fk_company_id09` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cm_period`
--

INSERT INTO `cm_period` (`period_id`, `name`, `startdate`, `enddate`, `company_id`, `created`, `updated`, `isactive`) VALUES
(1, 'EVALUACION JULIO', '2017-07-01', '2017-07-15', 1, '2017-06-15 05:20:37', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_ponderation_charge_level`
--

CREATE TABLE IF NOT EXISTS `cm_ponderation_charge_level` (
  `ponderation_charge_level_id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_of_evaluation_id` int(11) NOT NULL,
  `charge_level_id` int(11) NOT NULL,
  `value` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ponderation_charge_level_id`),
  KEY `fk_instrument_of_evaluation_id` (`instrument_of_evaluation_id`),
  KEY `fk_charge_level_id02` (`charge_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_role`
--

CREATE TABLE IF NOT EXISTS `cm_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`role_id`),
  KEY `fk_company` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cm_role`
--

INSERT INTO `cm_role` (`role_id`, `company_id`, `name`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'ADMINISTRATOR', '2017-06-14 19:35:56', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_service`
--

CREATE TABLE IF NOT EXISTS `cm_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `servicetype` char(2) NOT NULL DEFAULT 'FO',
  `position` int(11) NOT NULL DEFAULT '1',
  `service_parent_id` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `icon_class` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`service_id`),
  KEY `fk_company_id01` (`company_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `cm_service`
--

INSERT INTO `cm_service` (`service_id`, `company_id`, `name`, `servicetype`, `position`, `service_parent_id`, `url`, `icon_class`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'DASHBOARD', 'FO', 1, NULL, 'Mains', 'fa fa-dashboard', '2017-06-14 19:35:56', NULL, 'Y'),
(2, 1, 'COMPANY', 'FO', 2, NULL, 'Companies', 'fa fa-building', '2017-06-14 19:35:56', NULL, 'Y'),
(3, 1, 'ROLE', 'FO', 3, NULL, 'Roles', 'fa fa-universal-access', '2017-06-14 19:35:56', NULL, 'Y'),
(4, 1, 'USER', 'FO', 4, NULL, 'Users', 'fa fa-user', '2017-06-14 19:35:56', NULL, 'Y'),
(5, 1, 'SERVICE', 'FO', 5, NULL, 'Services', 'fa fa-link', '2017-06-14 19:35:56', NULL, 'Y'),
(6, 1, 'DEPARTAMENT', 'FO', 6, NULL, 'Departaments', 'fa fa-home', '2017-06-14 19:56:54', NULL, 'Y'),
(7, 1, 'CHARGE LEVEL', 'FO', 7, NULL, 'Chargelevels', 'fa fa-level-up', '2017-06-14 20:46:34', NULL, 'Y'),
(8, 1, 'CHARGE', 'FO', 8, NULL, 'Charges', 'fa fa-address-card', '2017-06-14 21:21:11', NULL, 'Y'),
(9, 1, 'DOMAIN LEVEL', 'FO', 9, NULL, 'Domainlevels', 'fa fa-hand-pointer-o', '2017-06-14 22:27:31', NULL, 'Y'),
(10, 1, 'DEVELOPMENT LEVEL', 'FO', 10, NULL, 'Developmentlevels', 'fa fa-bar-chart', '2017-06-15 04:47:27', NULL, 'Y'),
(11, 1, 'PERIOD', 'FO', 11, NULL, 'Periods', 'fa fa-calendar', '2017-06-15 05:19:45', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_user`
--

CREATE TABLE IF NOT EXISTS `cm_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `value` varchar(15) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`user_id`),
  KEY `fk_company_id02` (`company_id`),
  KEY `fk_role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cm_user`
--

INSERT INTO `cm_user` (`user_id`, `company_id`, `role_id`, `value`, `name`, `email`, `phone`, `password`, `avatar`, `created`, `updated`, `isactive`) VALUES
(1, 1, 1, 'V19455541', 'CARLOS VARGAS', 'CVARGAS@FRONTUARI.COM', '04160984343', 'ac8dc02dedde587f08a5c82b6c43e7a4', NULL, '2017-06-14 19:35:56', NULL, 'Y'),
(2, 1, 1, 'V20467209', 'ALBERTO VARGAS', 'AVARGAS@FRONTUARI.COM', '02556217144', '8298756c2be7a05bef83ea74d53ccd38', NULL, '2017-06-14 19:35:56', NULL, 'Y'),
(3, 1, 1, 'V20389586', 'JORGE COLMENAREZ', 'JCOLMENAREZ@FRONTUARI.COM', '04149739547', '8aa89832bc994ae3ccf78fd523e3f4a2', NULL, '2017-06-14 19:35:56', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_user_instrument`
--

CREATE TABLE IF NOT EXISTS `cm_user_instrument` (
  `user_instrument_id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_of_evaluation_id` int(11) NOT NULL,
  `user_evaluated_id` int(11) NOT NULL,
  `user_evaluator_id` int(11) NOT NULL,
  `evaluationdate` date DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT 'DR',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `isactive` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`user_instrument_id`),
  KEY `fk_instrument_of_evaluation_id04` (`instrument_of_evaluation_id`),
  KEY `fk_user_evaluator_id` (`user_evaluated_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_user_instrument_answer`
--

CREATE TABLE IF NOT EXISTS `cm_user_instrument_answer` (
  `user_instrument_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_instrument_id` int(11) NOT NULL,
  `behavioral_indicator_id` int(11) NOT NULL,
  `domain_level_id` int(11) NOT NULL,
  PRIMARY KEY (`user_instrument_answer_id`),
  KEY `fk_user_instrument_id` (`user_instrument_id`),
  KEY `fk_behavioral_indicator_id` (`behavioral_indicator_id`),
  KEY `fk_domain_level_id` (`domain_level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competency_instrument`
--

CREATE TABLE IF NOT EXISTS `competency_instrument` (
  `competency_instrument_id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_of_evaluation_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`competency_instrument_id`),
  KEY `fk_instrument_of_evaluation_id01` (`instrument_of_evaluation_id`),
  KEY `fk_competency_id01` (`competency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cm_access`
--
ALTER TABLE `cm_access`
  ADD CONSTRAINT `fk_role_id01` FOREIGN KEY (`role_id`) REFERENCES `cm_role` (`role_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_service_id` FOREIGN KEY (`service_id`) REFERENCES `cm_service` (`service_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_behavioral_indicator`
--
ALTER TABLE `cm_behavioral_indicator`
  ADD CONSTRAINT `fk_competency_id` FOREIGN KEY (`competency_id`) REFERENCES `cm_competency` (`competency_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_development_level_id` FOREIGN KEY (`development_level_id`) REFERENCES `cm_development_level` (`development_level_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_charge`
--
ALTER TABLE `cm_charge`
  ADD CONSTRAINT `fk_charge_level_id04` FOREIGN KEY (`charge_level_id`) REFERENCES `cm_charge_level` (`charge_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_departament_id` FOREIGN KEY (`departament_id`) REFERENCES `cm_departament` (`departament_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_charge_assigned`
--
ALTER TABLE `cm_charge_assigned`
  ADD CONSTRAINT `fk_charge_id` FOREIGN KEY (`charge_id`) REFERENCES `cm_charge` (`charge_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `cm_user` (`user_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_charge_level`
--
ALTER TABLE `cm_charge_level`
  ADD CONSTRAINT `fk_company_id05` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_competency`
--
ALTER TABLE `cm_competency`
  ADD CONSTRAINT `fk_charge_level_id03` FOREIGN KEY (`charge_level_id`) REFERENCES `cm_charge_level` (`charge_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_id07` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_departament`
--
ALTER TABLE `cm_departament`
  ADD CONSTRAINT `fk_company_id03` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_development_level`
--
ALTER TABLE `cm_development_level`
  ADD CONSTRAINT `fk_company_id06` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_domain_level`
--
ALTER TABLE `cm_domain_level`
  ADD CONSTRAINT `fk_company_id04` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_instrument_of_evaluation`
--
ALTER TABLE `cm_instrument_of_evaluation`
  ADD CONSTRAINT `fk_charge_level_id01` FOREIGN KEY (`charge_level_id`) REFERENCES `cm_charge_level` (`charge_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_company_id08` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_instrument_period`
--
ALTER TABLE `cm_instrument_period`
  ADD CONSTRAINT `fk_instrument_of_evaluation_id03` FOREIGN KEY (`instrument_of_evaluation_id`) REFERENCES `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_period_id` FOREIGN KEY (`period_id`) REFERENCES `cm_period` (`period_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_period`
--
ALTER TABLE `cm_period`
  ADD CONSTRAINT `fk_company_id09` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_ponderation_charge_level`
--
ALTER TABLE `cm_ponderation_charge_level`
  ADD CONSTRAINT `fk_charge_level_id02` FOREIGN KEY (`charge_level_id`) REFERENCES `cm_charge_level` (`charge_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instrument_of_evaluation_id` FOREIGN KEY (`instrument_of_evaluation_id`) REFERENCES `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_role`
--
ALTER TABLE `cm_role`
  ADD CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_service`
--
ALTER TABLE `cm_service`
  ADD CONSTRAINT `fk_company_id01` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_user`
--
ALTER TABLE `cm_user`
  ADD CONSTRAINT `fk_company_id02` FOREIGN KEY (`company_id`) REFERENCES `cm_company` (`company_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `cm_role` (`role_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_user_instrument`
--
ALTER TABLE `cm_user_instrument`
  ADD CONSTRAINT `fk_instrument_of_evaluation_id04` FOREIGN KEY (`instrument_of_evaluation_id`) REFERENCES `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_evaluated_id` FOREIGN KEY (`user_evaluated_id`) REFERENCES `cm_user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_evaluator_id` FOREIGN KEY (`user_evaluated_id`) REFERENCES `cm_user` (`user_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cm_user_instrument_answer`
--
ALTER TABLE `cm_user_instrument_answer`
  ADD CONSTRAINT `fk_behavioral_indicator_id` FOREIGN KEY (`behavioral_indicator_id`) REFERENCES `cm_behavioral_indicator` (`behavioral_indicator_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_domain_level_id` FOREIGN KEY (`domain_level_id`) REFERENCES `cm_domain_level` (`domain_level_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_instrument_id` FOREIGN KEY (`user_instrument_id`) REFERENCES `cm_user_instrument` (`user_instrument_id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `competency_instrument`
--
ALTER TABLE `competency_instrument`
  ADD CONSTRAINT `fk_competency_id01` FOREIGN KEY (`competency_id`) REFERENCES `cm_competency` (`competency_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instrument_of_evaluation_id01` FOREIGN KEY (`instrument_of_evaluation_id`) REFERENCES `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
