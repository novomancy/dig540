-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 16, 2020 at 06:26 PM
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
-- Database: `shcrawfo_poetry_events_audio_files`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(8) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `venue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ext` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `filename`, `date`, `venue`, `place`, `ext`) VALUES
(4, 'fall20.mp3', '2020-09-18', 'Frost Place', 'Franconia, NH', ''),
(5, 'fall19.mp3', '2019-09-20', 'Williams Cafe', 'Worcester, MA', ''),
(8, 'spring20.mp3', '2020-04-24', 'Smith Auditorium ', 'Hartford, CT', '');

-- --------------------------------------------------------

--
-- Table structure for table `event_appearances`
--

CREATE TABLE `event_appearances` (
  `speaker_id` int(8) NOT NULL,
  `poet_id` int(8) NOT NULL,
  `poem_id` int(8) NOT NULL,
  `event_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_appearances`
--

INSERT INTO `event_appearances` (`speaker_id`, `poet_id`, `poem_id`, `event_id`) VALUES
(3, 3, 2, 4),
(4, 4, 3, 5),
(5, 5, 4, 5),
(6, 6, 5, 5),
(6, 3, 6, 4),
(6, 3, 7, 4),
(3, 7, 8, 4),
(3, 8, 9, 8),
(3, 8, 10, 8),
(3, 8, 11, 8);

-- --------------------------------------------------------

--
-- Table structure for table `poem`
--

CREATE TABLE `poem` (
  `id` int(8) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poet_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poem`
--

INSERT INTO `poem` (`id`, `title`, `poet_id`) VALUES
(2, 'The Road Not Taken', 3),
(3, 'The Imaginary Iceberg', 4),
(4, 'The Drunken Boat', 5),
(5, 'The Panther', 6),
(6, 'Mending Wall', 3),
(7, 'Birches', 3),
(8, 'Song of Myself', 7),
(9, 'Hurt Hawks', 8),
(10, 'Cassandra', 8),
(11, 'Vulture', 8);

-- --------------------------------------------------------

--
-- Table structure for table `poet`
--

CREATE TABLE `poet` (
  `id` int(8) NOT NULL,
  `poet_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poet_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poet`
--

INSERT INTO `poet` (`id`, `poet_name`, `poet_country`) VALUES
(3, 'Robert Frost', 'USA'),
(4, 'Elizabeth Bishop', 'USA'),
(5, 'Arthur Rimbaud', 'FRA'),
(6, 'Rainer Maria Rilke', 'GER'),
(7, 'Walt Whitman', 'USA'),
(8, 'Robinson Jeffers', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `id` int(8) NOT NULL,
  `speaker_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `speaker_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`id`, `speaker_name`, `speaker_country`) VALUES
(3, 'John Smith', 'USA'),
(4, 'Mary Williams', 'USA'),
(5, 'Jack Stanton', 'GER'),
(6, 'Joanna Curtain', 'FRA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_appearances`
--
ALTER TABLE `event_appearances`
  ADD KEY `speaker_id` (`speaker_id`),
  ADD KEY `poet_id` (`poet_id`),
  ADD KEY `poem_id` (`poem_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `poem`
--
ALTER TABLE `poem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poem` (`title`),
  ADD KEY `poet_id` (`poet_id`);

--
-- Indexes for table `poet`
--
ALTER TABLE `poet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poet_name` (`poet_name`);

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `speaker_name` (`speaker_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `poem`
--
ALTER TABLE `poem`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `poet`
--
ALTER TABLE `poet`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_appearances`
--
ALTER TABLE `event_appearances`
  ADD CONSTRAINT `event_appearances_ibfk_1` FOREIGN KEY (`speaker_id`) REFERENCES `speaker` (`id`),
  ADD CONSTRAINT `event_appearances_ibfk_2` FOREIGN KEY (`poet_id`) REFERENCES `poet` (`id`),
  ADD CONSTRAINT `event_appearances_ibfk_3` FOREIGN KEY (`poem_id`) REFERENCES `poem` (`id`),
  ADD CONSTRAINT `event_appearances_ibfk_4` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`);

--
-- Constraints for table `poem`
--
ALTER TABLE `poem`
  ADD CONSTRAINT `poem_ibfk_1` FOREIGN KEY (`poet_id`) REFERENCES `poet` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
