-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 11:37 PM
-- Server version: 5.7.27
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
-- Database: `curtinwe_DIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(8) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active years` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `origin`, `active years`) VALUES
(1, 'Bob Dylan', 'Duluth, Minnesota', '1959-2019');

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `ext_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`id`, `title`, `artist_id`, `year`, `ext_data`) VALUES
(1, 'Biograph', 'Bob Dylan', 1985, '');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` varchar(9) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `artist_genre` varchar(9) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `artist_genre`) VALUES
('folk', 'rock');

-- --------------------------------------------------------

--
-- Table structure for table `record label`
--

CREATE TABLE `record label` (
  `artist label` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `disc label` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `record label`
--

INSERT INTO `record label` (`artist label`, `disc label`) VALUES
('Columbia, Asylum', 'Columbia');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `composer` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `writer` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `length` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `year recorded` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`composer`, `writer`, `length`, `year recorded`) VALUES
('Bob Dylan', 'Bob Dylan', '4314 seconds', 1965);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD KEY `artist_genre` (`artist_genre`);

--
-- Indexes for table `record label`
--
ALTER TABLE `record label`
  ADD KEY `artist label` (`artist label`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD UNIQUE KEY `composer` (`composer`,`writer`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
