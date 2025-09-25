-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- 생성 시간: 25-09-25 03:07
-- 서버 버전: 10.4.32-MariaDB
-- PHP 버전: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `factory`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `employee`
--

CREATE TABLE `employee` (
  `EID` varchar(50) NOT NULL,
  `EName` varchar(100) DEFAULT NULL,
  `ETEL` varchar(20) DEFAULT NULL,
  `EPOS` varchar(50) DEFAULT NULL,
  `ZONE` varchar(50) DEFAULT NULL,
  `SAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `finishedproduct`
--

CREATE TABLE `finishedproduct` (
  `Serial_fin` varchar(50) NOT NULL,
  `Stuff_Composition` text DEFAULT NULL,
  `LotN_fin` varchar(50) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `Quantity_fin` int(11) DEFAULT NULL,
  `ZONE` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `inventoryhistory`
--

CREATE TABLE `inventoryhistory` (
  `HISTORY` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Serial_stuff` varchar(50) DEFAULT NULL,
  `Quantity_stuff` int(11) DEFAULT NULL,
  `EID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `productionline`
--

CREATE TABLE `productionline` (
  `TM` varchar(50) NOT NULL,
  `PNAME` varchar(100) DEFAULT NULL,
  `EID` varchar(50) DEFAULT NULL,
  `ZONE` varchar(50) DEFAULT NULL,
  `Serial_stuff` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `stuff`
--

CREATE TABLE `stuff` (
  `Serial_stuff` varchar(50) NOT NULL,
  `Stuff_Name` varchar(100) DEFAULT NULL,
  `Supplier` varchar(100) DEFAULT NULL,
  `LotN` varchar(50) DEFAULT NULL,
  `PRICE_Stuff` decimal(10,2) DEFAULT NULL,
  `Quantity_stuff` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 테이블 구조 `warehouse`
--

CREATE TABLE `warehouse` (
  `WarehouseName` varchar(100) NOT NULL,
  `ProductionLine_TM` varchar(50) NOT NULL,
  `PNAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`);

--
-- 테이블의 인덱스 `finishedproduct`
--
ALTER TABLE `finishedproduct`
  ADD PRIMARY KEY (`Serial_fin`);

--
-- 테이블의 인덱스 `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  ADD PRIMARY KEY (`HISTORY`),
  ADD KEY `Serial_stuff` (`Serial_stuff`),
  ADD KEY `EID` (`EID`);

--
-- 테이블의 인덱스 `productionline`
--
ALTER TABLE `productionline`
  ADD PRIMARY KEY (`TM`),
  ADD KEY `EID` (`EID`),
  ADD KEY `Serial_stuff` (`Serial_stuff`);

--
-- 테이블의 인덱스 `stuff`
--
ALTER TABLE `stuff`
  ADD PRIMARY KEY (`Serial_stuff`);

--
-- 테이블의 인덱스 `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`WarehouseName`,`ProductionLine_TM`),
  ADD KEY `ProductionLine_TM` (`ProductionLine_TM`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  MODIFY `HISTORY` int(11) NOT NULL AUTO_INCREMENT;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `inventoryhistory`
--
ALTER TABLE `inventoryhistory`
  ADD CONSTRAINT `inventoryhistory_ibfk_1` FOREIGN KEY (`Serial_stuff`) REFERENCES `stuff` (`Serial_stuff`),
  ADD CONSTRAINT `inventoryhistory_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- 테이블의 제약사항 `productionline`
--
ALTER TABLE `productionline`
  ADD CONSTRAINT `productionline_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`),
  ADD CONSTRAINT `productionline_ibfk_2` FOREIGN KEY (`Serial_stuff`) REFERENCES `stuff` (`Serial_stuff`);

--
-- 테이블의 제약사항 `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`ProductionLine_TM`) REFERENCES `productionline` (`TM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
