-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 20, 2020 at 02:26 PM
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
-- Database: `fergusap_ExhibitB`
--

-- --------------------------------------------------------

--
-- Table structure for table `artifact`
--

CREATE TABLE `artifact` (
  `id` int(25) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` int(18) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rank` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artifact`
--

INSERT INTO `artifact` (`id`, `name`, `description`, `date`, `location`, `image`, `rank`) VALUES
(1, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', 'http://www.fergusapproved.com/ExhibitB/images/image1.jpg ', 1),
(2, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image2.jpg ', 2),
(3, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', 'http://www.fergusapproved.com/ExhibitB/images/image3.jpg ', 3),
(4, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', 'http://www.fergusapproved.com/ExhibitB/images/image4.jpg ', 4),
(5, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', 'http://www.fergusapproved.com/ExhibitB/images/image5.jpg ', 5),
(6, 'moccasins', 'flap style, geometric motif', 1800, 'New York', 'http://www.fergusapproved.com/ExhibitB/images/image6.jpg ', 6),
(7, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', 'http://www.fergusapproved.com/ExhibitB/images/image7.jpg ', 7),
(8, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image8.jpg ', 8),
(9, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image9.jpg ', 9),
(10, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image10.jpg ', 10),
(11, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', 'http://www.fergusapproved.com/ExhibitB/images/image11.jpg ', 11),
(12, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image12.jpg ', 12),
(13, 'garters ', 'six point star motif ', 1850, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image13.jpg ', 13),
(14, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', 'http://www.fergusapproved.com/ExhibitB/images/image14.jpg ', 14),
(15, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', 'http://www.fergusapproved.com/ExhibitB/images/image15.jpg ', 15),
(16, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(17, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', 'http://www.fergusapproved.com/ExhibitB/images/image17.jpg ', 17),
(18, 'club ', 'ball club, wild cat motif ', 1830, 'New York', 'http://www.fergusapproved.com/ExhibitB/images/image18.jpg ', 18),
(19, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', 'http://www.fergusapproved.com/ExhibitB/images/image19.jpg ', 19),
(20, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', 'http://www.fergusapproved.com/ExhibitB/images/image20.jpg ', 20),
(21, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', 'http://www.fergusapproved.com/ExhibitB/images/image21.jpg ', 21),
(22, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', 'http://www.fergusapproved.com/ExhibitB/images/image22.jpg ', 22),
(23, 'effigy ', 'head effigy ', 1830, 'Ontario ', 'http://www.fergusapproved.com/ExhibitB/images/image23.jpg ', 23),
(24, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', 'http://www.fergusapproved.com/ExhibitB/images/image24.jpg ', 24),
(25, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', 'http://www.fergusapproved.com/ExhibitB/images/image25.jpg ', 25),
(33, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(34, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', '', 2),
(35, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', '', 3),
(36, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', '', 4),
(37, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', '', 5),
(38, 'moccasins', 'flap style, geometric motif', 1800, 'New York', '', 6),
(39, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', '', 7),
(40, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', '', 8),
(41, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', '', 9),
(42, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', '', 10),
(43, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', '', 11),
(44, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', '', 12),
(45, 'garters ', 'six point star motif ', 1850, 'Michigan', '', 13),
(46, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', '', 14),
(47, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', '', 15),
(48, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(49, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', '', 17),
(50, 'club ', 'ball club, wild cat motif ', 1830, 'New York', '', 18),
(51, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', '', 19),
(52, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', '', 20),
(53, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', '', 21),
(54, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', '', 22),
(55, 'effigy ', 'head effigy ', 1830, 'Ontario ', '', 23),
(56, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', '', 24),
(57, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', '', 25),
(58, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(59, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', '', 2),
(60, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', '', 3),
(61, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', '', 4),
(62, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', '', 5),
(63, 'moccasins', 'flap style, geometric motif', 1800, 'New York', '', 6),
(64, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', '', 7),
(65, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', '', 8),
(66, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', '', 9),
(67, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', '', 10),
(68, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', '', 11),
(69, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', '', 12),
(70, 'garters ', 'six point star motif ', 1850, 'Michigan', '', 13),
(71, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', '', 14),
(72, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', '', 15),
(73, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(74, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', '', 17),
(75, 'club ', 'ball club, wild cat motif ', 1830, 'New York', '', 18),
(76, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', '', 19),
(77, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', '', 20),
(78, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', '', 21),
(79, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', '', 22),
(80, 'effigy ', 'head effigy ', 1830, 'Ontario ', '', 23),
(81, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', '', 24),
(82, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', '', 25),
(83, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(84, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(85, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(86, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(87, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', '', 2),
(88, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', '', 3),
(89, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', '', 4),
(90, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', '', 5),
(91, 'moccasins', 'flap style, geometric motif', 1800, 'New York', '', 6),
(92, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', '', 7),
(93, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', '', 8),
(94, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', '', 9),
(95, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', '', 10),
(96, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', '', 11),
(97, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', '', 12),
(98, 'garters ', 'six point star motif ', 1850, 'Michigan', '', 13),
(99, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', '', 14),
(100, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', '', 15),
(101, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(102, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', '', 17),
(103, 'club ', 'ball club, wild cat motif ', 1830, 'New York', '', 18),
(104, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', '', 19),
(105, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', '', 20),
(106, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', '', 21),
(107, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', '', 22),
(108, 'effigy ', 'head effigy ', 1830, 'Ontario ', '', 23),
(109, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', '', 24),
(110, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', '', 25),
(111, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(112, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', '', 2),
(113, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', '', 3),
(114, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', '', 4),
(115, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', '', 5),
(116, 'moccasins', 'flap style, geometric motif', 1800, 'New York', '', 6),
(117, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', '', 7),
(118, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', '', 8),
(119, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', '', 9),
(120, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', '', 10),
(121, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', '', 11),
(122, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', '', 12),
(123, 'garters ', 'six point star motif ', 1850, 'Michigan', '', 13),
(124, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', '', 14),
(125, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', '', 15),
(126, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(127, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', '', 17),
(128, 'club ', 'ball club, wild cat motif ', 1830, 'New York', '', 18),
(129, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', '', 19),
(130, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', '', 20),
(131, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', '', 21),
(132, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', '', 22),
(133, 'effigy ', 'head effigy ', 1830, 'Ontario ', '', 23),
(134, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', '', 24),
(135, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', '', 25),
(136, 'Pouch', 'Leather pounch with Mallard duck decoration and thunderbird motif', 1800, 'Minnesota ', '', 1),
(137, 'Pouch', 'Blackened buckskin pouch with a wild cat motif ', 1800, 'Michigan', '', 2),
(138, 'Pouch', 'cresent pouch of blackened buckskin with floral motif', 1800, 'Quebec', '', 3),
(139, 'shoulder bag ', 'blackened buckskin shoulder bag with cross motif and fringe', 1800, 'Wisconsin', '', 4),
(140, 'knife case ', 'blackened buckskin knife case decorative quill motif', 1800, 'Wisconsin', '', 5),
(141, 'moccasins', 'flap style, geometric motif', 1800, 'New York', '', 6),
(142, 'moccasins', 'ankle style, fish motif ', 1800, 'Wisconsin', '', 7),
(143, 'Sash ', 'Red, Black, Tan stripes with wave motif ', 1800, 'Michigan', '', 8),
(144, 'shoulder bag ', 'red, green stripes with white glass beads ', 1830, 'Michigan', '', 9),
(145, 'garters ', 'red, black, tan, cream with white beads ', 1830, 'Michigan', '', 10),
(146, 'shoulder bag ', 'velvet, glass bead geometric motif ', 1830, 'Ontario ', '', 11),
(147, 'moccasins', 'woodlands flap style, geometric motif ', 1830, 'Michigan', '', 12),
(148, 'garters ', 'six point star motif ', 1850, 'Michigan', '', 13),
(149, 'shoulder bag ', 'floral motif ', 1850, 'Kansas ', '', 14),
(150, 'sash ', 'purple, red, green, ', 1890, 'Oklahoma ', '', 15),
(151, 'blanket ', 'black with red, green silk ribbon ', 1890, 'Oklahoma ', '', 16),
(152, 'tomahawk ', 'fish, acorn, moon inlay ', 1800, 'Ohio ', '', 17),
(153, 'club ', 'ball club, wild cat motif ', 1830, 'New York', '', 18),
(154, 'club ', 'ball club, horse motif ', 1800, 'Minnesota ', '', 19),
(155, 'club ', 'gunstock club, fish, men, bird decoratons ', 1830, 'Michigan', '', 20),
(156, 'pipe ', 'black ball motif ', 1850, 'Minnesota ', '', 21),
(157, 'spoon ', 'spoon with face fetish ', 1850, 'Ontario ', '', 22),
(158, 'effigy ', 'head effigy ', 1830, 'Ontario ', '', 23),
(159, 'pipe ', 'sitting man effigy ', 1850, 'Minnesota ', '', 24),
(160, 'pipe ', 'inlay lead motif ', 1850, 'Minnesota ', '', 25);

-- --------------------------------------------------------

--
-- Table structure for table `artifact_material`
--

CREATE TABLE `artifact_material` (
  `artifact_id` int(25) NOT NULL,
  `material_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artifact_tribe`
--

CREATE TABLE `artifact_tribe` (
  `artifact_id` int(25) NOT NULL,
  `tribe_id` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `id` int(25) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`id`, `name`) VALUES
(16, ' '),
(15, ' brass'),
(23, ' buckskin '),
(12, ' cotton'),
(2, ' duck'),
(5, ' dyed deer hair'),
(6, ' glass beads '),
(24, ' iron '),
(21, ' lead '),
(7, ' moose hair'),
(3, ' porcupine quills'),
(11, ' silk ribbon '),
(20, ' silver'),
(18, ' steel'),
(4, ' tin cones'),
(14, ' twine'),
(8, ' vegetal fiber'),
(19, ' wood'),
(9, ' wool'),
(1, 'buckskin'),
(26, 'catlinite '),
(13, 'glass beads'),
(17, 'iron'),
(25, 'steatite '),
(22, 'wood'),
(10, 'wool');

-- --------------------------------------------------------

--
-- Table structure for table `tribe`
--

CREATE TABLE `tribe` (
  `id` int(25) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tribe`
--

INSERT INTO `tribe` (`id`, `name`) VALUES
(6, 'Chippewa '),
(7, 'Delaware '),
(1, 'Eastern Sioux'),
(3, 'Huron'),
(5, 'Iroquois'),
(4, 'Menominee'),
(8, 'Osage '),
(2, 'Ottawa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artifact`
--
ALTER TABLE `artifact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `name` (`name`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `artifact_material`
--
ALTER TABLE `artifact_material`
  ADD KEY `artifact_id` (`artifact_id`),
  ADD KEY `material_id` (`material_id`) USING BTREE;

--
-- Indexes for table `artifact_tribe`
--
ALTER TABLE `artifact_tribe`
  ADD PRIMARY KEY (`artifact_id`),
  ADD KEY `tribe-id` (`tribe_id`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material` (`name`);

--
-- Indexes for table `tribe`
--
ALTER TABLE `tribe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artifact`
--
ALTER TABLE `artifact`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `material`
--
ALTER TABLE `material`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tribe`
--
ALTER TABLE `tribe`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artifact_material`
--
ALTER TABLE `artifact_material`
  ADD CONSTRAINT `artifact_tk` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`),
  ADD CONSTRAINT `material_tk` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`);

--
-- Constraints for table `artifact_tribe`
--
ALTER TABLE `artifact_tribe`
  ADD CONSTRAINT `artifact_tk1` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`),
  ADD CONSTRAINT `tribe_tk` FOREIGN KEY (`tribe_id`) REFERENCES `tribe` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
