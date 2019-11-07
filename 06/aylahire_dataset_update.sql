-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2019 at 05:33 PM
-- Server version: 10.2.27-MariaDB
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
-- Database: `aylahire_dataset`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`) VALUES
(1, 'Drake featuring WizKid and Kyla'),
(2, 'Major Lazer and DJ Snake featuring MØ'),
(3, 'Justin Bieber'),
(4, 'Mark Ronson featuring Bruno Mars'),
(5, 'Ed Sheeran'),
(6, 'The Weeknd'),
(7, 'Adele'),
(8, 'Lukas Graham'),
(9, 'Shawn Mendes'),
(10, 'Sia'),
(11, 'Hozier'),
(12, 'Twenty One Pilots'),
(13, 'Skrillex and Diplo featuring Justin Bieber'),
(14, 'Wiz Khalifa featuring Charlie Puth'),
(15, 'Rihanna featuring Drake'),
(16, 'Calvin Harris featuring Rihanna'),
(17, 'Major Lazer featuring MØ and Justin Bieber'),
(18, 'Drake'),
(19, 'Fifth Harmony featuring Ty Dolla $ign'),
(20, 'Maroon 5'),
(21, 'Alan Walker'),
(22, 'Sam Smith'),
(23, 'Major Lazer featuring Nyla and Fuse ODG'),
(24, 'G-Eazy and Bebe Rexha'),
(25, 'Ellie Goulding'),
(26, 'Passenger'),
(27, 'Imagine Dragons'),
(28, 'John Legend'),
(29, 'Zara Larsson'),
(30, 'DJ Snake featuring Justin Bieber'),
(31, 'Clean Bandit featuring Jess Glynne'),
(32, 'Desiigner'),
(33, 'OneRepublic'),
(34, 'Justin Timberlake'),
(35, 'Fetty Wap'),
(36, 'Avicii featuring Aloe Blacc'),
(37, 'The Chainsmokers featuring Rozes'),
(38, 'Robin Schulz featuring Francesco Yates'),
(39, 'DNCE'),
(40, 'Pharrell Williams'),
(41, 'Kygo featuring Conrad Sewell'),
(42, 'Mike Posner'),
(43, 'Me 4 U'),
(44, 'The Chainsmokers featuring Daya'),
(45, 'The Chainsmokers featuring Halsey');

-- --------------------------------------------------------

--
-- Table structure for table `artist_ex_data`
--

CREATE TABLE `artist_ex_data` (
  `artist_id` int(11) NOT NULL,
  `ex_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disk`
--

CREATE TABLE `disk` (
  `id` int(11) NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `disk`
--

INSERT INTO `disk` (`id`, `year`) VALUES
(1, 2019),
(2, 2019);

-- --------------------------------------------------------

--
-- Table structure for table `disk_artist`
--

CREATE TABLE `disk_artist` (
  `disk_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disk_genre`
--

CREATE TABLE `disk_genre` (
  `disk_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disk_track`
--

CREATE TABLE `disk_track` (
  `disk_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ex_data`
--

CREATE TABLE `ex_data` (
  `id` int(11) NOT NULL,
  `original_album` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `orig_publication_date` date NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ex_data`
--

