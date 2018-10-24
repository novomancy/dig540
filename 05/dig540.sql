-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: mysql.howesarchives.org
-- Generation Time: Oct 10, 2018 at 05:39 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dig540`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(8) NOT NULL,
  `artistname` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `activeyears` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `artistname`, `origin`, `activeyears`) VALUES
(1, 'Sam Roberts', 'Canada', '2000-'),
(2, 'Ronnie Hawkins', 'Arkansas, USA', '1956-'),
(3, 'Sam Roberts Band', 'Canada', '2011-'),
(4, 'Hedley', 'Canada', '2003-');

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `extd` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `country`, `label`, `year`, `extd`) VALUES
(1, 'Let It Rock', 'Canada', 'Quality', 1985, ''),
(2, 'We Were Born In A Flame', 'Canada', 'Universal Music Canada', 2004, ''),
(3, 'Wild Life', 'Canada', 'Universal Music Canada', 2013, ''),
(4, 'Lo-Fantasy', 'Canada', 'Paper Bag Records', 2014, '');

-- --------------------------------------------------------

--
-- Table structure for table `disc_artist`
--

CREATE TABLE `disc_artist` (
  `artist_id` int(8) NOT NULL,
  `disc_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc_artist`
--

INSERT INTO `disc_artist` (`artist_id`, `disc_id`) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `disc_genre`
--

CREATE TABLE `disc_genre` (
  `disc_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc_genre`
--

INSERT INTO `disc_genre` (`disc_id`, `genre_id`) VALUES
(1, 1),
(2, 3),
(4, 3),
(3, 4);

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
(1, 'Rockabilly'),
(2, 'Rock'),
(3, 'Indie Rock'),
(4, 'Pop Rock');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `disc_id` int(8) NOT NULL,
  `playorder` int(11) NOT NULL,
  `extt` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `title`, `disc_id`, `playorder`, `extt`) VALUES
(1, 'Hard Road', 2, 1, ''),
(2, 'Let It Rock', 1, 1, ''),
(3, 'Shapeshifters', 4, 1, ''),
(4, 'We\'re All In This Together', 4, 2, ''),
(5, 'Anything', 3, 1, ''),
(6, 'Crazy For You', 3, 2, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artistname` (`artistname`(255)),
  ADD KEY `origin` (`origin`(255));

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`(255)),
  ADD KEY `country` (`country`(255)),
  ADD KEY `label` (`label`(255));

--
-- Indexes for table `disc_artist`
--
ALTER TABLE `disc_artist`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `disc_id` (`disc_id`);

--
-- Indexes for table `disc_genre`
--
ALTER TABLE `disc_genre`
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(255));

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `title` (`title`(255));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disc_artist`
--
ALTER TABLE `disc_artist`
  ADD CONSTRAINT `disc_artist_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `disc_artist_ibfk_2` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`);

--
-- Constraints for table `disc_genre`
--
ALTER TABLE `disc_genre`
  ADD CONSTRAINT `disc_genre_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`),
  ADD CONSTRAINT `disc_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
