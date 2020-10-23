-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 12:17 AM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spaceand_hip_expressions`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `active_years` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `origin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `first_name`, `last_name`, `active_years`, `origin_id`) VALUES
(1, 'Sergio', 'Mendes', '1990-1995', 0),
(3, 'Gotan', 'Project', '1999-2020', 3),
(4, 'Denis', 'Jasarevic', '2008-2020', 4),
(5, 'Michel', 'Cox', '2005-2012', 4);

-- --------------------------------------------------------

--
-- Table structure for table `artist_track`
--

CREATE TABLE `artist_track` (
  `artist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `artist`, `year`, `ext_data`) VALUES
(1, 'Brasileiro', 'Sergio Mendes', 1992, ''),
(2, 'La revancha del tango', 'Gotan Project', 2001, ''),
(3, 'Street Bangerz Vol. 3', 'Gramatik', 2010, ''),
(4, 'Desert Chill: Sensual Arabian Grooves', 'Petrol Bomb Samosa', 2012, '');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `label`) VALUES
(1, 'Samba'),
(2, 'Downtempo'),
(4, 'Arabian Groove');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `label`) VALUES
(1, 'Samba'),
(2, 'Argentine milonga'),
(3, 'Skyscrapers'),
(4, 'Desert Oasis');

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `id` int(11) NOT NULL,
  `country` varchar(36) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`id`, `country`) VALUES
(1, 'Brazil'),
(3, 'Argentina'),
(4, 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `origin_style`
--

CREATE TABLE `origin_style` (
  `origin_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `style`
--

CREATE TABLE `style` (
  `id` int(11) NOT NULL,
  `label` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `style`
--

INSERT INTO `style` (`id`, `label`) VALUES
(1, 'Samba'),
(2, 'Tango'),
(3, 'International Tribal Style'),
(4, 'Arabian Groove');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `disc_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL,
  `playorder` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `title`, `disc_id`, `style_id`, `genre_id`, `image_id`, `ext_data`, `playorder`) VALUES
(1, 'Magalenha', 1, 1, 1, 1, '', '0'),
(2, 'Epoca', 2, 2, 2, 2, '', ''),
(8, 'Balkan Express', 3, 3, 2, 3, '', ''),
(9, 'The Baghdad Groove', 4, 4, 4, 4, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stage_name` (`first_name`,`last_name`),
  ADD KEY `name` (`first_name`,`last_name`),
  ADD KEY `origin` (`origin_id`);

--
-- Indexes for table `artist_track`
--
ALTER TABLE `artist_track`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `artist` (`artist`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `origin_style`
--
ALTER TABLE `origin_style`
  ADD UNIQUE KEY `origin_id` (`origin_id`),
  ADD UNIQUE KEY `style_id` (`style_id`);

--
-- Indexes for table `style`
--
ALTER TABLE `style`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `track_ibfk_1` (`disc_id`),
  ADD KEY `track_ibfk_2` (`style_id`),
  ADD KEY `track_ibfk_3` (`genre_id`),
  ADD KEY `track_ibfk_4` (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_track`
--
ALTER TABLE `artist_track`
  ADD CONSTRAINT `artist_track_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `artist_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `origin_style`
--
ALTER TABLE `origin_style`
  ADD CONSTRAINT `origin_style_ibfk_1` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`id`),
  ADD CONSTRAINT `origin_style_ibfk_2` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `disc` (`id`),
  ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`),
  ADD CONSTRAINT `track_ibfk_3` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `track_ibfk_4` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
