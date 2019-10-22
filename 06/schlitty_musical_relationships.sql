-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2019 at 07:56 PM
-- Server version: 10.2.27-MariaDB
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
(1, 'Dangerously in Love', 2003, 1, 'Hip hop'),
(2, 'Double Fantasy', 1980, 5, 'Rock'),
(3, 'Experimental Jet Set, Trash and No Star', 1994, 4, 'Noise rock'),
(4, 'Elephant', 2003, 3, 'Garage rock'),
(5, 'Beyoncé ', 2013, 1, 'Hip hop');

-- --------------------------------------------------------

--
-- Table structure for table `album_track`
--

CREATE TABLE `album_track` (
  `album_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL,
  `track_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album_track`
--

INSERT INTO `album_track` (`album_id`, `track_id`, `track_location`) VALUES
(1, 1, 1),
(4, 2, 1),
(4, 3, 3),
(3, 4, 2),
(3, 5, 7),
(2, 7, 1),
(2, 7, 8),
(5, 8, 3);

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
(2, 'Jay-Z', 'Hip hop', 'New York, New York', '1988 - present'),
(3, 'White Stripes', 'Garage rock', 'Detroit', '1997 - 2011'),
(4, 'Sonic Youth', 'Noise rock', 'New York City', '1981 - 2011'),
(5, 'John Lennon and Yoko Ono', 'Rock', 'London', '1968 - 1980');

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
(2, 2),
(5, 8),
(5, 7),
(4, 3),
(4, 4),
(3, 6),
(3, 5);

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
(2, 'Beyoncé and Jay-Z', 'Married', 2002, 'Still current'),
(3, 'Yoko Ono and John Lennon', 'Married', 1968, '1980'),
(4, 'Jack and Meg White', 'Married', 1996, '2000'),
(5, 'Kim Gordon and Thurston Moore', 'Married', 1984, '2003');

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
(2, 2),
(4, 6),
(4, 5),
(5, 3),
(5, 4),
(3, 7),
(3, 8);

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
(2, 'Shawn Carter', 'male', 1969, 'Still alive'),
(3, 'Kim Gordon', 'Female', 1953, 'Still alive'),
(4, 'Thurston Moore', 'Male', 1958, 'Still alive'),
(5, 'Meg White', 'Female', 1974, 'Still alive'),
(6, 'Jack White', 'Male', 1975, 'Still alive'),
(7, 'Yoko Ono', 'Female', 1933, 'Still alive'),
(8, 'John Lennon', 'Male', 1940, '1980');

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
(1, 'Crazy in Love', 2003, 2),
(2, 'Seven nation army', 2003, 4),
(3, 'There\'s no home for you here', 2003, 4),
(4, 'Bull in the heather', 1994, 5),
(5, 'Bone', 1994, 5),
(6, 'Watching the wheels', 1980, 3),
(7, '(Just like) starting over', 1980, 3),
(8, 'Drunk in love', 2013, 2);

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
(1, 1),
(7, 5),
(5, 4),
(4, 4),
(8, 1),
(2, 3),
(3, 3),
(6, 5);

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
  ADD UNIQUE KEY `album_id_2` (`album_id`,`track_location`),
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
  MODIFY `album_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `couple`
--
ALTER TABLE `couple`
  MODIFY `couple_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
