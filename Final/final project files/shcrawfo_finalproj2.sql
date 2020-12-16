-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2020 at 08:07 PM
-- Server version: 5.7.32
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
-- Database: `shcrawfo_finalproj2`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(8) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Comedy'),
(2, 'Drama'),
(3, 'Mystery');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `id` int(8) NOT NULL,
  `number` int(8) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `director` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`id`, `number`, `title`, `year`, `director`, `image_url`) VALUES
(1, 1, 'Big', 1988, 'Penny Marshall', 'https://images-na.ssl-images-amazon.com/images/I/513YB9TBQRL.jpg'),
(2, 2, 'Sully', 2016, 'Clint Eastwood', 'https://images-na.ssl-images-amazon.com/images/I/911pliu-7hL._SL1500_.jpg'),
(3, 3, 'Chinatown', 1974, 'Roman Polanski', 'https://images-na.ssl-images-amazon.com/images/I/41sVJOVA0ZL.jpg'),
(4, 4, 'Groundhog Day', 1993, 'Harold Ramis', 'https://images-na.ssl-images-amazon.com/images/I/51E9PTFZZ3L.jpg'),
(5, 5, 'The Piano', 1993, 'Jane Campion', 'https://images-na.ssl-images-amazon.com/images/I/81UdJPWDoxL._SL1500_.jpg'),
(6, 6, 'Awakenings', 1990, 'Penny Marshall', 'https://images-na.ssl-images-amazon.com/images/I/51ZNCRTKWEL.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `movie_genre`
--

CREATE TABLE `movie_genre` (
  `movie_id` int(8) NOT NULL,
  `genre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movie_genre`
--

INSERT INTO `movie_genre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 1),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `movie_subgenre`
--

CREATE TABLE `movie_subgenre` (
  `movie_id` int(8) NOT NULL,
  `subgenre_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `movie_subgenre`
--

INSERT INTO `movie_subgenre` (`movie_id`, `subgenre_id`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 3),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subgenre`
--

CREATE TABLE `subgenre` (
  `id` int(8) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subgenre`
--

INSERT INTO `subgenre` (`id`, `name`) VALUES
(1, 'Biography'),
(2, 'Fantasy'),
(3, 'Romance'),
(4, 'Romantic Comedy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `director` (`director`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `movie_subgenre`
--
ALTER TABLE `movie_subgenre`
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `subgenre_id` (`subgenre_id`);

--
-- Indexes for table `subgenre`
--
ALTER TABLE `subgenre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subgenre`
--
ALTER TABLE `subgenre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_genre`
--
ALTER TABLE `movie_genre`
  ADD CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`);

--
-- Constraints for table `movie_subgenre`
--
ALTER TABLE `movie_subgenre`
  ADD CONSTRAINT `movie_subgenre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  ADD CONSTRAINT `movie_subgenre_ibfk_2` FOREIGN KEY (`subgenre_id`) REFERENCES `subgenre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
