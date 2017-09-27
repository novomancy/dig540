-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2015 at 08:38 AM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `curiocan_aacm`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `album_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `format` varchar(24) COLLATE utf8_unicode_ci NOT NULL,
  `label_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`album_title`(255),`label_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `album_title`, `date`, `format`, `label_id`) VALUES
(1, 'Young at Heart/Wise in Time', '1974-01-01', '12 inch LP', 1),
(2, 'Roscoe Mitchell Quartet', '1975-10-04', '12 inch LP', 2),
(3, 'Duets', '1976-12-16', '12 inch LP', 2);

-- --------------------------------------------------------

--
-- Table structure for table `instrument`
--

CREATE TABLE IF NOT EXISTS `instrument` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `instrument_name` varchar(72) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`instrument_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `instrument`
--

INSERT INTO `instrument` (`id`, `instrument_name`) VALUES
(2, 'alto saxophone'),
(7, 'b flat soprano saxophone'),
(5, 'bass'),
(4, 'flugelhorn'),
(10, 'guitar'),
(6, 'percussion'),
(1, 'piano'),
(11, 'reeds'),
(8, 'tenor saxophone'),
(9, 'trombone'),
(3, 'trumpet');

-- --------------------------------------------------------

--
-- Table structure for table `instrument_musician`
--

CREATE TABLE IF NOT EXISTS `instrument_musician` (
  `instrument_id` int(8) NOT NULL,
  `musician_id` int(8) NOT NULL,
  KEY `instrument_id` (`instrument_id`,`musician_id`),
  KEY `musician_id` (`musician_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instrument_musician`
--

INSERT INTO `instrument_musician` (`instrument_id`, `musician_id`) VALUES
(1, 1),
(2, 2),
(2, 6),
(3, 3),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 6),
(9, 7),
(10, 8),
(11, 6),
(11, 9);

-- --------------------------------------------------------

--
-- Table structure for table `instrument_track`
--

CREATE TABLE IF NOT EXISTS `instrument_track` (
  `instrument_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `ins_id` (`instrument_id`,`track_id`),
  KEY `track_id` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `instrument_track`
--

INSERT INTO `instrument_track` (`instrument_id`, `track_id`) VALUES
(1, 1),
(1, 1),
(1, 3),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 3),
(8, 5),
(8, 6),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(10, 3),
(10, 5),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 11),
(11, 13);

-- --------------------------------------------------------

--
-- Table structure for table `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `label_location` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`label_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `label`
--

INSERT INTO `label` (`id`, `label_name`, `label_location`) VALUES
(1, 'Delmark', 'Chicago, Illinois, USA'),
(2, 'Sackville', 'Toronto, Ontario, Canada');

-- --------------------------------------------------------

--
-- Table structure for table `musician`
--

CREATE TABLE IF NOT EXISTS `musician` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `musician_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `years_active` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`musician_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `musician`
--

INSERT INTO `musician` (`id`, `musician_name`, `origin`, `years_active`) VALUES
(1, 'Muhal Richard Abrams', 'Chicago, Illinois, USA', '1950-present'),
(2, 'Leo Smith', 'New York, New York, USA', '1967-present'),
(3, 'Henry Threadgill', 'Chicago, Illinois, USA', '1970-present'),
(4, 'Lester Lashley', 'Chicago, Illinois, USA', '1966-1990'),
(5, 'Thurman Barker', 'Chicago, Illinois, USA', '1966-present'),
(6, 'Roscoe Mitchell', 'Chicago, Illinois, USA', '1961-present'),
(7, 'George Lewis', 'Chicago, Illinois, USA', '1974-present'),
(8, 'Spencer Barefield', 'Detroit, Michigan, USA', '1972-present'),
(9, 'Anthony Braxton', 'Chicago, Illinois, USA', '1968-present');

-- --------------------------------------------------------

--
-- Table structure for table `musician_track`
--

CREATE TABLE IF NOT EXISTS `musician_track` (
  `musician_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  `musician_role` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `musician_id_2` (`musician_id`,`track_id`,`musician_role`),
  KEY `track_id` (`track_id`),
  KEY `musician_id` (`musician_id`,`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `musician_track`
--

INSERT INTO `musician_track` (`musician_id`, `track_id`, `musician_role`) VALUES
(1, 1, 'lead'),
(1, 2, 'lead'),
(1, 3, 'guest'),
(1, 5, 'guest'),
(2, 1, 'guest'),
(2, 2, 'guest'),
(3, 1, 'guest'),
(3, 2, 'guest'),
(4, 1, 'guest'),
(4, 2, 'guest'),
(6, 3, 'lead'),
(6, 4, 'lead'),
(6, 5, 'lead'),
(6, 6, 'lead'),
(6, 7, 'guest'),
(6, 8, 'guest'),
(6, 9, 'guest'),
(6, 10, 'guest'),
(6, 11, 'guest'),
(6, 12, 'guest'),
(6, 13, 'guest'),
(7, 3, 'guest'),
(7, 4, 'guest'),
(7, 5, 'guest'),
(7, 6, 'guest'),
(8, 3, 'guest'),
(8, 5, 'guest'),
(9, 7, 'lead'),
(9, 8, 'lead'),
(9, 9, 'lead'),
(9, 10, 'lead'),
(9, 11, 'lead'),
(9, 12, 'lead'),
(9, 13, 'lead');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `track_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `duration` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `album_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`track_title`(255),`album_id`),
  KEY `album_id` (`album_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `track_title`, `duration`, `album_id`) VALUES
(1, 'Young at Heart', '29:20', 1),
(2, 'Wise in Time', '24:52', 1),
(3, 'Tnoona', '6:46', 2),
(4, 'Music for Trombone and B Flat Soprano', '14:34', 2),
(5, 'Cards', '9:58', 2),
(6, 'Olobo', '9:38', 2),
(7, 'Five Twenty One Equals Eight', '4:52', 3),
(8, 'Line Fine Lyon Seven', '1:15', 3),
(9, 'Seven Behind Nine Ninety-Seven Sixteen or Seven', '2:37', 3),
(10, 'Cards-Three and Open', '10:52', 3),
(11, 'Composition 40Q', '6:46', 3),
(12, 'Composition 74B', '6:35', 3),
(13, 'Composition 74A', '7:56', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `label` (`id`);

--
-- Constraints for table `instrument_musician`
--
ALTER TABLE `instrument_musician`
  ADD CONSTRAINT `instrument_musician_ibfk_2` FOREIGN KEY (`musician_id`) REFERENCES `musician` (`id`),
  ADD CONSTRAINT `instrument_musician_ibfk_1` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`);

--
-- Constraints for table `instrument_track`
--
ALTER TABLE `instrument_track`
  ADD CONSTRAINT `instrument_track_ibfk_3` FOREIGN KEY (`instrument_id`) REFERENCES `instrument` (`id`),
  ADD CONSTRAINT `instrument_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `musician_track`
--
ALTER TABLE `musician_track`
  ADD CONSTRAINT `musician_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `musician_track_ibfk_3` FOREIGN KEY (`musician_id`) REFERENCES `musician` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
