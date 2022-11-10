-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2022 at 10:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `empresaeventos`
--

-- --------------------------------------------------------

--
-- Table structure for table `actividades`
--

CREATE TABLE `actividades` (
  `IdActividad` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `IdSubEvento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actividades`
--

INSERT INTO `actividades` (`IdActividad`, `Nombre`, `IdSubEvento`) VALUES
(1, 'Definicion de DAW', 1),
(2, 'Creacion de pagina', 1),
(3, 'Questionario', 1),
(4, 'Historia y evolucion', 2),
(5, 'Lenguajes de prog', 2),
(6, 'Programas no-code', 2),
(7, 'Questionario', 2),
(8, 'Importancia del ingles', 3),
(9, 'Ingles tecnico', 3),
(10, 'Questionario', 3),
(11, 'Creacion CV', 4),
(12, 'Linkedin', 4),
(13, 'Mundo Laboral', 4);

-- --------------------------------------------------------

--
-- Table structure for table `detalleparticipante`
--

CREATE TABLE `detalleparticipante` (
  `IdSubEvento` int(11) NOT NULL,
  `IdParticipante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detalleparticipante`
--

INSERT INTO `detalleparticipante` (`IdSubEvento`, `IdParticipante`) VALUES
(1, 2),
(1, 4),
(1, 5),
(1, 7),
(1, 9),
(1, 11),
(1, 12),
(1, 14),
(2, 1),
(2, 3),
(2, 7),
(2, 11),
(2, 13),
(3, 1),
(3, 4),
(3, 8),
(3, 9),
(3, 12),
(3, 13),
(4, 2),
(4, 3),
(4, 6),
(4, 8),
(4, 10),
(4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE `eventos` (
  `IdEvento` int(11) NOT NULL,
  `Titulo` varchar(25) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Fecha` date NOT NULL COMMENT 'fecha',
  `Duracion` int(11) NOT NULL COMMENT 'en Dias'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eventos`
--

INSERT INTO `eventos` (`IdEvento`, `Titulo`, `Descripcion`, `Fecha`, `Duracion`) VALUES
(1, 'Semana Informatica', 'En la Semana Informatica se celebraran 4 eventos sobre tecnologia e informatica, asi como las posibilidades de trabajo y facilidades para entrar en empresas de este sector.', '2022-11-14', 4);

-- --------------------------------------------------------

--
-- Table structure for table `lugar`
--

CREATE TABLE `lugar` (
  `IdLugar` int(11) NOT NULL,
  `Tipo` char(1) NOT NULL COMMENT 'P: Presencial / O: Online',
  `Enlace` varchar(100) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Capacidad` int(11) NOT NULL,
  `Aula` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lugar`
--

INSERT INTO `lugar` (`IdLugar`, `Tipo`, `Enlace`, `Nombre`, `Capacidad`, `Aula`, `Direccion`) VALUES
(1, 'p', '', 'Nazaret', 30, 414, 'Aldakoenea, 36 - 20012 Donostia - San Sebastián');

-- --------------------------------------------------------

--
-- Table structure for table `participantes`
--

CREATE TABLE `participantes` (
  `IdParticipante` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Telefono` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participantes`
--

INSERT INTO `participantes` (`IdParticipante`, `Nombre`, `Apellido`, `Correo`, `Edad`, `Telefono`) VALUES
(1, 'Oier', 'Rojo', 'oi.rojo@aulanz.net', 32, '671495609'),
(2, 'Telmo', 'Barandiaran', 'te.barandiaran@aulanz.net', 19, '682940203'),
(3, 'Carmelo', 'Ovono', 'ca.ovono@aulanz.net', 22, '689304022'),
(4, 'Galder', 'Melica', 'ga.melika@aulanz.net', 18, '671142552'),
(5, 'Miguel', 'Federico', 'miguelfede@gmail.com', 21, '693051223'),
(6, 'Mariano', 'Rajoy', 'marianito@gmail.com', 30, '693960321'),
(7, 'Yoel', 'Hernandez', 'hernandezyoel@gmail.com', 24, '654390765'),
(8, 'Issam', 'El Ouafa', 'is.elouafa@aulanz.net', 21, '639592945'),
(9, 'Lionel', 'Messi', 'leomessi@gmail.com', 33, '612334345'),
(10, 'Cristiano', 'Ronaldo', 'cristianito@gmail.com', 45, '687665943'),
(11, 'Juan', 'Rodriguez', 'tujuanito@gmail.com', 18, '692934919'),
(12, ' Ismael', 'Perez', 'ismaelperez@gmail.com', 25, '689021565'),
(13, 'Juan', 'Miguel', 'juanmi@gmail.com', 26, '697384823'),
(14, 'Xabier', 'Hernandez', 'xabiher@gmail.com', 19, '687902239');

-- --------------------------------------------------------

--
-- Table structure for table `subeventos`
--

CREATE TABLE `subeventos` (
  `IdSubEvento` int(11) NOT NULL,
  `Titulo` varchar(25) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Fecha` date NOT NULL,
  `Duracion` int(11) NOT NULL COMMENT 'en horas',
  `IdEvento` int(11) NOT NULL,
  `IdLugar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subeventos`
--

INSERT INTO `subeventos` (`IdSubEvento`, `Titulo`, `Descripcion`, `Fecha`, `Duracion`, `IdEvento`, `IdLugar`) VALUES
(1, 'Desarollo Web', '¿Que es el Desarrollo Web?\r\nComo crear una página desde cero:\r\nQue son HTML, CSS, JS\r\nQue son los Frameworks, Bootstrap, ReactJS\r\n', '2022-11-14', 5, 1, 1),
(2, 'Programacion', 'La Historia y la evolución de la programacion,\r\nCuales son los lenguajes de programación mas utilizados, que es la Programación \"NO-CODE\"\r\n', '2022-11-15', 5, 1, 1),
(3, 'Ingles para informaticos', 'La importancia del ingles en el mundo de la informatica.\r\nComo aprovechar el ingles en la informatica adecuadamente.', '2022-11-16', 5, 1, 1),
(4, 'Fol para informaticos', 'Como crear un CV y un portfolio para un informatico o un desarrollador.\r\nLa importancia de linkedin y como hacer una cuenta profesional.\r\nComo encontrar trabajo como desarrollador.', '2022-11-17', 5, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`IdActividad`),
  ADD KEY `IdSubEvento` (`IdSubEvento`);

--
-- Indexes for table `detalleparticipante`
--
ALTER TABLE `detalleparticipante`
  ADD PRIMARY KEY (`IdSubEvento`,`IdParticipante`),
  ADD KEY `IdParticipante` (`IdParticipante`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`IdEvento`);

--
-- Indexes for table `lugar`
--
ALTER TABLE `lugar`
  ADD PRIMARY KEY (`IdLugar`);

--
-- Indexes for table `participantes`
--
ALTER TABLE `participantes`
  ADD PRIMARY KEY (`IdParticipante`);

--
-- Indexes for table `subeventos`
--
ALTER TABLE `subeventos`
  ADD PRIMARY KEY (`IdSubEvento`),
  ADD KEY `IdEvento` (`IdEvento`),
  ADD KEY `IdLugar` (`IdLugar`),
  ADD KEY `IdLugar_2` (`IdLugar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `participantes`
--
ALTER TABLE `participantes`
  MODIFY `IdParticipante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `actividades_ibfk_1` FOREIGN KEY (`IdSubEvento`) REFERENCES `subeventos` (`IdSubEvento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detalleparticipante`
--
ALTER TABLE `detalleparticipante`
  ADD CONSTRAINT `detalleparticipante_ibfk_2` FOREIGN KEY (`IdSubEvento`) REFERENCES `subeventos` (`IdSubEvento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleparticipante_ibfk_3` FOREIGN KEY (`IdParticipante`) REFERENCES `participantes` (`IdParticipante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subeventos`
--
ALTER TABLE `subeventos`
  ADD CONSTRAINT `subeventos_ibfk_1` FOREIGN KEY (`IdEvento`) REFERENCES `eventos` (`IdEvento`),
  ADD CONSTRAINT `subeventos_ibfk_2` FOREIGN KEY (`IdLugar`) REFERENCES `lugar` (`IdLugar`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
