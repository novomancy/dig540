-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 12, 2019 at 08:19 PM
-- Server version: 10.2.26-MariaDB
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
-- Database: `enidcoll_VoicesOfMobile`
--

-- --------------------------------------------------------

--
-- Table structure for table `contributor`
--

CREATE TABLE `contributor` (
  `id` int(11) NOT NULL,
  `name` varchar(56) COLLATE utf8_unicode_ci NOT NULL,
  `years` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `extra` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contributor`
--

INSERT INTO `contributor` (`id`, `name`, `years`, `extra`) VALUES
(1, 'The Peanut Man', '1922-2005', 'Lamar Wilson, also known as Mobile Alabama\'s Peanut Man was known for selling hot paper bags of Peanuts from the A and M Peanut Store on Dauphin Street on the sidewalks and squares of  Mobile, AL.'),
(2, 'Mary Poole', '1936', 'Transcribed story by Mary Poole via the WPA Federal Writer\'s Project of a superstition of rain in Mobile, AL'),
(3, 'Agnes Tennenbaum', '2012', 'Agnes Tennenbaum, a Holocaust survivor who lived in Mobile since 2006, died Monday, May 30, 2016 at age 93.'),
(4, 'Eugene Walter', '1921-1998', 'Born and died in Mobile, AL, Eugene Ferdinand Walter, Jr. was an American screenwriter, poet, short-story author, actor, puppeteer, gourmet chef, cryptographer, translator, editor, costume designer and well-known raconteur.'),
(5, 'Dot Moore', '1976', 'Local NBC news personality Dot Moore was affiliated with both WEAR Channel 3 (ABC) and WALA Channel 10 (NBC) in the 1960\'s and 1970\'s.'),
(6, 'Cory Garfunkel', '2012', '\"We Remember\" credited author'),
(7, 'Victoria Hirsch', '2012', '\"We Remember\" credited author');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(2, 'Field Recording'),
(1, 'Interview'),
(3, 'Poetry Reading'),
(5, 'Song'),
(4, 'Story');

-- --------------------------------------------------------

--
-- Table structure for table `recording`
--

CREATE TABLE `recording` (
  `id` int(11) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `producer` varchar(106) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(106) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `subject` varchar(106) COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recording`
--

INSERT INTO `recording` (`id`, `title`, `producer`, `source`, `year`, `subject`, `extra`) VALUES
(1, 'Songs from the Peanut Man and Other Sidewalk Vendors', 'John A. Lomax Southern States Collection', 'loc.gov/folklife/guides/streetcries.html', 1937, 'Field Recording', 'Original Collection contains 647 items on discs of varying sizes (8-12 inch discs.)'),
(2, 'The Story of Rain in Mobile, AL', 'Mary A. Poole', 'alabamapioneers.com/story-of-rain-in-mobile-alabama/', 1936, 'folk story', 'Length not provided.'),
(3, '\"We Remember\" interview with Holocaust Survivor Mrs. Agnes Tennenbaum, Mobile AL resident', 'Victoria Hirsch and Cory Garfunkel', '\"We Remember\" produced by Gary Scovill with Kimberly and Stanley Zimmerman', 2012, 'Holocaust Survivor', 'Film Score Brian Keane. Interviewees included Agnes Tennenbaum, Violet Hirsch, James Philpot, Sibylle Von Campe Heidrich, and Roland Gulp Frey.'),
(4, '\"Art IS Mobile Part 4: Monologue with Eugene Walter\"', 'Melinda Klotz Mercer', 'https://youtu.be/IY01PE_F-Jg', 2016, 'Eugene Walter Interview', 'Local historian, and Mobile\'s own screenwriter, poet, short-story author, actor, puppeteer, gourmet chef, cryptographer, translator, editor, costume designer and well-known raconteur reminisces on his childhood and Mobile histories relating to it. Copyright 1999-2016.'),
(5, 'Rare Bird : Eugene Walter Stories, Poems and Songs', 'Nomad Productions', 'ASIN B002A8AFYG', 1991, 'Eugene Walter', 'Includes Cover Art by the Author, currently out of Print. Audio Cassette format. The first recording ever of this poet and novelist reading his famous story THE BYZANTINE RIDDLE, poems from The Pack Rat, Smallsong, Who\'s a Lyre?, Monkey Poems and singing his songs.'),
(6, 'Dot Moore Mardi Gras Mobile, AL 1976', 'WALA Channel 10 Local NBC Affiliate ', 'https://youtu.be/dwhPKL_Cgvo', 1976, 'Mobile Mardi Gras', 'Local news personality Dot Moore interviews George Criminale about building Mardi Gras Floats in Mobile AL 1976. Uploaded by Roland Fields.');

-- --------------------------------------------------------

--
-- Table structure for table `recording_contributor`
--

CREATE TABLE `recording_contributor` (
  `recording_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL,
  `contributor_role` varchar(111) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lookup table between recording and contributor';

--
-- Dumping data for table `recording_contributor`
--

INSERT INTO `recording_contributor` (`recording_id`, `contributor_id`, `contributor_role`) VALUES
(1, 1, 'Street Performer'),
(2, 2, 'Field Recorder'),
(3, 3, 'Interviewee'),
(4, 4, 'Storyteller'),
(5, 4, 'Author'),
(6, 5, 'Interviewer'),
(3, 6, 'Author'),
(3, 7, 'Author'),
(5, 4, 'Author');

-- --------------------------------------------------------

--
-- Table structure for table `recording_genre`
--

CREATE TABLE `recording_genre` (
  `recording_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lookup table between recording and genre';

--
-- Dumping data for table `recording_genre`
--

INSERT INTO `recording_genre` (`recording_id`, `genre_id`) VALUES
(1, 2),
(1, 5),
(2, 2),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 3),
(5, 4),
(5, 5),
(6, 2),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `recording_permission`
--

CREATE TABLE `recording_permission` (
  `recording_id` int(11) NOT NULL,
  `permission_name` varchar(56) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recording_permission`
--

INSERT INTO `recording_permission` (`recording_id`, `permission_name`) VALUES
(2, ''),
(5, 'Copyright Eugene Walter'),
(3, 'loc.gov'),
(4, 'Public Domain'),
(1, 'YouTube provided link');

-- --------------------------------------------------------

--
-- Table structure for table `recording_track`
--

CREATE TABLE `recording_track` (
  `id` int(11) NOT NULL,
  `title` varchar(106) COLLATE utf8_unicode_ci NOT NULL,
  `extra` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `recording_track`
--

INSERT INTO `recording_track` (`id`, `title`, `extra`) VALUES
(1, 'Sidewalk Chants from Mobile\'s Peanut Man', 'Field Recordings taken from the 1930\'s of a young Peanut Man hawking bags of peanuts in downtown Mobile, AL'),
(2, 'Mobile Mardi Gras emblem walkers announce the Order of Myths parade, 1947', 'Clip says \"Here comes the double O M\'s!\" of unknown announcer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contributor`
--
ALTER TABLE `contributor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `recording`
--
ALTER TABLE `recording`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `recording_contributor`
--
ALTER TABLE `recording_contributor`
  ADD KEY `contributor_role` (`contributor_role`),
  ADD KEY `recording_id` (`recording_id`),
  ADD KEY `contributor_id` (`contributor_id`);

--
-- Indexes for table `recording_genre`
--
ALTER TABLE `recording_genre`
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `recording_id` (`recording_id`);

--
-- Indexes for table `recording_permission`
--
ALTER TABLE `recording_permission`
  ADD PRIMARY KEY (`recording_id`),
  ADD KEY `permission_name` (`permission_name`);

--
-- Indexes for table `recording_track`
--
ALTER TABLE `recording_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contributor`
--
ALTER TABLE `contributor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recording`
--
ALTER TABLE `recording`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `recording_track`
--
ALTER TABLE `recording_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recording_contributor`
--
ALTER TABLE `recording_contributor`
  ADD CONSTRAINT `recording_contributor_ibfk_1` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`id`),
  ADD CONSTRAINT `recording_contributor_ibfk_2` FOREIGN KEY (`contributor_id`) REFERENCES `contributor` (`id`);

--
-- Constraints for table `recording_genre`
--
ALTER TABLE `recording_genre`
  ADD CONSTRAINT `recording_genre_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `recording_genre_ibfk_2` FOREIGN KEY (`recording_id`) REFERENCES `recording` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
