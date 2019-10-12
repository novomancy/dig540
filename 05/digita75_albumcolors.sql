-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 09:44 PM
-- Server version: 10.2.26-MariaDB
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
-- Database: `digita75_albumcolors`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(8) NOT NULL,
  `year` year(4) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `title`, `artist_id`, `year`, `ext_data`) VALUES
(1, 'Good Humor', 8, 1998, 'The words Saint Etienne themselves give me a similar feeling, one of a world in which all the women wear pearls and are able to sing in key, and one where the men drive sports cars and never stumble—a world where nostalgia is beside the point because all of us live inside a bright and glorious present. Douglas Coupland'),
(2, 'American IV: The Man Comes Around', 3, 2002, ''),
(3, 'Version 2.0', 7, 1998, ''),
(4, 'The Best of the Song Books', 6, 1993, ''),
(5, 'Simple Things', 9, 2001, '');

-- --------------------------------------------------------

--
-- Table structure for table `album_color`
--

CREATE TABLE `album_color` (
  `album_id` int(8) NOT NULL,
  `color_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album_color`
--

INSERT INTO `album_color` (`album_id`, `color_id`) VALUES
(1, 3),
(2, 2),
(3, 6),
(4, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `album_genre`
--

CREATE TABLE `album_genre` (
  `album_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album_genre`
--

INSERT INTO `album_genre` (`album_id`, `genre_id`) VALUES
(1, 1),
(2, 4),
(3, 8),
(4, 6),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `country`) VALUES
(1, 'Bjork', 'Iceland'),
(2, 'Black Prairie', 'USA (Portland,OR)'),
(3, 'Johnny Cash', 'USA (Nashville, TN)'),
(4, 'John Coltrane', 'USA (New York, NY)'),
(5, 'Duran Duran', 'UK (Birmingham, England)'),
(6, 'Ella Fitzgerald', 'USA'),
(7, 'Garbage', 'USA (Madison, WI)'),
(8, 'Saint Etienne', 'UK (London, England)'),
(9, 'Zero 7', 'UK (London, England)');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(8) NOT NULL,
  `hexdec` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `hexdec`, `name`) VALUES
(1, '#4363d8', 'blue'),
(2, '#000000', 'black'),
(3, '#3cb44b', 'green'),
(4, '#f032e6', 'magenta'),
(5, '#000075', 'navy'),
(6, '#f58231', 'orange'),
(7, '#911eb4', 'purple'),
(8, '#e6194B', 'red'),
(9, '#ffe119', 'yellow'),
(10, '#ffffff', 'white');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'alternative'),
(2, 'bluegrass'),
(3, 'blues'),
(4, 'country'),
(5, 'electronica'),
(6, 'jazz'),
(7, 'pop'),
(8, 'rock');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(8) NOT NULL,
  `album_id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `album_id`, `title`) VALUES
(1, 1, 'Wood Cabin'),
(2, 2, 'Hurt'),
(3, 3, 'Special'),
(4, 4, 'S\'Wonderful'),
(5, 5, 'In the Waiting Line');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_title` (`title`),
  ADD KEY `album_artist` (`artist_id`);

--
-- Indexes for table `album_color`
--
ALTER TABLE `album_color`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `color_id` (`color_id`);

--
-- Indexes for table `album_genre`
--
ALTER TABLE `album_genre`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hexdec` (`hexdec`) USING BTREE,
  ADD KEY `name` (`name`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `title` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Constraints for table `album_color`
--
ALTER TABLE `album_color`
  ADD CONSTRAINT `album_color_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `album_color_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`);

--
-- Constraints for table `album_genre`
--
ALTER TABLE `album_genre`
  ADD CONSTRAINT `album_genre_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `album_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
