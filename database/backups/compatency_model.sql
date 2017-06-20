-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 19-06-2017 a las 18:25:12
-- Versión del servidor: 10.1.22-MariaDB-cll-lve
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `carltuud_competency_model`
--

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `cm_access`
--

INSERT INTO `cm_access` (`access_id`, `role_id`, `service_id`) VALUES
(1, 0, 1),
(2, 0, 2),
(3, 0, 3),
(4, 0, 4),
(5, 0, 5),
(6, 0, 6),
(7, 0, 7),
(8, 0, 8),
(9, 0, 9),
(10, 0, 10),
(11, 0, 11),
(12, 0, 12),
(13, 0, 13),
(14, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=148 ;

--
-- Volcado de datos para la tabla `cm_behavioral_indicator`
--

INSERT INTO `cm_behavioral_indicator` (`behavioral_indicator_id`, `competency_id`, `description`, `development_level_id`, `position`, `created`, `updated`, `isactive`) VALUES
(13, 1, 'Cumple con lo ofrecido al cliente en calidad y tiempos de respuesta', 1, 1, '2017-06-16 18:42:11', NULL, 'Y'),
(14, 1, 'Sabe diferenciar las necesidades y caracteristicas de cada cliente', 1, 2, '2017-06-16 18:42:11', NULL, 'Y'),
(15, 1, 'Ofrece soluciones adaptadas a las necesidades de los clientes', 1, 3, '2017-06-16 18:42:11', NULL, 'Y'),
(16, 1, 'Se anticipa a las necesidades de sus clientes', 2, 1, '2017-06-16 18:42:11', NULL, 'Y'),
(17, 1, 'Es empatico hacia las realidades y situaciones de sus clientes', 2, 2, '2017-06-16 18:42:11', NULL, 'Y'),
(18, 1, 'Crea relaciones favorables y constantes con sus clientes', 2, 3, '2017-06-16 18:42:11', NULL, 'Y'),
(19, 1, 'Asesora a sus clientes con prontitud', 3, 1, '2017-06-16 18:42:11', NULL, 'Y'),
(20, 1, 'Motiva a otros a entender las necesidades de sus clientes', 3, 2, '2017-06-16 18:42:11', NULL, 'Y'),
(21, 1, 'Propone soluciones que agreguen valor a sus clientes', 3, 3, '2017-06-16 18:42:11', NULL, 'Y'),
(22, 1, 'Fomenta el uso de nuevas estrategias de atención al cliente', 4, 1, '2017-06-16 18:42:11', NULL, 'Y'),
(23, 1, 'Desarrolla Soluciones innovadoras para satisfacer las necesidades de sus clientes', 4, 2, '2017-06-16 18:42:11', NULL, 'Y'),
(24, 1, 'Promueve mecanismos para medir la satisfaccion del cliente', 4, 3, '2017-06-16 18:42:11', NULL, 'Y'),
(28, 12, 'Actúa de acuerdo a los valores morales y a los estándares éticos de la organización', 1, 1, '2017-06-19 14:10:35', NULL, 'Y'),
(29, 12, 'Es coherente entre lo que dice y lo que hace', 1, 2, '2017-06-19 14:10:35', NULL, 'Y'),
(30, 12, 'Se comporta de forma honrada ganándose la confianza de otros', 1, 3, '2017-06-19 14:10:35', NULL, 'Y'),
(31, 12, 'Mantiene la confiabilidad requerida por la organización', 2, 1, '2017-06-19 14:10:35', NULL, 'Y'),
(32, 12, 'Estimula a otros a realizar sus funciones conforme a los principios éticos de la organización', 2, 2, '2017-06-19 14:10:35', NULL, 'Y'),
(33, 12, 'Establece relaciones basadas en el respeto mutuo y la confianza', 2, 3, '2017-06-19 14:10:35', NULL, 'Y'),
(34, 12, 'Promueve el profesionalismo en el desempeño de sus funciones', 3, 1, '2017-06-19 14:10:35', NULL, 'Y'),
(35, 12, 'Defiende los intereses y valores de la organización', 3, 2, '2017-06-19 14:10:35', NULL, 'Y'),
(36, 12, 'Orienta a otros en situaciones donde los intereses personales se oponen a los organizacionales', 3, 3, '2017-06-19 14:10:35', NULL, 'Y'),
(37, 12, 'Es un referente por la coherencia entre sus principios morales y su forma de comportarse', 4, 1, '2017-06-19 14:10:35', NULL, 'Y'),
(38, 12, 'Es un promotor del cumplimiento y respeto de las políticas', 4, 2, '2017-06-19 14:10:35', NULL, 'Y'),
(39, 12, 'Fomenta el actuar con humildad y honestidad para construir relaciones de confianza', 4, 3, '2017-06-19 14:10:35', NULL, 'Y'),
(40, 3, 'Logra sus objetivos cumpliendo los estándares establecidos.', 1, 1, '2017-06-19 14:29:18', NULL, 'Y'),
(41, 3, 'Busca alternativas cuando se presentan obstáculos para alcanzar los objetivos.', 1, 2, '2017-06-19 14:29:18', NULL, 'Y'),
(42, 3, 'Conoce el impacto de sus acciones en el logro de los objetivos.', 1, 3, '2017-06-19 14:29:18', NULL, 'Y'),
(43, 3, 'Se fija objetivos retadores para superar los resultados esperados.', 2, 1, '2017-06-19 14:29:18', NULL, 'Y'),
(44, 3, 'Establece nuevos procedimientos y acciones para el logro de resultados.', 2, 2, '2017-06-19 14:29:18', NULL, 'Y'),
(45, 3, 'Contribuye a alinear sus objetivos y los de su unidad con los objetivos de otras áreas.', 2, 3, '2017-06-19 14:29:18', NULL, 'Y'),
(46, 3, 'Motiva a otros a fijar objetivos retadores.', 3, 1, '2017-06-19 14:29:18', NULL, 'Y'),
(47, 3, 'Prevé posibles obstáculos en el logro de los objetivos.', 3, 2, '2017-06-19 14:29:18', NULL, 'Y'),
(48, 3, 'Desarrolla iniciativas para superar objetivos en pro del crecimiento organizacional.', 3, 3, '2017-06-19 14:29:18', NULL, 'Y'),
(49, 3, 'Modela acciones que promueven la calidad en los resultados .', 4, 1, '2017-06-19 14:29:18', NULL, 'Y'),
(50, 3, 'Es un referente en el logro de los objetivos potenciando los resultados organizacionales.', 4, 2, '2017-06-19 14:29:18', NULL, 'Y'),
(51, 3, 'Fomenta la implementación de soluciones innovadoras para mantener liderazgo de la organización en el mercado.', 4, 3, '2017-06-19 14:29:18', NULL, 'Y'),
(52, 4, 'Está atento a las órdenes y cumple con su trabajo básico  entendiendo que forma parte de un equipo.', 1, 1, '2017-06-19 14:32:07', NULL, 'Y'),
(53, 4, 'Coopera activamente con los miembros del equipo.', 1, 2, '2017-06-19 14:32:07', NULL, 'Y'),
(54, 4, 'Conoce como se relaciona su actividad con las de su equipo.', 1, 3, '2017-06-19 14:32:07', NULL, 'Y'),
(55, 4, 'Interactúa con los demás integrantes del equipo para el logro de los objetivos.', 2, 1, '2017-06-19 14:32:07', NULL, 'Y'),
(56, 4, 'Crea canales de comunicación para el intercambio de ideas e información.', 2, 2, '2017-06-19 14:32:07', NULL, 'Y'),
(57, 4, 'Identifica el impacto de sus acciones en otras áreas de la organización.', 2, 3, '2017-06-19 14:32:07', NULL, 'Y'),
(58, 4, 'Promueve la formación de equipos multifuncionales de trabajo para agregar valor a los resultados grupales.', 3, 1, '2017-06-19 14:32:07', NULL, 'Y'),
(59, 4, 'Impulsa alianzas productivas con personas de otras áreas claves para el logro de objetivos.', 3, 2, '2017-06-19 14:32:07', NULL, 'Y'),
(60, 4, 'Prevé el impacto de las acciones del equipo en otras áreas de la organización.', 3, 3, '2017-06-19 14:32:07', NULL, 'Y'),
(61, 4, 'Fomenta la generación de sinergias entre equipos para el logro de los objetivos comunes.', 4, 1, '2017-06-19 14:32:07', NULL, 'Y'),
(62, 4, 'Incentiva la cooperación entre las áreas de la organización', 4, 2, '2017-06-19 14:32:07', NULL, 'Y'),
(63, 4, 'Implementa estrategias que sirven de referencia a otros equipos de trabajo.', 4, 3, '2017-06-19 14:32:07', NULL, 'Y'),
(64, 5, 'Conoce sus reacciones emocionales, formas de pensar y actuar.', 1, 1, '2017-06-19 15:06:18', NULL, 'Y'),
(65, 5, 'Identifica sus fortalezas y oportunidades de mejora.', 1, 2, '2017-06-19 15:06:18', NULL, 'Y'),
(66, 5, 'Conoce sus propias emociones y respeta la forma de pensar de los demás', 1, 3, '2017-06-19 15:06:18', NULL, 'Y'),
(67, 5, 'Mantiene el control de sus emociones en situaciones retadoras.', 2, 1, '2017-06-19 15:06:18', NULL, 'Y'),
(68, 5, 'Buscar  opciones de autodesarrollo para potenciar sus fortalezas.', 2, 2, '2017-06-19 15:06:18', NULL, 'Y'),
(69, 5, 'Pide feedback acerca de sus oportunidades de mejora.', 2, 3, '2017-06-19 15:06:18', NULL, 'Y'),
(70, 5, 'Reconoce el impacto de sus emociones y características personales en su desempeño.', 3, 1, '2017-06-19 15:06:18', NULL, 'Y'),
(71, 5, 'Demuestra seguridad al expresar sus opiniones.', 3, 2, '2017-06-19 15:06:18', NULL, 'Y'),
(72, 5, 'Modifica su accionar considerando el aprendizaje de sus experiencias.', 3, 3, '2017-06-19 15:06:18', NULL, 'Y'),
(73, 5, 'Propone soluciones de valor haciendo uso de sus habilidades personales y el control de sus emociones', 4, 1, '2017-06-19 15:06:18', NULL, 'Y'),
(74, 5, 'Fomenta la participación en nuevos proyectos para potenciar capacidades.', 4, 2, '2017-06-19 15:06:18', NULL, 'Y'),
(75, 5, 'Motiva a transformar situaciones desafiantes en situaciones positivas.', 4, 3, '2017-06-19 15:06:18', NULL, 'Y'),
(100, 6, 'Apoya a otros en el desarrollo de sus habilidades.', 1, 1, '2017-06-19 15:12:51', NULL, 'Y'),
(101, 6, 'Escucha activamente dando respuestas con empatía.', 1, 2, '2017-06-19 15:12:51', NULL, 'Y'),
(102, 6, 'Orienta a otros considerando el aprendizaje de su propia experiencia.', 1, 3, '2017-06-19 15:12:51', NULL, 'Y'),
(103, 6, 'Se interesa por comprender los puntos de vista de otros .', 2, 1, '2017-06-19 15:12:51', NULL, 'Y'),
(104, 6, 'Proporciona retroalimentación de manera frecuente y oportuna.', 2, 2, '2017-06-19 15:12:51', NULL, 'Y'),
(105, 6, 'Identifica en su equipo de trabajo oportunidades de desarrollo.', 2, 3, '2017-06-19 15:12:51', NULL, 'Y'),
(106, 6, 'Define un plan de acompañamiento para el proceso de aprendizaje de sus colaboradores.', 3, 1, '2017-06-19 15:12:51', NULL, 'Y'),
(107, 6, 'Facilita la retroalimentación y comunicación entre su equipo.', 3, 2, '2017-06-19 15:12:51', NULL, 'Y'),
(108, 6, 'Dirige de forma constructiva a sus colaboradores en todo tipo de situaciones.', 3, 3, '2017-06-19 15:12:51', NULL, 'Y'),
(109, 6, 'Incorpora nuevas tendencias y mejores prácticas en las estrategias de acompañamiento.', 4, 1, '2017-06-19 15:12:51', NULL, 'Y'),
(110, 6, 'Promueve el intercambio de información e ideas.', 4, 2, '2017-06-19 15:12:51', NULL, 'Y'),
(111, 6, 'Es un referente en el desarrollo de un equipo de alto desempeño.', 4, 3, '2017-06-19 15:12:51', NULL, 'Y'),
(112, 7, 'Comunica a su equipo de trabajo las instrucciones para el logro de los objetivos.', 1, 1, '2017-06-19 15:15:52', NULL, 'Y'),
(113, 7, 'Orienta a sus colaboradores cuando asumen una nueva responsabilidad.', 1, 2, '2017-06-19 15:15:52', NULL, 'Y'),
(114, 7, 'Identifica las fortalezas y oportunidades de mejora de sus colaboradores.', 1, 3, '2017-06-19 15:15:52', NULL, 'Y'),
(115, 7, 'Define con claridad los objetivos y planes de acción.', 2, 1, '2017-06-19 15:15:52', NULL, 'Y'),
(116, 7, 'Respalda las decisiones de su equipo ante terceros.', 2, 2, '2017-06-19 15:15:52', NULL, 'Y'),
(117, 7, 'Integra  equipos multidisciplinares de forma efectiva.', 2, 3, '2017-06-19 15:15:52', NULL, 'Y'),
(118, 7, 'Logra que el equipo siga siendo efectivo aun en situaciones exigentes.', 3, 1, '2017-06-19 15:15:52', NULL, 'Y'),
(119, 7, 'Asesora a otros en la toma de decisiones basada en los valores organizacionales.', 3, 2, '2017-06-19 15:15:52', NULL, 'Y'),
(120, 7, 'Desarrolla estrategias para favorecer la interdependencia en el logro de objetivos.', 3, 3, '2017-06-19 15:15:52', NULL, 'Y'),
(121, 7, 'Es un referente de liderazgo inspirando los valores organizacionales y la visión del negocio a su equipo y al resto de la organización.', 4, 1, '2017-06-19 15:15:52', NULL, 'Y'),
(122, 7, 'Promueve la corresponsabilidad en el logro de los objetivos organizacionales.', 4, 2, '2017-06-19 15:15:52', NULL, 'Y'),
(123, 7, 'Es un referente en el manejo de los recursos y la integración de equipos.', 4, 3, '2017-06-19 15:15:52', NULL, 'Y'),
(124, 8, 'Se integra rápidamente a nuevas actividades de acuerdo a las necesidades.', 1, 1, '2017-06-19 15:18:13', NULL, 'Y'),
(125, 8, 'Acepta las propuestas o ideas de los demás aunque sea diferentes a las suyas.', 1, 2, '2017-06-19 15:18:13', NULL, 'Y'),
(126, 8, 'Aplica nuevas políticas o procedimientos establecidos por la organización.', 1, 3, '2017-06-19 15:18:13', NULL, 'Y'),
(127, 8, 'Implementa cambios ante nueva información o variaciones en el entorno.', 2, 1, '2017-06-19 15:18:13', NULL, 'Y'),
(128, 8, 'Modifica su conducta ante situaciones cambiantes sin perder foco en los resultados.', 2, 2, '2017-06-19 15:18:13', NULL, 'Y'),
(129, 8, 'Establece nuevas conductas para potenciar el logro de los objetivos.', 2, 3, '2017-06-19 15:18:13', NULL, 'Y'),
(130, 8, 'Guía a otros en el manejo de los cambios ante situaciones críticas.', 3, 1, '2017-06-19 15:18:13', NULL, 'Y'),
(131, 8, 'Integra las diferencias individuales del equipo de trabajo en pro de los objetivos.', 3, 2, '2017-06-19 15:18:13', NULL, 'Y'),
(132, 8, 'Propone cambios que impactan positivamente los resultados propios o de su equipo.', 3, 3, '2017-06-19 15:18:13', NULL, 'Y'),
(133, 8, 'Es un referente como agente de cambio potenciando los resultados del negocio.', 4, 1, '2017-06-19 15:18:13', NULL, 'Y'),
(134, 8, 'Incentiva a otros a adecuar su accionar a fin de hacer frente a nuevas situaciones.', 4, 2, '2017-06-19 15:18:13', NULL, 'Y'),
(135, 8, 'Propone nuevas metodologías y herramientas para facilitar la adaptación a los cambios.', 4, 3, '2017-06-19 15:18:13', NULL, 'Y'),
(136, 9, 'Aplica nuevas formas de hacer las cosas a situaciones cotidianas de trabajo.', 1, 1, '2017-06-19 15:20:34', NULL, 'Y'),
(137, 9, 'Maneja información relevante del entorno en el desempeño de sus funciones.', 1, 2, '2017-06-19 15:20:34', NULL, 'Y'),
(138, 9, 'Identifica  procesos, productos y servicios susceptibles a ser modificados.', 1, 3, '2017-06-19 15:20:34', NULL, 'Y'),
(139, 9, 'Crea nuevas soluciones para enfrentar situaciones desafiantes.', 2, 1, '2017-06-19 15:20:34', NULL, 'Y'),
(140, 9, 'Investiga  información del entorno para generar soluciones.', 2, 2, '2017-06-19 15:20:34', NULL, 'Y'),
(141, 9, 'Prevé posibles cambios en el negocio basándose en el análisis del entorno.', 2, 3, '2017-06-19 15:20:34', NULL, 'Y'),
(142, 9, 'Estimula en sus colaboradores procesos creativos que generen valor a la organización.', 3, 1, '2017-06-19 15:20:34', NULL, 'Y'),
(143, 9, 'Motiva la implementación de nuevas estrategias de investigación del entorno.', 3, 2, '2017-06-19 15:20:34', NULL, 'Y'),
(144, 9, 'Propone estrategias que rompen el esquema de las existentes .', 3, 3, '2017-06-19 15:20:34', NULL, 'Y'),
(145, 9, 'Es un referente rompiendo paradigmas al generar soluciones innovadoras.', 4, 1, '2017-06-19 15:20:34', NULL, 'Y'),
(146, 9, 'Promueve el asumir riesgos para adaptarse a un entorno exigente y cambiante.', 4, 2, '2017-06-19 15:20:34', NULL, 'Y'),
(147, 9, 'Fomenta el desarrollo de estrategias innovadoras que posicionen los productos en el mercado.', 4, 3, '2017-06-19 15:20:34', NULL, 'Y');

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
(1, 1, 'GERENTE TI', 0, 3, '2017-06-16 17:26:11', NULL, 'Y'),
(2, 1, 'PROGRAMADOR', 1, 1, '2017-06-16 17:26:26', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_charge_assigned`
--

INSERT INTO `cm_charge_assigned` (`charge_assigned_id`, `user_id`, `charge_id`, `startdate`, `enddate`, `created`, `updated`, `isactive`) VALUES
(1, 1, 2, '2015-05-18', NULL, '2017-06-19 22:17:57', NULL, 'Y'),
(2, 2, 1, '1995-05-12', NULL, '2017-06-19 22:19:19', NULL, 'Y');

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
(1, 'GENERALES', 1, '2017-06-16 17:22:44', NULL, 'Y'),
(2, 'DIRECTIVOS', 1, '2017-06-16 17:23:35', NULL, 'Y'),
(3, 'GERENCIALES SUPERVISORIAS', 1, '2017-06-16 17:25:34', NULL, 'Y');

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
(0, 'J00000000', 'GLOBAL', 'GBL', '00000000000', 'SUPERADMIN@GLOBAL.COM', '2017-06-16 17:18:38', NULL, 'Y'),
(1, 'J123456789', 'EMPRESA A', 'EPA', '04161234567', 'CONTRATACIONES@EMPRESA.COM', '2017-06-16 17:21:59', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `cm_competency`
--

INSERT INTO `cm_competency` (`competency_id`, `name`, `definition`, `company_id`, `charge_level_id`, `created`, `updated`, `isactive`) VALUES
(1, 'ORIENTACION AL CLIENTE ', 'Es la capacidad para resolver los requerimientos de nuestros clientes internos, externos y consumidores de forma oportuna y con calidad. Implica conocer y demostrar sensibilidad ante sus características, necesidades y demandas generando soluciones que incrementen sus niveles de satisfacción y construyendo relaciones de confianza a largo plazo.', 1, 1, '2017-06-16 17:33:57', NULL, 'Y'),
(3, 'ORIENTACION A RESULTADOS', 'Es la capacidad para alcanzar y sobrepasar los resultados de su área y la organización, actuando con velocidad, proactividad y sentido de urgencia ante decisiones importantes para lograr los objetivos.', 1, 1, '2017-06-16 17:35:11', NULL, 'Y'),
(4, 'TRABAJO EN EQUIPO', 'Es la capacidad para trabajar con otros y participar activamente en la obtención de objetivos comunes, de manera coordinada y cohesionada. Implica cooperación, comunicación y foco en las relaciones considerando el impacto de las propias acciones en otras áreas y en el negocio.', 1, 1, '2017-06-16 17:35:51', NULL, 'Y'),
(5, 'INTELIGENCIA EMOCIONAL', 'Es la capacidad de reconocer las propias fortalezas y debilidades, así como las emociones, mantenerlas controladas, respetando los derechos de los demás. Implica confiar en sus fortalezas, potenciarlas e implementar cambios cuando sea necesario para alcanzar mejores resultados.', 1, 1, '2017-06-16 17:36:49', NULL, 'Y'),
(6, 'DESARROLLO DE PERSONAS', 'Es la capacidad para acompañar y facilitar el desarrollo de habilidades y conocimientos de  otros. Implica compartir información, proporcionar retroalimentación y orientación oportuna con la finalidad de acompañarles en el desarrollo de su potencial.', 1, 3, '2017-06-16 17:40:01', NULL, 'Y'),
(7, 'LIDERAZGO', 'Es la capacidad para orientar e inspirar las acciones del grupo de trabajo, impartir instrucciones con conocimiento y claridad, en función de los objetivos de un área de trabajo, integrando los recursos disponibles y las habilidades de los miembros del grupo.', 1, 3, '2017-06-16 17:40:54', NULL, 'Y'),
(8, 'GERENCIA DEL CAMBIO', 'Capacidad para entender y ajustarse eficazmente a situaciones de cambio, requeridas por la organización y por el puesto de trabajo. Implica ajustar conductas y formas de pensar en forma rápida y eficiente, generando estrategias de negocio que se adapten a la dinámica de los cambios para potenciar el logro de objetivos.', 1, 3, '2017-06-16 17:41:33', NULL, 'Y'),
(9, 'INNOVACION', 'Es la capacidad de idear soluciones y propuestas nuevas y diferentes para situaciones requeridas por el propio puesto, su equipo de trabajo, la organización, el cliente o los competidores.', 1, 3, '2017-06-16 17:42:56', NULL, 'Y'),
(12, 'ÉTICA PROFESIONAL', 'Es la capacidad para sentir y actuar en todo momento consecuentemente con los valores morales y las buenas costumbres y prácticas profesionales, respetando las políticas organizacionales. Es actuar con honestidad para construir a largo plazo.', 1, 1, '2017-06-16 18:46:13', NULL, 'Y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cm_competency_instrument`
--

CREATE TABLE IF NOT EXISTS `cm_competency_instrument` (
  `competency_instrument_id` int(11) NOT NULL AUTO_INCREMENT,
  `instrument_of_evaluation_id` int(11) NOT NULL,
  `competency_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`competency_instrument_id`),
  KEY `fk_instrument_of_evaluation_id01` (`instrument_of_evaluation_id`),
  KEY `fk_competency_id01` (`competency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `cm_competency_instrument`
--

INSERT INTO `cm_competency_instrument` (`competency_instrument_id`, `instrument_of_evaluation_id`, `competency_id`, `position`) VALUES
(1, 1, 1, 1),
(2, 1, 12, 2),
(3, 1, 3, 3),
(4, 1, 4, 4),
(5, 1, 5, 5),
(6, 2, 1, 1),
(7, 2, 12, 2),
(8, 2, 3, 3),
(9, 2, 4, 4),
(10, 2, 5, 5),
(11, 2, 7, 6),
(12, 2, 6, 7),
(13, 2, 8, 8),
(14, 2, 9, 9);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cm_departament`
--

INSERT INTO `cm_departament` (`departament_id`, `company_id`, `name`, `departament_parent_id`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'TI', 0, '2017-06-16 17:22:19', NULL, 'Y');

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
(1, 1, 'NIVEL 1', 1, '1', '2017-06-16 17:28:46', NULL, 'Y'),
(2, 1, 'NIVEL 2', 2, '2', '2017-06-16 17:32:32', NULL, 'Y'),
(3, 1, 'NIVEL 3', 3, '3', '2017-06-16 17:32:44', NULL, 'Y'),
(4, 1, 'NIVEL 4', 4, '4', '2017-06-16 17:33:11', NULL, 'Y');

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
(1, 1, 'CASI NUNCA', '1', 1, '1', '2017-06-16 17:27:09', NULL, 'Y'),
(2, 1, 'AVECES', '2', 2, '2', '2017-06-16 17:27:34', NULL, 'Y'),
(3, 1, 'FRECUENTEMENTE', '3', 3, '3', '2017-06-16 17:27:50', NULL, 'Y'),
(4, 1, 'SIEMPPRE', '4', 4, '4', '2017-06-16 17:28:04', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_instrument_of_evaluation`
--

INSERT INTO `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`, `company_id`, `name`, `description`, `instructions`, `evaluationtype`, `charge_level_id`, `status`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'INSTRUMENTO DE EVALUACION BASE', 'INSTRUMENTO DE EVALUACION BASE', 'A.- LA ESCALA  ES DEL 1 AL 4, SIENDO: 1 (CASI NUNCA) ;  2 (A VECES); 3 (FRECUENTEMENTE);  4 (CASI SIEMPRE).\r\nB.-SEA OBJETIVO EN LA EVALUACION.\r\nC.- MARQUE CON UN (X) LA CASILLA DE ACUERDO AL NIVEL DE DOMINIO QUE TIENE EL EVALUADO.\r\nD.- DISCUTA LOS RESULTADOS DE LA EVALUACIóN CON SU SUPERVISADO.\r\nE.-SEA DISCRETO EVITANDO COMENTARIOS SOBRE LOS RESULTADOS DE ESTA EVALUACIóN.', 'UC', 1, 'DR', '2017-06-19 22:04:17', NULL, 'Y'),
(2, 1, 'INSTRUMENTO DE EVALUACION GERENTES', 'INSTRUMENTO DE EVALUACION GERENTES', 'A.- LA ESCALA  ES DEL 1 AL 4, SIENDO: 1 (CASI NUNCA) ;  2 (A VECES); 3 (FRECUENTEMENTE);  4 (CASI SIEMPRE).\r\nB.-SEA OBJETIVO EN LA EVALUACION.\r\nC.- MARQUE CON UNA (X) LA CASILLA DE ACUERDO AL NIVEL DE DOMINIO QUE TIENE EL EVALUADO.\r\nD.- DISCUTA LOS RESULTADOS DE LA EVALUACIóN CON SU SUPERVISADO.\r\nE.- SEA DISCRETO EVITANDO COMENTARIOS SOBRE LOS RESULTADOS DE ESTA EVALUACIóN.', 'UC', 3, 'DR', '2017-06-19 22:08:45', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_instrument_period`
--

INSERT INTO `cm_instrument_period` (`instrument_period_id`, `instrument_of_evaluation_id`, `period_id`) VALUES
(1, 1, 1),
(2, 2, 1);

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
(1, 'EVALUACION JUNIO', '2017-06-19', '2017-06-23', 1, '2017-06-19 22:10:30', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cm_ponderation_charge_level`
--

INSERT INTO `cm_ponderation_charge_level` (`ponderation_charge_level_id`, `instrument_of_evaluation_id`, `charge_level_id`, `value`) VALUES
(1, 1, 1, '60'),
(2, 2, 1, '60'),
(3, 2, 3, '40');

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
(0, 0, 'SUPER ADMIN', '2017-06-16 17:18:38', NULL, 'Y'),
(1, 1, 'PARTICIPANTE', '2017-06-19 22:14:39', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `cm_service`
--

INSERT INTO `cm_service` (`service_id`, `company_id`, `name`, `servicetype`, `position`, `service_parent_id`, `url`, `icon_class`, `created`, `updated`, `isactive`) VALUES
(1, 0, 'ESCRITORIO', 'FO', 1, NULL, 'Mains', 'fa fa-dashboard', '2017-06-16 17:18:38', NULL, 'Y'),
(2, 0, 'COMPANIAS', 'FO', 2, NULL, 'Companies', 'fa fa-building', '2017-06-16 17:18:38', NULL, 'Y'),
(3, 0, 'DEPARTAMENTOS', 'FO', 3, NULL, 'Departaments', 'fa fa-home', '2017-06-16 17:18:38', NULL, 'Y'),
(4, 0, 'NIVELES DE CARGO', 'FO', 4, NULL, 'Chargelevels', 'fa fa-level-up', '2017-06-16 17:18:38', NULL, 'Y'),
(5, 0, 'CARGOS', 'FO', 5, NULL, 'Charges', 'fa fa-address-card', '2017-06-16 17:18:38', NULL, 'Y'),
(6, 0, 'SERVICIOS', 'FO', 6, NULL, 'Services', 'fa fa-link', '2017-06-16 17:18:38', NULL, 'Y'),
(7, 0, 'ROLES', 'FO', 7, NULL, 'Roles', 'fa fa-universal-access', '2017-06-16 17:18:38', NULL, 'Y'),
(8, 0, 'USUARIOS', 'FO', 8, NULL, 'Users', 'fa fa-user', '2017-06-16 17:18:38', NULL, 'Y'),
(9, 0, 'NIV. DE DOMINIOS', 'FO', 9, NULL, 'Domainlevels', 'fa fa-hand-pointer-o', '2017-06-16 17:18:38', NULL, 'Y'),
(10, 0, 'NIV. DE DESARROLLO', 'FO', 10, NULL, 'Developmentlevels', 'fa fa-bar-chart', '2017-06-16 17:18:38', NULL, 'Y'),
(11, 0, 'COMPETENCIAS', 'FO', 11, NULL, 'Competencies', 'fa fa-car', '2017-06-16 17:18:38', NULL, 'Y'),
(12, 0, 'INST. DE EVALUACION', 'FO', 12, NULL, 'Instrumentofevaluations', 'fa fa-file-text', '2017-06-16 17:18:38', NULL, 'Y'),
(13, 0, 'PERIODOS', 'FO', 13, NULL, 'Periods', 'fa fa-calendar', '2017-06-16 17:18:38', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_user`
--

INSERT INTO `cm_user` (`user_id`, `company_id`, `role_id`, `value`, `name`, `email`, `phone`, `password`, `avatar`, `created`, `updated`, `isactive`) VALUES
(0, 0, 0, 'V00000000', 'SUPER ADMIN', 'SUPERADMIN@GLOBAL.COM', '00000000000', 'c984ba46695ca7738f862023c0cee8fc', NULL, '2017-06-16 17:18:38', NULL, 'Y'),
(1, 1, 1, 'V19455541', 'CARLOS VARGAS', 'CVARGAS@EMPRESA.COM', '04160984343', '167ff7dd5614f4e7e82769403caad891', NULL, '2017-06-19 22:17:57', NULL, 'Y'),
(2, 1, 1, 'V10546354', 'ANGEL MUNOZ', 'AMUNOZ@EMPRESAA.COM', '04160876543', '0dac383265a6c2d073563a685b3acc93', NULL, '2017-06-19 22:19:19', NULL, 'Y');

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
-- Filtros para la tabla `cm_competency_instrument`
--
ALTER TABLE `cm_competency_instrument`
  ADD CONSTRAINT `fk_competency_id01` FOREIGN KEY (`competency_id`) REFERENCES `cm_competency` (`competency_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_instrument_of_evaluation_id01` FOREIGN KEY (`instrument_of_evaluation_id`) REFERENCES `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`) ON UPDATE CASCADE;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
