-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 22, 2020 at 02:48 AM
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
-- Database: `digmikej_Audio_E-Book_Tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `id` int(11) NOT NULL,
  `city` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`id`, `city`, `state`, `zipcode`) VALUES
(1, 'New York', 'NY', 10020),
(2, 'Prince Fredrick', 'MD', 20678),
(3, 'New Orleans', 'LA', 70118),
(4, 'Los Angeles', 'CA', 90005),
(5, 'St Peters', 'MO', 63304),
(6, 'Nashville', 'TN', 37011),
(7, 'Chicago', 'IL', 60007),
(8, 'Jacksonville', 'FL', 32034);

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `international_standard_book_number` bigint(13) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `published_year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`id`, `international_standard_book_number`, `title`, `format`, `published_year`) VALUES
(1, 9781501126352, 'The Fire This Time', 'Print', 2017),
(2, 9781501941030, 'The Fire This Time ', 'Audio E-Book', 2016),
(3, 9781595540560, 'Chasing Fireflies', 'Print', 2007),
(4, 9781418537265, 'Chasing Fireflies', 'Audio E-Book', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Contributor`
--

CREATE TABLE `Book_Contributor` (
  `book_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Book_Contributor`
--

INSERT INTO `Book_Contributor` (`book_id`, `contributor_id`) VALUES
(1, 1),
(2, 1),
(3, 7),
(4, 7),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Genre`
--

CREATE TABLE `Book_Genre` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `Book_Genre`
--

INSERT INTO `Book_Genre` (`book_id`, `genre_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 5),
(3, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Language`
--

CREATE TABLE `Book_Language` (
  `book_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `Book_Language`
--

INSERT INTO `Book_Language` (`book_id`, `language_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(3, 1),
(3, 4),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Publisher`
--

CREATE TABLE `Book_Publisher` (
  `book_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Book_Publisher`
--

INSERT INTO `Book_Publisher` (`book_id`, `publisher_id`) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Contributor`
--

CREATE TABLE `Contributor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `nationality` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lifespan` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Contributor`
--

INSERT INTO `Contributor` (`id`, `first_name`, `last_name`, `address_id`, `role`, `nationality`, `lifespan`) VALUES
(1, 'Jesmyn', 'Ward', 3, 'Author', 'African American', '1977-'),
(2, 'Cherise', 'Booth', 5, 'Narrator', 'African American', '1977-'),
(3, 'Michael ', 'Early', 6, 'Narrator', 'African American', '1973-'),
(4, 'Kevin', 'Free', 1, 'Narrator', 'African American', '1961-'),
(5, 'Korey', 'Jackson', 1, 'Narrator', 'African American', '1961-'),
(6, 'Susan', 'Spain', 1, 'Narrator', 'African American', '1984-'),
(7, 'Charles', 'Martin', 8, 'Author', 'American ', '1945-'),
(8, 'Adam', 'Verner', 8, 'Narrator', 'American ', '1982-');

-- --------------------------------------------------------

--
-- Table structure for table `Contributor_Genre`
--

CREATE TABLE `Contributor_Genre` (
  `contributor_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `Contributor_Genre`
--

INSERT INTO `Contributor_Genre` (`contributor_id`, `genre_id`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 5),
(3, 5),
(3, 1),
(4, 1),
(5, 1),
(5, 5),
(6, 5),
(7, 2),
(8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `id` int(11) NOT NULL,
  `genre_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`id`, `genre_type`) VALUES
(1, 'Social Science '),
(2, 'Christian Fiction'),
(4, 'Young Adult'),
(5, 'History'),
(6, 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `Language`
--

CREATE TABLE `Language` (
  `id` int(11) NOT NULL,
  `natural_language` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Language`
--

INSERT INTO `Language` (`id`, `natural_language`) VALUES
(1, 'English'),
(2, 'Spanish'),
(4, 'French'),
(5, 'German'),
(6, 'Japanese'),
(7, 'Hindi'),
(8, 'Cantonese'),
(9, 'Mandarin');

-- --------------------------------------------------------

--
-- Table structure for table `Publisher`
--

CREATE TABLE `Publisher` (
  `id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `publisher_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `publisher_role` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Publisher`
--

INSERT INTO `Publisher` (`id`, `address_id`, `publisher_name`, `publisher_role`) VALUES
(1, 2, 'Recorded Books, Inc', 'Audio Publisher'),
(2, 1, 'Scribner', 'Print Publisher'),
(3, 6, 'Thomas Nelson', 'Print Publisher'),
(4, 6, 'Thomas Nelson ', 'Audio Publisher');

-- --------------------------------------------------------

--
-- Table structure for table `Publisher_Contributor`
--

CREATE TABLE `Publisher_Contributor` (
  `publisher_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Publisher_Contributor`
--

INSERT INTO `Publisher_Contributor` (`publisher_id`, `contributor_id`) VALUES
(1, 1),
(2, 1),
(3, 7),
(4, 7),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(4, 7),
(4, 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Book_Contributor`
--
ALTER TABLE `Book_Contributor`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `contributor_id` (`contributor_id`);

--
-- Indexes for table `Book_Genre`
--
ALTER TABLE `Book_Genre`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Book_Language`
--
ALTER TABLE `Book_Language`
  ADD KEY `Book_Language_ibfk_2` (`language_id`),
  ADD KEY `book_id` (`book_id`,`language_id`) USING BTREE;

--
-- Indexes for table `Book_Publisher`
--
ALTER TABLE `Book_Publisher`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indexes for table `Contributor`
--
ALTER TABLE `Contributor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `Contributor_Genre`
--
ALTER TABLE `Contributor_Genre`
  ADD KEY `contributor_id` (`contributor_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Publisher`
--
ALTER TABLE `Publisher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `Publisher_Contributor`
--
ALTER TABLE `Publisher_Contributor`
  ADD KEY `contributor_id` (`contributor_id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Contributor`
--
ALTER TABLE `Contributor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Language`
--
ALTER TABLE `Language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Publisher`
--
ALTER TABLE `Publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Book_Contributor`
--
ALTER TABLE `Book_Contributor`
  ADD CONSTRAINT `Book_Contributor_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Book_Contributor_ibfk_2` FOREIGN KEY (`contributor_id`) REFERENCES `Contributor` (`id`);

--
-- Constraints for table `Book_Genre`
--
ALTER TABLE `Book_Genre`
  ADD CONSTRAINT `book_id` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `genre_id` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`id`);

--
-- Constraints for table `Book_Language`
--
ALTER TABLE `Book_Language`
  ADD CONSTRAINT `Book_Language_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Book_Language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `Language` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Book_Publisher`
--
ALTER TABLE `Book_Publisher`
  ADD CONSTRAINT `Book_Publisher_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Book_Publisher_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`id`);

--
-- Constraints for table `Contributor`
--
ALTER TABLE `Contributor`
  ADD CONSTRAINT `Contributor_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);

--
-- Constraints for table `Contributor_Genre`
--
ALTER TABLE `Contributor_Genre`
  ADD CONSTRAINT `Contributor_Genre_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `Contributor` (`id`),
  ADD CONSTRAINT `Contributor_Genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genre` (`id`);

--
-- Constraints for table `Publisher`
--
ALTER TABLE `Publisher`
  ADD CONSTRAINT `Publisher_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);

--
-- Constraints for table `Publisher_Contributor`
--
ALTER TABLE `Publisher_Contributor`
  ADD CONSTRAINT `Publisher_Contributor_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `Contributor` (`id`),
  ADD CONSTRAINT `Publisher_Contributor_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
