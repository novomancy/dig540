-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 25, 2017 at 11:20 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digitaly_Take 2 Dianne`
--

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id` int(8) NOT NULL,
  `genre_label` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `genre_label`) VALUES
(1, 'personal_interview'),
(2, 'personal_narrative');

-- --------------------------------------------------------

--
-- Table structure for table `interviewer`
--

CREATE TABLE `interviewer` (
  `id` int(8) NOT NULL,
  `name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `organization` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interviewer`
--

INSERT INTO `interviewer` (`id`, `name`, `organization`) VALUES
(1, 'Jessica Boyd', 'Hancock County interviewer'),
(2, 'Ryan Rostro', 'Portland interviwer'),
(3, 'John Keller', ''),
(4, 'Kay Kaufman Shelemay', 'Massachusetts interviewer'),
(5, 'Sarah Philipson', 'New York City interviewer'),
(6, 'Shalena Rivas', 'New York City'),
(7, 'Michael Cursi', 'StoryCorps 9-11 project'),
(8, 'null', 'interviewer not determined');

-- --------------------------------------------------------

--
-- Table structure for table `interview_files`
--

CREATE TABLE `interview_files` (
  `id` int(8) NOT NULL,
  `id_source` int(8) NOT NULL,
  `file_name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `interviewee_name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `id_interviewer` int(8) NOT NULL,
  `date_created` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `id_genre` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interview_files`
--

INSERT INTO `interview_files` (`id`, `id_source`, `file_name`, `interviewee_name`, `id_interviewer`, `date_created`, `note`, `id_genre`) VALUES
(1, 1, 'Rachel Philio interview', 'Philio, Rachel', 1, 'September 20, 2001', 'September 11 documentary project', 1),
(3, 1, 'David Harmon interview', 'David Harmon', 2, 'September 25, 2001', 'David Harmon was at home when a friend called and informed him about the attacks on the World Trade Center. He recalls thinking it was a joke. He describes his personal feelings and discusses his thoughts on the government\'s handling of the situation. He believes the whole world is now aware of terrorism.', 1),
(10, 1, 'Josh Pate interview', 'Josh Pate', 3, 'September 27, 2001', 'Josh Pate\'s uncle, who worked in the World Trade Center, died when the first plane crashed. The entire situation was hard for him to believe. He feels that the United States must go on the offensive, however, people should maintain normalcy in their lives. The situation is a struggle of good versus evil and the terrorists must be destroyed.', 1),
(11, 1, 'Dustin Young interiview', 'Dustin Young', 1, 'September 19, s001', 'At first, Dustin Young thought the attacks were an accident. He believes that the events will bring out more nationalism and respect for the flag and will make the United States a closer society. Mr. Young also talks about his pride in America, retaliation, praying for the victims and supporting the firefighters.', 1),
(12, 1, 'Peter Cioni and Tom Latimer interview', 'Peter Cioni and Tom Latimer', 2, 'September 19, 2001', 'Peter Cioni and Tom Latimer were interviewed by students from the Salt Institute. Peter was shocked and appalled by the attacks and supports using whatever means necessary to protect America, including fighting a protracted war in the Middle East. There is a discussion about the terrorists\' success at provoking fear in society and the implications to the economy and our sense of freedom. Many other issues are discussed in this interview.\r\n', 1),
(14, 1, 'Sharon Batista and Sankar Guan interviews', 'Sharon Batista and Sankar Guan interviews', 4, 'November 16, 2001', 'Kay Kaufman Shelemay summarizes her reactions to the terrorist attacks. Additionally, several students engage in a group discussion about the attacks and their ramifications', 1),
(15, 1, 'Loriann Messerschmitt interview', 'Loriann Messerschmitt', 5, 'November 10, 2001', 'Loriann Messerschmitt was near the World Trade Center when the planes hit. She ran to a ferry to escape Manhattan but it was overcrowded. She describes the physical scene that day, including the sight and smell of rubble, and discusses the reactions people had to the day\'s events. Maintaining a sense of normalcy since the attacks has been difficult.', 1),
(16, 1, 'Lillie Haws interview', 'Lillie Haws', 5, 'November 10, 2001', 'Lillie Haws was at a friend\'s house in Brooklyn when the September 11 attacks occurred. She ran to the pier to view the scene. Later, people flooded into her bar and stayed late into the night, especially firefighters. She discusses her personal response, admiration for the New York City firefighters, and the loss of a friend. Ms. Haws hopes the tragedy will bring people closer together and that they will appreciate firefighters more.', 1),
(18, 1, 'Tenisha Semidey interview', 'Tenisha Semidey', 6, 'November 18, 2001', 'Tenisha Semidey\'s sister woke her up to tell her about the September 11 attacks. She attends community college two blocks from Ground Zero. She feels bad every time she walks there. The air smells like gas and smoke. Tenisha wishes her school had not reopened. Students complain about headaches and nausea. A distant cousin died in the attacks. She feels sorry for everyone who perished during the attacks.', 1),
(19, 5, 'John Abruzzo interview', 'John Abruzzo', 7, '', 'John Abruzzo (above) is a quadriplegic who uses an an electric wheelchair. On September 11, 2001, he was working as an accountant for The Port Authority in the North Tower of the World Trade Center.  Abruzzo escaped the building with the help of 10 colleagues, who carried him down 69 flights of stairs in an emergency evacuation chair. At StoryCorps, John spoke with Michael Curci (left), one of the 10 who helped him to safety.', 1),
(21, 5, 'Joseph Lutrario interview', 'Joseph Lutrario', 8, 'November 8, 2007', 'Retired NYPD officer Joseph Lutrario was on duty the morning of September 11th, 2001. When the first plane hit the north tower, his unit was mobilized immediately.', 2),
(22, 5, 'Racquel Kelley interview', 'Racquel Kelley', 8, 'May 21, 2006', 'Racquel Kelley was working at the Pentagon on the morning of September 11, 2001 when American Airlines Flight 77 crashed into the building. At the time, Kelley had an 8-month-old son at home.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `interview_files_subject`
--

CREATE TABLE `interview_files_subject` (
  `subject_id` int(8) NOT NULL,
  `interview_files_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `interview_files_subject`
--

INSERT INTO `interview_files_subject` (`subject_id`, `interview_files_id`) VALUES
(1, 1),
(1, 3),
(2, 11),
(1, 11),
(1, 3),
(1, 19),
(1, 21),
(1, 10),
(1, 16),
(1, 15),
(1, 12),
(1, 18),
(1, 14),
(1, 1),
(1, 19),
(1, 22);

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE `source` (
  `id` int(8) NOT NULL,
  `url` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(265) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`id`, `url`, `name`, `description`) VALUES
(1, 'https://www.loc.gov/collections/september-11th-2001-documentary-project/', 'September 11, 2001 Documentary Project', 'An LOC project documenting 9-11'),
(5, 'https://storycorps.org/?s=9-11&type=listen', 'Story Corps 9-11', 'Story Corps interviews about 9-11');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(8) NOT NULL,
  `subject_label` varchar(265) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subject_label`) VALUES
(1, '9-11'),
(2, 'East Sullivan--Hancock County--Maine'),
(3, 'Portland -- Maine'),
(4, 'emigration and immigration'),
(5, 'Bin Laden, Osama, 1957-2011'),
(6, 'Cambridge--Massachusetts'),
(7, 'New York--New York'),
(8, 'Pentagon'),
(9, 'Washingtion DC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_label` (`genre_label`(255));

--
-- Indexes for table `interviewer`
--
ALTER TABLE `interviewer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `interview_files`
--
ALTER TABLE `interview_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_interviewer` (`id_interviewer`),
  ADD KEY `id` (`id`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_source` (`id_source`);

--
-- Indexes for table `interview_files_subject`
--
ALTER TABLE `interview_files_subject`
  ADD KEY `interview_files_id` (`interview_files_id`),
  ADD KEY `subject_id` (`subject_id`) USING BTREE;

--
-- Indexes for table `source`
--
ALTER TABLE `source`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`(255)),
  ADD KEY `id` (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_label` (`subject_label`(255));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `interviewer`
--
ALTER TABLE `interviewer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `interview_files`
--
ALTER TABLE `interview_files`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `source`
--
ALTER TABLE `source`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `interview_files`
--
ALTER TABLE `interview_files`
  ADD CONSTRAINT `interview_files_ibfk_1` FOREIGN KEY (`id_interviewer`) REFERENCES `interviewer` (`id`),
  ADD CONSTRAINT `interview_files_ibfk_3` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `interview_files_ibfk_4` FOREIGN KEY (`id_source`) REFERENCES `source` (`id`);

--
-- Constraints for table `interview_files_subject`
--
ALTER TABLE `interview_files_subject`
  ADD CONSTRAINT `interview_files_subject_ibfk_1` FOREIGN KEY (`interview_files_id`) REFERENCES `interview_files` (`id`),
  ADD CONSTRAINT `interview_files_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
