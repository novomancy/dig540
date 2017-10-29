-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2017 at 02:45 AM
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
-- Database: `colinwin_disc_curator`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `artist_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dates_active` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`artist_id`, `name`, `dates_active`) VALUES
(2, 'David Willcocks', '1945-2015'),
(3, 'Stephen Cleobury', '1970-2017');

-- --------------------------------------------------------

--
-- Table structure for table `Composer`
--

CREATE TABLE `Composer` (
  `composer_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dates active` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Composer`
--

INSERT INTO `Composer` (`composer_id`, `name`, `dates active`) VALUES
(2, 'Orlando Gibbons', '1610-1625'),
(3, 'Ralph Vaughan Williams', '1900-1958');

-- --------------------------------------------------------

--
-- Table structure for table `Discs`
--

CREATE TABLE `Discs` (
  `disc_id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `length` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Discs`
--

INSERT INTO `Discs` (`disc_id`, `title`, `artist_id`, `genre_id`, `ext_data`, `year`, `length`) VALUES
(1, 'Psalms at Kings College', 2, 2, '', 1980, 3600),
(2, 'Anthems at King\'s College', 3, 3, '', 2000, 3650);

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `genre_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`genre_id`, `name`) VALUES
(2, 'Choral, 17th Century'),
(3, 'Choral, 20th Century');

-- --------------------------------------------------------

--
-- Table structure for table `Track`
--

CREATE TABLE `Track` (
  `track_id` int(8) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist_id` int(8) NOT NULL,
  `disc_id` int(8) NOT NULL,
  `playorder` int(8) NOT NULL,
  `composer_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Track`
--

INSERT INTO `Track` (`track_id`, `title`, `artist_id`, `disc_id`, `playorder`, `composer_id`) VALUES
(2, 'This is the record of John', 2, 1, 4, 2),
(3, 'O clap your hands', 3, 2, 14, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `Composer`
--
ALTER TABLE `Composer`
  ADD PRIMARY KEY (`composer_id`);

--
-- Indexes for table `Discs`
--
ALTER TABLE `Discs`
  ADD PRIMARY KEY (`disc_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `Track`
--
ALTER TABLE `Track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `artist_id` (`artist_id`,`disc_id`,`composer_id`),
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `composer_id` (`composer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Artist`
--
ALTER TABLE `Artist`
  MODIFY `artist_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `Composer`
--
ALTER TABLE `Composer`
  MODIFY `composer_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Discs`
--
ALTER TABLE `Discs`
  MODIFY `disc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `genre_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Artist`
--
ALTER TABLE `Artist`
  ADD CONSTRAINT `Artist_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `Discs` (`artist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Discs`
--
ALTER TABLE `Discs`
  ADD CONSTRAINT `Discs_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`genre_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Track`
--
ALTER TABLE `Track`
  ADD CONSTRAINT `Track_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `Artist` (`artist_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Track_ibfk_2` FOREIGN KEY (`disc_id`) REFERENCES `Discs` (`disc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Track_ibfk_3` FOREIGN KEY (`composer_id`) REFERENCES `Composer` (`composer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
