-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2020 at 10:16 PM
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
-- Database: `alanadig_ubuweb_sound`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `years` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `origin` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `resources_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `years`, `origin`, `resources_url`) VALUES
(1, 'Apollinaire, Guillaume', '1880-1918', 'France', ''),
(2, 'Lesko, Lauren', '', 'United States', ''),
(3, 'Kieltyka, Connie', '', '', ''),
(4, 'Burljuk, David', '1882-1967', 'Ukraine', 'http://ukrainianmuseum.org/burliuk/?q=node/1'),
(5, 'Kamenskij, Vasilij', '1884-1961', 'Russia', 'https://en.wikipedia.org/wiki/Vasily_Kamensky'),
(6, 'Dine, Jim', '1935-', 'United States', 'https://www.tate.org.uk/art/artists/jim-dine-1009'),
(7, 'Klüver, Billy', '1927-2004', 'Monaco; Sweden', 'https://en.wikipedia.org/wiki/Billy_Kl%C3%BCver'),
(8, 'Brecht, George', '1926-2008', 'United States', 'https://en.wikipedia.org/wiki/George_Brecht'),
(9, 'Khlebnikov, Velimir (Viktor Vladimirovich)', '1885-1922', 'Russia', 'https://en.wikipedia.org/wiki/Velimir_Khlebnikov'),
(10, 'Kirsanov, Semyon', '1906-1972', 'Russia', 'https://en.wikipedia.org/wiki/Semyon_Kirsanov'),
(11, 'Johns, Jasper', '1930-', 'United States', 'https://www.jasper-johns.org/'),
(12, 'Ray, May (Emmanuel Radnitzky)', '1890-1976', 'United States', 'https://www.moma.org/artists/3716');

-- --------------------------------------------------------

--
-- Table structure for table `artist_role`
--

CREATE TABLE `artist_role` (
  `audio_id` int(8) NOT NULL,
  `artist_id` int(8) NOT NULL,
  `role_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artist_role`
--

INSERT INTO `artist_role` (`audio_id`, `artist_id`, `role_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(3, 3, 3),
(5, 4, 1),
(6, 5, 1),
(7, 6, 2),
(7, 7, 5),
(8, 8, 2),
(8, 7, 5),
(9, 9, 1),
(9, 10, 6),
(10, 11, 2),
(11, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `id` int(8) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  `language` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `audio_url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `extd` text COLLATE utf8_unicode_ci NOT NULL,
  `compilation_id` int(8) DEFAULT NULL,
  `playorder` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`id`, `title`, `year`, `language`, `audio_url`, `extd`, `compilation_id`, `playorder`) VALUES
(1, 'Le Pont Mirabeau (Alcools)', 1913, 'French', 'http://media.sas.upenn.edu/pennsound/authors/Apollinaire/Apollinaire-Guillaume_01_Le-Pont-Mirabeau_1913.mp3', '', 1, 1),
(2, 'Marie', 1913, 'French', 'http://media.sas.upenn.edu/pennsound/authors/Apollinaire/Apollinaire-Guillaume_02_Marie_1913.mp3', '', 1, 2),
(3, 'Thirst', 1995, '', 'https://ubusound.memoryoftheworld.org/lesko_lauren/Lesko-Lauren_Thirst.mp3', 'Audio: Harvestworks, NYC\r\nEdition of 12', NULL, NULL),
(4, 'Le Voyageur', 1913, 'French', 'http://media.sas.upenn.edu/pennsound/authors/Apollinaire/Apollinaire-Guillaume_03_Le-Voyager_1913.mp3', '', 1, 3),
(5, 'Sunset Painter', NULL, 'Ukrainian', 'https://ubusound.memoryoftheworld.org/russian_futurism/Russian-Futurism_Burljuk_Sunset-Painter.mp3', '', 2, 1),
(6, 'How I Live', 1959, 'Russian', 'https://ubusound.memoryoftheworld.org/russian_futurism/Russian-Futurism_Kamenskij_How-I-Live_1959.mp3', '', 2, 2),
(7, 'Jim Dine', 1963, 'English', 'https://ubusound.memoryoftheworld.org/pop/01_Popular-Image-Exhibition_1963_Jim-Dine.mp3', '', 3, 1),
(8, 'George Brecht', 1963, 'English', 'https://ubusound.memoryoftheworld.org/pop/02_Popular-Image-Exhibition_1963_George-Brecht.mp3', '', 3, 2),
(9, 'Don\'t Be Naughty', 1963, '', 'https://www.ubu.com/media/sound/russian_futurism/Russian-Futurism_Khlebnikov-Don\'T-Be-Naughty_Read-By-Kirsanov_1963.mp3', 'Read by Kirsanov', 2, 3),
(10, 'Jasper Johns', 1963, 'English', 'https://www.ubu.com/media/sound/pop/03_Popular-Image-Exhibition_1963_Jasper-Johns.mp3', '', 3, 3),
(11, 'Man Ray (Interview)', NULL, 'English', 'https://www.ubu.com/media/sound/ray_man/Ray-Man_Interview.mp3', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audio_category`
--

CREATE TABLE `audio_category` (
  `audio_id` int(8) NOT NULL,
  `category_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `audio_category`
--

INSERT INTO `audio_category` (`audio_id`, `category_id`) VALUES
(1, 1),
(3, 2),
(2, 1),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(4, 1),
(9, 3),
(10, 4),
(7, 5),
(8, 5),
(10, 5),
(11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(8) NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(3, 'Futurism'),
(4, 'Interview'),
(5, 'Pop Art'),
(2, 'Sound Art'),
(1, 'Symbolism');

-- --------------------------------------------------------

--
-- Table structure for table `compilation`
--

CREATE TABLE `compilation` (
  `id` int(8) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compilation`
--

INSERT INTO `compilation` (`id`, `title`, `year`, `description`) VALUES
(1, 'Recordings by Apollinaire', 1913, ''),
(2, 'Russian Futurists from the GLM Collection', NULL, ''),
(3, 'Popular Image Exhibition', 1963, 'Recorded By, Edited By, Interviewer, Liner Notes – Billy Klüver\r\n\r\n\"During March 1963 I produced an hour-long record of interviews with eleven artists in the \'Popular Image Exhibition\' at the Washington Gallery of Modern Art, Washington, D.C., organized by Alice Denney, April 18 - June 2, 1963.\r\n\r\nThis was the fourth exhibition of \'pop artists\' held in the six months since \'Art 1963: A New Vocabulary\' opening October 25, 1962, in Philadelphia, followed by shows at Sidney Janis Gallery in New York and Dwan Gallery in Los Angeles.');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(8) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `notes` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Use notes for additional data on role/instruments';

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `notes`) VALUES
(1, 'Poet', ''),
(2, 'Artist', ''),
(3, 'Producer', ''),
(4, 'Engineer', ''),
(5, 'Interviewer', ''),
(6, 'Reader', '');

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
-- Indexes for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comp_id_2` (`compilation_id`,`playorder`) USING BTREE,
  ADD KEY `title` (`title`),
  ADD KEY `comp_id` (`compilation_id`);
ALTER TABLE `audio` ADD FULLTEXT KEY `extd` (`extd`);

--
-- Indexes for table `audio_category`
--
ALTER TABLE `audio_category`
  ADD KEY `audio_id` (`audio_id`),
  ADD KEY `cat_id` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `compilation`
--
ALTER TABLE `compilation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `compilation`
--
ALTER TABLE `compilation`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_role`
--
ALTER TABLE `artist_role`
  ADD CONSTRAINT `artist_role_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `artist_role_ibfk_2` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`id`),
  ADD CONSTRAINT `artist_role_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `audio`
--
ALTER TABLE `audio`
  ADD CONSTRAINT `audio_ibfk_1` FOREIGN KEY (`compilation_id`) REFERENCES `compilation` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `audio_category`
--
ALTER TABLE `audio_category`
  ADD CONSTRAINT `audio_category_ibfk_1` FOREIGN KEY (`audio_id`) REFERENCES `audio` (`id`),
  ADD CONSTRAINT `audio_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
