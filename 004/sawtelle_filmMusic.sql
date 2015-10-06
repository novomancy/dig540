-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2015 at 07:42 PM
-- Server version: 5.5.42-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yippeezi_filmMusic`
--

-- --------------------------------------------------------

--
-- Table structure for table `cadence`
--

CREATE TABLE IF NOT EXISTS `cadence` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contributor`
--

CREATE TABLE IF NOT EXISTS `contributor` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `born` date DEFAULT NULL COMMENT 'YYYY/DD/MM',
  `died` date DEFAULT NULL COMMENT 'YYYY/DD/MM',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `contributor_movie`
--

CREATE TABLE IF NOT EXISTS `contributor_movie` (
  `contributor_id` int(8) NOT NULL,
  `movie_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL,
  KEY `contributor_id` (`contributor_id`,`movie_id`,`role_id`),
  KEY `movie_id` (`movie_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contributor_track`
--

CREATE TABLE IF NOT EXISTS `contributor_track` (
  `contributor_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL,
  KEY `contributor_id` (`contributor_id`,`track_id`,`role_id`),
  KEY `track_id` (`track_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modulation`
--

CREATE TABLE IF NOT EXISTS `modulation` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mood`
--

CREATE TABLE IF NOT EXISTS `mood` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `copyrightDate` year(4) NOT NULL,
  `contributor_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL,
  `studio_id` int(8) NOT NULL,
  `movieGenre_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`,`contributor_id`,`role_id`,`studio_id`,`movieGenre_id`),
  KEY `contributor_id` (`contributor_id`),
  KEY `role_id` (`role_id`),
  KEY `studio_id` (`studio_id`),
  KEY `movieGenre_id` (`movieGenre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movieGenre`
--

CREATE TABLE IF NOT EXISTS `movieGenre` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movieScore`
--

CREATE TABLE IF NOT EXISTS `movieScore` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `track_id` int(8) NOT NULL,
  `movie_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`,`movie_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movie_scene`
--

CREATE TABLE IF NOT EXISTS `movie_scene` (
  `movie_id` int(8) NOT NULL,
  `scene_id` int(8) NOT NULL,
  KEY `movie_id` (`movie_id`,`scene_id`),
  KEY `scene_id` (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movie_track`
--

CREATE TABLE IF NOT EXISTS `movie_track` (
  `movie_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  KEY `movie_id` (`movie_id`,`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `musicGenre`
--

CREATE TABLE IF NOT EXISTS `musicGenre` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `plotElement`
--

CREATE TABLE IF NOT EXISTS `plotElement` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scale`
--

CREATE TABLE IF NOT EXISTS `scale` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scene`
--

CREATE TABLE IF NOT EXISTS `scene` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `track_id` int(8) NOT NULL,
  `movie_id` int(8) NOT NULL,
  `plotElement_id` int(8) NOT NULL,
  `sceneMood_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`track_id`,`movie_id`),
  KEY `track_id` (`track_id`),
  KEY `movie_id` (`movie_id`),
  KEY `plotElement_id` (`plotElement_id`),
  KEY `sceneMood_id` (`sceneMood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scene_mood`
--

CREATE TABLE IF NOT EXISTS `scene_mood` (
  `scene_id` int(8) NOT NULL,
  `mood_id` int(8) NOT NULL,
  KEY `scene_id` (`scene_id`,`mood_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scene_plotElement`
--

CREATE TABLE IF NOT EXISTS `scene_plotElement` (
  `scene_id` int(8) NOT NULL,
  `plotElement_id` int(8) NOT NULL,
  KEY `scene_id` (`scene_id`,`plotElement_id`),
  KEY `plotElement_id` (`plotElement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studio`
--

CREATE TABLE IF NOT EXISTS `studio` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contributor_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL,
  `publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `copyrightDate` year(4) NOT NULL,
  `musicGenre_id` int(8) NOT NULL,
  `modulation_id` int(8) NOT NULL,
  `scale_id` int(8) NOT NULL,
  `cadence_id` int(8) NOT NULL,
  `mood_id` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`,`contributor_id`,`musicGenre_id`,`mood_id`),
  KEY `role_id` (`role_id`),
  KEY `contributor_id` (`contributor_id`),
  KEY `musicGenre_id` (`musicGenre_id`),
  KEY `modulation_id` (`modulation_id`),
  KEY `scale_id` (`scale_id`),
  KEY `cadence_id` (`cadence_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `track_cadence`
--

CREATE TABLE IF NOT EXISTS `track_cadence` (
  `track_id` int(8) NOT NULL,
  `cadence_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`cadence_id`),
  KEY `cadence_id` (`cadence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_modulation`
--

CREATE TABLE IF NOT EXISTS `track_modulation` (
  `track_id` int(8) NOT NULL,
  `modulation_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`),
  KEY `modulation_id` (`modulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_mood`
--

CREATE TABLE IF NOT EXISTS `track_mood` (
  `track_id` int(8) NOT NULL,
  `mood_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`mood_id`),
  KEY `mood_id` (`mood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_movie`
--

CREATE TABLE IF NOT EXISTS `track_movie` (
  `track_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  KEY `track_id` (`track_id`,`movie_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_musicGenre`
--

CREATE TABLE IF NOT EXISTS `track_musicGenre` (
  `track_id` int(8) NOT NULL,
  `musicGenre_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`musicGenre_id`),
  KEY `musicGenre_id` (`musicGenre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_scale`
--

CREATE TABLE IF NOT EXISTS `track_scale` (
  `track_id` int(8) NOT NULL,
  `scale_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`scale_id`),
  KEY `scale_id` (`scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track_scene`
--

CREATE TABLE IF NOT EXISTS `track_scene` (
  `track_id` int(8) NOT NULL,
  `scene_id` int(8) NOT NULL,
  KEY `track_id` (`track_id`,`scene_id`),
  KEY `scene_id` (`scene_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contributor_movie`
--
ALTER TABLE `contributor_movie`
  ADD CONSTRAINT `contributor_movie_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `contributor_movie_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `contributor` (`id`),
  ADD CONSTRAINT `contributor_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Constraints for table `contributor_track`
--
ALTER TABLE `contributor_track`
  ADD CONSTRAINT `contributor_track_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `contributor_track_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `contributor` (`id`),
  ADD CONSTRAINT `contributor_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `movie_ibfk_4` FOREIGN KEY (`movieGenre_id`) REFERENCES `movieGenre` (`id`),
  ADD CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `contributor_movie` (`contributor_id`),
  ADD CONSTRAINT `movie_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `contributor_movie` (`role_id`),
  ADD CONSTRAINT `movie_ibfk_3` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`id`);

--
-- Constraints for table `movieScore`
--
ALTER TABLE `movieScore`
  ADD CONSTRAINT `movieScore_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `track_movie` (`movie_id`),
  ADD CONSTRAINT `movieScore_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track_movie` (`track_id`);

--
-- Constraints for table `movie_scene`
--
ALTER TABLE `movie_scene`
  ADD CONSTRAINT `movie_scene_ibfk_2` FOREIGN KEY (`scene_id`) REFERENCES `scene` (`id`),
  ADD CONSTRAINT `movie_scene_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Constraints for table `scene`
--
ALTER TABLE `scene`
  ADD CONSTRAINT `scene_ibfk_4` FOREIGN KEY (`sceneMood_id`) REFERENCES `scene_mood` (`mood_id`),
  ADD CONSTRAINT `scene_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track_scale` (`track_id`),
  ADD CONSTRAINT `scene_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie_scene` (`movie_id`),
  ADD CONSTRAINT `scene_ibfk_3` FOREIGN KEY (`plotElement_id`) REFERENCES `scene_plotElement` (`plotElement_id`);

--
-- Constraints for table `scene_mood`
--
ALTER TABLE `scene_mood`
  ADD CONSTRAINT `scene_mood_ibfk_2` FOREIGN KEY (`mood_id`) REFERENCES `mood` (`id`),
  ADD CONSTRAINT `scene_mood_ibfk_1` FOREIGN KEY (`scene_id`) REFERENCES `scene` (`id`);

--
-- Constraints for table `scene_plotElement`
--
ALTER TABLE `scene_plotElement`
  ADD CONSTRAINT `scene_plotElement_ibfk_2` FOREIGN KEY (`plotElement_id`) REFERENCES `plotElement` (`id`),
  ADD CONSTRAINT `scene_plotElement_ibfk_1` FOREIGN KEY (`scene_id`) REFERENCES `scene` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_7` FOREIGN KEY (`mood_id`) REFERENCES `track_mood` (`mood_id`),
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `contributor_track` (`contributor_id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `contributor_track` (`role_id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`musicGenre_id`) REFERENCES `track_musicGenre` (`musicGenre_id`),
  ADD CONSTRAINT `track_ibfk_4` FOREIGN KEY (`modulation_id`) REFERENCES `track_modulation` (`modulation_id`),
  ADD CONSTRAINT `track_ibfk_5` FOREIGN KEY (`scale_id`) REFERENCES `track_scale` (`scale_id`),
  ADD CONSTRAINT `track_ibfk_6` FOREIGN KEY (`cadence_id`) REFERENCES `track_cadence` (`cadence_id`);

--
-- Constraints for table `track_cadence`
--
ALTER TABLE `track_cadence`
  ADD CONSTRAINT `track_cadence_ibfk_2` FOREIGN KEY (`cadence_id`) REFERENCES `cadence` (`id`),
  ADD CONSTRAINT `track_cadence_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_modulation`
--
ALTER TABLE `track_modulation`
  ADD CONSTRAINT `track_modulation_ibfk_2` FOREIGN KEY (`modulation_id`) REFERENCES `modulation` (`id`),
  ADD CONSTRAINT `track_modulation_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_mood`
--
ALTER TABLE `track_mood`
  ADD CONSTRAINT `track_mood_ibfk_2` FOREIGN KEY (`mood_id`) REFERENCES `mood` (`id`),
  ADD CONSTRAINT `track_mood_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_movie`
--
ALTER TABLE `track_movie`
  ADD CONSTRAINT `track_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `track_movie_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_musicGenre`
--
ALTER TABLE `track_musicGenre`
  ADD CONSTRAINT `track_musicGenre_ibfk_2` FOREIGN KEY (`musicGenre_id`) REFERENCES `musicGenre` (`id`),
  ADD CONSTRAINT `track_musicGenre_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_scale`
--
ALTER TABLE `track_scale`
  ADD CONSTRAINT `track_scale_ibfk_2` FOREIGN KEY (`scale_id`) REFERENCES `scale` (`id`),
  ADD CONSTRAINT `track_scale_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_scene`
--
ALTER TABLE `track_scene`
  ADD CONSTRAINT `track_scene_ibfk_2` FOREIGN KEY (`scene_id`) REFERENCES `scene` (`id`),
  ADD CONSTRAINT `track_scene_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
