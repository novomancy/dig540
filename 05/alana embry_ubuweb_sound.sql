-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 13, 2020 at 09:44 PM
-- Server version: 5.7.31
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
-- Database: `alanadig_ubuweb_sound`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `years` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `resources_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`, `years`, `origin`, `resources_url`) VALUES
(1, 'Apollinaire, Guillaume', '1880-1918', 'France', ''),
(2, 'Lesko, Lauren', '', 'United States', ''),
(3, 'Kieltyka, Connie', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `artist_role`
--

CREATE TABLE `artist_role` (
  `audio_id` int(8) NOT NULL,
  `artist_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_role`
--

INSERT INTO `artist_role` (`audio_id`, `artist_id`, `role_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `audio_id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `language` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `extd` text COLLATE utf8_unicode_ci NOT NULL,
  `comp_id` int(8) DEFAULT NULL,
  `playorder` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`audio_id`, `title`, `year`, `language`, `url`, `extd`, `comp_id`, `playorder`) VALUES
(1, 'Le Pont Mirabeau (Alcools)', 1913, 'French', 'http://media.sas.upenn.edu/pennsound/authors/Apollinaire/Apollinaire-Guillaume_01_Le-Pont-Mirabeau_1913.mp3', '', 1, 1),
(2, 'Marie', 1913, 'French', 'http://media.sas.upenn.edu/pennsound/authors/Apollinaire/Apollinaire-Guillaume_02_Marie_1913.mp3', '', 1, 2),
(3, 'Thirst', 1995, '', 'https://ubusound.memoryoftheworld.org/lesko_lauren/Lesko-Lauren_Thirst.mp3', 'Audio: Harvestworks, NYC\r\nEdition of 12', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audio_category`
--

CREATE TABLE `audio_category` (
  `audio_id` int(8) NOT NULL,
  `cat_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio_category`
--

INSERT INTO `audio_category` (`audio_id`, `cat_id`) VALUES
(1, 1),
(3, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(8) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `name`) VALUES
(2, 'Sound Art'),
(1, 'Symbolism');

-- --------------------------------------------------------

--
-- Table structure for table `compilation`
--

CREATE TABLE `compilation` (
  `comp_id` int(8) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compilation`
--

INSERT INTO `compilation` (`comp_id`, `title`, `year`, `description`) VALUES
(1, 'Recordings by Apollinaire', 1913, '');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `notes` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Use notes for additional data on role/instruments';

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`, `notes`) VALUES
(1, 'Poet', ''),
(2, 'Artist', ''),
(3, 'Producer', ''),
(4, 'Engineer', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`audio_id`),
  ADD KEY `title` (`title`),
  ADD KEY `comp_id` (`comp_id`);
ALTER TABLE `audio` ADD FULLTEXT KEY `extd` (`extd`);

--
-- Indexes for table `audio_category`
--
ALTER TABLE `audio_category`
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `compilation`
--
ALTER TABLE `compilation`
  ADD PRIMARY KEY (`comp_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `audio_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `compilation`
--
ALTER TABLE `compilation`
  MODIFY `comp_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD CONSTRAINT `artist_role_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `artist_role_ibfk_2` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`audio_id`),
  ADD CONSTRAINT `artist_role_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `audio`
--
ALTER TABLE `audio`
  ADD CONSTRAINT `audio_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `compilation` (`comp_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `audio_category`
--
ALTER TABLE `audio_category`
  ADD CONSTRAINT `audio_category_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`audio_id`),
  ADD CONSTRAINT `audio_category_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
