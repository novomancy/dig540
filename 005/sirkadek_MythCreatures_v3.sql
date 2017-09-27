-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 13, 2015 at 12:09 PM
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
-- Table structure for table `animal_base`
--

CREATE TABLE IF NOT EXISTS `animal_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `animal_base` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `animalBase` (`animal_base`),
  KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `animal_base`
--

INSERT INTO `animal_base` (`id`, `animal_base`) VALUES
(4, 'Dragon'),
(2, 'Eagle'),
(1, 'Lion'),
(6, 'Snake'),
(5, 'Wolf'),
(3, 'Woman');

-- --------------------------------------------------------

--
-- Table structure for table `creature`
--

CREATE TABLE IF NOT EXISTS `creature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creature_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `food_source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `power` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `venom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mortality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adult_height` int(15) NOT NULL,
  `adult_weight` int(15) NOT NULL,
  `how_born_id` int(50) NOT NULL,
  `origin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creatureName` (`creature_name`),
  KEY `how_born.id` (`how_born_id`),
  KEY `birth` (`how_born_id`),
  KEY `how_born_id` (`how_born_id`),
  KEY `origin_id` (`origin_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `creature`
--

INSERT INTO `creature` (`id`, `creature_name`, `food_source`, `power`, `venom`, `mortality`, `adult_height`, `adult_weight`, `how_born_id`, `origin_id`) VALUES
(1, 'Griffin', 'Horses', 'Medicinal healing', '', '', 9, 300, 1, 1),
(2, 'Sybaris', 'Livestock, people', '', '', '', 20, 175, 1, 2),
(3, 'Fenrir', '', 'Rapid growth', '', '', 5, 145, 2, 3),
(4, 'Skoll', 'Sun', '', '', '', 3, 145, 2, 3),
(5, 'Hati Hroovitnisson', 'Moon', '', '', '', 3, 145, 2, 3),
(6, 'Loki', '', '', '', '', 4, 175, 2, 3),
(7, 'Zilant', 'Grass, Virgins, Youth', '', '', '', 6, 200, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `creature_animal_base_part`
--

CREATE TABLE IF NOT EXISTS `creature_animal_base_part` (
  `creature_id` int(11) NOT NULL,
  `part_id` int(11) NOT NULL,
  `animal_base_id` int(11) NOT NULL,
  KEY `creature_id` (`creature_id`,`part_id`,`animal_base_id`),
  KEY `part_id` (`part_id`),
  KEY `animal_base_id` (`animal_base_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `creature_animal_base_part`
--

INSERT INTO `creature_animal_base_part` (`creature_id`, `part_id`, `animal_base_id`) VALUES
(1, 1, 2),
(1, 3, 1),
(1, 4, 1),
(1, 5, 2),
(1, 6, 2),
(1, 7, 1),
(2, 1, 3),
(2, 2, 3),
(2, 4, 4),
(2, 7, 4),
(3, 8, 5),
(4, 8, 5),
(5, 8, 5),
(6, 8, 5),
(7, 3, 6),
(7, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `creature_sound`
--

CREATE TABLE IF NOT EXISTS `creature_sound` (
  `creature_id` int(11) NOT NULL,
  `sound_id` int(11) NOT NULL,
  KEY `creature_id` (`creature_id`,`sound_id`),
  KEY `sound_id` (`sound_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `creature_sound`
--

INSERT INTO `creature_sound` (`creature_id`, `sound_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `how_born`
--

CREATE TABLE IF NOT EXISTS `how_born` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `how_born` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `how_born` (`how_born`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `how_born`
--

INSERT INTO `how_born` (`id`, `how_born`) VALUES
(1, 'Hatched'),
(2, 'Live Birth');

-- --------------------------------------------------------

--
-- Table structure for table `individual`
--

CREATE TABLE IF NOT EXISTS `individual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `affiliation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lastName` (`last_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `individual`
--

INSERT INTO `individual` (`id`, `first_name`, `last_name`, `affiliation`) VALUES
(1, 'Jackie', 'Brownstein', 'MassEnt Studios'),
(2, 'Jack', 'Blackman', 'MousieBlonde'),
(3, 'Fredericka', 'James', 'Vocal Adrenaline'),
(4, 'Julius', 'McNillan', 'Mac Productions'),
(5, 'DeNalia', 'Smith', 'Empty Glass Productions');

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE IF NOT EXISTS `origin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `origin` (`origin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`id`, `origin`) VALUES
(2, 'Delphic mythology'),
(1, 'Middle Eastern folklore'),
(3, 'Norse mythology'),
(4, 'Russian legend');

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

CREATE TABLE IF NOT EXISTS `part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`id`, `part`) VALUES
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
-- Table structure for table `relationship`
--

CREATE TABLE IF NOT EXISTS `relationship` (
  `creature_id1` int(11) NOT NULL,
  `creature_id2` int(11) NOT NULL,
  `relationship_type` enum('is father of','is mother of','is offspring of','is sibling of','is spouse of','is similar to','is related to') COLLATE utf8_unicode_ci NOT NULL,
  KEY `creature_id1` (`creature_id1`,`creature_id2`),
  KEY `creature_id1_2` (`creature_id1`),
  KEY `creature_id2` (`creature_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`creature_id1`, `creature_id2`, `relationship_type`) VALUES
(3, 4, 'is father of'),
(3, 5, 'is father of'),
(3, 6, 'is offspring of'),
(4, 3, 'is offspring of'),
(5, 4, 'is sibling of'),
(5, 3, 'is offspring of'),
(6, 3, 'is father of'),
(4, 5, 'is sibling of');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'Mixer'),
(2, 'Producer'),
(3, 'Vocals'),
(4, 'Sound Effects');

-- --------------------------------------------------------

--
-- Table structure for table `sound`
--

CREATE TABLE IF NOT EXISTS `sound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_recorded` year(4) NOT NULL,
  `sound_length` int(5) NOT NULL,
  `sound_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sound_type_id` (`sound_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sound`
--

INSERT INTO `sound` (`id`, `year_recorded`, `sound_length`, `sound_type_id`) VALUES
(1, 1987, 45, 3),
(2, 1994, 30, 4),
(3, 2006, 45, 2),
(4, 2001, 60, 5),
(5, 1994, 90, 6),
(6, 1987, 45, 1),
(7, 1982, 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sound_individual_role`
--

CREATE TABLE IF NOT EXISTS `sound_individual_role` (
  `sound_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `individual_id` int(11) NOT NULL,
  KEY `sound_id` (`sound_id`,`role_id`,`individual_id`),
  KEY `role_id` (`role_id`),
  KEY `individual_id` (`individual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sound_individual_role`
--

INSERT INTO `sound_individual_role` (`sound_id`, `role_id`, `individual_id`) VALUES
(1, 2, 4),
(1, 3, 3),
(2, 2, 2),
(2, 4, 2),
(3, 1, 1),
(3, 2, 5),
(4, 2, 2),
(4, 4, 2),
(5, 1, 1),
(5, 2, 4),
(6, 1, 1),
(6, 2, 5),
(7, 2, 5),
(7, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sound_type`
--

CREATE TABLE IF NOT EXISTS `sound_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sound_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sound_type`
--

INSERT INTO `sound_type` (`id`, `sound_type`) VALUES
(1, 'Call to Female'),
(2, 'War Cry'),
(3, 'Hunting'),
(4, 'Full Moon'),
(5, 'Injuried'),
(6, 'Happy'),
(7, 'Frightened');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creature`
--
ALTER TABLE `creature`
  ADD CONSTRAINT `creature_ibfk_2` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`),
  ADD CONSTRAINT `creature_ibfk_1` FOREIGN KEY (`how_born_id`) REFERENCES `creature` (`id`);

--
-- Constraints for table `creature_animal_base_part`
--
ALTER TABLE `creature_animal_base_part`
  ADD CONSTRAINT `creature_animal_base_part_ibfk_3` FOREIGN KEY (`animal_base_id`) REFERENCES `animal_base` (`id`),
  ADD CONSTRAINT `creature_animal_base_part_ibfk_1` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`),
  ADD CONSTRAINT `creature_animal_base_part_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`);

--
-- Constraints for table `creature_sound`
--
ALTER TABLE `creature_sound`
  ADD CONSTRAINT `creature_sound_ibfk_2` FOREIGN KEY (`sound_id`) REFERENCES `sound` (`id`),
  ADD CONSTRAINT `creature_sound_ibfk_1` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`);

--
-- Constraints for table `relationship`
--
ALTER TABLE `relationship`
  ADD CONSTRAINT `relationship_ibfk_1` FOREIGN KEY (`creature_id1`) REFERENCES `creature` (`id`),
  ADD CONSTRAINT `relationship_ibfk_2` FOREIGN KEY (`creature_id2`) REFERENCES `creature` (`id`);

--
-- Constraints for table `sound`
--
ALTER TABLE `sound`
  ADD CONSTRAINT `sound_ibfk_1` FOREIGN KEY (`sound_type_id`) REFERENCES `sound_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sound_individual_role`
--
ALTER TABLE `sound_individual_role`
  ADD CONSTRAINT `sound_individual_role_ibfk_3` FOREIGN KEY (`individual_id`) REFERENCES `individual` (`id`),
  ADD CONSTRAINT `sound_individual_role_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `sound` (`id`),
  ADD CONSTRAINT `sound_individual_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
