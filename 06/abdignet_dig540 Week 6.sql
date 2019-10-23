-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2019 at 12:41 AM
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
-- Database: `abdignet_dig540`
--

-- --------------------------------------------------------

--
-- Table structure for table `collection`
--

CREATE TABLE `collection` (
  `collection_id` int(7) NOT NULL,
  `collection_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collection`
--

INSERT INTO `collection` (`collection_id`, `collection_name`) VALUES
(2019001, 'Completely Unrelated Project Collection'),
(2005003, 'Small Town Oral History Project');

-- --------------------------------------------------------

--
-- Table structure for table `interview`
--

CREATE TABLE `interview` (
  `collection_id` int(7) NOT NULL,
  `object_id` int(10) NOT NULL,
  `interview_length` int(11) DEFAULT NULL,
  `interview_date` date DEFAULT NULL,
  `interview_location` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transcript_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interview`
--

INSERT INTO `interview` (`collection_id`, `object_id`, `interview_length`, `interview_date`, `interview_location`, `transcript_id`) VALUES
(2005003, 2005003001, 40, '2004-10-10', 'SmallTown, ME', 1),
(2005003, 2005003002, 60, '2004-08-02', 'SmallTown, ME', 2),
(2019001, 2019001001, 17, '2019-10-16', 'Orono, ME', 3);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `person_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `person_address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_city` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_state` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_zip` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_telephone` int(10) DEFAULT NULL,
  `person_email` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_dob` date DEFAULT NULL,
  `person_dod` date DEFAULT NULL,
  `person_extd` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `person_name`, `person_address`, `person_city`, `person_state`, `person_zip`, `person_telephone`, `person_email`, `person_dob`, `person_dod`, `person_extd`) VALUES
(1, 'Thor Odinson', '65 Asgard Street', 'SmallTown', 'Maine', '04403', 2079421234, 'godofthunder@gmail.com', '1962-08-01', '2010-05-16', NULL),
(2, 'Horus Smith', '16 Skyview Road', 'SmallTown', 'Maine', '04403', 2079425678, 'falconfan36@hotmail.com', NULL, NULL, 'Volunteer at Small Town Historical Society'),
(3, 'Clio Jones', '35 Mountain Lane', 'Parnassos\r\n', 'Maine', '04402', 2078274567, 'history2006@gmail.com', '1987-02-28', NULL, 'Volunteer at Small Town Historical Society'),
(4, 'Freyja ', '87 Folkvangr Avenue', 'SmallTown', 'Maine', '04403', 2079426060, 'catchariot@yahoo.com', '1932-01-01', '2014-12-31', NULL),
(5, 'Anubis Paul', '1 Duat Street\r\n', 'SmallTown', 'Maine', '04403', 2079426666, 'anubisbpaul@gmail.com', '1975-06-16', NULL, 'Former Volunteer at Small Town Historical Society'),
(6, 'Test Testy', '123 Test Lane', 'Testerville', 'TS', '12345', 158123456, 'testing@gmail.com', NULL, NULL, 'They had nothing to do with the SmallTown Oral History Project. ');

-- --------------------------------------------------------

--
-- Table structure for table `person_interview`
--

CREATE TABLE `person_interview` (
  `object_id` int(10) NOT NULL,
  `person_id` int(11) NOT NULL,
  `role` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_interview`
--

INSERT INTO `person_interview` (`object_id`, `person_id`, `role`) VALUES
(2005003001, 1, 'Interviewee'),
(2005003001, 2, 'Interviewer'),
(2005003001, 3, 'Transcriber'),
(2005003002, 3, 'Transcriber'),
(2005003002, 4, 'Interviewee'),
(2005003002, 5, 'Interviewer'),
(2019001001, 6, 'Interviewer');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject`) VALUES
(17, 'battle'),
(20, 'career'),
(18, 'cats'),
(19, 'chariot'),
(7, 'college'),
(1, 'education'),
(2, 'family'),
(16, 'Folkvangr'),
(4, 'friends'),
(10, 'Frigga'),
(5, 'hammers'),
(12, 'lightning'),
(3, 'neighborhood'),
(14, 'oak trees'),
(8, 'Odin'),
(6, 'SmallTown'),
(13, 'storms'),
(15, 'strength'),
(11, 'thunder');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `track_length` int(11) NOT NULL,
  `track_playorder` int(11) NOT NULL,
  `track_extd` text COLLATE utf8_unicode_ci NOT NULL,
  `object_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `title`, `track_length`, `track_playorder`, `track_extd`, `object_id`) VALUES
(1, 'Introduction', 5, 1, 'The interview introduces himself and his position in the community', 2005003001),
(2, 'Early Life and Family', 10, 2, 'Thor discusses his childhood and family life in Smalltown. ', 2005003001),
(3, 'Growing Up in SmallTown', 15, 3, 'Thor discusses his experiences growing up in SmallTown in detail. ', 2005003001),
(4, 'College and Return to SmallTown', 10, 4, 'Thor discusses his college experiences and why he later returned to SmallTown. Discussion of his adult life in the community. ', 2005003001),
(9, 'Introduction and Early Life', 20, 1, '', 2005003002),
(10, 'Challenges in Life', 20, 2, '', 2005003002),
(11, 'Life in SmallTown', 20, 3, '', 2005003002);

-- --------------------------------------------------------

--
-- Table structure for table `track_subject`
--

CREATE TABLE `track_subject` (
  `subject_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track_subject`
--

INSERT INTO `track_subject` (`subject_id`, `track_id`) VALUES
(13, 1),
(12, 1),
(14, 1),
(15, 1),
(15, 1),
(10, 2),
(8, 2),
(1, 3),
(2, 2),
(5, 3),
(3, 3),
(1, 4),
(7, 4),
(5, 4),
(5, 1),
(5, 2),
(2, 9),
(18, 9),
(1, 9),
(4, 9),
(20, 10),
(16, 10),
(18, 11),
(19, 11),
(16, 11),
(17, 11);

-- --------------------------------------------------------

--
-- Table structure for table `transcript`
--

CREATE TABLE `transcript` (
  `transcript_id` int(11) NOT NULL,
  `transcript_length` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transcript`
--

INSERT INTO `transcript` (`transcript_id`, `transcript_length`) VALUES
(1, 6),
(2, 15),
(3, 17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`collection_id`),
  ADD KEY `collection_name` (`collection_name`);

--
-- Indexes for table `interview`
--
ALTER TABLE `interview`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `collection_id` (`collection_id`),
  ADD KEY `transcript_id` (`transcript_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `person_name` (`person_name`),
  ADD KEY `person_city` (`person_city`);

--
-- Indexes for table `person_interview`
--
ALTER TABLE `person_interview`
  ADD KEY `object_id` (`object_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `subject` (`subject`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `title` (`title`),
  ADD KEY `object_id` (`object_id`);

--
-- Indexes for table `track_subject`
--
ALTER TABLE `track_subject`
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `transcript`
--
ALTER TABLE `transcript`
  ADD PRIMARY KEY (`transcript_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `person_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transcript`
--
ALTER TABLE `transcript`
  MODIFY `transcript_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `interview`
--
ALTER TABLE `interview`
  ADD CONSTRAINT `interview_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`collection_id`),
  ADD CONSTRAINT `interview_ibfk_2` FOREIGN KEY (`transcript_id`) REFERENCES `transcript` (`transcript_id`);

--
-- Constraints for table `person_interview`
--
ALTER TABLE `person_interview`
  ADD CONSTRAINT `person_interview_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `interview` (`object_id`),
  ADD CONSTRAINT `person_interview_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `interview` (`object_id`);

--
-- Constraints for table `track_subject`
--
ALTER TABLE `track_subject`
  ADD CONSTRAINT `track_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  ADD CONSTRAINT `track_subject_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`track_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
