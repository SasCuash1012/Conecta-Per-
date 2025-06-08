-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2025 a las 00:15:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pryosiptel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idcomentario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacionn`
--

CREATE TABLE `evaluacionn` (
  `idevaluacion` int(11) NOT NULL,
  `idoperadora` int(11) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `Mbpscontratadas` decimal(5,2) NOT NULL,
  `Mbpsentregados` decimal(5,2) NOT NULL,
  `fecha` date NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operadoras`
--

CREATE TABLE `operadoras` (
  `idoperadora` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `satisfaccion`
--

CREATE TABLE `satisfaccion` (
  `idsatisfaccion` int(11) NOT NULL,
  `idoperadora` int(11) NOT NULL,
  `region` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `Csoporte` int(11) DEFAULT NULL CHECK (`Csoporte` between 1 and 5),
  `Catusu` int(11) DEFAULT NULL CHECK (`Catusu` between 1 and 5),
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `dni` int(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `dni`, `nombre`, `apellido`, `correo`, `contrasena`) VALUES
(2, 28280594, 'Wilson ', 'Torres Huaman ', 'lokiwilson2002@gmail.com', 'asdasd'),
(5, 3213213, 'ewqe', 'wqe', 'wqewqe@fsdsdsd.rgdf', 'wqeewqe'),
(7, 72160594, 'Wilson ', 'Loki', '213213fsdfdas@fsd.ccc', '1234'),
(8, 1111111, 'Wilson ', 'Loki', 'jesss@jessss', '21123'),
(9, 1112333, 'Wilson', 'Loki', 'asdasdg@sdfasdd', '123'),
(11, 12345678, 'Wilson', 'Loki', 'lokiwilsoeen2002@gmail.com', '1234'),
(14, 43545, '43543', '4354355', '43543@fdsfdf.fskkd', '5435');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idcomentario`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `evaluacionn`
--
ALTER TABLE `evaluacionn`
  ADD PRIMARY KEY (`idevaluacion`),
  ADD KEY `idoperadora` (`idoperadora`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `operadoras`
--
ALTER TABLE `operadoras`
  ADD PRIMARY KEY (`idoperadora`);

--
-- Indices de la tabla `satisfaccion`
--
ALTER TABLE `satisfaccion`
  ADD PRIMARY KEY (`idsatisfaccion`),
  ADD KEY `idoperadora` (`idoperadora`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `dni_2` (`dni`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evaluacionn`
--
ALTER TABLE `evaluacionn`
  MODIFY `idevaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operadoras`
--
ALTER TABLE `operadoras`
  MODIFY `idoperadora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `satisfaccion`
--
ALTER TABLE `satisfaccion`
  MODIFY `idsatisfaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `evaluacionn`
--
ALTER TABLE `evaluacionn`
  ADD CONSTRAINT `evaluacionn_ibfk_1` FOREIGN KEY (`idoperadora`) REFERENCES `operadoras` (`idoperadora`),
  ADD CONSTRAINT `evaluacionn_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `satisfaccion`
--
ALTER TABLE `satisfaccion`
  ADD CONSTRAINT `satisfaccion_ibfk_1` FOREIGN KEY (`idoperadora`) REFERENCES `operadoras` (`idoperadora`),
  ADD CONSTRAINT `satisfaccion_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