INSERT INTO `ex_data` (`id`, `original_album`, `orig_publication_date`, `artist_id`) VALUES
(2, 'Views', '2016-05-06', 1),
(3, 'Peace Is the Mission', '2015-06-01', 2),
(4, 'Purpose (Deluxe)', '2015-11-15', 3),
(5, 'x (Deluxe Edition)', '2014-06-21', 3),
(6, 'At Night Alone.', '2016-05-06', 5),
(7, 'Me 4 U', '2014-12-02', 3),
(8, 'Collage EP', '2016-02-05', 42),
(9, 'Uptown Special', '2015-01-12', 43),
(10, 'Beauty Behind the Madness', '2015-08-28', 44),
(11, '25', '2015-10-23', 45),
(12, 'Lukas Graham', '2016-04-01', 4),
(13, 'Handwritten', '2015-04-15', 6),
(14, 'This Is Acting', '2015-12-17', 7),
(15, 'Hozier', '2013-11-29', 8),
(16, 'Blurryface', '2015-04-28', 9),
(17, 'Skrillex and Diplo Present Jack Ü', '2015-02-24', 10),
(18, 'Furious 7: Original Motion Picture Soundtrack', '2015-03-10', 11),
(19, 'ANTI (Deluxe)', '2016-01-29', 12),
(20, 'This Is What You Came For', '2016-04-16', 13),
(21, 'Cold Water', '2016-07-22', 14),
(22, 'Views', '2015-07-31', 15),
(23, '7/27 (Deluxe)', '2016-05-27', 16),
(24, 'V', '2015-03-10', 17),
(25, 'Faded', '2015-12-04', 18),
(26, 'In the Lonely Hour', '2014-01-01', 19),
(27, '1000 Forms of Fear', '2014-03-17', 20),
(28, 'Peace Is the Mission (Extended)', '2015-11-27', 21),
(29, '× (Deluxe Edition)', '2014-06-21', 22),
(30, 'When It\'s Dark Out', '2015-10-14', 10),
(31, 'Fifty Shades of Grey (Original Motion Picture Soundtrack)', '2015-02-10', 23),
(32, 'All the Little Lights', '2012-07-24', 5),
(33, 'Night Visions', '2012-01-01', 24),
(34, 'Love in the Future', '2013-08-08', 25),
(35, 'Lush Life ', '2015-06-09', 6),
(36, 'Encore', '2016-08-05', 26),
(37, 'New Eyes', '2014-01-17', 27),
(38, 'New English', '2016-02-26', 28),
(39, 'Native (Deluxe)', '2013-03-26', 29),
(40, 'TROLLS (Original Motion Picture Soundtrack)', '2016-05-06', 30),
(41, 'Fetty Wap (Deluxe)', '2014-12-15', 35),
(42, 'True', '2013-06-30', 36),
(43, 'Bouquet', '2015-06-16', 37),
(44, 'SUGAR', '2015-07-17', 38),
(45, 'DNCE', '2015-09-18', 39),
(46, 'Despicable Me 2 (Original Motion Picture Soundtrack)', '2013-06-18', 40),
(47, 'Cloud Nine', '2015-08-28', 41);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Pop'),
(3, 'pop/Rap'),
(2, 'Rap');

-- --------------------------------------------------------

--
-- Table structure for table `spotify_info`
--

