-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2020 at 04:00 AM
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
-- Database: `ajccom_FinalDIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `Albums`
--

CREATE TABLE `Albums` (
  `Album_ID` int(11) NOT NULL,
  `Album Name` varchar(50) NOT NULL,
  `Album Genre` varchar(30) NOT NULL,
  `Composers` varchar(100) NOT NULL,
  `Year` year(4) NOT NULL,
  `Total Songs` int(30) NOT NULL,
  `Artist_ID` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Albums`
--

INSERT INTO `Albums` (`Album_ID`, `Album Name`, `Album Genre`, `Composers`, `Year`, `Total Songs`, `Artist_ID`) VALUES
(1, 'Fear Inoculum', 'Progressive Rock', 'Maynard James Keenan, Adam Jones, Danny Carey, Justin Chancellor', 2019, 10, 1),
(2, 'Reise, Reise', 'Industrial Metal', 'Till Lindemann, Christoph Schneider, Richard Krupse, Paul Landers, Christian Lorenz', 2004, 11, 2),
(3, 'Dark is the Way, Light is a Place', 'Alternative Rock', 'Stephen Christian, Christian McAlhaney, Joseph Miligan, Deon Rexroat, Nathan Young', 2010, 10, 3),
(4, 'Random Album Title', 'Progressive House', 'Joel Zimmerman', 2008, 12, 4),
(5, 'Black Holes and Revelations', 'Space Rock', 'Matthew Bellamy', 2006, 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Artists`
--

CREATE TABLE `Artists` (
  `Name of Band` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Genre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Members` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Artist_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Artists`
--

INSERT INTO `Artists` (`Name of Band`, `Genre`, `Members`, `Artist_ID`) VALUES
('Tool', 'Progressive Rock', 'Maynard James Keenan, Adam Jones, Danny Carey, Justin Chancellor', 1),
('Rammstein', 'Industrial Metal', 'Till Lindemann, Christoph Schneider, Richard Krupse, Paul Landers, Christian Lorenz', 2),
('Anberlin', 'Alternative Rock', 'Stephen Christian, Christian McAlhaney, Joseph Miligan, Deon Rexroat, Nathan Young', 3),
('Deadmau5', 'Progressive House', 'Joel Zimmerman', 4),
('Muse', 'Space Rock', 'Matthew Bellamy, Christopher Wolstenholme, Dominic Howard', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Albums`
--
ALTER TABLE `Albums`
  ADD PRIMARY KEY (`Album_ID`),
  ADD UNIQUE KEY `Artist_ID_2` (`Artist_ID`),
  ADD KEY `Album Name` (`Album Name`),
  ADD KEY `Album Genre` (`Album Genre`),
  ADD KEY `Composers` (`Composers`),
  ADD KEY `Total Songs` (`Total Songs`),
  ADD KEY `Artist_ID` (`Artist_ID`);

--
-- Indexes for table `Artists`
--
ALTER TABLE `Artists`
  ADD PRIMARY KEY (`Artist_ID`),
  ADD KEY `Genre` (`Genre`),
  ADD KEY `Members` (`Members`),
  ADD KEY `Name of Band` (`Name of Band`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Albums`
--
ALTER TABLE `Albums`
  MODIFY `Album_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Artists`
--
ALTER TABLE `Artists`
  MODIFY `Artist_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
