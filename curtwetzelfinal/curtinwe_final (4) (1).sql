-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2019 at 12:46 AM
-- Server version: 5.7.28
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
-- Database: `curtinwe_final`
--

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE `director` (
  `film_id` int(4) NOT NULL,
  `director_id` int(4) NOT NULL,
  `name` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `years_active` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(155) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `director`
--

INSERT INTO `director` (`film_id`, `director_id`, `name`, `years_active`, `country`) VALUES
(1, 1, 'george_miller', '1970-2019', 'australia'),
(2, 2, 'l_q_jones', '1955-2006', 'united_states'),
(3, 3, 'ubaldo_ragona_and_sidney_salkow', '1955-1966', 'italy_united_states'),
(4, 4, 'stanley_kramer', '1933-1979', 'united_states');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `film_id` int(4) NOT NULL,
  `title` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `director` varchar(155) COLLATE utf8_unicode_ci NOT NULL,
  `genre_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`film_id`, `title`, `director`, `genre_name`, `image_url`) VALUES
(1, 'mad_max', 'george_miller', 'action', ''),
(2, 'a_boy_and_his_dog', 'l_q_jones', 'science_fiction', 'https://upload.wikimedia.org/wikipedia/en/f/f3/1976_movie_poster_for_the_movie_%27a_boy_and_his_dog%27.jpg'),
(3, 'the_last_man_on_earth', 'ubaldo_ragona_and_sidney_salkow', 'horror', 'https://upload.wikimedia.org/wikipedia/en/7/73/Lastmanonearth1960s.jpg'),
(4, 'on_the_beach', 'stanley_kramer', 'science_fiction', '');

-- --------------------------------------------------------

--
-- Table structure for table `film_genre`
--

CREATE TABLE `film_genre` (
  `genre_id` int(4) NOT NULL,
  `genre_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `film_genre`
--

INSERT INTO `film_genre` (`genre_id`, `genre_name`) VALUES
(1, 'action'),
(2, 'science_fiction'),
(3, 'horror'),
(2, 'science_fiction');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `director`
--
ALTER TABLE `director`
  ADD UNIQUE KEY `director_id_2` (`director_id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `director_id_3` (`director_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`),
  ADD UNIQUE KEY `director` (`director`),
  ADD KEY `director_2` (`director`),
  ADD KEY `genre` (`genre_name`);

--
-- Indexes for table `film_genre`
--
ALTER TABLE `film_genre`
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `genre_name` (`genre_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `film_genre_ibfk_1` FOREIGN KEY (`genre_name`) REFERENCES `film` (`genre_name`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
