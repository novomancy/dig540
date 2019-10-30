-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 11:50 AM
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
-- Database: `schlitty_musical_relationships`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `album_id` int(8) NOT NULL,
  `album_title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `album_year` year(4) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `album_genre` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`album_id`, `album_title`, `album_year`, `artist_id`, `album_genre`) VALUES
(1, 'Dangerously in Love', 2003, 1, 'Hip hop');

-- --------------------------------------------------------

--
-- Table structure for table `album_track`
--

CREATE TABLE `album_track` (
  `album_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album_track`
--

INSERT INTO `album_track` (`album_id`, `track_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `artist_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `genre` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `active_years` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`, `genre`, `origin`, `active_years`) VALUES
(1, 'Beyoncé', 'Hip hop', 'Houston, Texas', '1997 - present'),
(2, 'Jay-Z', 'Hip hop', 'New York, New York', '1988 - present');

-- --------------------------------------------------------

--
-- Table structure for table `artist_person`
--

CREATE TABLE `artist_person` (
  `artist_id` int(8) NOT NULL,
  `person_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist_person`
--

INSERT INTO `artist_person` (`artist_id`, `person_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `couple`
--

CREATE TABLE `couple` (
  `couple_id` int(11) NOT NULL,
  `couple_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `relationship_type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `relationship_begin` year(4) NOT NULL,
  `relationship_end` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `couple`
--

INSERT INTO `couple` (`couple_id`, `couple_name`, `relationship_type`, `relationship_begin`, `relationship_end`) VALUES
(2, 'Beyoncé and Jay-Z', 'Married', 2002, 'Still current');

-- --------------------------------------------------------

--
-- Table structure for table `couple_person`
--

CREATE TABLE `couple_person` (
  `couple_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `couple_person`
--

INSERT INTO `couple_person` (`couple_id`, `person_id`) VALUES
(2, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `birth_year` year(4) NOT NULL,
  `death_year` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `name`, `gender`, `birth_year`, `death_year`) VALUES
(1, 'Beyoncé Knowles-Carter', 'female', 1981, 'Still alive'),
(2, 'Shawn Carter', 'male', 1969, 'Still alive');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `track_year` year(4) NOT NULL,
  `couple_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `title`, `track_year`, `couple_id`) VALUES
(1, 'Crazy in Love', 2003, 2);

-- --------------------------------------------------------

--
-- Table structure for table `track_artist`
--

CREATE TABLE `track_artist` (
  `track_id` int(8) NOT NULL,
  `artist_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track_artist`
--

INSERT INTO `track_artist` (`track_id`, `artist_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_title` (`album_title`),
  ADD KEY `album_genre` (`album_genre`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `album_track`
--
ALTER TABLE `album_track`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `name` (`name`),
  ADD KEY `genre` (`genre`),
  ADD KEY `origin` (`origin`);

--
-- Indexes for table `artist_person`
--
ALTER TABLE `artist_person`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `couple`
--
ALTER TABLE `couple`
  ADD PRIMARY KEY (`couple_id`),
  ADD KEY `couple_name` (`couple_name`);

--
-- Indexes for table `couple_person`
--
ALTER TABLE `couple_person`
  ADD KEY `couple_id` (`couple_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `title` (`title`),
  ADD KEY `couple_id` (`couple_id`);

--
-- Indexes for table `track_artist`
--
ALTER TABLE `track_artist`
  ADD KEY `track_id` (`track_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `album_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `couple`
--
ALTER TABLE `couple`
  MODIFY `couple_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`);

--
-- Constraints for table `album_track`
--
ALTER TABLE `album_track`
  ADD CONSTRAINT `album_track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`),
  ADD CONSTRAINT `album_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);

--
-- Constraints for table `artist_person`
--
ALTER TABLE `artist_person`
  ADD CONSTRAINT `artist_person_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `artist_person_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `couple_person`
--
ALTER TABLE `couple_person`
  ADD CONSTRAINT `couple_person_ibfk_1` FOREIGN KEY (`couple_id`) REFERENCES `couple` (`couple_id`),
  ADD CONSTRAINT `couple_person_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`couple_id`) REFERENCES `couple` (`couple_id`);

--
-- Constraints for table `track_artist`
--
ALTER TABLE `track_artist`
  ADD CONSTRAINT `track_artist_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`),
  ADD CONSTRAINT `track_artist_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
