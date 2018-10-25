-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2018 at 10:38 AM
-- Server version: 5.6.41-log
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
-- Database: `paulinem_orrington`
--

-- --------------------------------------------------------

--
-- Table structure for table `interviewer`
--

CREATE TABLE `interviewer` (
  `id` int(8) NOT NULL,
  `name` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interviewer`
--

INSERT INTO `interviewer` (`id`, `name`, `title`) VALUES
(5, 'Sally Hays', 'Volunteer'),
(7, 'Antonio Rodriguez', 'Retired Volunteer, Former Chief of Police for the Town of Orrington');

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `id` int(8) NOT NULL,
  `keyword` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`id`, `keyword`) VALUES
(5, 'history'),
(7, 'Orrington'),
(8, 'Maine'),
(9, 'Orrington Historical Society'),
(10, 'World War II'),
(11, 'school'),
(12, 'Center Drive'),
(13, 'King\'s Mountain');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id` int(8) NOT NULL,
  `language` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id`, `language`) VALUES
(1, 'English'),
(2, 'French'),
(3, 'Spanish');

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `id` int(8) NOT NULL,
  `name` varchar(256) NOT NULL,
  `job_title` varchar(256) NOT NULL,
  `date_of_birth` date NOT NULL,
  `biography` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`id`, `name`, `job_title`, `date_of_birth`, `biography`) VALUES
(3, 'Josie Church', 'Retired R.N.', '1929-07-02', 'Born in 1929, Josie grew up on Goodale Corner. She later attended the University of Maine and earned a degree in nursing. She raised 2 children and moved to Bucksport for two years before returning to her hometown of Orrington.'),
(4, 'Dick Harrington', 'Retired Store Owner', '1930-02-03', 'Dick Harrington was born and raised on Settler\'s Way in South Orrington. His grandfather founded Harrington\'s General Store in 1902 and the business was passed down to Dick Harrington Sr. and finally to Dick Harrington Jr.'),
(5, 'Brian Jones', 'Retiree, Prior Town Manager', '1935-12-02', 'Most recently, Brian Jones worked as Orrington\'s Town Manager. Prior to that, he was a C.P.A. at a large accounting firm in Bangor. He grew up in North Orrington.'),
(6, 'Jackie Betts', 'Retiree, Prior Schoolteacher', '1941-03-12', 'Jackie Betts taught at North Orrington School for nearly 40 years before moving to Center Drive School.');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `length` int(255) NOT NULL,
  `summary` varchar(8000) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `device` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `title`, `date`, `length`, `summary`, `copyright`, `device`, `location`) VALUES
(5, 'Interview with Josie Church', '2018-10-02', 60, 'Sally Haystack interviews Josie Church, a member of the Rebeccas and registered nurse who grew up n Goodale Corner. ', 'This interview is property of the Orrington Historical Society (2018).', 'Samsung', 'Orrington, ME'),
(6, 'Interview with Dick Harrington', '2018-09-11', 72, 'Sally Haystack interviews Dick Harrington, longtime owner of Harrington\'s General Store, which closed in 1978.', 'This interview is property of the Orrington Historical Society (2018).', 'Samsung', 'Orrington, ME'),
(7, 'Interview with Brian Jones', '2018-05-08', 89, 'Brian Jones describes attending First United Methodist Church of Orrington (FUMCO) as a child and a teenager. ', 'This interview is property of the Orrington Historical Society (2018).', 'iPhone', 'Orrington, ME'),
(8, 'Interview with Jackie Betts', '2018-01-23', 90, 'Jackie Betts, lifetime resident of Orrington, discusses how the neighborhood changed when Center Drive School was built.', 'This interview is property of the Orrington Historical Society (2018).', 'iPhone', 'Brewer, ME');

-- --------------------------------------------------------

--
-- Table structure for table `track_interviewer`
--

CREATE TABLE `track_interviewer` (
  `track_id` int(8) NOT NULL,
  `interviewer_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_interviewer`
--

INSERT INTO `track_interviewer` (`track_id`, `interviewer_id`) VALUES
(5, 5),
(6, 5),
(7, 7),
(7, 5),
(8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `track_keyword`
--

CREATE TABLE `track_keyword` (
  `track_id` int(8) NOT NULL,
  `keyword_id` int(8) NOT NULL,
  `keyword_type` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_keyword`
--

INSERT INTO `track_keyword` (`track_id`, `keyword_id`, `keyword_type`) VALUES
(6, 5, 'noun'),
(6, 5, 'noun'),
(5, 5, ''),
(6, 13, 'location'),
(7, 13, 'location'),
(8, 8, 'location'),
(7, 8, 'location'),
(6, 8, 'location'),
(5, 8, 'location'),
(7, 11, 'noun'),
(8, 11, 'noun');

-- --------------------------------------------------------

--
-- Table structure for table `track_language`
--

CREATE TABLE `track_language` (
  `language_id` int(8) NOT NULL,
  `track_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_language`
--

INSERT INTO `track_language` (`language_id`, `track_id`) VALUES
(1, 6),
(1, 5),
(1, 7),
(2, 7),
(1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `track_speaker`
--

CREATE TABLE `track_speaker` (
  `track_id` int(8) NOT NULL,
  `speaker_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_speaker`
--

INSERT INTO `track_speaker` (`track_id`, `speaker_id`) VALUES
(6, 4),
(5, 3),
(8, 6),
(7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transcription`
--

CREATE TABLE `transcription` (
  `id` int(8) NOT NULL,
  `author` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `revisions` int(4) NOT NULL,
  `track_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcription`
--

INSERT INTO `transcription` (`id`, `author`, `text`, `date`, `revisions`, `track_id`) VALUES
(4, 'Diana Jones', 'Sally Hays: Thank you for agreeing to meet with me, Mrs. Church.\r\nJosie Church: You can call me Josie.', '2018-10-08', 2, 5),
(5, 'Diana Jones', 'Sally Hays: Hi, I\'m Sally, with the Orrington Historical Society.\r\nDick Harrington: Nice to meet you.', '2018-09-15', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `transcription_language`
--

CREATE TABLE `transcription_language` (
  `transcription_id` int(8) NOT NULL,
  `language_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcription_language`
--

INSERT INTO `transcription_language` (`transcription_id`, `language_id`) VALUES
(4, 1),
(5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interviewer`
--
ALTER TABLE `interviewer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_interviewer`
--
ALTER TABLE `track_interviewer`
  ADD KEY `track_interviewer_ibfk_1` (`track_id`),
  ADD KEY `interviewer_id` (`interviewer_id`);

--
-- Indexes for table `track_keyword`
--
ALTER TABLE `track_keyword`
  ADD KEY `keywordid` (`keyword_id`),
  ADD KEY `ttrackid` (`track_id`);

--
-- Indexes for table `track_language`
--
ALTER TABLE `track_language`
  ADD KEY `tlanguageid` (`language_id`),
  ADD KEY `ttrackid` (`track_id`);

--
-- Indexes for table `track_speaker`
--
ALTER TABLE `track_speaker`
  ADD KEY `speakerid` (`speaker_id`),
  ADD KEY `ttrackid` (`track_id`);

--
-- Indexes for table `transcription`
--
ALTER TABLE `transcription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trackid` (`track_id`);

--
-- Indexes for table `transcription_language`
--
ALTER TABLE `transcription_language`
  ADD KEY `scripid` (`transcription_id`),
  ADD KEY `tlanguageid` (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interviewer`
--
ALTER TABLE `interviewer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transcription`
--
ALTER TABLE `transcription`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `track_interviewer`
--
ALTER TABLE `track_interviewer`
  ADD CONSTRAINT `track_interviewer_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`),
  ADD CONSTRAINT `track_interviewer_ibfk_3` FOREIGN KEY (`interviewer_id`) REFERENCES `interviewer` (`id`);

--
-- Constraints for table `track_keyword`
--
ALTER TABLE `track_keyword`
  ADD CONSTRAINT `track_keyword_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`id`),
  ADD CONSTRAINT `track_keyword_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_language`
--
ALTER TABLE `track_language`
  ADD CONSTRAINT `track_language_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `track_language_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `track_speaker`
--
ALTER TABLE `track_speaker`
  ADD CONSTRAINT `track_speaker_ibfk_1` FOREIGN KEY (`speaker_id`) REFERENCES `speaker` (`id`),
  ADD CONSTRAINT `track_speaker_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `transcription`
--
ALTER TABLE `transcription`
  ADD CONSTRAINT `transcription_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `transcription_language`
--
ALTER TABLE `transcription_language`
  ADD CONSTRAINT `transcription_language_ibfk_1` FOREIGN KEY (`transcription_id`) REFERENCES `transcription` (`id`),
  ADD CONSTRAINT `transcription_language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
