-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2018 at 09:39 PM
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
  `intid` int(8) NOT NULL,
  `name` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interviewer`
--

INSERT INTO `interviewer` (`intid`, `name`, `title`) VALUES
(5, 'Sally Haystack', 'Volunteer');

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `keywordid` int(8) NOT NULL,
  `keyword` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`keywordid`, `keyword`) VALUES
(5, 'history'),
(6, 'history');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `languageid` int(11) NOT NULL,
  `language` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`languageid`, `language`) VALUES
(1, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `speakerid` int(8) NOT NULL,
  `name` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `dob` date NOT NULL,
  `bio` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`speakerid`, `name`, `title`, `dob`, `bio`) VALUES
(3, 'Josie Church', 'Retired R.N.', '1929-07-02', 'Born in 1929, Josie grew up on Goodale Corner. She later attended the University of Maine and earned a degree in nursing. She raised 2 children and moved to Bucksport for two years before returning to her hometown of Orrington.'),
(4, 'Dick Harrington', 'Retired Store Owner', '1930-02-03', 'Dick Harrington was born and raised on Settler\'s Way in South Orrington. His grandfather founded Harrington\'s General Store in 1902 and the business was passed down to Dick Harrington Sr. and finally to Dick Harrington Jr.');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `trackID` int(8) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `length` int(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `device` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`trackID`, `title`, `date`, `length`, `summary`, `copyright`, `device`, `location`) VALUES
(5, 'Interview with Josie Church', '2018-10-02', 60, 'Sally Haystack interviews Josie Church, a member of the Rebeccas and registered nurse who grew up n Goodale Corner. ', 'This interview is property of the Orrington Historical Society (2018).', 'Samsung', 'Orrington, ME'),
(6, 'Interview with Dick Harrington', '2018-09-11', 72, 'Susie Haystack interviews Dick Harrington, longtime owner of Harrington\'s General Store, which closed in 1978.', 'This interview is owned by the Orrington Historical Society (2018).', 'Samsung', 'Orrington, ME');

-- --------------------------------------------------------

--
-- Table structure for table `track_interviewer`
--

CREATE TABLE `track_interviewer` (
  `trackid` int(8) NOT NULL,
  `intid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_interviewer`
--

INSERT INTO `track_interviewer` (`trackid`, `intid`) VALUES
(5, 5),
(6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `track_keyword`
--

CREATE TABLE `track_keyword` (
  `trackid` int(8) NOT NULL,
  `keywordid` int(8) NOT NULL,
  `keywordtype` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_keyword`
--

INSERT INTO `track_keyword` (`trackid`, `keywordid`, `keywordtype`) VALUES
(6, 5, 'noun'),
(6, 5, 'noun'),
(5, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `track_language`
--

CREATE TABLE `track_language` (
  `languageid` int(8) NOT NULL,
  `trackid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_language`
--

INSERT INTO `track_language` (`languageid`, `trackid`) VALUES
(1, 6),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `track_speaker`
--

CREATE TABLE `track_speaker` (
  `trackid` int(8) NOT NULL,
  `speakerid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_speaker`
--

INSERT INTO `track_speaker` (`trackid`, `speakerid`) VALUES
(6, 4),
(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `transcription`
--

CREATE TABLE `transcription` (
  `scripid` int(8) NOT NULL,
  `author` varchar(256) NOT NULL,
  `text` text NOT NULL,
  `date` date NOT NULL,
  `revisions` int(4) NOT NULL,
  `trackid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcription`
--

INSERT INTO `transcription` (`scripid`, `author`, `text`, `date`, `revisions`, `trackid`) VALUES
(4, 'Diana Jones', 'Sally Haystack: Thank you for agreeing to meet with me, Mrs. Church.\r\nJosie Church: You can call me Josie.', '2018-10-08', 2, 5),
(5, 'Diana Jones', 'Susie Haystack: Hi, I\'m Susie, with the Orrington Historical Society.\r\nDick Harrington: Nice to meet you.', '2018-09-15', 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `transcription_language`
--

CREATE TABLE `transcription_language` (
  `scripid` int(8) NOT NULL,
  `languageid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcription_language`
--

INSERT INTO `transcription_language` (`scripid`, `languageid`) VALUES
(4, 1),
(5, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `interviewer`
--
ALTER TABLE `interviewer`
  ADD PRIMARY KEY (`intid`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keywordid`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`languageid`);

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`speakerid`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`trackID`);

--
-- Indexes for table `track_interviewer`
--
ALTER TABLE `track_interviewer`
  ADD KEY `intid` (`intid`),
  ADD KEY `ttrackid` (`trackid`);

--
-- Indexes for table `track_keyword`
--
ALTER TABLE `track_keyword`
  ADD KEY `keywordid` (`keywordid`),
  ADD KEY `ttrackid` (`trackid`);

--
-- Indexes for table `track_language`
--
ALTER TABLE `track_language`
  ADD KEY `tlanguageid` (`languageid`),
  ADD KEY `ttrackid` (`trackid`);

--
-- Indexes for table `track_speaker`
--
ALTER TABLE `track_speaker`
  ADD KEY `speakerid` (`speakerid`),
  ADD KEY `ttrackid` (`trackid`);

--
-- Indexes for table `transcription`
--
ALTER TABLE `transcription`
  ADD PRIMARY KEY (`scripid`);

--
-- Indexes for table `transcription_language`
--
ALTER TABLE `transcription_language`
  ADD KEY `scripid` (`scripid`),
  ADD KEY `tlanguageid` (`languageid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interviewer`
--
ALTER TABLE `interviewer`
  MODIFY `intid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keywordid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `languageid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `speakerid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `trackID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transcription`
--
ALTER TABLE `transcription`
  MODIFY `scripid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `track_interviewer`
--
ALTER TABLE `track_interviewer`
  ADD CONSTRAINT `track_interviewer_ibfk_1` FOREIGN KEY (`intid`) REFERENCES `interviewer` (`intid`),
  ADD CONSTRAINT `track_interviewer_ibfk_2` FOREIGN KEY (`trackid`) REFERENCES `track` (`trackID`);

--
-- Constraints for table `track_keyword`
--
ALTER TABLE `track_keyword`
  ADD CONSTRAINT `track_keyword_ibfk_1` FOREIGN KEY (`keywordid`) REFERENCES `keyword` (`keywordid`),
  ADD CONSTRAINT `track_keyword_ibfk_2` FOREIGN KEY (`trackid`) REFERENCES `track` (`trackID`);

--
-- Constraints for table `track_language`
--
ALTER TABLE `track_language`
  ADD CONSTRAINT `track_language_ibfk_1` FOREIGN KEY (`languageid`) REFERENCES `language` (`languageid`),
  ADD CONSTRAINT `track_language_ibfk_2` FOREIGN KEY (`trackid`) REFERENCES `track` (`trackID`);

--
-- Constraints for table `track_speaker`
--
ALTER TABLE `track_speaker`
  ADD CONSTRAINT `track_speaker_ibfk_1` FOREIGN KEY (`speakerid`) REFERENCES `speaker` (`speakerid`),
  ADD CONSTRAINT `track_speaker_ibfk_2` FOREIGN KEY (`trackid`) REFERENCES `track` (`trackID`);

--
-- Constraints for table `transcription_language`
--
ALTER TABLE `transcription_language`
  ADD CONSTRAINT `transcription_language_ibfk_1` FOREIGN KEY (`scripid`) REFERENCES `transcription` (`scripid`),
  ADD CONSTRAINT `transcription_language_ibfk_2` FOREIGN KEY (`languageid`) REFERENCES `language` (`languageid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
