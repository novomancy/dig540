-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2018 at 06:25 PM
-- Server version: 10.2.18-MariaDB
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
-- Database: `chldaven_Julia_Whyel_Revised_SQL`
--

-- --------------------------------------------------------

--
-- Table structure for table `Audio`
--

CREATE TABLE `Audio` (
  `audio_id` int(8) NOT NULL,
  `audio` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Audio`
--

INSERT INTO `Audio` (`audio_id`, `audio`, `title`, `length`) VALUES
(1, '2018.04.12_HIV in Portland', 'HIV in Portland', '00:05:23'),
(2, '2015.03.23_Open Bench Project', 'Quality of Community', '00:02:17'),
(3, '2017.06.02_Christmas', 'merry christmas', '00:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `Audio_Genre`
--

CREATE TABLE `Audio_Genre` (
  `audio_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Audio_Interviewer`
--

CREATE TABLE `Audio_Interviewer` (
  `interviewer_id` int(8) NOT NULL,
  `audio_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Audio_Subject`
--

CREATE TABLE `Audio_Subject` (
  `audio_id` int(8) NOT NULL,
  `subject_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Audio_Town`
--

CREATE TABLE `Audio_Town` (
  `audio_id` int(8) NOT NULL,
  `town_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `genre_id` int(8) NOT NULL,
  `topic` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`genre_id`, `topic`) VALUES
(1, 'healthcare'),
(2, 'maker space'),
(3, 'meditation');

-- --------------------------------------------------------

--
-- Table structure for table `Interviewer`
--

CREATE TABLE `Interviewer` (
  `interviewer_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Interviewer`
--

INSERT INTO `Interviewer` (`interviewer_id`, `name`, `website`) VALUES
(1, 'Julia Whyel', 'www.juliawhyel.com'),
(2, 'kaylee holt', 'www.kalila.com'),
(3, 'whit walker', 'www.dixonpandejo.com');

-- --------------------------------------------------------

--
-- Table structure for table `Subject`
--

CREATE TABLE `Subject` (
  `subject_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Subject`
--

INSERT INTO `Subject` (`subject_id`, `name`, `address`) VALUES
(1, 'jane doe', '123 fake street'),
(2, 'jake ryan', '51 thompsons point'),
(3, 'jessie douglass', 'www.mcflorman.com');

-- --------------------------------------------------------

--
-- Table structure for table `Town`
--

CREATE TABLE `Town` (
  `town_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Town`
--

INSERT INTO `Town` (`town_id`, `name`, `state`) VALUES
(1, 'portland', 'maine'),
(2, 'portland', 'maine'),
(3, 'seattle', 'washington');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Audio`
--
ALTER TABLE `Audio`
  ADD PRIMARY KEY (`audio_id`),
  ADD KEY `audio` (`audio`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `Audio_Genre`
--
ALTER TABLE `Audio_Genre`
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Audio_Interviewer`
--
ALTER TABLE `Audio_Interviewer`
  ADD KEY `interviewer_id` (`interviewer_id`),
  ADD KEY `audio_id` (`audio_id`);

--
-- Indexes for table `Audio_Subject`
--
ALTER TABLE `Audio_Subject`
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `Audio_Town`
--
ALTER TABLE `Audio_Town`
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`genre_id`),
  ADD KEY `topic` (`topic`);

--
-- Indexes for table `Interviewer`
--
ALTER TABLE `Interviewer`
  ADD PRIMARY KEY (`interviewer_id`),
  ADD KEY `name` (`name`),
  ADD KEY `website` (`website`);

--
-- Indexes for table `Subject`
--
ALTER TABLE `Subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `name` (`name`),
  ADD KEY `address` (`address`);

--
-- Indexes for table `Town`
--
ALTER TABLE `Town`
  ADD PRIMARY KEY (`town_id`),
  ADD KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Audio`
--
ALTER TABLE `Audio`
  MODIFY `audio_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `genre_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Interviewer`
--
ALTER TABLE `Interviewer`
  MODIFY `interviewer_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Subject`
--
ALTER TABLE `Subject`
  MODIFY `subject_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Town`
--
ALTER TABLE `Town`
  MODIFY `town_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Audio_Genre`
--
ALTER TABLE `Audio_Genre`
  ADD CONSTRAINT `Audio_Genre_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `Audio` (`audio_id`),
  ADD CONSTRAINT `Audio_Genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`genre_id`);

--
-- Constraints for table `Audio_Interviewer`
--
ALTER TABLE `Audio_Interviewer`
  ADD CONSTRAINT `Audio_Interviewer_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `Audio` (`audio_id`),
  ADD CONSTRAINT `Audio_Interviewer_ibfk_2` FOREIGN KEY (`interviewer_id`) REFERENCES `Interviewer` (`interviewer_id`);

--
-- Constraints for table `Audio_Subject`
--
ALTER TABLE `Audio_Subject`
  ADD CONSTRAINT `Audio_Subject_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `Audio` (`audio_id`),
  ADD CONSTRAINT `Audio_Subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `Subject` (`subject_id`);

--
-- Constraints for table `Audio_Town`
--
ALTER TABLE `Audio_Town`
  ADD CONSTRAINT `Audio_Town_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `Audio` (`audio_id`),
  ADD CONSTRAINT `Audio_Town_ibfk_2` FOREIGN KEY (`town_id`) REFERENCES `Town` (`town_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
