-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 24, 2020 at 01:02 AM
-- Server version: 5.7.32
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
-- Database: `ajccom_Digital Archive Certificate Database 1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `Artist_ID` int(8) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Active_Years` varchar(11) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`Artist_ID`, `Name`, `Origin`, `Active_Years`) VALUES
(1, 'Tool', 'Los Angeles, California, USA', '1990-today'),
(2, 'Rammstein', 'Berlin, Germany', '1994-today'),
(3, 'Muse', 'Teignmouth, Devon, England', '1994-today'),
(4, 'Deadmau5', 'Niagara Falls, Ontario, Canada', '1998-today'),
(5, 'Anberlin', 'Winter Haven, Florida, USA', '2002-2014');

-- --------------------------------------------------------

--
-- Table structure for table `Disc`
--

CREATE TABLE `Disc` (
  `DiscID` int(11) NOT NULL,
  `Disc_Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Disc_Genre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Disc_Length` int(11) NOT NULL,
  `Artist_ID` int(8) NOT NULL,
  `Year` year(4) NOT NULL,
  `Disc_Tracks` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Disc`
--

INSERT INTO `Disc` (`DiscID`, `Disc_Title`, `Disc_Genre`, `Disc_Length`, `Artist_ID`, `Year`, `Disc_Tracks`) VALUES
(2, 'Fear Inoculum', 'Rock', 86, 1, 2019, 10),
(3, 'Reise, Reise', 'Industrial Metal', 47, 2, 2004, 11),
(4, 'Black Holes and Revelations', 'Alternative Rock', 45, 3, 2006, 11),
(5, 'Random Album Title', 'Progressive House', 72, 4, 2008, 12),
(6, 'New Surrender', 'Alternative Rock', 45, 5, 2008, 12),
(7, 'Drones', 'Alternative Rock', 52, 3, 2015, 12);

-- --------------------------------------------------------

--
-- Table structure for table `Disc_Track`
--

CREATE TABLE `Disc_Track` (
  `Disc_ID` int(8) NOT NULL,
  `Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Composer` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Artist_ID` int(8) NOT NULL,
  `Playorder` int(11) NOT NULL,
  `Track_Length` int(11) NOT NULL,
  `Track_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Disc_Track`
--

INSERT INTO `Disc_Track` (`Disc_ID`, `Title`, `Composer`, `Artist_ID`, `Playorder`, `Track_Length`, `Track_ID`) VALUES
(2, 'Pneuma', 'Adam Jones, Danny Carey, Justin Chancellor, Maynard James Keenan', 1, 2, 12, 1),
(3, 'Los', 'Richard Kruspe, Paul Landers, Till Lindemann, Christian Lorenz, Oliver Riedel, Christoph Schneider', 2, 5, 4, 2),
(4, 'Assassin', 'Matthew James Bellamy', 3, 7, 3, 3),
(5, 'Arguru', 'Joel Zimmerman, Chris Lake', 4, 11, 5, 4),
(6, 'Disappear', 'Stephen Christian, Christian McAlhaney, Joseph Milligan', 5, 6, 4, 5),
(7, 'Dead Inside', 'Matthew James Bellamy', 3, 1, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Track`
--

CREATE TABLE `Track` (
  `ID` int(8) NOT NULL,
  `Title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `Disc_ID` int(8) NOT NULL,
  `Playorder` int(11) NOT NULL,
  `Length` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Track`
--

INSERT INTO `Track` (`ID`, `Title`, `Disc_ID`, `Playorder`, `Length`) VALUES
(1, 'Pneuma', 2, 2, 12),
(2, 'Los', 3, 5, 4),
(3, 'Assassin', 4, 7, 3),
(4, 'Arguru', 5, 11, 5),
(5, 'Disappear', 6, 6, 4),
(6, 'Dead Inside', 7, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`Artist_ID`),
  ADD KEY `Name` (`Name`);

--
-- Indexes for table `Disc`
--
ALTER TABLE `Disc`
  ADD PRIMARY KEY (`DiscID`),
  ADD KEY `Disc_Title` (`Disc_Title`),
  ADD KEY `Artist_ID` (`Artist_ID`),
  ADD KEY `Disc_Genre` (`Disc_Genre`),
  ADD KEY `Disc_Length` (`Disc_Length`),
  ADD KEY `Disc_Tracks` (`Disc_Tracks`);

--
-- Indexes for table `Disc_Track`
--
ALTER TABLE `Disc_Track`
  ADD PRIMARY KEY (`Disc_ID`),
  ADD UNIQUE KEY `Disc_ID` (`Disc_ID`,`Playorder`),
  ADD KEY `Title` (`Title`),
  ADD KEY `Composer` (`Composer`),
  ADD KEY `Artist_ID` (`Artist_ID`),
  ADD KEY `Playorder` (`Playorder`),
  ADD KEY `Track_Length` (`Track_Length`),
  ADD KEY `Track_ID` (`Track_ID`);

--
-- Indexes for table `Track`
--
ALTER TABLE `Track`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `Disc_ID` (`Disc_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Artist`
--
ALTER TABLE `Artist`
  MODIFY `Artist_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Disc`
--
ALTER TABLE `Disc`
  MODIFY `DiscID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Disc_Track`
--
ALTER TABLE `Disc_Track`
  MODIFY `Disc_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Track`
--
ALTER TABLE `Track`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Disc`
--
ALTER TABLE `Disc`
  ADD CONSTRAINT `Disc_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`);

--
-- Constraints for table `Disc_Track`
--
ALTER TABLE `Disc_Track`
  ADD CONSTRAINT `Disc_Track_ibfk_1` FOREIGN KEY (`Artist_ID`) REFERENCES `Artist` (`Artist_ID`),
  ADD CONSTRAINT `Disc_Track_ibfk_2` FOREIGN KEY (`Disc_ID`) REFERENCES `Disc` (`DiscID`);

--
-- Constraints for table `Track`
--
ALTER TABLE `Track`
  ADD CONSTRAINT `Track_ibfk_1` FOREIGN KEY (`Disc_ID`) REFERENCES `Disc` (`DiscID`),
  ADD CONSTRAINT `Track_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `Disc_Track` (`Track_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
