-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 13, 2020 at 05:09 PM
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
-- Database: `digmikej_Images`
--

-- --------------------------------------------------------

--
-- Table structure for table `Exhibit`
--

CREATE TABLE `Exhibit` (
  `id` int(4) UNSIGNED NOT NULL COMMENT 'Primary Key ',
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Exhibit Title ',
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Exhibit Subject',
  `theme` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Exhibit Theme'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Exhibit Attributes ';

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `id` int(4) UNSIGNED NOT NULL COMMENT 'Primary Key ',
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Title ',
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Subject ',
  `date` date NOT NULL COMMENT 'Image Creation Date ',
  `hour` time(6) NOT NULL COMMENT 'Image Creation Time',
  `pixel_x_dimension` int(8) UNSIGNED NOT NULL COMMENT 'Image Width',
  `pixel_y_dimension` int(8) UNSIGNED NOT NULL COMMENT 'Image Height',
  `horizontal_resolution` int(4) UNSIGNED NOT NULL COMMENT 'Image Horiz. Res.',
  `vertical_resolution` int(4) UNSIGNED NOT NULL COMMENT 'Image Vert. Res.',
  `bit_depth` int(4) UNSIGNED NOT NULL COMMENT 'Image Bit Depth',
  `resolution_unit` int(2) UNSIGNED DEFAULT NULL COMMENT 'Image Resolution Unit',
  `color_representation` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Color Representation',
  `compressed_bits` int(2) DEFAULT NULL COMMENT 'Compressed bits/pixel',
  `image_item_type` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Item Type',
  `image_url` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image URL',
  `photographer_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Image Attributes ';

-- --------------------------------------------------------

--
-- Table structure for table `Image_Exhibit`
--

CREATE TABLE `Image_Exhibit` (
  `image_id` int(4) NOT NULL COMMENT 'Foreign Key ',
  `exhibit_id` int(4) NOT NULL COMMENT 'Foreign Key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Photographer`
--

CREATE TABLE `Photographer` (
  `id` int(4) NOT NULL COMMENT 'Primary Key ',
  `first_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'First Name ',
  `last_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Last Name ',
  `city` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'City of Residence ',
  `state` varchar(2) COLLATE utf8_unicode_ci NOT NULL COMMENT 'State Code ',
  `zip_code` int(5) NOT NULL COMMENT 'Zip Code '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Photographer Demographics ';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Exhibit`
--
ALTER TABLE `Exhibit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photographer_id` (`photographer_id`);

--
-- Indexes for table `Image_Exhibit`
--
ALTER TABLE `Image_Exhibit`
  ADD UNIQUE KEY `image_id` (`image_id`),
  ADD UNIQUE KEY `exhibit_id` (`exhibit_id`);

--
-- Indexes for table `Photographer`
--
ALTER TABLE `Photographer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Exhibit`
--
ALTER TABLE `Exhibit`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ';

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ';

--
-- AUTO_INCREMENT for table `Photographer`
--
ALTER TABLE `Photographer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Image`
--
ALTER TABLE `Image`
  ADD CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`photographer_id`) REFERENCES `Photographer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
