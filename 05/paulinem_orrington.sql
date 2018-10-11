-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2018 at 07:56 PM
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
  `intname` varchar(256) NOT NULL,
  `inttitle` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `interviewer`
--

INSERT INTO `interviewer` (`intid`, `intname`, `inttitle`) VALUES
(2, 'Judith Harrington', 'President of Orrington Historical Society');

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE `keyword` (
  `keywordid` int(8) NOT NULL,
  `keyword` varchar(256) NOT NULL,
  `ttrackid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`keywordid`, `keyword`, `ttrackid`) VALUES
(2, 'history', 2);

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `speakerid` int(8) NOT NULL,
  `speakername` varchar(256) NOT NULL,
  `speakertitle` varchar(256) NOT NULL,
  `speakerdob` date NOT NULL,
  `speakerbio` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`speakerid`, `speakername`, `speakertitle`, `speakerdob`, `speakerbio`) VALUES
(1, 'Vicks, Sarah', 'Retired R.N.', '1929-07-02', 'Sarah Vicks was born in Orrington in 1929 and attended Goodale Corner School. She worked as a registered nurse for 20 years.');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `ttrackID` int(8) NOT NULL,
  `ttitle` varchar(255) NOT NULL,
  `tdate` date NOT NULL,
  `tlength` int(255) NOT NULL,
  `tsummary` varchar(255) NOT NULL,
  `tcopyright` varchar(255) NOT NULL,
  `tdevice` varchar(255) NOT NULL,
  `tlocation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`ttrackID`, `ttitle`, `tdate`, `tlength`, `tsummary`, `tcopyright`, `tdevice`, `tlocation`) VALUES
(1, '', '0000-00-00', 0, '', '', '', ''),
(2, 'Interview with Sarah Vicks', '2018-10-02', 60, 'Sarah Vicks describes growing up in Center Orrington near the Goodale Cemetery. ', 'This interview is the property of the Orrington Historical Society (2018).', 'Samsung', 'Orrington, ME'),
(3, '', '0000-00-00', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transcription`
--

CREATE TABLE `transcription` (
  `scripid` int(8) NOT NULL,
  `scripauthor` varchar(256) NOT NULL,
  `scriptext` text NOT NULL,
  `scripdate` date NOT NULL,
  `scriprevisions` int(4) NOT NULL,
  `ttrackid` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transcription`
--

INSERT INTO `transcription` (`scripid`, `scripauthor`, `scriptext`, `scripdate`, `scriprevisions`, `ttrackid`) VALUES
(2, 'Josie Johnson', 'Judith: Sarah, it\'s nice to see you. Thanks for agreeing to meet with me.\r\nSarah: Of course. Thank you. \r\nJudith: Why don\'t you start by telling me when you were born? Were you born in Orrington? ', '2018-08-08', 2, 2);

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
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`speakerid`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`ttrackID`);

--
-- Indexes for table `transcription`
--
ALTER TABLE `transcription`
  ADD PRIMARY KEY (`scripid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `interviewer`
--
ALTER TABLE `interviewer`
  MODIFY `intid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keywordid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `speakerid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ttrackID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transcription`
--
ALTER TABLE `transcription`
  MODIFY `scripid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `interviewer`
--
ALTER TABLE `interviewer`
  ADD CONSTRAINT `interviewer_ibfk_1` FOREIGN KEY (`intid`) REFERENCES `track` (`ttrackID`);

--
-- Constraints for table `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`keywordid`) REFERENCES `track` (`ttrackID`);

--
-- Constraints for table `speaker`
--
ALTER TABLE `speaker`
  ADD CONSTRAINT `speaker_ibfk_1` FOREIGN KEY (`speakerid`) REFERENCES `track` (`ttrackID`);

--
-- Constraints for table `transcription`
--
ALTER TABLE `transcription`
  ADD CONSTRAINT `transcription_ibfk_1` FOREIGN KEY (`scripid`) REFERENCES `track` (`ttrackID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
