-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 11, 2020 at 02:05 AM
-- Server version: 5.7.31
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
-- Database: `digmikej_Online_Audio_E-Book_Database_Homework_DIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `city` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `zipcode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`id`, `publisher_id`, `city`, `state`, `zipcode`) VALUES
(1, 2, 'New York ', 'New York ', 10020),
(2, 1, 'Prince Frederick', 'Maryland ', 20678),
(3, 2, 'New Orleans', 'Louisiana ', 70118),
(4, 1, 'New Orleans', 'Lousianna', 70118),
(5, 1, 'Los Angeles', 'California', 90005),
(6, 1, 'St Peters', 'Missouri ', 63304),
(7, 5, 'Nashville', 'Tennessee', 37011),
(8, 5, 'Chicago', 'Illinois', 60007),
(9, 4, 'Jacksonville', 'Florida', 32034);

-- --------------------------------------------------------

--
-- Table structure for table `Book`
--

CREATE TABLE `Book` (
  `id` int(11) NOT NULL,
  `international_standard_book_number` bigint(20) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `format` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `published_year` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Book`
--

INSERT INTO `Book` (`id`, `international_standard_book_number`, `title`, `format`, `publisher_id`, `published_year`) VALUES
(1, 9781501126352, 'The Fire This Time ', 'Print ', 2, 2017),
(2, 9781501941030, 'The Fire This Time ', 'Audio E-Book', 1, 2016),
(4, 9781595540560, 'Chasing Fireflies', 'Print ', 4, 2007),
(5, 9781418537265, 'Chasing Fireflies', 'Audio E-book', 5, 2020);

-- --------------------------------------------------------

--
-- Table structure for table `Book_Contributor`
--

CREATE TABLE `Book_Contributor` (
  `book_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Book_Language`
--

CREATE TABLE `Book_Language` (
  `book_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Contributor`
--

CREATE TABLE `Contributor` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `address_id` int(11) NOT NULL,
  `role` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nationality` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `lifespan` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Contributor`
--

INSERT INTO `Contributor` (`id`, `first_name`, `last_name`, `address_id`, `role`, `nationality`, `lifespan`) VALUES
(1, 'Jesmyn', 'Ward', 3, 'Author ', 'African American', '1977-'),
(2, 'Cherise', 'Boothe', 5, 'Narrator', 'African American', '1977-'),
(3, 'Michael', 'Early ', 6, 'Narrator', 'African American ', '1973-'),
(4, 'Kevin ', 'Free', 1, 'Narrator', 'African American', '1961-'),
(5, 'Korey ', 'Jackson', 1, 'Narrator', 'African American', '1980'),
(6, 'Susan', 'Spain', 1, 'Narrator', '\r\nAfrican American', '1984'),
(7, 'Charles', 'Martin', 9, 'Author', 'American', '1945-'),
(8, 'Adam', 'Verner', 8, 'Narrator', 'American', '1982-');

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `id` int(11) NOT NULL,
  `genre_type` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `contributor_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`id`, `genre_type`, `contributor_id`, `book_id`) VALUES
(1, 'Social Science', 1, 1),
(2, 'Christian Fiction', 7, 4);

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
(1, 'English '),
(2, 'Spanish '),
(3, 'German'),
(4, 'French '),
(5, 'Japanese '),
(6, 'Chinese'),
(7, 'Hindi');

-- --------------------------------------------------------

--
-- Table structure for table `Publisher`
--

CREATE TABLE `Publisher` (
  `id` int(11) NOT NULL,
  `publisher_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `publisher_role` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Publisher`
--

INSERT INTO `Publisher` (`id`, `publisher_name`, `publisher_role`) VALUES
(1, 'Recorded Books, Inc', 'Audio Publisher'),
(2, 'Scribner', 'Print Publisher'),
(4, 'Thomas Nelson ', 'Print Publisher '),
(5, 'Thomas Nelson', 'Audio Publisher');

-- --------------------------------------------------------

--
-- Table structure for table `Publisher_Contributor`
--

CREATE TABLE `Publisher_Contributor` (
  `publisher_id` int(11) NOT NULL,
  `contributor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`) USING BTREE;

--
-- Indexes for table `Book`
--
ALTER TABLE `Book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `publisher_id` (`publisher_id`);

--
-- Indexes for table `Book_Contributor`
--
ALTER TABLE `Book_Contributor`
  ADD KEY `book_id` (`book_id`) USING BTREE,
  ADD KEY `contributor_id` (`contributor_id`) USING BTREE;

--
-- Indexes for table `Book_Language`
--
ALTER TABLE `Book_Language`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `Contributor`
--
ALTER TABLE `Contributor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `address_id_2` (`address_id`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contributor_id` (`contributor_id`) USING BTREE,
  ADD UNIQUE KEY `book_id` (`book_id`) USING BTREE;

--
-- Indexes for table `Language`
--
ALTER TABLE `Language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Publisher`
--
ALTER TABLE `Publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Publisher_Contributor`
--
ALTER TABLE `Publisher_Contributor`
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `contributor_id` (`contributor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Book`
--
ALTER TABLE `Book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Contributor`
--
ALTER TABLE `Contributor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Language`
--
ALTER TABLE `Language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Publisher`
--
ALTER TABLE `Publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`id`);

--
-- Constraints for table `Book`
--
ALTER TABLE `Book`
  ADD CONSTRAINT `Book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `Publisher` (`id`);

--
-- Constraints for table `Book_Contributor`
--
ALTER TABLE `Book_Contributor`
  ADD CONSTRAINT `Book_Contributor_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`),
  ADD CONSTRAINT `Book_Contributor_ibfk_2` FOREIGN KEY (`contributor_id`) REFERENCES `Contributor` (`id`);

--
-- Constraints for table `Contributor`
--
ALTER TABLE `Contributor`
  ADD CONSTRAINT `Contributor_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);

--
-- Constraints for table `Genre`
--
ALTER TABLE `Genre`
  ADD CONSTRAINT `Genre_ibfk_1` FOREIGN KEY (`contributor_id`) REFERENCES `Contributor` (`id`),
  ADD CONSTRAINT `Genre_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
