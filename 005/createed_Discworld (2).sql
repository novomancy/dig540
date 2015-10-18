-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 17, 2015 at 08:07 PM
-- Server version: 5.5.45-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `createed_Discworld`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `bookid` int(2) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `book_num` int(4) NOT NULL,
  `story_serial` enum('City Watch','Rincewind','Tiffany Aching','The Witches','The Wizards','Death','Miscellaneous','Moist von Lipwig') COLLATE utf8_unicode_ci NOT NULL,
  `story_serial_number` int(2) NOT NULL COMMENT 'This signifies the number this book represents in the individual storyline',
  PRIMARY KEY (`bookid`),
  KEY `Book_Title` (`book_title`(255),`story_serial`),
  KEY `Story_Theme` (`story_serial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `book_title`, `book_num`, `story_serial`, `story_serial_number`) VALUES
(14, 'The Colour of Magic', 1, 'Rincewind', 1),
(15, 'The Light Fantastic', 2, 'Rincewind', 2),
(16, 'Equal Rites', 3, 'The Witches', 1),
(17, 'Mort', 4, 'Death', 1),
(18, 'Sourcery', 5, 'Rincewind', 3),
(19, 'Wyrd Sisters', 6, 'The Witches', 2),
(20, 'Pyramids', 7, 'Miscellaneous', 1),
(21, 'Guards! Guards!', 8, 'City Watch', 1),
(22, 'Eric', 9, 'Rincewind', 4),
(23, 'Moving Pictures', 10, 'The Wizards', 1),
(24, 'Reaper Man', 11, 'Death', 2),
(25, 'Witches Abroad', 12, 'The Witches', 3),
(26, 'Small Gods', 13, 'Miscellaneous', 3),
(27, 'Lords and Ladies', 14, 'The Witches', 4);

-- --------------------------------------------------------

--
-- Table structure for table `narrator`
--

CREATE TABLE IF NOT EXISTS `narrator` (
  `narratorid` int(2) NOT NULL AUTO_INCREMENT,
  `narrator_name` varchar(140) COLLATE utf8_unicode_ci NOT NULL,
  `narrator_home` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT 'narrator''s home country (read: accent)',
  `narrator_gender` varchar(140) COLLATE utf8_unicode_ci NOT NULL COMMENT 'represents narrator''s gender identity ',
  `narrator_bio` varchar(5000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`narratorid`),
  KEY `Narrator_Name` (`narrator_name`,`narrator_gender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `narrator`
--

INSERT INTO `narrator` (`narratorid`, `narrator_name`, `narrator_home`, `narrator_gender`, `narrator_bio`) VALUES
(2, 'Nigel Planer', 'London', 'Male', 'Theatre, television, and film actor. Also voiced many of the Discworld novels in audio-adaptation. '),
(8, 'Celia Imrie', 'Guidlford, Surrey, England', 'Female', 'author, film and television actor, audio-book voice actor'),
(9, 'Stephen Briggs', 'Oxford, England', 'Male', 'author, playwright, thespian, illustrator, audio-book voice actor'),
(10, 'Tony Robinson', 'London', 'Male', 'film and television actor, comedian, political activist, audio-book actor');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE IF NOT EXISTS `performance` (
  `perfid` int(3) NOT NULL AUTO_INCREMENT,
  `perf_pub` varchar(254) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Name of the Audio publisher (differs from text publisher)',
  `perf_year` year(4) NOT NULL,
  `perf_length` int(5) NOT NULL COMMENT 'in minutes',
  `format_length` enum('abridged','unabridged') COLLATE utf8_unicode_ci NOT NULL,
  `book_id` int(2) NOT NULL,
  PRIMARY KEY (`perfid`),
  KEY `Perf_Pub` (`perf_pub`,`format_length`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`perfid`, `perf_pub`, `perf_year`, `perf_length`, `format_length`, `book_id`) VALUES
(8, 'Isis', 1995, 415, 'unabridged', 14),
(9, 'Random House Audio Books', 2007, 184, 'abridged', 14),
(10, 'ISIS', 1999, 463, 'unabridged', 16),
(11, 'Random House', 2007, 174, 'abridged', 16),
(12, 'Isis', 1999, 419, 'unabridged', 15),
(13, 'Random House', 2007, 181, 'abridged', 15),
(14, 'ISIS', 1999, 448, 'unabridged', 17),
(15, 'Random House', 2007, 184, 'abridged', 17);

-- --------------------------------------------------------

--
-- Table structure for table `performance_narrator`
--

CREATE TABLE IF NOT EXISTS `performance_narrator` (
  `perf_id` int(3) NOT NULL,
  `narrator_id` int(1) NOT NULL,
  KEY `perf_id` (`perf_id`),
  KEY `narrator_id` (`narrator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `performance_narrator`
--

INSERT INTO `performance_narrator` (`perf_id`, `narrator_id`) VALUES
(8, 2),
(9, 10),
(10, 8),
(11, 10),
(12, 2),
(13, 10),
(14, 2),
(15, 10);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`BookID`);

--
-- Constraints for table `performance_narrator`
--
ALTER TABLE `performance_narrator`
  ADD CONSTRAINT `performance_narrator_ibfk_2` FOREIGN KEY (`narrator_id`) REFERENCES `narrator` (`NarratorID`),
  ADD CONSTRAINT `performance_narrator_ibfk_1` FOREIGN KEY (`perf_id`) REFERENCES `performance` (`PerfID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
