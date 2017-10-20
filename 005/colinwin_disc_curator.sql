-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 10, 2017 at 12:30 PM
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
  `datesActive` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `genre_id` int(8) NOT NULL,
  `track-id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Artist`
--

INSERT INTO `Artist` (`artist_id`, `name`, `datesActive`, `genre_id`, `track-id`) VALUES
(2, 'David Willcocks', '1945-2006', 0, 0),
(3, 'Stephen Cleobury', '1980-2017', 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Composer`
--

CREATE TABLE `Composer` (
  `Composer_id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dates active` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `track_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Composer`
--

INSERT INTO `Composer` (`Composer_id`, `name`, `dates active`, `track_id`) VALUES
(2, 'Orlando Gibbons', '1610-1625', 12),
(3, 'Ralph Vaughan Williams', '1900-1958', 10);

-- --------------------------------------------------------

--
-- Table structure for table `DiscGenre`
--

CREATE TABLE `DiscGenre` (
  `disc_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DiscGenre`
--

INSERT INTO `DiscGenre` (`disc_id`, `genre_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Discs`
--

CREATE TABLE `Discs` (
  `disc_id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL,
  `year` year(4) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL,
  `length` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Discs`
--

INSERT INTO `Discs` (`disc_id`, `title`, `artist_id`, `genre_id`, `year`, `ext_data`, `length`) VALUES
(1, 'Anthems at Kings College', 2, 2, 2000, '', 3600),
(2, 'Anthems at Kings College', 3, 3, 2000, '', 3600);

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
(1, 'Choral'),
(2, 'choral, modern'),
(3, 'choral, 17th century');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `track_id` int(4) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(8) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL,
  `playorder` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`track_id`, `title`, `artist_id`, `ext_data`, `playorder`) VALUES
(2, 'This is the record of John', 2, '', 14),
(3, 'O clap your hands', 3, '', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `name` (`name`(255)),
  ADD KEY `datesActive` (`datesActive`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Composer`
--
ALTER TABLE `Composer`
  ADD PRIMARY KEY (`Composer_id`),
  ADD KEY `name` (`name`(255));

--
-- Indexes for table `DiscGenre`
--
ALTER TABLE `DiscGenre`
  ADD PRIMARY KEY (`disc_id`),
  ADD KEY `Genre_id` (`genre_id`);

--
-- Indexes for table `Discs`
--
ALTER TABLE `Discs`
  ADD PRIMARY KEY (`disc_id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `artist_id` (`artist_id`);

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
  MODIFY `Composer_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `DiscGenre`
--
ALTER TABLE `DiscGenre`
  MODIFY `disc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Discs`
--
ALTER TABLE `Discs`
  MODIFY `disc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `genre_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `track_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
