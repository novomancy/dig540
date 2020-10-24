-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2020 at 09:25 PM
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
-- Database: `samlehma_DIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `discs`
--

CREATE TABLE `discs` (
  `disc_id` int(7) NOT NULL,
  `title` varchar(270) COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(7) NOT NULL,
  `year` year(4) NOT NULL,
  `lines` int(8) NOT NULL,
  `producer_id` int(7) NOT NULL,
  `extd` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discs`
--

INSERT INTO `discs` (`disc_id`, `title`, `artist_id`, `year`, `lines`, `producer_id`, `extd`) VALUES
(1, 'King Arthur\'s Death', 1, 2007, 7561965, 1, ''),
(2, 'Malory Aloud', 2, 2002, 172526, 1, ''),
(3, 'Alliterative Morte', 1, 2007, 756785, 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discs`
--
ALTER TABLE `discs`
  ADD PRIMARY KEY (`disc_id`),
  ADD KEY `title` (`title`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `producer_id` (`producer_id`),
  ADD KEY `lines` (`lines`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discs`
--
ALTER TABLE `discs`
  MODIFY `disc_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discs`
--
ALTER TABLE `discs`
  ADD CONSTRAINT `discs_ibfk_1` FOREIGN KEY (`disc_id`) REFERENCES `Exhibition` (`exhibition_discs`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
