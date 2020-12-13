-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2020 at 07:32 PM
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
(1, 'Sergio', 'Santos', '1990-1995', 1),
(3, 'Eduardo ', 'Makaroff', '1999-2020', 3),
(4, 'Denis', 'Jasarevic', '2008-2020', 6),
(5, 'Michel', 'Cox', '2005-2012', 4),
(6, 'Menton', 'Matthews', '2006-2020', 4),
(7, 'Damian', 'Marley', '1992-2020', 7),
(8, 'Jimbo', 'Mathus', '1993-2020', 4),
(9, 'Emad', 'Sayyah', '1981-2010', 8),
(10, 'Ya', 'Halawa', '1999-2009', 9),
(11, 'Max', 'Johnston', '1994-2013', 4),
(12, 'Gil', 'Cerezo', '1996-2020', 10),
(13, 'Ben', 'Haggerty', '2008-2017', 4),
(14, 'Quentin', 'Cook', '1979-2020', 11),
(15, 'DJ', 'Stott', '1994-2020', 4),
(16, 'Hussein', 'El Masry', '1993-2014', 12),
(17, 'Kristine', 'Flaherty', '2003-2020', 4),
(18, 'Massimilliano', 'Titi', '1990-2010', 13),
(19, 'Steven', 'Buble', '1995-2020', 14),
(20, 'Kiatia', 'Kirkland', '2006-2020', 4),
(21, 'Zoe', 'Jakes', '2007-2020', 4),
(22, 'Katharine', 'Whalen', '1993-2020', 4);

-- --------------------------------------------------------

--
-- Table structure for table `artist_track`
--

CREATE TABLE `artist_track` (
  `artist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist_track`
--

INSERT INTO `artist_track` (`artist_id`, `track_id`) VALUES
(1, 1),
(3, 2),
(4, 8),
(5, 9),
(6, 10),
(7, 11),
(8, 12),
(9, 13),
(10, 14),
(11, 15),
(12, 16),
(13, 17),
(14, 18),
(15, 19),
(16, 20),
(17, 21),
(18, 22),
(19, 23),
(20, 24),
(21, 25),
(22, 26);

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
(2, 'La Revancha del Tango', 'Gotan Project', 2001, ''),
(3, 'Street Bangerz Vol. 3', 'Gramatik', 2010, ''),
(4, 'Desert Chill: Sensual Arabian Grooves', 'Petrol Bomb Samosa', 2012, ''),
(5, 'Ganglion', 'Saltillo', 2006, ''),
(6, 'Make It Bun Dem After Hours', 'Skrillex', 2012, ''),
(7, 'Perennial Favorites', 'Squirrel Nut Zippers', 1998, ''),
(8, 'Exotic Cairo: Modern Belly Dance Music from Cairo', 'Zamalek Musicians', 2005, ''),
(9, 'Modern Egyptian Belly Dance', 'Gizira Band', 2006, ''),
(10, 'Shinebox', 'The Gourds', 1998, ''),
(11, 'Vicious Delicious', 'Infected Mushroom', 2007, ''),
(12, 'The Heist', 'Macklemore and Ryan Lewis', 2012, ''),
(13, 'You\'ve Come a Long Way Baby', 'Fatboy Slim', 1998, ''),
(14, 'SoukSonik', 'Jef Stott and Reda Darwish', 2007, ''),
(15, 'Egypt Belly Dance', 'Hussein El Masry and Baligh Hamdi', 2008, ''),
(16, 'K.Flay', 'K.Flay', 2010, ''),
(17, 'Ethnic Soundscapes', 'TCO', 2010, ''),
(18, 'It\'s Time', 'Michael Buble', 2019, ''),
(19, 'VYP', 'Lil Mama', 2008, ''),
(20, 'Elektrafone', 'Beats Antique', 2011, '');

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
(4, 'Arabian Groove'),
(5, 'Reggaestep'),
(6, 'Jazz'),
(7, 'Belly Dance'),
(8, 'Country'),
(9, 'Psychedelic trance'),
(10, 'Hip Hop'),
(11, 'Big beat'),
(12, 'International'),
(13, 'Easy Listening'),
(14, 'Electronic');

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
(1, 'Brasileiro cover art'),
(2, 'Argentine milonga'),
(3, 'Skyscrapers'),
(4, 'Desert Oasis'),
(5, 'Violin'),
(6, 'Jamaican sun'),
(7, 'Squirrel Nut Zipper cover art'),
(8, 'Belly dance instructor'),
(9, 'Belly dancer'),
(10, 'The Gourds'),
(11, 'Infected Mushroom cover art'),
(12, 'Thrift Shop'),
(13, 'Disc cover art'),
(14, 'Jef Stott'),
(15, 'Hip Stars'),
(16, 'K.Flay art'),
(17, 'Rio Carnival'),
(18, 'Michael Buble'),
(19, 'Lil Mama'),
(20, 'Cat Skillz SoundCloud'),
(21, 'Katharine Whalen');

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
(4, 'United States'),
(6, 'Slovenia'),
(7, 'Jamaica'),
(8, 'Lebanon'),
(9, 'Middle East'),
(10, 'Israel'),
(11, 'England'),
(12, 'Egypt'),
(13, 'Italy'),
(14, 'Canada');

-- --------------------------------------------------------

--
-- Table structure for table `origin_style`
--

CREATE TABLE `origin_style` (
  `origin_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `origin_style`
--

INSERT INTO `origin_style` (`origin_id`, `style_id`) VALUES
(1, 1),
(3, 2),
(4, 3),
(6, 3),
(7, 3),
(8, 7),
(9, 7),
(10, 3),
(11, 3),
(12, 10),
(13, 1),
(14, 5),
(4, 4),
(4, 8),
(4, 6),
(4, 9),
(4, 5);

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
(4, 'Arabian Groove'),
(5, 'Belly Dance Fusion'),
(6, 'Burlesque'),
(7, 'Egyptian'),
(8, 'Funky Fusion'),
(9, 'Turkish Belly Dance'),
(10, 'Baladi');

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
(9, 'The Baghdad Groove', 4, 4, 4, 4, '', ''),
(10, 'Grafting', 5, 5, 2, 5, '', ''),
(11, 'Make It Bun Dem', 6, 3, 5, 6, '', ''),
(12, 'That Fascinating Thing', 7, 6, 6, 7, '', ''),
(13, 'I Love Tabla', 8, 7, 7, 8, '', ''),
(14, 'El Hakkale', 9, 7, 7, 9, '', ''),
(15, 'Gin and Juice', 10, 8, 8, 10, '', ''),
(16, 'Becoming Insane', 11, 3, 9, 11, '', ''),
(17, 'Thrift Shop', 12, 8, 10, 12, '', ''),
(18, 'The Rockafeller Skank', 13, 3, 11, 13, '', ''),
(19, 'Funky Nawari', 14, 9, 12, 14, '', ''),
(20, 'Tabeli', 15, 10, 7, 15, '', ''),
(21, 'Acetaminophen', 16, 3, 10, 16, '', ''),
(22, 'Brazilian Samba', 17, 1, 1, 17, '', ''),
(23, 'Feeling Good', 18, 5, 13, 18, '', ''),
(24, 'Lip Gloss', 19, 5, 10, 19, '', ''),
(25, 'Cat Skillz', 20, 8, 14, 20, '', ''),
(26, 'My Drag', 7, 5, 6, 21, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
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
  ADD KEY `style_id` (`style_id`) USING BTREE,
  ADD KEY `origin_id` (`origin_id`) USING BTREE;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `disc`
--
ALTER TABLE `disc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `style`
--
ALTER TABLE `style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
