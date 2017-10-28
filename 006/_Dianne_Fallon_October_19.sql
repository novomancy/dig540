-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2017 at 12:10 AM
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
-- Database: `digitaly_Take 2 Dianne`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(8) NOT NULL,
  `genre_label` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `genre_label`) VALUES
(1, 'personal_interview'),
(2, 'personal_narrative');

-- --------------------------------------------------------

--
-- Table structure for table `interviewer`
--

CREATE TABLE `interviewer` (
  `id` int(8) NOT NULL,
  `name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `organization` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interviewer`
--

INSERT INTO `interviewer` (`id`, `name`, `organization`) VALUES
(1, 'Jessica Boyd', 'Hancock County interviewer'),
(2, 'Ryan Rostro', 'Portland interviwer');

-- --------------------------------------------------------

--
-- Table structure for table `interview_files`
--

CREATE TABLE `interview_files` (
  `id` int(8) NOT NULL,
  `id_source` int(8) NOT NULL,
  `file_name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `interviewee_name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `id_interviewer` int(8) NOT NULL,
  `date_created` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `id_genre` int(8) NOT NULL,
  `id_subject` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interview_files`
--

INSERT INTO `interview_files` (`id`, `id_source`, `file_name`, `interviewee_name`, `id_interviewer`, `date_created`, `note`, `id_genre`, `id_subject`) VALUES
(1, 1, 'Rachel Philio interview', 'Philio, Rachel', 1, 'September 20, 2001', 'September 11 documentary project', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(8) NOT NULL,
  `url` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `url`, `name`, `description`) VALUES
(1, 'https://www.loc.gov/collections/september-11th-2001-documentary-project/', 'September 11, 2001 Documentary Project', 'An LOC project documenting 9-11'),
(2, 'http://www.madeupdata.com', 'Maine Folklife 9-11', 'Just making this up to make the relationship table work.'),
(3, 'http://www.madeupdata.com', 'Maine Folklife 9-11', 'Just making this up to make the relationship table work.');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(8) NOT NULL,
  `subject_label` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subject_label`) VALUES
(1, '9-11'),
(2, 'East Sullivan--Hancock County--Maine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_label` (`genre_label`(255));

--
-- Indexes for table `interviewer`
--
ALTER TABLE `interviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `interview_files`
--
ALTER TABLE `interview_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_interviewer` (`id_interviewer`),
  ADD KEY `id` (`id`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_subject` (`id_subject`),
  ADD KEY `id_source` (`id_source`);

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(255)),
  ADD KEY `id` (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_label` (`subject_label`(255));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `interviewer`
--
ALTER TABLE `interviewer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `interview_files`
--
ALTER TABLE `interview_files`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `interview_files`
--
ALTER TABLE `interview_files`
  ADD CONSTRAINT `interview_files_ibfk_1` FOREIGN KEY (`id_interviewer`) REFERENCES `interviewer` (`id`),
  ADD CONSTRAINT `interview_files_ibfk_2` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`),
  ADD CONSTRAINT `interview_files_ibfk_3` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `interview_files_ibfk_4` FOREIGN KEY (`id_source`) REFERENCES `source` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
