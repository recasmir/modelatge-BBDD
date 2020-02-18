-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-02-2020 a las 12:39:35
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culdampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `idAddress` int(11) NOT NULL,
  `streeet` varchar(50) NOT NULL,
  `number` varchar(5) NOT NULL,
  `floor` int(3) NOT NULL,
  `door` varchar(3) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postcode` varchar(5) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `idBrand` int(11) NOT NULL,
  `nameBrand` varchar(50) NOT NULL,
  `supplierId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `idClient` int(11) NOT NULL,
  `nameClient` varchar(50) NOT NULL,
  `addressId` int(11) NOT NULL,
  `phoneClient` tinyint(4) NOT NULL,
  `emailClient` varchar(100) NOT NULL,
  `registerDate` date NOT NULL,
  `clientRecommended` tinyint(1) NOT NULL,
  `idClientRelation` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `idEmployee` int(11) NOT NULL,
  `nameEmployee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frames`
--

CREATE TABLE `frames` (
  `idFrameType` int(11) NOT NULL,
  `floatingGlasses` tinyint(1) NOT NULL,
  `rimmedGlasses` tinyint(1) NOT NULL,
  `metalGlasses` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL,
  `strenghtGlasses` varchar(4) NOT NULL,
  `frameColour` varchar(10) NOT NULL,
  `glassColour` varchar(10) NOT NULL,
  `priceGlasses` decimal(10,0) NOT NULL,
  `frameTypeId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `brandId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE `purchases` (
  `idPurchase` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `glassesId` int(11) NOT NULL,
  `employeeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `idSupplier` int(11) NOT NULL,
  `nameSupplier` varchar(50) NOT NULL,
  `addressId` int(11) NOT NULL,
  `faxSupplier` varchar(9) NOT NULL,
  `nifSupplier` int(11) NOT NULL,
  `phoneSupplier` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`idBrand`),
  ADD KEY `supplierId` (`supplierId`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `addressId` (`addressId`),
  ADD KEY `idClient` (`idClient`),
  ADD KEY `idClientRelation` (`idClientRelation`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`idEmployee`);

--
-- Indices de la tabla `frames`
--
ALTER TABLE `frames`
  ADD PRIMARY KEY (`idFrameType`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`idGlasses`),
  ADD KEY `supplierId` (`supplierId`,`brandId`),
  ADD KEY `frameTypeId` (`frameTypeId`),
  ADD KEY `brandId` (`brandId`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`idPurchase`),
  ADD KEY `clientId` (`clientId`,`glassesId`,`employeeId`),
  ADD KEY `employeeId` (`employeeId`),
  ADD KEY `glassesId` (`glassesId`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`idSupplier`),
  ADD KEY `addressId` (`addressId`,`nifSupplier`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `frames`
--
ALTER TABLE `frames`
  MODIFY `idFrameType` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `glasses`
--
ALTER TABLE `glasses`
  MODIFY `idGlasses` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `purchases`
--
ALTER TABLE `purchases`
  MODIFY `idPurchase` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `idSupplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`idAddress`),
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  ADD CONSTRAINT `clients_ibfk_3` FOREIGN KEY (`idClientRelation`) REFERENCES `clients` (`idClient`);

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`idSupplier`),
  ADD CONSTRAINT `glasses_ibfk_2` FOREIGN KEY (`frameTypeId`) REFERENCES `frames` (`idFrameType`),
  ADD CONSTRAINT `glasses_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `brands` (`idBrand`);

--
-- Filtros para la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`idClient`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employees` (`idEmployee`),
  ADD CONSTRAINT `purchases_ibfk_3` FOREIGN KEY (`glassesId`) REFERENCES `glasses` (`idGlasses`);

--
-- Filtros para la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`idAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
