-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 24, 2019 at 02:42 AM
-- Server version: 5.7.28
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
  `artist_id` int(8) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `active_years` varchar(9) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`, `origin`, `active_years`) VALUES
(1, 'bob_dylan', 'duluth_minnesota', '1959-2019'),
(2, 'a_tribe_called_quest', 'queens_new_york', '1985-2017');

-- --------------------------------------------------------

--
-- Table structure for table `disc`
--

CREATE TABLE `disc` (
  `artist_id` int(11) NOT NULL,
  `disc_id` int(1) NOT NULL,
  `title` varchar(256) COLLATE utf32_unicode_ci NOT NULL,
  `artist_name` varchar(30) COLLATE utf32_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `ext_data` mediumtext COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `disc`
--

INSERT INTO `disc` (`artist_id`, `disc_id`, `title`, `artist_name`, `year`, `ext_data`) VALUES
(1, 1, 'biograph', 'bob_dylan', 1985, ''),
(2, 2, 'bringing_it_all_back_home', 'bob_dylan', 1965, 'Electric Dylan'),
(4, 3, 'the_low_end_theory', 'a_tribe_called_quest', 1991, '');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `artist_id` int(11) NOT NULL,
  `disc_id` int(1) NOT NULL,
  `disc_genre` varchar(9) COLLATE utf32_unicode_ci NOT NULL,
  `artist_genre` varchar(9) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`artist_id`, `disc_id`, `disc_genre`, `artist_genre`) VALUES
(1, 1, 'folk', 'rock'),
(2, 3, 'hip-hop', 'rap'),
(4, 2, 'folk', 'rock');

-- --------------------------------------------------------

--
-- Table structure for table `record_label`
--

CREATE TABLE `record_label` (
  `artist_id` int(11) NOT NULL,
  `disc_id` int(11) NOT NULL,
  `artist_label` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  `disc_label` varchar(8) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `record_label`
--

INSERT INTO `record_label` (`artist_id`, `disc_id`, `artist_label`, `disc_label`) VALUES
(1, 1, 'columbia_asylum', 'columbia'),
(2, 3, 'jive_epic', 'jive'),
(3, 2, 'columbia_asylum', 'columbia');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `artist_id` int(11) NOT NULL,
  `disc_id` int(1) NOT NULL,
  `composer` varchar(20) COLLATE utf32_unicode_ci NOT NULL,
  `writer` varchar(50) COLLATE utf32_unicode_ci NOT NULL,
  `length` varchar(13) COLLATE utf32_unicode_ci NOT NULL,
  `year recorded` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`artist_id`, `disc_id`, `composer`, `writer`, `length`, `year recorded`) VALUES
(1, 1, 'bob_dylan', 'bob_dylan', '4314 seconds', 1965),
(2, 3, 'q-tip', 'q-tip_phife_ali_shaheed_muhammad', '2883 seconds', 1990),
(4, 2, 'bob_dylan', 'bob_dylan', '2841 seconds', 1965);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `name` (`name`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `artist_id_2` (`artist_id`),
  ADD KEY `artist_id_3` (`artist_id`);

--
-- Indexes for table `disc`
--
ALTER TABLE `disc`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `title` (`title`),
  ADD KEY `artist_id` (`artist_name`),
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `artist_id_2` (`artist_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `artist_genre` (`artist_genre`),
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `record_label`
--
ALTER TABLE `record_label`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `artist label` (`artist_label`),
  ADD KEY `disc_id` (`disc_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`artist_id`),
  ADD KEY `composer` (`composer`,`writer`) USING BTREE,
  ADD KEY `disc_id` (`disc_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `artist_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `record_label`
--
ALTER TABLE `record_label`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `artist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
