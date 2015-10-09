-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 09, 2015 at 07:19 PM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sirkadek_MythCreatures`
--

-- --------------------------------------------------------

--
-- Table structure for table `animalBase`
--

CREATE TABLE IF NOT EXISTS `animalBase` (
  `animalBaseID` int(11) NOT NULL AUTO_INCREMENT,
  `animalBase` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`animalBaseID`),
  KEY `animalBase` (`animalBase`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `animalBase`
--

INSERT INTO `animalBase` (`animalBaseID`, `animalBase`) VALUES
(4, 'Dragon'),
(2, 'Eagle'),
(1, 'Lion'),
(6, 'Snake'),
(5, 'Wolf'),
(3, 'Woman');

-- --------------------------------------------------------

--
-- Table structure for table `Creatures`
--

CREATE TABLE IF NOT EXISTS `Creatures` (
  `creatureID` int(11) NOT NULL AUTO_INCREMENT,
  `creatureName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `howBorn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foodSource` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `power` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `venom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mortality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adultHeight` int(15) NOT NULL,
  `adultWeight` int(15) NOT NULL,
  PRIMARY KEY (`creatureID`),
  KEY `creatureName` (`creatureName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Creatures`
--

INSERT INTO `Creatures` (`creatureID`, `creatureName`, `origin`, `howBorn`, `foodSource`, `power`, `venom`, `mortality`, `adultHeight`, `adultWeight`) VALUES
(1, 'Griffin', 'Middle Eastern folklore', 'Hatched', 'Horses', 'Medicinal healing', '', '', 9, 300),
(2, 'Sybaris', 'Delphic mythology', 'Hatched', 'Livestock, people', '', '', '', 20, 175),
(3, 'Fenrir', 'Norse mythology', 'Live birth', '', 'Rapid growth', '', '', 5, 145),
(4, 'Skoll', 'Norse mythology', 'Live birth', 'Sun', '', '', '', 3, 145),
(5, 'Hati Hroovitnisson', 'Norse mythology', 'Live birth', 'Moon', '', '', '', 3, 145),
(6, 'Loki', 'Norse mythology', 'Live birth', '', '', '', '', 4, 175),
(7, 'Zilant', 'Russian legend', 'Hatched', 'Grass, Virgins, Youth', '', '', '', 6, 200);

-- --------------------------------------------------------

--
-- Table structure for table `Creatures_animalBase_Parts`
--

CREATE TABLE IF NOT EXISTS `Creatures_animalBase_Parts` (
  `creatureID` int(11) NOT NULL,
  `partID` int(11) NOT NULL,
  `animalBaseID` int(11) NOT NULL,
  KEY `creatureID` (`creatureID`),
  KEY `partID` (`partID`),
  KEY `animalBaseID` (`animalBaseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Creatures_animalBase_Parts`
--

INSERT INTO `Creatures_animalBase_Parts` (`creatureID`, `partID`, `animalBaseID`) VALUES
(1, 3, 1),
(1, 4, 1),
(1, 7, 1),
(1, 1, 2),
(1, 5, 2),
(1, 6, 2),
(2, 1, 3),
(2, 2, 3),
(2, 7, 4),
(2, 4, 4),
(3, 8, 5),
(4, 8, 5),
(5, 8, 5),
(6, 8, 5),
(7, 3, 6),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Creatures_Media`
--

CREATE TABLE IF NOT EXISTS `Creatures_Media` (
  `creatureID` int(11) NOT NULL,
  `mediaID` int(11) NOT NULL,
  KEY `creatureID` (`creatureID`),
  KEY `mediaID` (`mediaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Creatures_Media`
--

INSERT INTO `Creatures_Media` (`creatureID`, `mediaID`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Creatures_Sounds`
--

CREATE TABLE IF NOT EXISTS `Creatures_Sounds` (
  `creatureID` int(11) NOT NULL,
  `soundID` int(11) NOT NULL,
  KEY `creatureID` (`creatureID`),
  KEY `soundID` (`soundID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Creatures_Sounds`
--

INSERT INTO `Creatures_Sounds` (`creatureID`, `soundID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 7),
(5, 4),
(6, 5),
(7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Individual`
--

CREATE TABLE IF NOT EXISTS `Individual` (
  `individualID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `affiliation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`individualID`),
  KEY `lastName` (`lastName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Individual`
--

INSERT INTO `Individual` (`individualID`, `firstName`, `lastName`, `affiliation`) VALUES
(1, 'Jackie', 'Brownstein', 'MassEnt Studios'),
(2, 'Jack', 'Blackman', 'MousieBlonde'),
(3, 'Fredericka', 'James', 'Vocal Adrenaline'),
(4, 'Julius', 'McNillan', 'Mac Productions'),
(5, 'DeNalia', 'Smith', 'Empty Glass Productions');

-- --------------------------------------------------------

--
-- Table structure for table `Individual_Sounds_Role`
--

CREATE TABLE IF NOT EXISTS `Individual_Sounds_Role` (
  `soundsID` int(11) NOT NULL,
  `individualID` int(11) NOT NULL,
  `roleID` int(11) NOT NULL,
  KEY `soundsID` (`soundsID`),
  KEY `individualID` (`individualID`),
  KEY `roleID` (`roleID`),
  KEY `roleID_2` (`roleID`),
  KEY `soundsID_2` (`soundsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Individual_Sounds_Role`
--

INSERT INTO `Individual_Sounds_Role` (`soundsID`, `individualID`, `roleID`) VALUES
(1, 4, 2),
(1, 3, 3),
(2, 2, 2),
(2, 2, 4),
(3, 5, 2),
(3, 1, 1),
(7, 5, 2),
(7, 3, 3),
(4, 2, 2),
(4, 2, 4),
(5, 4, 2),
(5, 1, 1),
(6, 5, 2),
(6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Media`
--

CREATE TABLE IF NOT EXISTS `Media` (
  `mediaID` int(11) NOT NULL AUTO_INCREMENT,
  `storiesID` int(11) NOT NULL,
  `mediaType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mediaID`),
  KEY `storiesID` (`storiesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Media`
--

INSERT INTO `Media` (`mediaID`, `storiesID`, `mediaType`, `title`, `year`, `format`) VALUES
(2, 1, 'Epic Poem', 'Divine Comedy', '1320', 'Book'),
(3, 2, 'Myth', 'Metamorphoses', '1437', 'Book'),
(4, 6, 'Painting', 'Loki''s Brood', '1905', 'Poem'),
(5, 4, 'Game', 'World of Warcraft', '2004', 'Online roleplay'),
(6, 5, 'Game', 'Final Fantasy XIII', '2010', 'Video roleplay'),
(7, 6, 'Book', 'Eight Days of Luke', '1975', 'Book'),
(8, 7, 'Art', 'The Qazan', '2005', 'Sculpture');

-- --------------------------------------------------------

--
-- Table structure for table `Parts`
--

CREATE TABLE IF NOT EXISTS `Parts` (
  `partID` int(11) NOT NULL AUTO_INCREMENT,
  `part` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`partID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Parts`
--

INSERT INTO `Parts` (`partID`, `part`) VALUES
(1, 'Head'),
(2, 'Torso'),
(3, 'Body'),
(4, 'Tail'),
(5, 'Wings'),
(6, 'Front Legs'),
(7, 'Back Legs'),
(8, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `Relationship`
--

CREATE TABLE IF NOT EXISTS `Relationship` (
  `creatureID1` int(11) NOT NULL,
  `relationshipType` enum('is father of','is mother of','is offspring of','is sibling of','is mate of','is related to','is similar to') COLLATE utf8_unicode_ci NOT NULL,
  `creatureID2` int(11) NOT NULL,
  KEY `creatureID1` (`creatureID1`),
  KEY `creatureID2` (`creatureID2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Relationship`
--

INSERT INTO `Relationship` (`creatureID1`, `relationshipType`, `creatureID2`) VALUES
(3, 'is father of', 4),
(3, 'is father of', 5),
(3, 'is offspring of', 6),
(4, 'is offspring of', 3),
(4, 'is sibling of', 5),
(5, 'is sibling of', 4),
(5, 'is offspring of', 3),
(6, 'is father of', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`roleID`, `roleName`) VALUES
(1, 'Mixer'),
(2, 'Producer'),
(3, 'Vocals'),
(4, 'Sound Effects');

-- --------------------------------------------------------

--
-- Table structure for table `Sounds`
--

CREATE TABLE IF NOT EXISTS `Sounds` (
  `soundsID` int(11) NOT NULL AUTO_INCREMENT,
  `whereRecorded` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seasonRecorded` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `yearRecorded` year(4) NOT NULL,
  `howRecorded` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `soundType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `soundLength` int(5) NOT NULL,
  PRIMARY KEY (`soundsID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Sounds`
--

INSERT INTO `Sounds` (`soundsID`, `whereRecorded`, `seasonRecorded`, `yearRecorded`, `howRecorded`, `soundType`, `soundLength`) VALUES
(1, 'Adeki Studios', 'Summer', 1987, 'Analog', 'Call to females', 45),
(2, 'Adeki Studios', 'Spring', 1994, 'Analog', 'War cry', 30),
(3, 'Hunts Den', 'Fall', 2006, 'Digital', 'Hunting', 45),
(4, 'Adeki Studios', 'Spring', 2001, 'Digital', 'Call to females', 60),
(5, 'Adeki Studios', 'Summer', 1994, 'Analog', 'Injured', 90),
(6, 'Hunts Den', 'Spring', 1987, 'Analog', 'Hunting', 45),
(7, 'Hunts Den', 'Winter', 1982, 'Analog', 'Full Moon', 15);

-- --------------------------------------------------------

--
-- Table structure for table `Stories`
--

CREATE TABLE IF NOT EXISTS `Stories` (
  `storiesID` int(11) NOT NULL AUTO_INCREMENT,
  `storyName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storyOrigin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`storiesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Stories`
--

INSERT INTO `Stories` (`storiesID`, `storyName`, `storyOrigin`) VALUES
(1, 'Divine Comedy', 'Italian'),
(2, 'Tale of Sybaris', 'Greek'),
(4, 'Vafpruonismal', 'Old Norse'),
(5, 'Grimnismal', 'Old Norse'),
(6, 'Poetic Edda', 'Old Norse'),
(7, 'Zilant Legend', 'Russian');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Creatures_animalBase_Parts`
--
ALTER TABLE `Creatures_animalBase_Parts`
  ADD CONSTRAINT `Creatures_animalBase_Parts_ibfk_1` FOREIGN KEY (`creatureID`) REFERENCES `Creatures` (`creatureID`),
  ADD CONSTRAINT `Creatures_animalBase_Parts_ibfk_2` FOREIGN KEY (`partID`) REFERENCES `Parts` (`partID`),
  ADD CONSTRAINT `Creatures_animalBase_Parts_ibfk_3` FOREIGN KEY (`animalBaseID`) REFERENCES `animalBase` (`animalBaseID`);

--
-- Constraints for table `Creatures_Media`
--
ALTER TABLE `Creatures_Media`
  ADD CONSTRAINT `Creatures_Media_ibfk_1` FOREIGN KEY (`creatureID`) REFERENCES `Creatures` (`creatureID`),
  ADD CONSTRAINT `Creatures_Media_ibfk_2` FOREIGN KEY (`mediaID`) REFERENCES `Media` (`mediaID`);

--
-- Constraints for table `Creatures_Sounds`
--
ALTER TABLE `Creatures_Sounds`
  ADD CONSTRAINT `Creatures_Sounds_ibfk_1` FOREIGN KEY (`creatureID`) REFERENCES `Creatures` (`creatureID`),
  ADD CONSTRAINT `Creatures_Sounds_ibfk_2` FOREIGN KEY (`soundID`) REFERENCES `Sounds` (`soundsID`);

--
-- Constraints for table `Individual_Sounds_Role`
--
ALTER TABLE `Individual_Sounds_Role`
  ADD CONSTRAINT `Individual_Sounds_Role_ibfk_1` FOREIGN KEY (`soundsID`) REFERENCES `Sounds` (`soundsID`),
  ADD CONSTRAINT `Individual_Sounds_Role_ibfk_2` FOREIGN KEY (`individualID`) REFERENCES `Individual` (`individualID`),
  ADD CONSTRAINT `Individual_Sounds_Role_ibfk_3` FOREIGN KEY (`roleID`) REFERENCES `Role` (`roleID`);

--
-- Constraints for table `Media`
--
ALTER TABLE `Media`
  ADD CONSTRAINT `Media_ibfk_1` FOREIGN KEY (`storiesID`) REFERENCES `Stories` (`storiesID`);

--
-- Constraints for table `Relationship`
--
ALTER TABLE `Relationship`
  ADD CONSTRAINT `Relationship_ibfk_1` FOREIGN KEY (`creatureID1`) REFERENCES `Creatures` (`creatureID`),
  ADD CONSTRAINT `Relationship_ibfk_2` FOREIGN KEY (`creatureID2`) REFERENCES `Creatures` (`creatureID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
