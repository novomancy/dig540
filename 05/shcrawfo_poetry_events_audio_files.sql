-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2020 at 02:28 PM
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
  `event_id` int(8) NOT NULL,
  `file_date` date NOT NULL,
  `file_id` int(8) NOT NULL,
  `venue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `file_date`, `file_id`, `venue`, `place`) VALUES
(4, '2020-09-01', 6, 'Frost Place', 'Franconia, NH'),
(5, '2020-08-01', 7, 'Williams Cafe ', 'Worcester, MA ');

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
(4, 4, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` int(8) NOT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_date` date NOT NULL,
  `file_length` int(11) NOT NULL,
  `event_id` int(8) NOT NULL,
  `ext` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `file_name`, `file_date`, `file_length`, `event_id`, `ext`) VALUES
(6, 'frostreading.mp3', '2020-09-01', 3689, 4, ''),
(7, 'bishopreading.mp3', '2020-08-01', 3215, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `poem`
--

CREATE TABLE `poem` (
  `poem_id` int(8) NOT NULL,
  `poem` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poet_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poem`
--

INSERT INTO `poem` (`poem_id`, `poem`, `poet_id`) VALUES
(2, 'The Road Not Taken', 3),
(3, 'The Imaginary Iceberg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `poet`
--

CREATE TABLE `poet` (
  `poet_id` int(8) NOT NULL,
  `poet_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `poet_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `poet`
--

INSERT INTO `poet` (`poet_id`, `poet_name`, `poet_country`) VALUES
(3, 'Robert Frost ', 'USA '),
(4, 'Elizabeth Bishop', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `speaker_id` int(8) NOT NULL,
  `speaker_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `speaker_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`speaker_id`, `speaker_name`, `speaker_country`) VALUES
(3, 'John Smith ', 'USA'),
(4, 'Mary Williams', 'USA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `file_id` (`file_id`),
  ADD KEY `file_date` (`file_date`);

--
-- Indexes for table `event_appearances`
--
ALTER TABLE `event_appearances`
  ADD KEY `speaker_id` (`speaker_id`),
  ADD KEY `poet_id` (`poet_id`),
  ADD KEY `poem_id` (`poem_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `file_name` (`file_name`),
  ADD KEY `file_date` (`file_date`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `poem`
--
ALTER TABLE `poem`
  ADD PRIMARY KEY (`poem_id`),
  ADD KEY `poem` (`poem`),
  ADD KEY `poet_id` (`poet_id`);

--
-- Indexes for table `poet`
--
ALTER TABLE `poet`
  ADD PRIMARY KEY (`poet_id`),
  ADD KEY `poet_name` (`poet_name`);

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`speaker_id`),
  ADD KEY `speaker_name` (`speaker_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `poem`
--
ALTER TABLE `poem`
  MODIFY `poem_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `poet`
--
ALTER TABLE `poet`
  MODIFY `poet_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `speaker_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`file_date`) REFERENCES `file` (`file_date`);

--
-- Constraints for table `event_appearances`
--
ALTER TABLE `event_appearances`
  ADD CONSTRAINT `event_appearances_ibfk_1` FOREIGN KEY (`speaker_id`) REFERENCES `speaker` (`speaker_id`),
  ADD CONSTRAINT `event_appearances_ibfk_2` FOREIGN KEY (`poet_id`) REFERENCES `poet` (`poet_id`),
  ADD CONSTRAINT `event_appearances_ibfk_3` FOREIGN KEY (`poem_id`) REFERENCES `poem` (`poem_id`),
  ADD CONSTRAINT `event_appearances_ibfk_4` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `file`
--
ALTER TABLE `file`
  ADD CONSTRAINT `file_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`);

--
-- Constraints for table `poem`
--
ALTER TABLE `poem`
  ADD CONSTRAINT `poem_ibfk_1` FOREIGN KEY (`poet_id`) REFERENCES `poet` (`poet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
