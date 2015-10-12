-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2015 at 04:29 PM
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
  PRIMARY KEY (`id`),
  KEY `creatureName` (`creature_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `creature`
--

INSERT INTO `creature` (`id`, `creature_name`, `food_source`, `power`, `venom`, `mortality`, `adult_height`, `adult_weight`) VALUES
(1, 'Griffin', 'Horses', 'Medicinal healing', '', '', 9, 300),
(2, 'Sybaris', 'Livestock, people', '', '', '', 20, 175),
(3, 'Fenrir', '', 'Rapid growth', '', '', 5, 145),
(4, 'Skoll', 'Sun', '', '', '', 3, 145),
(5, 'Hati Hroovitnisson', 'Moon', '', '', '', 3, 145),
(6, 'Loki', '', '', '', '', 4, 175),
(7, 'Zilant', 'Grass, Virgins, Youth', '', '', '', 6, 200);

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
-- Table structure for table `creature_how_born`
--

CREATE TABLE IF NOT EXISTS `creature_how_born` (
  `creature_id` int(11) NOT NULL,
  `how_born_id` int(11) NOT NULL,
  KEY `creature_id` (`creature_id`,`how_born_id`),
  KEY `how_born_id` (`how_born_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `creature_how_born`
--

INSERT INTO `creature_how_born` (`creature_id`, `how_born_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `creature_origin`
--

CREATE TABLE IF NOT EXISTS `creature_origin` (
  `creature_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  KEY `creature_id` (`creature_id`,`origin_id`),
  KEY `origin_id` (`origin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `creature_origin`
--

INSERT INTO `creature_origin` (`creature_id`, `origin_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 4);

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
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sound`
--

INSERT INTO `sound` (`id`, `year_recorded`, `sound_length`) VALUES
(1, 1987, 45),
(2, 1994, 30),
(3, 2006, 45),
(4, 2001, 60),
(5, 1994, 90),
(6, 1987, 45),
(7, 1982, 15);

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
-- Table structure for table `sound_sound_type`
--

CREATE TABLE IF NOT EXISTS `sound_sound_type` (
  `sound_id` int(11) NOT NULL,
  `sound_type_id` int(11) NOT NULL,
  `season` enum('Winter','Spring','Summer','Autumn') COLLATE utf8_unicode_ci NOT NULL,
  KEY `sound_id` (`sound_id`,`sound_type_id`),
  KEY `sound_type_id` (`sound_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sound_sound_type`
--

INSERT INTO `sound_sound_type` (`sound_id`, `sound_type_id`, `season`) VALUES
(1, 1, 'Spring'),
(2, 2, 'Winter'),
(3, 3, 'Summer'),
(4, 4, 'Autumn'),
(5, 5, 'Summer'),
(6, 6, 'Autumn'),
(7, 7, 'Spring');

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
-- Constraints for table `creature_animal_base_part`
--
ALTER TABLE `creature_animal_base_part`
  ADD CONSTRAINT `creature_animal_base_part_ibfk_3` FOREIGN KEY (`animal_base_id`) REFERENCES `animal_base` (`id`),
  ADD CONSTRAINT `creature_animal_base_part_ibfk_1` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`),
  ADD CONSTRAINT `creature_animal_base_part_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`);

--
-- Constraints for table `creature_how_born`
--
ALTER TABLE `creature_how_born`
  ADD CONSTRAINT `creature_how_born_ibfk_2` FOREIGN KEY (`how_born_id`) REFERENCES `how_born` (`id`),
  ADD CONSTRAINT `creature_how_born_ibfk_1` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`);

--
-- Constraints for table `creature_origin`
--
ALTER TABLE `creature_origin`
  ADD CONSTRAINT `creature_origin_ibfk_2` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`),
  ADD CONSTRAINT `creature_origin_ibfk_1` FOREIGN KEY (`creature_id`) REFERENCES `creature` (`id`);

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
-- Constraints for table `sound_individual_role`
--
ALTER TABLE `sound_individual_role`
  ADD CONSTRAINT `sound_individual_role_ibfk_3` FOREIGN KEY (`individual_id`) REFERENCES `individual` (`id`),
  ADD CONSTRAINT `sound_individual_role_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `sound` (`id`),
  ADD CONSTRAINT `sound_individual_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `sound_sound_type`
--
ALTER TABLE `sound_sound_type`
  ADD CONSTRAINT `sound_sound_type_ibfk_1` FOREIGN KEY (`sound_id`) REFERENCES `sound` (`id`),
  ADD CONSTRAINT `sound_sound_type_ibfk_2` FOREIGN KEY (`sound_type_id`) REFERENCES `sound_type` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
