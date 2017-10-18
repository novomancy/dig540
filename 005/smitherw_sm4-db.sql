-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 18, 2017 at 01:06 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smitherw_sm4-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(8) NOT NULL,
  `last_name` varchar(256) CHARACTER SET latin1 NOT NULL,
  `first_name` varchar(256) CHARACTER SET latin1 NOT NULL,
  `notes` mediumtext CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `last_name`, `first_name`, `notes`) VALUES
(1, 'Smitherman', 'Paul', 'Paul Smitherman has been creating music and visual media since the 1970s. He currently resides in Orono, Maine.'),
(2, 'Heide', 'Bret', 'Bret Heide is one of the world\'s greatest guitarists, songwriter and all-around snarky fellow. His last known whereabouts were on Ascension Island.');

-- --------------------------------------------------------

--
-- Table structure for table `audio_object`
--

CREATE TABLE `audio_object` (
  `id` int(11) NOT NULL,
  `track_id` int(8) NOT NULL,
  `format` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio_object`
--

INSERT INTO `audio_object` (`id`, `track_id`, `format`, `title`, `year`, `notes`) VALUES
(1, 1, 'Audio Cassette', 'Brother Paul', 1989, 'A compilation of both vocal and instrumental tunes recorded by Paul from July to December 1989.');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(8) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `name` varchar(256) CHARACTER SET latin1 NOT NULL,
  `notes` mediumtext CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `latitude`, `longitude`, `name`, `notes`) VALUES
(1, 44.8204, -68.8215, 'Horizon Inn', 'The Horizon Inn at Bangor ANGB was the enlisted dormitory for active duty USAF personnel working on the OTH-B radar project from the mid 1980s to the mid 1990s.'),
(2, 44.8054, -68.7723, 'Spring Street', 'The third floor apartment on Spring St. was the early home of the Smithermans from 1991 to 1995. A number of 4-track cassette songs were recorded in the front room, also known as \"The Cold Room\".');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(8) NOT NULL,
  `artist_id` int(8) NOT NULL,
  `location_id` int(8) NOT NULL,
  `record_year` year(4) NOT NULL,
  `length` time NOT NULL,
  `notes` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `artist_id`, `location_id`, `record_year`, `length`, `notes`) VALUES
(1, 1, 1, 1989, '00:03:56', 'Recorded in the Fall of 1989 in Room 302 (\"The 3rd Oz\"). Recorded on a Fostex 4-track with Paul performing all instruments: Keyboards, guitar, bongos and triangle.'),
(2, 1, 2, 1992, '00:05:25', 'Recorded late summer at Spring St, Diane Smitherman joins Paul on vocals in a sleepy bossa. Paul plays electric guitar and bass. Drums from a Roland drum machine. ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio_object`
--
ALTER TABLE `audio_object`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track_index` (`track_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_index` (`artist_id`),
  ADD KEY `location_index` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `audio_object`
--
ALTER TABLE `audio_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `audio_object`
--
ALTER TABLE `audio_object`
  ADD CONSTRAINT `audio_object_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
