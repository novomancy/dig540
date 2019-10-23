-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2019 at 01:46 AM
-- Server version: 10.2.26-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librari2_zacharydig540`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(8) NOT NULL,
  `name` varchar(865) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `label` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `name`, `year`, `label`) VALUES
(1, '20/20', 2020, 'Z-LYT Records');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `name`) VALUES
(1, 'Rap/Hip-hop'),
(2, 'Contemporary R&B'),
(3, 'Alternative Rock'),
(4, 'Metal');

-- --------------------------------------------------------

--
-- Table structure for table `original_album`
--

CREATE TABLE `original_album` (
  `original_album_id` int(11) NOT NULL,
  `name` varchar(865) COLLATE utf8_unicode_ci NOT NULL,
  `original_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `original_album`
--

INSERT INTO `original_album` (`original_album_id`, `name`, `original_year`) VALUES
(14, 'BUILD', 2018),
(15, 'FAST LIFE', 2016),
(16, 'Vickatnite', 2019),
(17, 'Oceans', 2017),
(18, 'Green Haven', 2017),
(19, 'True Colors', 2019),
(20, 'Baby Steps', 2017),
(21, 'Single', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `years_active` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `name`, `years_active`, `origin`) VALUES
(10, 'Sunny Z', '2014-', 'Florida'),
(11, 'D-LYT', '2014-', 'Florida'),
(12, 'J. Mars', '2013-', 'Toronto'),
(13, 'Theodora', '2011-', 'Florida'),
(14, 'Vctr.', '2017-', 'Connecticut'),
(15, 'T. Smith', '2013-', 'Florida'),
(16, 'Green Haven', '2015-', 'Florida'),
(17, 'Madtown', '2015-', 'Florida'),
(18, 'Razor Boomerang', '2012-', 'Florida');

-- --------------------------------------------------------

--
-- Table structure for table `person_role_track`
--

CREATE TABLE `person_role_track` (
  `track_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_role_track`
--

INSERT INTO `person_role_track` (`track_id`, `person_id`, `role_id`) VALUES
(11, 10, 1),
(11, 11, 1),
(11, 11, 3),
(11, 18, 4),
(12, 12, 1),
(12, 11, 3),
(12, 18, 4),
(13, 14, 1),
(13, 11, 3),
(13, 18, 4),
(14, 13, 1),
(14, 13, 2),
(14, 18, 4),
(15, 16, 1),
(15, 16, 2),
(15, 18, 4),
(16, 17, 1),
(16, 17, 2),
(16, 18, 4),
(17, 12, 1),
(17, 11, 3),
(17, 18, 4),
(18, 15, 1),
(18, 11, 3),
(19, 12, 1),
(19, 10, 1),
(19, 11, 1),
(19, 11, 3),
(19, 18, 4),
(20, 10, 1),
(20, 11, 1),
(20, 11, 3),
(20, 18, 4);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`) VALUES
(1, 'Vocalist'),
(2, 'Instrumentalist'),
(3, 'Producer'),
(4, 'Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `length` text COLLATE utf8_unicode_ci NOT NULL,
  `bpm` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `album_id` int(11) NOT NULL,
  `original_album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `name`, `number`, `length`, `bpm`, `album_id`, `original_album_id`) VALUES
(11, 'LOUDHOUSE', '1', '2:32', '115', 1, 14),
(12, 'Fast Life', '2', '2:32', '115', 1, 15),
(13, 'Where''d You Go?', '3', '2:34', '100', 1, 16),
(14, 'Tougher Than This', '4', '2:08', '130', 1, 17),
(15, 'Underneath', '5', '3:50', '143', 1, 18),
(16, 'Hand in Hand', '6', '3:02', '165', 1, 19),
(17, 'Casual', '7', '5:08', '101', 1, 15),
(18, 'Open Out', '8', '3:32', '140', 1, 20),
(19, 'Suspect (feat. Sunny Z & D-LYT)', '9', '2:45', '95', 1, 21),
(20, 'NEXT', '10', '3:04', '102', 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `track_genre`
--

CREATE TABLE `track_genre` (
  `track_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track_genre`
--

INSERT INTO `track_genre` (`track_id`, `genre_id`) VALUES
(11, 1),
(12, 2),
(13, 2),
(14, 2),
(15, 3),
(16, 4),
(17, 2),
(18, 1),
(19, 1),
(20, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `original_album`
--
ALTER TABLE `original_album`
  ADD PRIMARY KEY (`original_album_id`),
  ADD KEY `original_album_id` (`original_album_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `name` (`name`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person_role_track`
--
ALTER TABLE `person_role_track`
  ADD KEY `role_id` (`role_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `name` (`name`),
  ADD KEY `original_album_id` (`original_album_id`);

--
-- Indexes for table `track_genre`
--
ALTER TABLE `track_genre`
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `track_id` (`track_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `original_album`
--
ALTER TABLE `original_album`
  MODIFY `original_album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `person_role_track`
--
ALTER TABLE `person_role_track`
  ADD CONSTRAINT `person_role_track_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  ADD CONSTRAINT `person_role_track_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `person_role_track_ibfk_3` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`original_album_id`) REFERENCES `original_album` (`original_album_id`);

--
-- Constraints for table `track_genre`
--
ALTER TABLE `track_genre`
  ADD CONSTRAINT `track_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  ADD CONSTRAINT `track_genre_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
