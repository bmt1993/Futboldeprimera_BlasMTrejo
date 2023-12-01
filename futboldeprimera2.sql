-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2023 a las 21:32:08
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futboldeprimera2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonatos`
--

CREATE TABLE `campeonatos` (
  `Idcampeonato` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Campeon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `Nombre` varchar(20) NOT NULL,
  `Dt` varchar(20) NOT NULL,
  `Tamañoplantel` int(11) NOT NULL,
  `Campeonatoscortosganados` int(11) NOT NULL,
  `Campeonatoslargosganados` int(11) NOT NULL,
  `Partidosganados` int(11) NOT NULL,
  `Partidosempatados` int(11) NOT NULL,
  `Partidosperdidos` int(11) NOT NULL,
  `Golesafavor` int(11) NOT NULL,
  `Golesencontra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `Idcampeonato` int(11) NOT NULL,
  `Fecha` int(11) NOT NULL,
  `Equipolocal` varchar(20) NOT NULL,
  `Equipovisitante` varchar(20) NOT NULL,
  `Goleslocal` int(11) NOT NULL,
  `Golesvisitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD PRIMARY KEY (`Idcampeonato`),
  ADD KEY `Campeon` (`Campeon`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`Nombre`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD KEY `Equipolocal` (`Equipolocal`),
  ADD KEY `Equipovisitante` (`Equipovisitante`),
  ADD KEY `Idcampeonato` (`Idcampeonato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  MODIFY `Idcampeonato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD CONSTRAINT `campeonatos_ibfk_1` FOREIGN KEY (`Campeon`) REFERENCES `equipos` (`Nombre`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`Equipolocal`) REFERENCES `equipos` (`Nombre`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`Equipovisitante`) REFERENCES `equipos` (`Nombre`),
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`Idcampeonato`) REFERENCES `campeonatos` (`Idcampeonato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