CREATE TABLE `spotify_info` (
  `id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `streams` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `spotify_info`
--

INSERT INTO `spotify_info` (`id`, `rank`, `streams`, `artist_id`) VALUES
(1, 1, 1011, 1),
(2, 2, 909, 2),
(3, 3, 828, 3),
(4, 4, 782, 3),
(5, 5, 770, 5),
(6, 6, 750, 3),
(7, 7, 730, 42),
(8, 8, 708, 43),
(9, 9, 694, 44),
(10, 10, 678, 45),
(11, 11, 678, 4),
(12, 12, 648, 6),
(13, 13, 632, 7),
(14, 14, 624, 8),
(15, 15, 623, 9),
(16, 16, 616, 10),
(17, 17, 611, 11),
(18, 18, 603, 12),
(19, 19, 600, 13),
(20, 20, 599, 14),
(21, 21, 595, 15),
(22, 22, 585, 16),
(23, 23, 580, 17),
(24, 24, 575, 18),
(25, 25, 574, 19),
(26, 26, 565, 20),
(27, 27, 559, 21),
(28, 28, 554, 22),
(29, 29, 553, 10),
(30, 30, 551, 23),
(31, 31, 538, 5),
(32, 32, 538, 24),
(33, 33, 537, 25),
(34, 34, 532, 6),
(35, 35, 522, 26),
(36, 36, 521, 27),
(37, 37, 519, 28),
(38, 38, 513, 29),
(39, 39, 511, 30),
(40, 40, 507, 31),
(41, 41, 502, 32),
(42, 42, 486, 33),
(43, 43, 485, 34),
(44, 44, 481, 35),
(45, 45, 478, 36),
(46, 46, 477, 37),
(47, 47, 477, 38),
(48, 48, 474, 39),
(49, 49, 473, 40),
(50, 50, 471, 41);

-- --------------------------------------------------------

--
-- Table structure for table `spotify_info_ex_data`
--

CREATE TABLE `spotify_info_ex_data` (
  `spotify_info_id` int(11) NOT NULL,
  `ex_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `track_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_520_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `track_title`, `artist_id`) VALUES
(1, 'One Dance', 1),
(2, 'Lean On', 2),
(3, 'Sorry', 3),
(4, 'Love Yourself', 3),
(5, 'Thinking Out Loud', 5),
(6, 'What Do You Mean?', 3),
(7, 'I Took a Pill in Ibiza', 42),
(8, 'Cheerleader', 43),
(9, 'Don\'t Let Me Down', 44),
(10, 'Closer', 45),
(11, 'Uptown Funk', 4),
(12, 'Can\'t Feel My Face', 6),
(13, 'Hello', 7),
(14, '7 Years', 8),
(15, 'Stitches', 9),
(16, 'Cheap Thrills', 10),
(17, 'Take Me to Church', 11),
(18, 'Stressed Out', 12),
(19, 'Where Are Ü Now', 13),
(20, 'See You Again', 14),
(21, 'Work', 15),
(22, 'This Is What You Came For', 16),
(23, 'Cold Water', 17),
(24, 'Hotline Bling', 18),
(25, 'Work from Home', 19),
(26, 'Sugar', 20),
(27, 'Faded', 21),
(28, 'Stay with Me', 22),
(29, 'Chandelier', 10),
(30, 'Light It Up', 23),
(31, 'Photograph', 5),
(32, 'Me Myself & I', 24),
(33, 'Love Me Like You Do', 25),
(34, 'The Hills', 6),
(35, 'Let Her Go', 26),
(36, 'Radioactive', 27),
(37, 'All of Me', 28),
(38, 'Lush Life', 29),
(39, 'Let Me Love You', 30),
(40, 'Rather Be', 31),
(41, 'Panda', 32),
(42, 'Counting Stars', 33),
(43, 'Can\'t Stop the Feeling!', 34),
(44, 'Trap Queen', 35),
(45, 'Wake Me Up', 36),
(46, 'Roses', 37),
(47, 'Sugar', 38),
(48, 'Cake by the Ocean', 39),
(49, 'Happy', 40),
(50, 'Firestone', 41);

-- --------------------------------------------------------

--
-- Table structure for table `track_ex_data`
--

CREATE TABLE `track_ex_data` (
  `ex_data_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `artist_ex_data`
--
ALTER TABLE `artist_ex_data`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `ex_data_id` (`ex_data_id`);

--
-- Indexes for table `disk`
--
ALTER TABLE `disk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disk_artist`
--
ALTER TABLE `disk_artist`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `disk_id` (`disk_id`);

--
-- Indexes for table `disk_genre`
--
ALTER TABLE `disk_genre`
  ADD KEY `disk_id` (`disk_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `disk_track`
--
ALTER TABLE `disk_track`
  ADD UNIQUE KEY `disk_id` (`disk_id`,`position`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `ex_data`
--
ALTER TABLE `ex_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `original_album` (`original_album`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `spotify_info`
--
ALTER TABLE `spotify_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rank` (`rank`);

--
-- Indexes for table `spotify_info_ex_data`
--
ALTER TABLE `spotify_info_ex_data`
  ADD KEY `ex_data_id` (`ex_data_id`),
  ADD KEY `spotify_info_id` (`spotify_info_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track_title` (`track_title`);

--
-- Indexes for table `track_ex_data`
--
ALTER TABLE `track_ex_data`
  ADD KEY `ex_data_id` (`ex_data_id`),
  ADD KEY `track_id` (`track_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `disk`
--
ALTER TABLE `disk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ex_data`
--
ALTER TABLE `ex_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spotify_info`
--
ALTER TABLE `spotify_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_ex_data`
--
ALTER TABLE `artist_ex_data`
  ADD CONSTRAINT `artist_ex_data_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `artist_ex_data_ibfk_2` FOREIGN KEY (`ex_data_id`) REFERENCES `ex_data` (`id`);

--
-- Constraints for table `disk_artist`
--
ALTER TABLE `disk_artist`
  ADD CONSTRAINT `disk_artist_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `disk_artist_ibfk_2` FOREIGN KEY (`disk_id`) REFERENCES `disk` (`id`);

--
-- Constraints for table `disk_genre`
--
ALTER TABLE `disk_genre`
  ADD CONSTRAINT `disk_genre_ibfk_1` FOREIGN KEY (`disk_id`) REFERENCES `disk` (`id`),
  ADD CONSTRAINT `disk_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Constraints for table `disk_track`
--
ALTER TABLE `disk_track`
  ADD CONSTRAINT `disk_track_ibfk_1` FOREIGN KEY (`disk_id`) REFERENCES `disk` (`id`),
  ADD CONSTRAINT `disk_track_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `spotify_info_ex_data`
--
ALTER TABLE `spotify_info_ex_data`
  ADD CONSTRAINT `spotify_info_ex_data_ibfk_1` FOREIGN KEY (`ex_data_id`) REFERENCES `ex_data` (`id`),
  ADD CONSTRAINT `spotify_info_ex_data_ibfk_2` FOREIGN KEY (`spotify_info_id`) REFERENCES `spotify_info` (`id`);

--
-- Constraints for table `track_ex_data`
--
ALTER TABLE `track_ex_data`
  ADD CONSTRAINT `track_ex_data_ibfk_1` FOREIGN KEY (`ex_data_id`) REFERENCES `ex_data` (`id`),
  ADD CONSTRAINT `track_ex_data_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
