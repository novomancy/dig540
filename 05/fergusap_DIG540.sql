-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 14, 2020 at 06:06 PM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fergusap_DIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `Origin`
--

CREATE TABLE `Origin` (
  `Id` int(8) NOT NULL,
  `Date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Song`
--

CREATE TABLE `Song` (
  `Id` int(11) NOT NULL,
  `Author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Origin` int(8) NOT NULL,
  `Score_ID` int(8) NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  `Rights_ID` int(8) NOT NULL,
  `Derivatives_ID` int(8) NOT NULL,
  `Description` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Origin`
--
ALTER TABLE `Origin`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Country` (`Date`);

--
-- Indexes for table `Song`
--
ALTER TABLE `Song`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Score_ID` (`Score_ID`),
  ADD KEY `Author` (`Author`),
  ADD KEY `Origin` (`Origin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Origin`
--
ALTER TABLE `Origin`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Song`
--
ALTER TABLE `Song`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Song`
--
ALTER TABLE `Song`
  ADD CONSTRAINT `Song_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `Origin` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
