-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-06-2017 a las 08:35:38
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

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
(14, 1, 1),
(15, 2, 1),
(16, 2, 14);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=199 ;

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
(147, 9, 'Fomenta el desarrollo de estrategias innovadoras que posicionen los productos en el mercado.', 4, 3, '2017-06-19 15:20:34', NULL, 'Y'),
(148, 4, 'Está atento a las órdenes y cumple con su trabajo básico  entendiendo que forma parte de un equipo.', 1, 1, '2017-06-20 22:39:35', NULL, 'Y'),
(149, 4, 'Coopera activamente con los miembros del equipo.', 1, 2, '2017-06-20 22:39:35', NULL, 'Y'),
(150, 4, 'Conoce como se relaciona su actividad con las de su equipo.', 1, 3, '2017-06-20 22:39:35', NULL, 'Y'),
(151, 4, 'Interactúa con los demás integrantes del equipo para el logro de los objetivos.', 2, 1, '2017-06-20 22:39:35', NULL, 'Y'),
(152, 4, 'Crea canales de comunicación para el intercambio de ideas e información.', 2, 2, '2017-06-20 22:39:35', NULL, 'Y'),
(153, 4, 'Identifica el impacto de sus acciones en otras áreas de la organización.', 2, 3, '2017-06-20 22:39:35', NULL, 'Y'),
(154, 4, 'Promueve la formación de equipos multifuncionales de trabajo para agregar valor a los resultados grupales.', 3, 1, '2017-06-20 22:39:35', NULL, 'Y'),
(155, 4, 'Impulsa alianzas productivas con personas de otras áreas claves para el logro de objetivos.', 3, 2, '2017-06-20 22:39:35', NULL, 'Y'),
(156, 4, 'Prevé el impacto de las acciones del equipo en otras áreas de la organización.', 3, 3, '2017-06-20 22:39:35', NULL, 'Y'),
(157, 4, 'Fomenta la generación de sinergias entre equipos para el logro de los objetivos comunes.', 4, 1, '2017-06-20 22:39:35', NULL, 'Y'),
(158, 4, 'Incentiva la cooperación entre las áreas de la organización', 4, 2, '2017-06-20 22:39:35', NULL, 'Y'),
(159, 4, 'Implementa estrategias que sirven de referencia a otros equipos de trabajo.', 4, 3, '2017-06-20 22:39:35', NULL, 'Y'),
(163, 13, 'Conoce el impacto de su función en el negocio y de las variables del entorno en el negocio.', 1, 1, '2017-06-22 00:38:11', NULL, 'Y'),
(164, 13, 'Busca nuevos negocios alineados a la visión del negocio.', 1, 2, '2017-06-22 00:38:11', NULL, 'Y'),
(165, 13, 'Identifica las fortalezas y debilidades que impactan los resultados del negocio.', 1, 3, '2017-06-22 00:38:11', NULL, 'Y'),
(166, 13, 'Promueve estrategias diferenciadoras que capitalizan las oportunidades del entorno.', 2, 1, '2017-06-22 00:38:11', NULL, 'Y'),
(167, 13, 'Transforma debilidades en oportunidades de negocio.', 2, 2, '2017-06-22 00:38:11', NULL, 'Y'),
(168, 13, 'Se mantiene actualizado acerca de las estrategias del entorno.', 2, 3, '2017-06-22 00:38:11', NULL, 'Y'),
(169, 13, 'Diseña estrategias considerando las características del entorno para impulsar el negocio.', 3, 1, '2017-06-22 00:38:11', NULL, 'Y'),
(170, 13, 'Monitorea la dinámica del entorno para identificar oportunidades de negocio.', 3, 2, '2017-06-22 00:38:11', NULL, 'Y'),
(171, 13, 'Modifica las estrategias para enfrentar las demandas cambiantes del entorno.', 3, 3, '2017-06-22 00:38:11', NULL, 'Y'),
(172, 13, 'Formula planes a corto y mediano plazo para potenciar el posicionamiento de la organización.', 4, 1, '2017-06-22 00:38:11', NULL, 'Y'),
(173, 13, 'Integra mejores prácticas en la generación de nuevos negocios.', 4, 2, '2017-06-22 00:38:11', NULL, 'Y'),
(174, 13, 'Propicia cambios organizacionales para responder a las exigencias del entorno.', 4, 3, '2017-06-22 00:38:11', NULL, 'Y'),
(175, 14, 'Crea un ambiente propicio para la negociación de acuerdo a los lineamientos establecidos por la organización', 1, 1, '2017-06-22 00:41:57', NULL, 'Y'),
(176, 14, 'Obtiene información relevante para la toma de decisiones.', 1, 2, '2017-06-22 00:41:57', NULL, 'Y'),
(177, 14, 'Toma decisiones de manera efectiva y acertada para el logro de los objetivos estratégicos', 1, 3, '2017-06-22 00:41:57', NULL, 'Y'),
(178, 14, 'Concreta acuerdos beneficiosos para ambas partes.', 2, 1, '2017-06-22 00:41:57', NULL, 'Y'),
(179, 14, 'Elige la alternativas más adecuada asegurándose que se  ejecute correctamente.', 2, 2, '2017-06-22 00:41:57', NULL, 'Y'),
(180, 14, 'Visualiza el impacto de sus decisiones en la estrategia organizacional.', 2, 3, '2017-06-22 00:41:57', NULL, 'Y'),
(181, 14, 'Identifica los intereses propios y de la contraparte.', 3, 1, '2017-06-22 00:41:57', NULL, 'Y'),
(182, 14, 'Analiza información objetiva de una situación para evaluar alternativas.', 3, 2, '2017-06-22 00:41:57', NULL, 'Y'),
(183, 14, 'Toma decisiones con un impacto positivo a largo plazo en los objetivos del negocio.', 3, 3, '2017-06-22 00:41:57', NULL, 'Y'),
(184, 14, 'Desarrolla estrategias de negociación ganar-ganar exitosas.', 4, 1, '2017-06-22 00:41:57', NULL, 'Y'),
(185, 14, 'Genera nuevos procedimientos para el análisis de alternativas.', 4, 2, '2017-06-22 00:41:57', NULL, 'Y'),
(186, 14, 'Toma decisiones sobre metas y objetivos convirtiéndolos en planes estratégicos.', 4, 3, '2017-06-22 00:41:57', NULL, 'Y'),
(187, 15, 'Hace uso de sus fortalezas para influir en los demás.', 1, 1, '2017-06-22 00:49:13', NULL, 'Y'),
(188, 15, 'Está consciente del impacto que tiene sobre otros.', 1, 2, '2017-06-22 00:49:13', NULL, 'Y'),
(189, 15, 'Busca el momento propicio para plantear sus ideas.', 1, 3, '2017-06-22 00:49:13', NULL, 'Y'),
(190, 15, 'Ajusta su estilo de comunicación a sus interlocutores.', 2, 1, '2017-06-22 00:49:13', NULL, 'Y'),
(191, 15, 'Argumenta sus ideas de forma persuasiva.', 2, 2, '2017-06-22 00:49:13', NULL, 'Y'),
(192, 15, 'Desarrolla redes de contactos para el logro de los objetivos.', 2, 3, '2017-06-22 00:49:13', NULL, 'Y'),
(193, 15, 'Diseña con anticipación su estrategia para lograr convencer a otros.', 3, 1, '2017-06-22 00:49:13', NULL, 'Y'),
(194, 15, 'Logra acuerdos y compromisos entre distintas personas y áreas.', 3, 2, '2017-06-22 00:49:13', NULL, 'Y'),
(195, 15, 'Genera alianzas efectivas que favorezcan el logro de los objetivos organizacionales.', 3, 3, '2017-06-22 00:49:13', NULL, 'Y'),
(196, 15, 'Evalúa estrategias de influencia escogiendo la de mayor impacto de acuerdo a sus interlocutores.', 4, 1, '2017-06-22 00:49:13', NULL, 'Y'),
(197, 15, 'Es un referente obteniendo compromisos como resultado de sus argumentos y propuestas.', 4, 2, '2017-06-22 00:49:13', NULL, 'Y'),
(198, 15, 'Consolida vínculos para mantener relaciones una vez alcanzados los objetivos establecidos.', 4, 3, '2017-06-22 00:49:13', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cm_charge`
--

INSERT INTO `cm_charge` (`charge_id`, `departament_id`, `name`, `charge_parent_id`, `charge_level_id`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'GERENTE', 3, 3, '2017-06-16 17:26:11', NULL, 'Y'),
(2, 1, 'PROGRAMADOR', 1, 1, '2017-06-16 17:26:26', NULL, 'Y'),
(3, 2, 'DIRECTOR', 4, 2, '2017-06-21 23:29:51', NULL, 'Y'),
(4, 3, 'PRESIDENTE', 0, 4, '2017-06-22 00:16:20', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `cm_charge_assigned`
--

INSERT INTO `cm_charge_assigned` (`charge_assigned_id`, `user_id`, `charge_id`, `startdate`, `enddate`, `created`, `updated`, `isactive`) VALUES
(1, 1, 2, '2015-05-18', NULL, '2017-06-19 22:17:57', NULL, 'N'),
(2, 2, 1, '1995-05-12', NULL, '2017-06-19 22:19:19', NULL, 'N'),
(3, 3, 3, '2015-05-05', NULL, '2017-06-21 23:30:58', NULL, 'N'),
(4, 4, 4, '1980-01-01', NULL, '2017-06-22 00:20:57', NULL, 'N'),
(5, 5, 2, '2015-01-01', NULL, '2017-06-22 00:21:45', NULL, 'Y'),
(6, 6, 2, '2015-02-02', NULL, '2017-06-22 00:22:22', NULL, 'Y'),
(7, 7, 2, '2016-06-01', NULL, '2017-06-22 02:01:48', NULL, 'Y'),
(8, 8, 2, '2016-02-02', NULL, '2017-06-22 02:02:31', NULL, 'Y'),
(9, 9, 2, '2014-05-05', NULL, '2017-06-23 00:42:26', NULL, 'Y'),
(10, 10, 2, '2016-05-02', NULL, '2017-06-23 00:43:20', NULL, 'Y'),
(11, 11, 2, '2017-01-01', NULL, '2017-06-23 04:42:43', NULL, 'Y'),
(12, 12, 2, '2016-09-09', NULL, '2017-06-23 04:44:56', NULL, 'Y'),
(13, 13, 2, '2012-09-01', NULL, '2017-06-23 04:45:38', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cm_charge_level`
--

INSERT INTO `cm_charge_level` (`charge_level_id`, `name`, `company_id`, `created`, `updated`, `isactive`) VALUES
(1, 'GENERALES', 1, '2017-06-16 17:22:44', NULL, 'Y'),
(2, 'DIRECTIVOS', 1, '2017-06-16 17:23:35', NULL, 'Y'),
(3, 'GERENCIALES SUPERVISORIAS', 1, '2017-06-16 17:25:34', NULL, 'Y'),
(4, 'NO APLICA', 1, '2017-06-22 00:16:00', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

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
(12, 'ÉTICA PROFESIONAL', 'Es la capacidad para sentir y actuar en todo momento consecuentemente con los valores morales y las buenas costumbres y prácticas profesionales, respetando las políticas organizacionales. Es actuar con honestidad para construir a largo plazo.', 1, 1, '2017-06-16 18:46:13', NULL, 'Y'),
(13, 'PENSAMIENTO ESTRATEGICO', 's la capacidad para comprender los cambios del entorno, visualizar oportunidades y amenazas, reconocer las fortalezas y debilidades, a fin de establecer metas, objetivos y estrategias que generen nuevos negocios y mantengan el liderazgo en el mercado.', 1, 2, '2017-06-22 00:26:41', NULL, 'Y'),
(14, 'NEGOCIACION Y MANEJO DE CONFLICTOS', 'Es la capacidad para lograr acuerdos duraderos, creando para ello un ambiente propicio, utilizando estrategias de ganar–ganar que fortalezcan relaciones productivas. Implica entender una situación, evaluar alternativas de solución y tomar de decisiones con criterios de calidad que respondan a los objetivos de la organización.', 1, 2, '2017-06-22 00:41:57', NULL, 'Y'),
(15, 'IMPACTO E INLUENCIA', 'Es la capacidad de influir de forma positiva en otros para generar cambios y reorientar acciones. Implica persuadir, impactar y convencer a los demás para que contribuyan a alcanzar los objetivos organizacionales.', 1, 2, '2017-06-22 00:49:13', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `cm_competency_instrument`
--

INSERT INTO `cm_competency_instrument` (`competency_instrument_id`, `instrument_of_evaluation_id`, `competency_id`, `position`) VALUES
(20, 2, 1, 1),
(21, 2, 12, 2),
(22, 2, 3, 3),
(23, 2, 4, 4),
(24, 2, 5, 5),
(25, 2, 7, 6),
(26, 2, 6, 7),
(27, 2, 8, 8),
(28, 2, 9, 9),
(29, 1, 1, 1),
(30, 1, 12, 2),
(31, 1, 3, 3),
(32, 1, 4, 4),
(33, 1, 5, 5),
(34, 3, 1, 1),
(35, 3, 12, 2),
(36, 3, 3, 3),
(37, 3, 4, 4),
(38, 3, 5, 5),
(39, 3, 7, 6),
(40, 3, 6, 7),
(41, 3, 8, 8),
(42, 3, 9, 9),
(43, 3, 13, 10),
(44, 3, 14, 11),
(45, 3, 15, 12);

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
(1, 1, 'INFORMATICA', 2, '2017-06-16 17:22:19', NULL, 'Y'),
(2, 1, 'DIRECTIVA', 3, '2017-06-21 23:28:32', NULL, 'Y'),
(3, 1, 'PRESIDENCIA', 0, '2017-06-22 00:13:05', NULL, 'Y');

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
(4, 1, 'SIEMPRE', '4', 4, '4', '2017-06-16 17:28:04', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cm_instrument_of_evaluation`
--

INSERT INTO `cm_instrument_of_evaluation` (`instrument_of_evaluation_id`, `company_id`, `name`, `description`, `instructions`, `evaluationtype`, `charge_level_id`, `status`, `created`, `updated`, `isactive`) VALUES
(1, 1, 'INSTRUMENTO DE EVALUACION BASE', 'INSTRUMENTO DE EVALUACION BASE', 'A.- LA ESCALA  ES DEL 1 AL 4, SIENDO: 1 (CASI NUNCA) ;  2 (A VECES); 3 (FRECUENTEMENTE);  4 (CASI SIEMPRE).\r\nB.-SEA OBJETIVO EN LA EVALUACION.\r\nC.- MARQUE CON UN (X) LA CASILLA DE ACUERDO AL NIVEL DE DOMINIO QUE TIENE EL EVALUADO.\r\nD.- DISCUTA LOS RESULTADOS DE LA EVALUACIóN CON SU SUPERVISADO.\r\nE.-SEA DISCRETO EVITANDO COMENTARIOS SOBRE LOS RESULTADOS DE ESTA EVALUACIóN.', 'UC', 1, 'CO', '2017-06-19 22:04:17', NULL, 'Y'),
(2, 1, 'INSTRUMENTO DE EVALUACION GERENTES', 'INSTRUMENTO DE EVALUACION GERENTES', 'A.- LA ESCALA  ES DEL 1 AL 4, SIENDO: 1 (CASI NUNCA) ;  2 (A VECES); 3 (FRECUENTEMENTE);  4 (CASI SIEMPRE).\r\nB.-SEA OBJETIVO EN LA EVALUACION.\r\nC.- MARQUE CON UNA (X) LA CASILLA DE ACUERDO AL NIVEL DE DOMINIO QUE TIENE EL EVALUADO.\r\nD.- DISCUTA LOS RESULTADOS DE LA EVALUACIóN CON SU SUPERVISADO.\r\nE.- SEA DISCRETO EVITANDO COMENTARIOS SOBRE LOS RESULTADOS DE ESTA EVALUACIóN.', 'UC', 3, 'CO', '2017-06-19 22:08:45', NULL, 'Y'),
(3, 1, 'INSTRUMENTO DE EVALUACION DIRECTIVOS', 'INSTRUMENTO DE EVALUACION DIRECTIVOS', 'A.- LA ESCALA  ES DEL 1 AL 4, SIENDO: 1 (CASI NUNCA) ;  2 (A VECES); 3 (FRECUENTEMENTE);  4 (CASI SIEMPRE).\r\nB.- SEA OBJETIVO EN LA EVALUACION.\r\nC.- MARQUE CON UNA (X) LA CASILLA DE ACUERDO AL NIVEL DE DOMINIO QUE TIENE EL EVALUADO.\r\nD.- DISCUTA LOS RESULTADOS DE LA EVALUACIóN CON SU SUPERVISADO.\r\nE.- SEA DISCRETO EVITANDO COMENTARIOS SOBRE LOS RESULTADOS DE ESTA EVALUACIóN.', 'UC', 2, 'CO', '2017-06-22 00:53:36', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `cm_instrument_period`
--

INSERT INTO `cm_instrument_period` (`instrument_period_id`, `instrument_of_evaluation_id`, `period_id`) VALUES
(3, 1, 1),
(4, 2, 1),
(5, 3, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `cm_ponderation_charge_level`
--

INSERT INTO `cm_ponderation_charge_level` (`ponderation_charge_level_id`, `instrument_of_evaluation_id`, `charge_level_id`, `value`) VALUES
(5, 2, 1, '60'),
(6, 2, 3, '40'),
(7, 1, 1, '60'),
(8, 3, 1, '40'),
(9, 3, 3, '30'),
(10, 3, 2, '30');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cm_role`
--

INSERT INTO `cm_role` (`role_id`, `company_id`, `name`, `created`, `updated`, `isactive`) VALUES
(0, 0, 'SUPER ADMIN', '2017-06-16 17:18:38', NULL, 'Y'),
(1, 1, 'PARTICIPANTE', '2017-06-19 22:14:39', NULL, 'Y'),
(2, 1, 'GERENTE / SUPERVISORIO', '2017-06-22 16:42:57', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `cm_service`
--

INSERT INTO `cm_service` (`service_id`, `company_id`, `name`, `servicetype`, `position`, `service_parent_id`, `url`, `icon_class`, `created`, `updated`, `isactive`) VALUES
(1, 0, 'DASHBOARD', 'FO', 1, NULL, 'Mains', 'fa fa-dashboard', '2017-06-16 17:18:38', NULL, 'Y'),
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
(13, 0, 'PERIODOS', 'FO', 13, NULL, 'Periods', 'fa fa-calendar', '2017-06-16 17:18:38', NULL, 'Y'),
(14, 1, 'PROMEDIO GRUPAL', 'RP', 14, NULL, 'Reports', 'fa fa-newspaper-o', '2017-06-22 16:42:31', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `cm_user`
--

INSERT INTO `cm_user` (`user_id`, `company_id`, `role_id`, `value`, `name`, `email`, `phone`, `password`, `avatar`, `created`, `updated`, `isactive`) VALUES
(0, 0, 0, 'V00000000', 'SUPER ADMIN', 'SUPERADMIN@GLOBAL.COM', '00000000000', 'c984ba46695ca7738f862023c0cee8fc', NULL, '2017-06-16 17:18:38', NULL, 'Y'),
(1, 1, 1, 'V00000001', 'EMPLEADO 1', 'EMPLEADO1@EMPRESAA.COM', '00000000001', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-19 22:17:57', NULL, 'Y'),
(2, 1, 2, 'V00000002', 'GERENTE 1', 'GERENTE1@EMPRESAA.COM', '00000000002', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-19 22:19:19', NULL, 'Y'),
(3, 1, 2, 'V00000003', 'DIRECTOR 1', 'DIRECTOR1@EMPRESAA.COM', '00000000003', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-21 23:30:58', NULL, 'Y'),
(4, 1, 2, 'V00000004', 'PRESIDENTE 1', 'PRESIDENTE1@EMPRESAA.COM', '00000000004', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-22 00:20:57', NULL, 'Y'),
(5, 1, 1, 'V00000005', 'EMPLEADO 2', 'EMPLEADO2@EMPRESAA.COM', '00000000005', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-22 00:21:45', NULL, 'Y'),
(6, 1, 1, 'V00000006', 'EMPLEADO 3', 'EMPLEADO3@EMPRESAA.COM', '00000000006', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-22 00:22:22', NULL, 'Y'),
(7, 1, 1, 'V00000007', 'EMPLEADO 4', 'EMPLEADO4@EMPRESAA.COM', '00000000007', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-22 02:01:48', NULL, 'Y'),
(8, 1, 1, 'V00000008', 'EMPLEADO 5', 'EMPLEADO5@EMPRESAA.COM', '00000000008', '827ccb0eea8a706c4c34a16891f84e7b', NULL, '2017-06-22 02:02:31', NULL, 'Y'),
(9, 1, 1, 'V00000006', 'EMPLEADO 6', 'EMPLEADO6@EMPRESAA.COM', '00000000006', '1647787df9c610465cee0dce173541f5', NULL, '2017-06-23 00:42:26', NULL, 'Y'),
(10, 1, 1, 'V00000007', 'EMPLEADO 7', 'EMPLEADO7@EMPRESAA.COM', '00000000007', 'adfd6bee581fb6b43cf9b679cc7fe0f1', NULL, '2017-06-23 00:43:20', NULL, 'Y'),
(11, 1, 1, 'V00000008', 'EMPLEADO 8', 'EMPLEADO8@EMPRESAA.COM', '00000000008', 'b998db5ef57701a5092c008541354445', NULL, '2017-06-23 04:42:43', NULL, 'Y'),
(12, 1, 1, 'V00000009', 'EMPLEADO 9', 'EMPLEADO9@EMPRESAA.COM', '00000000009', '75a143b1655b4203cc596fbd7f92a288', NULL, '2017-06-23 04:44:56', NULL, 'Y'),
(13, 1, 1, 'V00000010', 'EMPLEADO 10', 'EMPLEADO10@EMPRESAA.COM', '00000000010', '79b21535f1f117c1cede705e3fcb45fa', NULL, '2017-06-23 04:45:38', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `cm_user_instrument`
--

INSERT INTO `cm_user_instrument` (`user_instrument_id`, `instrument_of_evaluation_id`, `user_evaluated_id`, `user_evaluator_id`, `evaluationdate`, `status`, `created`, `updated`, `isactive`) VALUES
(1, 1, 1, 2, '2017-06-21', 'CO', '2017-06-22 03:58:53', NULL, 'Y'),
(2, 1, 5, 2, '2017-06-22', 'CO', '2017-06-22 04:01:23', NULL, 'Y'),
(3, 1, 6, 2, '2017-06-22', 'CO', '2017-06-22 04:04:33', NULL, 'Y'),
(4, 1, 7, 2, '2017-06-22', 'CO', '2017-06-22 04:06:47', NULL, 'Y'),
(5, 1, 8, 2, '2017-06-22', 'CO', '2017-06-22 04:07:42', NULL, 'Y'),
(6, 2, 2, 3, '2017-06-22', 'CO', '2017-06-22 14:02:31', NULL, 'Y'),
(7, 3, 3, 4, '2017-06-22', 'CO', '2017-06-22 14:05:40', NULL, 'Y'),
(8, 1, 9, 2, '2017-06-22', 'CO', '2017-06-23 00:50:12', NULL, 'Y'),
(9, 1, 10, 2, '2017-06-23', 'CO', '2017-06-23 04:20:22', NULL, 'Y');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=607 ;

--
-- Volcado de datos para la tabla `cm_user_instrument_answer`
--

INSERT INTO `cm_user_instrument_answer` (`user_instrument_answer_id`, `user_instrument_id`, `behavioral_indicator_id`, `domain_level_id`) VALUES
(1, 1, 13, 3),
(2, 1, 14, 2),
(3, 1, 15, 4),
(4, 1, 16, 1),
(5, 1, 17, 2),
(6, 1, 18, 4),
(7, 1, 19, 3),
(8, 1, 20, 3),
(9, 1, 21, 2),
(10, 1, 22, 2),
(11, 1, 23, 2),
(12, 1, 24, 3),
(13, 1, 28, 2),
(14, 1, 29, 2),
(15, 1, 30, 3),
(16, 1, 31, 3),
(17, 1, 32, 4),
(18, 1, 33, 4),
(19, 1, 34, 3),
(20, 1, 35, 3),
(21, 1, 36, 4),
(22, 1, 37, 3),
(23, 1, 38, 4),
(24, 1, 39, 3),
(25, 1, 40, 3),
(26, 1, 41, 3),
(27, 1, 42, 4),
(28, 1, 43, 3),
(29, 1, 44, 4),
(30, 1, 45, 3),
(31, 1, 46, 3),
(32, 1, 47, 3),
(33, 1, 48, 3),
(34, 1, 49, 2),
(35, 1, 50, 2),
(36, 1, 51, 4),
(37, 1, 148, 2),
(38, 1, 149, 3),
(39, 1, 150, 2),
(40, 1, 151, 3),
(41, 1, 152, 3),
(42, 1, 153, 2),
(43, 1, 154, 3),
(44, 1, 155, 3),
(45, 1, 156, 3),
(46, 1, 157, 2),
(47, 1, 158, 2),
(48, 1, 159, 4),
(49, 1, 64, 4),
(50, 1, 65, 4),
(51, 1, 66, 3),
(52, 1, 67, 3),
(53, 1, 68, 3),
(54, 1, 69, 4),
(55, 1, 70, 3),
(56, 1, 71, 3),
(57, 1, 72, 4),
(58, 1, 73, 3),
(59, 1, 74, 3),
(60, 1, 75, 3),
(61, 2, 13, 2),
(62, 2, 14, 2),
(63, 2, 15, 2),
(64, 2, 16, 2),
(65, 2, 17, 2),
(66, 2, 18, 2),
(67, 2, 19, 1),
(68, 2, 20, 1),
(69, 2, 21, 1),
(70, 2, 22, 2),
(71, 2, 23, 1),
(72, 2, 24, 2),
(73, 2, 28, 1),
(74, 2, 29, 1),
(75, 2, 30, 2),
(76, 2, 31, 1),
(77, 2, 32, 1),
(78, 2, 33, 1),
(79, 2, 34, 2),
(80, 2, 35, 2),
(81, 2, 36, 3),
(82, 2, 37, 2),
(83, 2, 38, 2),
(84, 2, 39, 1),
(85, 2, 40, 1),
(86, 2, 41, 1),
(87, 2, 42, 1),
(88, 2, 43, 2),
(89, 2, 44, 2),
(90, 2, 45, 2),
(91, 2, 46, 1),
(92, 2, 47, 1),
(93, 2, 48, 1),
(94, 2, 49, 2),
(95, 2, 50, 2),
(96, 2, 51, 1),
(97, 2, 148, 1),
(98, 2, 149, 1),
(99, 2, 150, 1),
(100, 2, 151, 2),
(101, 2, 152, 3),
(102, 2, 153, 3),
(103, 2, 154, 2),
(104, 2, 155, 2),
(105, 2, 156, 2),
(106, 2, 157, 1),
(107, 2, 158, 1),
(108, 2, 159, 1),
(109, 2, 64, 2),
(110, 2, 65, 2),
(111, 2, 66, 2),
(112, 2, 67, 1),
(113, 2, 68, 1),
(114, 2, 69, 1),
(115, 2, 70, 2),
(116, 2, 71, 2),
(117, 2, 72, 1),
(118, 2, 73, 2),
(119, 2, 74, 2),
(120, 2, 75, 1),
(121, 3, 13, 4),
(122, 3, 14, 3),
(123, 3, 15, 4),
(124, 3, 16, 4),
(125, 3, 17, 4),
(126, 3, 18, 4),
(127, 3, 19, 3),
(128, 3, 20, 3),
(129, 3, 21, 3),
(130, 3, 22, 4),
(131, 3, 23, 3),
(132, 3, 24, 4),
(133, 3, 28, 3),
(134, 3, 29, 3),
(135, 3, 30, 4),
(136, 3, 31, 3),
(137, 3, 32, 3),
(138, 3, 33, 3),
(139, 3, 34, 4),
(140, 3, 35, 4),
(141, 3, 36, 4),
(142, 3, 37, 3),
(143, 3, 38, 4),
(144, 3, 39, 3),
(145, 3, 40, 4),
(146, 3, 41, 3),
(147, 3, 42, 4),
(148, 3, 43, 3),
(149, 3, 44, 3),
(150, 3, 45, 4),
(151, 3, 46, 4),
(152, 3, 47, 3),
(153, 3, 48, 3),
(154, 3, 49, 3),
(155, 3, 50, 3),
(156, 3, 51, 4),
(157, 3, 148, 4),
(158, 3, 149, 4),
(159, 3, 150, 4),
(160, 3, 151, 3),
(161, 3, 152, 3),
(162, 3, 153, 3),
(163, 3, 154, 4),
(164, 3, 155, 4),
(165, 3, 156, 4),
(166, 3, 157, 3),
(167, 3, 158, 3),
(168, 3, 159, 3),
(169, 3, 64, 4),
(170, 3, 65, 4),
(171, 3, 66, 4),
(172, 3, 67, 3),
(173, 3, 68, 3),
(174, 3, 69, 4),
(175, 3, 70, 3),
(176, 3, 71, 3),
(177, 3, 72, 3),
(178, 3, 73, 4),
(179, 3, 74, 4),
(180, 3, 75, 4),
(181, 4, 13, 2),
(182, 4, 14, 2),
(183, 4, 15, 2),
(184, 4, 16, 3),
(185, 4, 17, 3),
(186, 4, 18, 3),
(187, 4, 19, 2),
(188, 4, 20, 2),
(189, 4, 21, 2),
(190, 4, 22, 3),
(191, 4, 23, 3),
(192, 4, 24, 3),
(193, 4, 28, 2),
(194, 4, 29, 2),
(195, 4, 30, 2),
(196, 4, 31, 3),
(197, 4, 32, 3),
(198, 4, 33, 3),
(199, 4, 34, 2),
(200, 4, 35, 2),
(201, 4, 36, 2),
(202, 4, 37, 3),
(203, 4, 38, 3),
(204, 4, 39, 3),
(205, 4, 40, 2),
(206, 4, 41, 2),
(207, 4, 42, 2),
(208, 4, 43, 3),
(209, 4, 44, 3),
(210, 4, 45, 3),
(211, 4, 46, 2),
(212, 4, 47, 2),
(213, 4, 48, 2),
(214, 4, 49, 3),
(215, 4, 50, 3),
(216, 4, 51, 3),
(217, 4, 148, 2),
(218, 4, 149, 2),
(219, 4, 150, 2),
(220, 4, 151, 3),
(221, 4, 152, 3),
(222, 4, 153, 3),
(223, 4, 154, 2),
(224, 4, 155, 2),
(225, 4, 156, 2),
(226, 4, 157, 3),
(227, 4, 158, 3),
(228, 4, 159, 3),
(229, 4, 64, 2),
(230, 4, 65, 2),
(231, 4, 66, 2),
(232, 4, 67, 3),
(233, 4, 68, 3),
(234, 4, 69, 3),
(235, 4, 70, 2),
(236, 4, 71, 2),
(237, 4, 72, 2),
(238, 4, 73, 3),
(239, 4, 74, 3),
(240, 4, 75, 3),
(241, 5, 13, 1),
(242, 5, 14, 1),
(243, 5, 15, 1),
(244, 5, 16, 1),
(245, 5, 17, 1),
(246, 5, 18, 1),
(247, 5, 19, 1),
(248, 5, 20, 1),
(249, 5, 21, 1),
(250, 5, 22, 1),
(251, 5, 23, 1),
(252, 5, 24, 1),
(253, 5, 28, 1),
(254, 5, 29, 1),
(255, 5, 30, 1),
(256, 5, 31, 1),
(257, 5, 32, 2),
(258, 5, 33, 1),
(259, 5, 34, 1),
(260, 5, 35, 1),
(261, 5, 36, 2),
(262, 5, 37, 1),
(263, 5, 38, 1),
(264, 5, 40, 1),
(265, 5, 41, 2),
(266, 5, 42, 1),
(267, 5, 43, 1),
(268, 5, 44, 1),
(269, 5, 45, 1),
(270, 5, 46, 1),
(271, 5, 47, 2),
(272, 5, 48, 1),
(273, 5, 49, 1),
(274, 5, 50, 1),
(275, 5, 51, 1),
(276, 5, 148, 2),
(277, 5, 149, 2),
(278, 5, 150, 1),
(279, 5, 151, 1),
(280, 5, 152, 2),
(281, 5, 153, 1),
(282, 5, 154, 1),
(283, 5, 155, 1),
(284, 5, 156, 2),
(285, 5, 157, 1),
(286, 5, 158, 1),
(287, 5, 159, 2),
(288, 5, 64, 1),
(289, 5, 65, 1),
(290, 5, 66, 1),
(291, 5, 67, 1),
(292, 5, 68, 1),
(293, 5, 69, 1),
(294, 5, 70, 1),
(295, 5, 71, 2),
(296, 5, 72, 1),
(297, 5, 73, 1),
(298, 5, 74, 1),
(299, 5, 75, 1),
(300, 6, 13, 2),
(301, 6, 14, 2),
(302, 6, 15, 2),
(303, 6, 16, 3),
(304, 6, 17, 3),
(305, 6, 18, 3),
(306, 6, 19, 3),
(307, 6, 20, 3),
(308, 6, 21, 3),
(309, 6, 22, 4),
(310, 6, 23, 4),
(311, 6, 24, 4),
(312, 6, 28, 3),
(313, 6, 29, 4),
(314, 6, 30, 3),
(315, 6, 31, 3),
(316, 6, 32, 3),
(317, 6, 33, 3),
(318, 6, 34, 4),
(319, 6, 35, 4),
(320, 6, 36, 3),
(321, 6, 37, 4),
(322, 6, 38, 4),
(323, 6, 39, 3),
(324, 6, 40, 4),
(325, 6, 41, 4),
(326, 6, 42, 4),
(327, 6, 43, 3),
(328, 6, 44, 4),
(329, 6, 45, 3),
(330, 6, 46, 3),
(331, 6, 47, 3),
(332, 6, 48, 3),
(333, 6, 49, 4),
(334, 6, 50, 3),
(335, 6, 51, 4),
(336, 6, 148, 3),
(337, 6, 149, 3),
(338, 6, 150, 3),
(339, 6, 151, 4),
(340, 6, 152, 4),
(341, 6, 153, 4),
(342, 6, 154, 3),
(343, 6, 155, 3),
(344, 6, 156, 4),
(345, 6, 157, 3),
(346, 6, 158, 3),
(347, 6, 159, 3),
(348, 6, 64, 4),
(349, 6, 65, 4),
(350, 6, 66, 4),
(351, 6, 67, 3),
(352, 6, 68, 3),
(353, 6, 69, 4),
(354, 6, 70, 3),
(355, 6, 71, 4),
(356, 6, 72, 3),
(357, 6, 73, 3),
(358, 6, 74, 3),
(359, 6, 75, 3),
(360, 6, 112, 4),
(361, 6, 113, 3),
(362, 6, 114, 4),
(363, 6, 115, 4),
(364, 6, 116, 3),
(365, 6, 117, 3),
(366, 6, 118, 3),
(367, 6, 119, 3),
(368, 6, 120, 4),
(369, 6, 121, 3),
(370, 6, 122, 3),
(371, 6, 123, 4),
(372, 6, 100, 3),
(373, 6, 101, 3),
(374, 6, 102, 3),
(375, 6, 103, 3),
(376, 6, 104, 4),
(377, 6, 105, 3),
(378, 6, 106, 3),
(379, 6, 107, 3),
(380, 6, 108, 3),
(381, 6, 109, 4),
(382, 6, 110, 3),
(383, 6, 111, 4),
(384, 6, 124, 4),
(385, 6, 125, 4),
(386, 6, 126, 4),
(387, 6, 127, 3),
(388, 6, 128, 3),
(389, 6, 129, 3),
(390, 6, 130, 3),
(391, 6, 131, 4),
(392, 6, 132, 3),
(393, 6, 133, 3),
(394, 6, 134, 3),
(395, 6, 135, 3),
(396, 6, 136, 3),
(397, 6, 137, 4),
(398, 6, 138, 3),
(399, 6, 139, 3),
(400, 6, 140, 3),
(401, 6, 141, 3),
(402, 6, 142, 4),
(403, 6, 143, 4),
(404, 6, 144, 4),
(405, 6, 145, 3),
(406, 6, 146, 3),
(407, 6, 147, 3),
(408, 7, 13, 2),
(409, 7, 14, 2),
(410, 7, 15, 3),
(411, 7, 16, 3),
(412, 7, 17, 3),
(413, 7, 18, 3),
(414, 7, 19, 2),
(415, 7, 20, 4),
(416, 7, 21, 3),
(417, 7, 22, 3),
(418, 7, 23, 3),
(419, 7, 24, 3),
(420, 7, 28, 4),
(421, 7, 29, 4),
(422, 7, 30, 4),
(423, 7, 31, 3),
(424, 7, 32, 3),
(425, 7, 33, 3),
(426, 7, 34, 3),
(427, 7, 35, 4),
(428, 7, 36, 3),
(429, 7, 37, 3),
(430, 7, 38, 3),
(431, 7, 39, 3),
(432, 7, 40, 3),
(433, 7, 41, 4),
(434, 7, 42, 3),
(435, 7, 43, 3),
(436, 7, 44, 3),
(437, 7, 45, 3),
(438, 7, 46, 4),
(439, 7, 47, 4),
(440, 7, 48, 4),
(441, 7, 49, 3),
(442, 7, 50, 3),
(443, 7, 51, 4),
(444, 7, 148, 4),
(445, 7, 149, 4),
(446, 7, 150, 3),
(447, 7, 151, 3),
(448, 7, 152, 4),
(449, 7, 153, 4),
(450, 7, 154, 3),
(451, 7, 155, 2),
(452, 7, 156, 4),
(453, 7, 157, 3),
(454, 7, 158, 3),
(455, 7, 159, 4),
(456, 7, 64, 3),
(457, 7, 65, 3),
(458, 7, 66, 3),
(459, 7, 67, 4),
(460, 7, 68, 4),
(461, 7, 69, 4),
(462, 7, 70, 4),
(463, 7, 71, 4),
(464, 7, 72, 3),
(465, 7, 73, 4),
(466, 7, 74, 4),
(467, 7, 75, 3),
(468, 7, 112, 3),
(469, 7, 113, 3),
(470, 7, 114, 3),
(471, 7, 115, 4),
(472, 7, 116, 4),
(473, 7, 117, 4),
(474, 7, 118, 3),
(475, 7, 119, 3),
(476, 7, 120, 3),
(477, 7, 121, 3),
(478, 7, 122, 3),
(479, 7, 123, 3),
(480, 7, 100, 4),
(481, 7, 101, 4),
(482, 7, 102, 4),
(483, 7, 103, 3),
(484, 7, 104, 3),
(485, 7, 105, 3),
(486, 7, 106, 4),
(487, 7, 107, 4),
(488, 7, 108, 4),
(489, 7, 109, 3),
(490, 7, 110, 4),
(491, 7, 111, 3),
(492, 7, 124, 3),
(493, 7, 125, 3),
(494, 7, 126, 3),
(495, 7, 127, 4),
(496, 7, 128, 4),
(497, 7, 129, 4),
(498, 7, 130, 3),
(499, 7, 131, 3),
(500, 7, 132, 4),
(501, 7, 133, 3),
(502, 7, 134, 3),
(503, 7, 135, 3),
(504, 7, 136, 3),
(505, 7, 137, 4),
(506, 7, 138, 3),
(507, 7, 139, 3),
(508, 7, 140, 4),
(509, 7, 141, 3),
(510, 7, 145, 3),
(511, 7, 146, 4),
(512, 7, 147, 4),
(513, 7, 163, 4),
(514, 7, 164, 4),
(515, 7, 165, 4),
(516, 7, 166, 3),
(517, 7, 167, 3),
(518, 7, 168, 4),
(519, 7, 169, 3),
(520, 7, 170, 3),
(521, 7, 171, 3),
(522, 7, 172, 4),
(523, 7, 173, 4),
(524, 7, 174, 3),
(525, 7, 175, 3),
(526, 7, 176, 3),
(527, 7, 177, 4),
(528, 7, 178, 3),
(529, 7, 179, 3),
(530, 7, 180, 3),
(531, 7, 181, 4),
(532, 7, 182, 4),
(533, 7, 183, 4),
(534, 7, 184, 3),
(535, 7, 185, 3),
(536, 7, 186, 4),
(537, 7, 187, 3),
(538, 7, 188, 3),
(539, 7, 189, 3),
(540, 7, 190, 3),
(541, 7, 191, 4),
(542, 7, 192, 3),
(543, 7, 193, 3),
(544, 7, 194, 3),
(545, 7, 195, 3),
(546, 7, 196, 4),
(547, 7, 197, 4),
(548, 7, 198, 4),
(549, 8, 13, 1),
(550, 8, 14, 2),
(551, 8, 15, 3),
(552, 8, 16, 1),
(553, 8, 17, 1),
(554, 8, 18, 2),
(555, 8, 19, 1),
(556, 8, 20, 2),
(557, 8, 21, 3),
(558, 8, 22, 1),
(559, 8, 23, 1),
(560, 8, 24, 3),
(561, 8, 28, 1),
(562, 8, 29, 2),
(563, 8, 31, 2),
(564, 8, 32, 2),
(565, 8, 33, 2),
(566, 8, 34, 2),
(567, 8, 35, 3),
(568, 8, 36, 3),
(569, 8, 37, 1),
(570, 8, 38, 2),
(571, 8, 39, 3),
(572, 8, 40, 1),
(573, 8, 41, 2),
(574, 8, 42, 3),
(575, 8, 43, 1),
(576, 8, 44, 2),
(577, 8, 45, 3),
(578, 8, 46, 1),
(579, 8, 47, 1),
(580, 8, 48, 3),
(581, 8, 49, 1),
(582, 8, 50, 2),
(583, 8, 51, 3),
(584, 8, 148, 1),
(585, 8, 149, 2),
(586, 8, 150, 3),
(587, 8, 151, 1),
(588, 8, 152, 2),
(589, 8, 153, 2),
(590, 8, 154, 1),
(591, 8, 155, 2),
(592, 8, 156, 3),
(593, 8, 157, 1),
(594, 8, 158, 2),
(595, 8, 159, 3),
(596, 8, 64, 1),
(597, 8, 65, 2),
(598, 8, 66, 3),
(599, 8, 67, 1),
(600, 8, 68, 2),
(601, 8, 70, 1),
(602, 8, 71, 2),
(603, 8, 72, 3),
(604, 8, 73, 1),
(605, 8, 74, 2),
(606, 8, 75, 2);

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
