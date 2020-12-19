-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2020 at 01:28 AM
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
CREATE DATABASE IF NOT EXISTS `digmikej_Images` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `digmikej_Images`;

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

--
-- Dumping data for table `Exhibit`
--

INSERT INTO `Exhibit` (`id`, `title`, `subject`, `theme`) VALUES
(1, 'American Vistas', 'Landscapes ', 'Conservation '),
(2, 'American Vistas', 'Landscapes ', 'Conservation '),
(3, 'American Vistas', 'Landscapes ', 'Conservation '),
(4, 'American Vistas', 'Landscapes ', 'Conservation '),
(5, 'American Vistas', 'Landscapes ', 'Conservation '),
(6, 'Wild Animals', 'Various Animals ', 'Preservation '),
(7, 'Wild Animals', 'Various Animals ', 'Preservation '),
(8, 'Wild Animals', 'Various Animals ', 'Preservation '),
(9, 'Wild Animals', 'Various Animals ', 'Preservation '),
(10, 'Insects', 'Various Insects', 'Natural Beauty '),
(11, 'Insects', 'Various Insects', 'Natural Beauty '),
(12, 'Insects', 'Various Insects', 'Natural Beauty '),
(13, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(14, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(15, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(16, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(17, 'Rural Spain ', 'Castillejo', 'Preserving our History '),
(18, 'Rural Spain ', 'Castillejo2', 'Preserving our History '),
(19, 'Rural Spain ', 'Castillejo3', 'Preserving our History '),
(20, 'Season Memories', 'Various Season Images', 'Enjoying the Seasons '),
(21, 'Season Memories', 'Various Season Images', 'Enjoying the Seasons '),
(22, 'Teddy Memories', 'Various Images of Teddy', 'Teddy our Companion'),
(23, 'Teddy Memories', 'Various Images of Teddy', 'Teddy our Companion'),
(24, 'Visitors ', 'Visitors to our house', 'Unwanted & Unexpected Visitors '),
(25, 'Visitors ', 'Visitors to our house', 'Unwanted & Unexpected Visitors '),
(26, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth '),
(27, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth '),
(28, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth '),
(29, 'American Vistas', 'Landscapes ', 'Conservation '),
(30, 'American Vistas', 'Landscapes ', 'Conservation '),
(31, 'American Vistas', 'Landscapes ', 'Conservation '),
(32, 'American Vistas', 'Landscapes ', 'Conservation '),
(33, 'American Vistas', 'Landscapes ', 'Conservation '),
(34, 'Wild Animals', 'Various Animals ', 'Preservation '),
(35, 'Wild Animals', 'Various Animals ', 'Preservation '),
(36, 'Wild Animals', 'Various Animals ', 'Preservation '),
(37, 'Wild Animals', 'Various Animals ', 'Preservation '),
(38, 'Insects', 'Various Insects', 'Natural Beauty '),
(39, 'Insects', 'Various Insects', 'Natural Beauty '),
(40, 'Insects', 'Various Insects', 'Natural Beauty '),
(41, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(42, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(43, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(44, 'Individual Plants', 'Various Plants ', 'Indviduals in the Plant World'),
(45, 'Rural Spain ', 'Castillejo', 'Preserving our History '),
(46, 'Rural Spain ', 'Castillejo2', 'Preserving our History '),
(47, 'Rural Spain ', 'Castillejo3', 'Preserving our History '),
(48, 'Season Memories', 'Various Season Images', 'Enjoying the Seasons '),
(49, 'Season Memories', 'Various Season Images', 'Enjoying the Seasons '),
(50, 'Teddy Memories', 'Various Images of Teddy', 'Teddy our Companion'),
(51, 'Teddy Memories', 'Various Images of Teddy', 'Teddy our Companion'),
(52, 'Visitors ', 'Visitors to our house', 'Unwanted & Unexpected Visitors '),
(53, 'Visitors ', 'Visitors to our house', 'Unwanted & Unexpected Visitors '),
(54, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth '),
(55, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth '),
(56, 'Land, Water, & Sky', 'Views of Land, Water, & Sky', 'Appreciating the Earth ');

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `id` int(4) UNSIGNED NOT NULL COMMENT 'Primary Key ',
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Title ',
  `subject` varchar(256) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Subject ',
  `date` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Creation Date ',
  `hour` time(6) NOT NULL COMMENT 'Image Creation Time',
  `pixel_x_dimension` int(8) UNSIGNED NOT NULL COMMENT 'Image Width',
  `pixel_y_dimension` int(8) UNSIGNED NOT NULL COMMENT 'Image Height',
  `horizontal_resolution` int(4) UNSIGNED NOT NULL COMMENT 'Image Horiz. Res.',
  `vertical_resolution` int(4) UNSIGNED NOT NULL COMMENT 'Image Vert. Res.',
  `bit_depth` int(4) UNSIGNED NOT NULL COMMENT 'Image Bit Depth',
  `resolution_unit` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Image Resolution Unit',
  `color_representation` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Color Representation',
  `compression` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Compressed bits/pixel',
  `image_item_type` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image Item Type',
  `image_url` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Image URL',
  `photographer_id` int(11) DEFAULT NULL COMMENT 'foreign key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Image Attributes ';

--
-- Dumping data for table `Image`
--

INSERT INTO `Image` (`id`, `title`, `subject`, `date`, `hour`, `pixel_x_dimension`, `pixel_y_dimension`, `horizontal_resolution`, `vertical_resolution`, `bit_depth`, `resolution_unit`, `color_representation`, `compression`, `image_item_type`, `image_url`, `photographer_id`) VALUES
(1, 'Chesapeake', 'Chesapeake Bay Structure', '9/8/2020', '01:44:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/chesapeake.JPG', 1),
(2, 'Marsh', 'Marshland', '9/15/2020', '02:27:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/marsh.JPG', 2),
(3, 'Forest', 'Forest', '9/14/2020', '02:20:00.000000', 4000, 6000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/forest.JPG', 3),
(4, 'Forest', 'Forest', '6/25/2020', '10:36:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', ' ', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Forest2.JPG', 4),
(5, 'Fall Foilage and Lake', 'Fall Foilage and Lake', '10/18/2020', '12:54:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/fall%20foliage%20and%20lake.JPG', 5),
(6, 'Bunny ', 'Rabit', '10/26/2020', '04:05:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/bunny.JPG', 6),
(7, 'Faun', 'Deer', '7/30/2020', '15:30:00.000000', 2833, 3652, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Fawn.JPG', 7),
(8, 'Deer', 'Deer', '12/12/2016', '12:58:00.000000', 4608, 3456, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Deer.JPG', 8),
(9, 'Vultures ', 'Vultures ', '1/1/2011', '18:21:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Vultures.JPG', 9),
(10, 'Monarch', 'Butterfly', '9/17/2020', '01:48:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/monarch.JPG', 10),
(11, 'Preying Mantis', 'Preying Mantis', '9/27/2019', '14:30:00.000000', 1600, 1289, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Preying%20Mantis.jpg', 11),
(12, 'Pumpkin Spider', 'Pumpkin Spider', '10/26/2019', '14:06:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Pumpkin%20Spider.JPG', 12),
(13, 'Rose', 'White and Yellow Rose ', '10/26/2020', '03:16:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/rose.JPG', 13),
(14, 'Tree', 'Fir Tree', '9/17/2020', '03:53:00.000000', 4000, 6000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/tree.JPG', 14),
(15, 'Blooming ', 'Cherry Tree', '3/28/2020', '19:32:00.000000', 1200, 1600, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Blooming.jpg', 15),
(16, 'Bonsai', 'Bonsai Tree', '5/16/2019', '12:04:00.000000', 4144, 5520, 96, 96, 24, '', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Bonsai.JPG', 16),
(17, 'Castillejo', 'View of Castillejo from hillside', '8/21/2010', '21:25:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '4', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo.JPG', 17),
(18, 'Castillejo', 'View behind the house', '8/14/2019', '04:54:00.000000', 1600, 900, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo%202.jpg', 18),
(19, 'Castillejo', 'Bridge in the fields ', '3/4/2019', '12:21:00.000000', 1600, 900, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo%203.jpg', 19),
(20, 'Springtime', 'Cherry Blossoms ', '4/11/2019', '15:14:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Springtime.JPG', 20),
(21, 'Winter', 'Forest in Winter', '2/20/2019', '13:51:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Winter.JPG', 21),
(22, 'Teddy Snow Suit', 'Teddy Dressed for the Cold', '12/30/2017', '15:07:00.000000', 1496, 844, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Teddy%20Snow%20Suit.jpg', 22),
(23, 'The Encounter', 'Teddy looking through window at deer', '7/21/2020', '11:03:00.000000', 5520, 4144, 96, 96, 24, '', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/The%20Encounter.JPG', 23),
(24, 'Unexpected Visitor', 'Amphibian in the house on a Rainy Day', '10/31/2019', '21:19:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Unexpected%20Visitor.JPG', 24),
(25, 'Unwanted Visitor', 'Mouse in the House ', '12/8/2019', '21:40:00.000000', 1600, 1200, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Unwanted%20Visitor.jpg', 25),
(26, 'Pasture', 'Pasture ', '10/7/2018', '16:11:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Pasture.JPG', 26),
(27, 'Rapids', 'Rapids', '3/19/2015', '21:09:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '4', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Rapids.JPG', 27),
(28, 'Sky', 'Sky', '8/13/2020', '20:54:00.000000', 1200, 1600, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Sky.jpg', 28),
(29, 'Chesapeake', 'Chesapeake Bay Structure', '9/8/2020', '01:44:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/chesapeake.JPG', 29),
(30, 'Marsh', 'Marshland', '9/15/2020', '02:27:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/marsh.JPG', 30),
(31, 'Forest', 'Forest', '9/14/2020', '02:20:00.000000', 4000, 6000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/forest.JPG', 31),
(32, 'Forest', 'Forest', '6/25/2020', '10:36:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', ' ', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Forest2.JPG', 32),
(33, 'Fall Foilage and Lake', 'Fall Foilage and Lake', '10/18/2020', '12:54:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/fall%20foliage%20and%20lake.JPG', 33),
(34, 'Bunny ', 'Rabit', '10/26/2020', '04:05:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/bunny.JPG', 34),
(35, 'Faun', 'Deer', '7/30/2020', '15:30:00.000000', 2833, 3652, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Fawn.JPG', 35),
(36, 'Deer', 'Deer', '12/12/2016', '12:58:00.000000', 4608, 3456, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Deer.JPG', 36),
(37, 'Vultures ', 'Vultures ', '1/1/2011', '18:21:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Vultures.JPG', 37),
(38, 'Monarch', 'Butterfly', '9/17/2020', '01:48:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/monarch.JPG', 38),
(39, 'Preying Mantis', 'Preying Mantis', '9/27/2019', '14:30:00.000000', 1600, 1289, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Preying%20Mantis.jpg', 39),
(40, 'Pumpkin Spider', 'Pumpkin Spider', '10/26/2019', '14:06:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Pumpkin%20Spider.JPG', 40),
(41, 'Rose', 'White and Yellow Rose ', '10/26/2020', '03:16:00.000000', 6000, 4000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/rose.JPG', 41),
(42, 'Tree', 'Fir Tree', '9/17/2020', '03:53:00.000000', 4000, 6000, 300, 300, 24, '2', 'sRGB', '2', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/tree.JPG', 42),
(43, 'Blooming ', 'Cherry Tree', '3/28/2020', '19:32:00.000000', 1200, 1600, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Blooming.jpg', 43),
(44, 'Bonsai', 'Bonsai Tree', '5/16/2019', '12:04:00.000000', 4144, 5520, 96, 96, 24, '', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Bonsai.JPG', 44),
(45, 'Castillejo', 'View of Castillejo from hillside', '8/21/2010', '21:25:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '4', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo.JPG', 45),
(46, 'Castillejo', 'View behind the house', '8/14/2019', '04:54:00.000000', 1600, 900, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo%202.jpg', 46),
(47, 'Castillejo', 'Bridge in the fields ', '3/4/2019', '12:21:00.000000', 1600, 900, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Castillejo%203.jpg', 47),
(48, 'Springtime', 'Cherry Blossoms ', '4/11/2019', '15:14:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Springtime.JPG', 48),
(49, 'Winter', 'Forest in Winter', '2/20/2019', '13:51:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Winter.JPG', 49),
(50, 'Teddy Snow Suit', 'Teddy Dressed for the Cold', '12/30/2017', '15:07:00.000000', 1496, 844, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Teddy%20Snow%20Suit.jpg', 50),
(51, 'The Encounter', 'Teddy looking through window at deer', '7/21/2020', '11:03:00.000000', 5520, 4144, 96, 96, 24, '', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/The%20Encounter.JPG', 51),
(52, 'Unexpected Visitor', 'Amphibian in the house on a Rainy Day', '10/31/2019', '21:19:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Unexpected%20Visitor.JPG', 52),
(53, 'Unwanted Visitor', 'Mouse in the House ', '12/8/2019', '21:40:00.000000', 1600, 1200, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Unwanted%20Visitor.jpg', 53),
(54, 'Pasture', 'Pasture ', '10/7/2018', '16:11:00.000000', 5520, 4144, 72, 72, 24, '2', 'sRGB', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Pasture.JPG', 54),
(55, 'Rapids', 'Rapids', '3/19/2015', '21:09:00.000000', 3456, 2592, 180, 180, 24, '2', 'sRGB', '4', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Rapids.JPG', 55),
(56, 'Sky', 'Sky', '8/13/2020', '20:54:00.000000', 1200, 1600, 96, 96, 24, '', '', '', 'JPG', 'https://dig540mikejoseph.org/album_data/images%20/Sky.jpg', 56);

-- --------------------------------------------------------

--
-- Table structure for table `Image_Exhibit`
--

CREATE TABLE `Image_Exhibit` (
  `image_id` int(4) NOT NULL COMMENT 'Foreign Key ',
  `exhibit_id` int(4) NOT NULL COMMENT 'Foreign Key'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Image_Exhibit`
--

INSERT INTO `Image_Exhibit` (`image_id`, `exhibit_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49),
(50, 50),
(51, 51),
(52, 52),
(53, 53),
(54, 54),
(55, 55),
(56, 56);

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
-- Dumping data for table `Photographer`
--

INSERT INTO `Photographer` (`id`, `first_name`, `last_name`, `city`, `state`, `zip_code`) VALUES
(1, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(2, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(3, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(4, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(5, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(6, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(7, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(8, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(9, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(10, 'Susanna', 'Joseph', 'Rockville', 'md', 20853),
(11, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(12, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(13, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(14, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(15, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(16, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(17, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(18, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(19, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(20, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(21, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(22, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(23, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(24, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(25, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(26, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(27, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(28, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(29, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(30, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(31, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(32, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(33, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(34, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(35, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(36, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(37, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(38, 'Susanna', 'Joseph', 'Rockville', 'md', 20853),
(39, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(40, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(41, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(42, 'Susanna', 'Joseph', 'Rockville', 'MD', 20853),
(43, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(44, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(45, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(46, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(47, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(48, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(49, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(50, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(51, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(52, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(53, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(54, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(55, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007),
(56, 'Maria ', 'Izquierdo', 'Zaragoza ', 'SP', 50007);

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
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ', AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ', AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `Photographer`
--
ALTER TABLE `Photographer`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key ', AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Image`
--
ALTER TABLE `Image`
  ADD CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`photographer_id`) REFERENCES `Photographer` (`id`);
