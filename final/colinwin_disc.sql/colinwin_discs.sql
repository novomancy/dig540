-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2017 at 02:46 PM
-- Server version: 5.6.38
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
-- Database: `colinwin_discs`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id` int(4) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(4) NOT NULL,
  `artist_id` int(4) NOT NULL,
  `image_url` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `title`, `year`, `artist_id`, `image_url`) VALUES
(5, 'The Glory of Purcell', 1995, 6, 'https://goo.gl/images/brGx1q'),
(7, 'Sir Hubert Parry', 2015, 5, 'https://goo.gl/images/WDhXcE '),
(10, 'Adam\'s Lament', 2012, 4, 'https://goo.gl/images/Vmw9Rm'),
(11, 'Messiah Highlights', 1998, 3, 'https://goo.gl/images/RG4xEi'),
(14, 'The Song of Songs', 1994, 2, 'https://goo.gl/images/Sb91CU'),
(15, 'Faure Requiem', 1988, 2, 'https://goo.gl/images/QD5nms'),
(18, 'Tallis Mass for Four Voices, Motets', 1993, 1, 'https://goo.gl/images/yHnsnx'),
(20, 'A Banquet of Voices', 1994, 2, 'https://goo.gl/images/RLRa15');

-- --------------------------------------------------------

--
-- Table structure for table `album_composer`
--

CREATE TABLE `album_composer` (
  `album_id` int(4) NOT NULL,
  `composer_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(4) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`) VALUES
(1, 'Summerly, Jeremy'),
(2, 'Rutter, John'),
(3, 'Solti, Sir George'),
(4, 'Kaljuste, Tonu'),
(5, 'O\'Donnel, James'),
(6, 'Hogwood, Christopher');

-- --------------------------------------------------------

--
-- Table structure for table `composer`
--

CREATE TABLE `composer` (
  `id` int(4) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `composer`
--

INSERT INTO `composer` (`id`, `name`) VALUES
(1, '\"Thomas Tallis\"'),
(2, '\"Gabriel Faure\"'),
(3, '\"Giovanni da Palestrina\"'),
(4, '\"George F. Handel\"'),
(5, '\"Arvo Part\"'),
(6, '\"Hubert H. Parry\"'),
(7, '\"Henry Purcell\"'),
(8, '\"Johann Sebastian Bach\"'),
(9, '\"Gregorio Allegri\"'),
(10, '\"Johannes Brahms\"');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`title`(255),`year`,`artist_id`),
  ADD KEY `artist-id` (`artist_id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `album_composer`
--
ALTER TABLE `album_composer`
  ADD KEY `album_id` (`album_id`),
  ADD KEY `composer_id` (`composer_id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`name`(255));

--
-- Indexes for table `composer`
--
ALTER TABLE `composer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`name`(255)),
  ADD KEY `id_2` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `composer`
--
ALTER TABLE `composer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`);

--
-- Constraints for table `album_composer`
--
ALTER TABLE `album_composer`
  ADD CONSTRAINT `album_composer_ibfk_1` FOREIGN KEY (`composer_id`) REFERENCES `composer` (`id`),
  ADD CONSTRAINT `album_composer_ibfk_2` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
