-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 19, 2020 at 05:51 PM
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
-- Database: `alanadig_artistbios`
--

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `id` int(4) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `life_dates` varchar(9) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`id`, `name`, `life_dates`) VALUES
(1, 'Alice Neel', '1900-1984'),
(2, 'Amedeo Clemente Modigliani', '1884-1920'),
(3, 'Artemisia Gentileschi', '1593-1654'),
(4, 'Camille Claudel', '1864-1943'),
(5, 'Dora de Houghton Carrington', '1893-1932'),
(6, 'Françoise Gilot', '1921-'),
(7, 'Frida Kahlo', '1907-1954'),
(8, 'Georgia O\'Keefe', '1887-1986'),
(9, 'Gustav Klimt', '1862-1918'),
(10, 'Jean-Michel Basquiat', '1960-1988'),
(11, 'Johannes Vermeer ', '1632-1675'),
(12, 'Joseph Mallord William (J.M.W.) Turner', '1775-1851'),
(13, 'Leonardo da Vinci', '1452-1519'),
(14, 'M.F. Husain', '1915-2011'),
(15, 'Marcel Duchamp', '1887-1968'),
(16, 'Michelangelo di Lodovico Buonarroti Simoni', '1475-1564'),
(17, 'Pablo Ruiz Picasso', '1881-1973'),
(18, 'Paul Jackson Pollock', '1912-1956'),
(19, 'Peggy Guggenheim', '1898-1979'),
(20, 'Rembrandt Harmenszoon van Rijn', '1606-1669'),
(21, 'Robert Mapplethorpe', '1946-1989'),
(22, 'Vincent Willem van Gogh', '1853-1890'),
(23, 'Yayoi Kusama ', '1929-');

-- --------------------------------------------------------

--
-- Table structure for table `artist_tag`
--

CREATE TABLE `artist_tag` (
  `artist_id` int(4) NOT NULL,
  `tag_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `artist_tag`
--

INSERT INTO `artist_tag` (`artist_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 5),
(2, 7),
(2, 8),
(2, 8),
(3, 9),
(3, 6),
(3, 5),
(4, 10),
(4, 11),
(4, 8),
(5, 12),
(5, 13),
(5, 5),
(5, 14),
(5, 15),
(6, 16),
(6, 10),
(6, 5),
(6, 17),
(6, 18),
(6, 19),
(7, 20),
(7, 21),
(7, 5),
(7, 3),
(7, 22),
(7, 23),
(8, 1),
(8, 4),
(8, 5),
(9, 24),
(9, 25),
(9, 5),
(9, 23),
(9, 26),
(10, 27),
(10, 1),
(10, 28),
(10, 29),
(10, 30),
(10, 5),
(10, 31),
(11, 32),
(11, 33),
(11, 5),
(12, 13),
(12, 5),
(12, 34),
(12, 35),
(12, 17),
(13, 36),
(13, 6),
(13, 37),
(13, 5),
(14, 38),
(14, 5),
(14, 39),
(15, 40),
(15, 41),
(15, 42),
(15, 43),
(15, 5),
(15, 8),
(16, 44),
(16, 45),
(16, 6),
(16, 5),
(16, 46),
(16, 8),
(16, 47),
(17, 16),
(17, 48),
(17, 5),
(17, 34),
(17, 8),
(17, 49),
(17, 50),
(17, 18),
(17, 19),
(18, 1),
(18, 5),
(18, 51),
(19, 1),
(19, 52),
(19, 4),
(19, 53),
(20, 32),
(20, 54),
(20, 5),
(20, 55),
(21, 1),
(21, 56),
(21, 57),
(21, 58),
(21, 3),
(21, 59),
(22, 32),
(22, 5),
(22, 60),
(22, 15),
(23, 41),
(23, 61),
(23, 28),
(23, 62),
(23, 63),
(23, 64),
(23, 8);

-- --------------------------------------------------------

--
-- Table structure for table `biography`
--

CREATE TABLE `biography` (
  `id` int(4) NOT NULL,
  `artist_id` int(4) NOT NULL,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `format_id` int(4) NOT NULL,
  `author_director` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `categories` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `biography`
--

INSERT INTO `biography` (`id`, `artist_id`, `title`, `year`, `format_id`, `author_director`, `categories`, `image_url`) VALUES
(1, 1, 'Alice Neel: The Art of Not Sitting Pretty', 2010, 1, 'Phoebe Hoban', 'Biography', '<a title=\"Lynn Gilbert\n, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Alice_Neel_portrait_by_%C2%A9Lynn_Gilbert_1976.jpg\"><img width=\"256\" alt=\"Alice Neel portrait by ©Lynn Gilbert 1976\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Alice_Neel_portrait_by_%C2%A9Lynn_Gilbert_1976.jpg/256px-Alice_Neel_portrait_by_%C2%A9Lynn_Gilbert_1976.jpg\"></a>'),
(2, 1, 'Alice Neel', 2007, 2, 'Andrew Neel', 'Documentary', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/t8sPFpXakI0\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(3, 2, 'Montparnasse 19', 1958, 2, 'Jacques Becker', 'Drama, Romance', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wndw2l6yUrs\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(4, 2, 'Modigliani', 2004, 2, 'Mick Davis', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Bv_VAqNL_V0\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(5, 2, 'Modigliani: A Life', 2011, 1, 'Meryle Secrest', 'Nonfiction', '<a title=\"Multiple Artists, CC0, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Amedeo-Modigliani-Nudo-rosso.jpg\"><img width=\"512\" alt=\"Amedeo-Modigliani-Nudo-rosso\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Amedeo-Modigliani-Nudo-rosso.jpg/512px-Amedeo-Modigliani-Nudo-rosso.jpg\"></a>'),
(6, 3, 'Artemesia', 1997, 2, 'Agnès Merlet', 'Drama, History', '<a title=\"Artemisia Gentileschi\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Self-portrait_as_the_Allegory_of_Painting_(La_Pittura)_-_Artemisia_Gentileschi.jpg\"><img width=\"256\" alt=\"Self-portrait as the Allegory of Painting (La Pittura) - Artemisia Gentileschi\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Self-portrait_as_the_Allegory_of_Painting_%28La_Pittura%29_-_Artemisia_Gentileschi.jpg/256px-Self-portrait_as_the_Allegory_of_Painting_%28La_Pittura%29_-_Artemisia_Gentileschi.jpg\"></a>'),
(7, 3, 'Artemisia Gentileschi: Warrior Painter', 2020, 2, 'Jordan River', 'Drama, Documentary', '<a title=\"Deltastarpictures, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:MoviePoster_ITA_Artemisia-Gentileschi,Pittirce_Guerriera.jpg\"><img width=\"256\" alt=\"MoviePoster ITA Artemisia-Gentileschi,Pittirce Guerriera\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/MoviePoster_ITA_Artemisia-Gentileschi%2CPittirce_Guerriera.jpg/256px-MoviePoster_ITA_Artemisia-Gentileschi%2CPittirce_Guerriera.jpg\"></a>'),
(8, 3, 'Artemisia Gentileschi', 1991, 1, 'Mary D. Garrard', 'Nonfiction, History', '<a title=\"Artemisia Gentileschi\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Judit_decapitando_a_Holofernes,_por_Artemisia_Gentileschi.jpg\"><img width=\"256\" alt=\"Judit decapitando a Holofernes, por Artemisia Gentileschi\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Judit_decapitando_a_Holofernes%2C_por_Artemisia_Gentileschi.jpg/256px-Judit_decapitando_a_Holofernes%2C_por_Artemisia_Gentileschi.jpg\"></a>'),
(9, 4, 'Camille Claudel', 1988, 2, 'Bruno Nuytten', 'Drama, History', '<iframe src=\"https://player.vimeo.com/video/27254994\" width=\"640\" height=\"480\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen></iframe>\n<p><a href=\"https://vimeo.com/27254994\">Camille Claudel (1988) Bir Kadın - Trailer</a> from <a href=\"https://vimeo.com/tamsanat\">tamsanat</a> on <a href=\"https://vimeo.com\">Vimeo</a>.</p>'),
(10, 4, 'Camille Claudel: A Life', 2002, 1, 'Odile Ayral-Clause', 'Nonfiction', '<a title=\"William Elborne, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Camille_Claudel_atelier_cropped_Lipscomb.jpg\"><img width=\"256\" alt=\"Camille Claudel atelier cropped Lipscomb\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Camille_Claudel_atelier_cropped_Lipscomb.jpg/256px-Camille_Claudel_atelier_cropped_Lipscomb.jpg\"></a>'),
(11, 5, 'Carrington', 1995, 2, 'Christopher Hampton', 'Drama, Romance', '<a title=\"Dora Carrington (1893-1932), Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Dora_Carrington,_1910.jpg\"><img width=\"256\" alt=\"Dora Carrington, 1910\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Dora_Carrington%2C_1910.jpg/256px-Dora_Carrington%2C_1910.jpg\"></a>'),
(12, 5, 'Carrington: A Life of Dora Carrington (1893-1932)', 1995, 1, 'Gretchen Holbrook Gerzina', 'Memoir, Nonfiction', '<a title=\"public domain, CC0, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Conviv%C3%A8ncia_Lytton_Strachey_i_Dora_Carrington.jpg\"><img width=\"256\" alt=\"Convivència Lytton Strachey i Dora Carrington\" src=\"https://upload.wikimedia.org/wikipedia/commons/3/39/Conviv%C3%A8ncia_Lytton_Strachey_i_Dora_Carrington.jpg\"></a>'),
(13, 5, 'Carrington: Letters And Extracts From Her Diaries', 1979, 1, 'Dora Carrington & David Garnett (Editor)', 'Nonfiction, Diary', '<a title=\"Carrington, Dora(1893-1932), Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:CarringtonTidmarsh.png\"><img width=\"256\" alt=\"CarringtonTidmarsh\" src=\"https://upload.wikimedia.org/wikipedia/commons/d/d5/CarringtonTidmarsh.png\"></a>'),
(14, 6, 'Surviving Picasso', 1996, 2, 'James Ivory', 'Drama, Romance', '<a title=\"Revista Vea y Lea (cuadrado por Juan Pablo Arancibia Medina), Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Pablo_picasso_1_(cuadrado).jpg\"><img width=\"128\" alt=\"Pablo picasso 1 (cuadrado)\" src=\"https://upload.wikimedia.org/wikipedia/commons/a/a9/Pablo_picasso_1_%28cuadrado%29.jpg\"></a>'),
(15, 6, 'Life with Picasso', 2019, 1, 'Françoise Gilot, Carlton Lake, & Lisa Alther', 'Memoir, Biography', '<a title=\"KhanAcademyTurkce, CC BY 3.0 &lt;https://creativecommons.org/licenses/by/3.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Fran%C3%A7oise_Gilot.jpg\"><img width=\"300\" alt=\"Françoise Gilot\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Fran%C3%A7oise_Gilot.jpg/512px-Fran%C3%A7oise_Gilot.jpg\"></a>'),
(16, 7, 'The Life and Times of Frida Kahlo', 2005, 2, 'Amy Stechler', 'Documentary', '<a title=\"Guillermo Kahlo, Frida Kahlo, 1932, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Guillermo_Kahlo,_Frida_Kahlo,_1932.jpg\"><img width=\"256\" alt=\"Guillermo Kahlo, Frida Kahlo, 1932\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Guillermo_Kahlo%2C_Frida_Kahlo%2C_1932.jpg/256px-Guillermo_Kahlo%2C_Frida_Kahlo%2C_1932.jpg\"></a>'),
(17, 7, 'Frida', 2002, 2, 'Julie Taymor', 'Drama, Romance', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-CTM7FcY1LE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(18, 7, 'Frida', 1998, 1, 'Hayden Herrera', 'Nonfiction, History', '<a title=\"Guillermo Kalho\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Frida_Kahlo,_by_Guillermo_Kahlo_3_(cropped).jpg\"><img width=\"256\" alt=\"Frida Kahlo, by Guillermo Kahlo 3 (cropped)\" src=\"https://upload.wikimedia.org/wikipedia/commons/b/bd/Frida_Kahlo%2C_by_Guillermo_Kahlo_3_%28cropped%29.jpg\"></a>'),
(19, 8, 'Georgia O\'Keefe', 2009, 2, 'Bob Balaban', 'Drama, Romance', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ihhsSLMNh5s\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(20, 8, 'Portrait of an Artist: A Biography of Georgia O\'Keeffe', 1997, 1, 'Laurie Lisle ', 'Nonfiction, History', '<a title=\"Alfred Stieglitz\n, CC0, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Georgia_O%27Keeffe_MET_CT_41513.jpg\"><img width=\"256\" alt=\"Georgia O&#039;Keeffe MET CT 41513\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Georgia_O%27Keeffe_MET_CT_41513.jpg/256px-Georgia_O%27Keeffe_MET_CT_41513.jpg\"></a>'),
(21, 9, 'Klimt', 2006, 2, 'Raoul Ruiz', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WbbaU5P0lL4\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(22, 9, 'The Kiss: A Novel', 2001, 1, 'Danielle Steele', 'Novel, Historical Fiction', '<a title=\"Gustav Klimt\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg\"><img width=\"300\" alt=\"The Kiss - Gustav Klimt - Google Cultural Institute\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg/512px-The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg\"></a>'),
(23, 10, 'Jean-Michel Basquiat: The Radiant Child', 2010, 2, 'Tamra Davis', 'Documentary', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bt48AxjzQJI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(24, 10, 'Basquiat', 1996, 2, 'Julian Schnabel', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/VV8r1VMJoQE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(25, 10, 'Jean Michel Basquiat: A Biography', 2010, 1, 'Eric Fretz', 'Nonfiction', '<a title=\"Galerie Bruno Bischofberger, CC BY-SA 4.0 &lt;https://creativecommons.org/licenses/by-sa/4.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Andy_Warhol,_Jean-Michel_Basquiat,_Bruno_Bischofberger_and_Fransesco_Clemente,_New_York,_1984.tif\"><img width=\"512\" alt=\"Andy Warhol, Jean-Michel Basquiat, Bruno Bischofberger and Fransesco Clemente, New York, 1984\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Andy_Warhol%2C_Jean-Michel_Basquiat%2C_Bruno_Bischofberger_and_Fransesco_Clemente%2C_New_York%2C_1984.tif/lossy-page1-789px-Andy_Warhol%2C_Jean-Michel_Basquiat%2C_Bruno_Bischofberger_and_Fransesco_Clemente%2C_New_York%2C_1984.tif.jpg\"></a>'),
(26, 11, 'Girl with a Pearl Earring', 1999, 1, 'Tracy Chevalier', 'Novel, Historical Fiction', '<a title=\"Johannes Vermeer\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Johannes_Vermeer_(1632-1675)_-_The_Girl_With_The_Pearl_Earring_(1665).jpg\"><img width=\"256\" alt=\"Johannes Vermeer (1632-1675) - The Girl With The Pearl Earring (1665)\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Johannes_Vermeer_%281632-1675%29_-_The_Girl_With_The_Pearl_Earring_%281665%29.jpg/256px-Johannes_Vermeer_%281632-1675%29_-_The_Girl_With_The_Pearl_Earring_%281665%29.jpg\"></a>'),
(27, 11, 'Girl with a Pearl Earring', 2003, 2, 'Peter Webber', 'Drama, Romance', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/q32dGk7r5qs\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(28, 12, 'Turner: The Extraordinary Life and Momentous Times of J.M.W. Turner', 2016, 1, 'Franny Moyle', 'Nonfiction, History', '<a title=\"J. M. W. Turner\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Joseph_Mallord_William_Turner_038.jpg\"><img width=\"300\" alt=\"Joseph Mallord William Turner 038\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Joseph_Mallord_William_Turner_038.jpg/512px-Joseph_Mallord_William_Turner_038.jpg\"></a>'),
(29, 12, 'Mr. Turner', 2014, 2, 'Mike Leigh', 'Drama, History', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nkSwUnkKzoA\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(30, 13, 'Leonardo da Vinci', 2017, 1, 'Walter Isaacson', 'Nonfiction, History', '<a title=\"Alison restrepo quiroga, CC BY-SA 3.0 &lt;https://creativecommons.org/licenses/by-sa/3.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:LEONARDO_DA_VINCI.jpg\"><img width=\"256\" alt=\"LEONARDO DA VINCI\" src=\"https://upload.wikimedia.org/wikipedia/commons/5/54/LEONARDO_DA_VINCI.jpg\"></a>'),
(31, 13, 'Being Leonardo da Vinci', 2019, 2, 'Massimiliano Finazzer Flory', 'Drama, History, Mystery', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UlR31G4Wiek\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(32, 14, 'Through the Eyes of a Painter', 1967, 2, 'M.F. Husain', 'Short Film', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/qHg2AR8_UeM\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(33, 15, 'Marcel Duchamp: The Afternoon Interviews', 2013, 1, 'Calvin Tomkins', 'Biography', '<p><a href=\"https://en.wikipedia.org/wiki/File:Man_Ray,_1920-21,_Portrait_of_Marcel_Duchamp,_gelatin_silver_print,_Yale_University_Art_Gallery.jpg#/media/File:Man_Ray,_1920-21,_Portrait_of_Marcel_Duchamp,_gelatin_silver_print,_Yale_University_Art_Gallery.jpg\"><img src=\"https://upload.wikimedia.org/wikipedia/en/3/34/Man_Ray%2C_1920-21%2C_Portrait_of_Marcel_Duchamp%2C_gelatin_silver_print%2C_Yale_University_Art_Gallery.jpg\" alt=\"Man Ray, 1920-21, Portrait of Marcel Duchamp, gelatin silver print, Yale University Art Gallery.jpg\" height=\"480\" width=\"377\"></a><br>By <a href=\"//en.wikipedia.org/wiki/Man_Ray\" title=\"Man Ray\"&gt;Man Ray&lt;/a&gt; - &lt;a rel=\"nofollow\" class=\"external text\" href=\"http://artgallery.yale.edu/collections/objects/31309\"&gt;Yale University Art Gallery&lt;/a&gt;, <a href=\"//en.wikipedia.org/wiki/File:Man_Ray,_1920-21,_Portrait_of_Marcel_Duchamp,_gelatin_silver_print,_Yale_University_Art_Gallery.jpg\" title=\"Public domain in the United States\">PD-US</a>, <a href=\"https://en.wikipedia.org/w/index.php?curid=48429831\">Link</a></p>'),
(34, 15, 'Marcel Duchamp: The Art of the Possible', 2019, 2, 'Matthew Taylor', 'Documentary', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gCW6p8d0L8s\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(35, 16, 'The Agony and the Ecstasy', 1965, 2, 'Carol Reed', 'Drama, History', '<iframe src=\"https://player.vimeo.com/video/165285200\" width=\"640\" height=\"360\" frameborder=\"0\" allow=\"autoplay; fullscreen\" allowfullscreen></iframe>\n<p><a href=\"https://vimeo.com/165285200\">The Agony and the Ecstasy (1965) - Trailer-SD</a> from <a href=\"https://vimeo.com/asifeorg\">ASIFEORG</a> on <a href=\"https://vimeo.com\">Vimeo</a>.</p>'),
(36, 16, 'The Agony and the Ecstasy', 1961, 1, 'Irving Stone', 'Novel, Historical Fiction', '<a title=\"Michelangelo\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Creaci%C3%B3n_de_Ad%C3%A1n.jpg\"><img width=\"512\" alt=\"Creación de Adán\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Creaci%C3%B3n_de_Ad%C3%A1n.jpg/512px-Creaci%C3%B3n_de_Ad%C3%A1n.jpg\"></a>'),
(37, 16, 'Michelangelo: The Artist, the Man, and His Times', 2011, 1, 'William E. Wallace', 'Nonfiction, History', '<a title=\"Jacopino del Conte\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Michelangelo-Buonarroti1.jpg\"><img width=\"256\" alt=\"Michelangelo-Buonarroti1\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Michelangelo-Buonarroti1.jpg/256px-Michelangelo-Buonarroti1.jpg\"></a>'),
(38, 17, 'The Success and Failure of Picasso', 1993, 1, 'John Berger', 'Nonfiction, History', '<a title=\"Argentina. Revista Vea y Lea, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Pablo_picasso_1.jpg\"><img width=\"128\" alt=\"Pablo picasso 1\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Pablo_picasso_1.jpg/128px-Pablo_picasso_1.jpg\"></a>'),
(39, 18, 'Pollock', 2000, 2, 'Ed Harris', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/OyXlkiwHBzE\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(40, 18, 'Jackson Pollock: An American Saga\r', 1998, 1, 'Gregory White Smith & Steven Naifeh', 'Nonfiction, History, Memoir', '<img src=\"https://static01.nyt.com/images/2006/09/30/arts/30holmes_CA1.450.jpg\">'),
(41, 19, 'Confessions of an Art Addict', 2013, 1, 'Peggy Guggenheim', 'Autobiography, Memoir', '<img src=\"https://www.guggenheim-venice.it/site/assets/files/5635/peggy_padiglione_1948-pegeen-1.749x0-is.jpg\" width=300>'),
(42, 19, 'Peggy Guggenheim: Art Addict', 2015, 2, 'Lisa Immordino Vreeland', 'Documentary', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/rocx6zoMg4A\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(43, 20, 'Rembrandt', 1936, 2, 'Alexander Korda ', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YuWasFUW1Ds\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(44, 20, 'Rembrandt\'s Eyes', 1999, 1, 'Simon Schama', 'Nonfiction, History', '<a title=\"Rembrandt\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Rembrandt_-_Self-Portrait_with_Velvet_Beret_-_Google_Art_Project.jpg\"><img width=\"256\" alt=\"Rembrandt - Self-Portrait with Velvet Beret - Google Art Project\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/Rembrandt_-_Self-Portrait_with_Velvet_Beret_-_Google_Art_Project.jpg/256px-Rembrandt_-_Self-Portrait_with_Velvet_Beret_-_Google_Art_Project.jpg\"></a>'),
(45, 21, 'Just Kids', 2010, 1, 'Patti Smith', 'Nonfiction, Autobiography, Memoir', '<a title=\"Vistawhite, CC BY-SA 3.0 &lt;https://creativecommons.org/licenses/by-sa/3.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:Patti_Smith.jpg\"><img width=\"256\" alt=\"Patti Smith\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Patti_Smith.jpg/256px-Patti_Smith.jpg\"></a>'),
(46, 21, 'Mapplethorpe', 2019, 2, 'Ondi Timoner', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/TvXLMpjyqpU\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(47, 22, 'Loving Vincent', 2017, 2, 'Dorota Kobiela & Hugh Welchman', 'Animation, Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Gy0RVDM1sNA\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(48, 22, 'Vincent and Theo', 1990, 2, 'Robert Altman', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/6iZx3vuKXnI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(49, 22, 'Van Gogh', 1991, 2, 'Maurice Pialat', 'Drama', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/GmuoJTPE834\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(50, 22, 'Vincent van Gogh: A Life in Letters', 2009, 1, 'Nienke Bakker, Leo Jansen, Hans Luijten', 'Nonfiction, History', '<a title=\"Vincent van Gogh\n, Public domain, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:VanGogh_1887_Selbstbildnis.jpg\"><img width=\"256\" alt=\"VanGogh 1887 Selbstbildnis\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/3/38/VanGogh_1887_Selbstbildnis.jpg/256px-VanGogh_1887_Selbstbildnis.jpg\"></a>'),
(51, 23, 'Kusama Infinity', 2018, 2, 'Heather Lenz', 'Documentary', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/J8zqhGf7EA0\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>'),
(52, 23, 'Infinity Net: The Autobiography of Yayoi Kusama', 2007, 1, 'Yayoi Kusama, Ralph McCarthy', 'Autobiography, Memoir, Nonfiction', '<a title=\"Ron Cogswell from Arlington, Virginia, USA, CC BY 2.0 &lt;https://creativecommons.org/licenses/by/2.0&gt;, via Wikimedia Commons\" href=\"https://commons.wikimedia.org/wiki/File:%27Infinity_Mirrored_Room%E2%80%94The_Souls_of_Millions_of_Light_Years_Away%27_2013_by_Yayoi_Kusama_--_The_Hirshhorn_Museum_(DC)_March_2017_(34420154200).jpg\"><img width=\"512\" alt=\"&#039;Infinity Mirrored Room—The Souls of Millions of Light Years Away&#039; 2013 by Yayoi Kusama -- The Hirshhorn Museum (DC) March 2017 (34420154200)\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/%27Infinity_Mirrored_Room%E2%80%94The_Souls_of_Millions_of_Light_Years_Away%27_2013_by_Yayoi_Kusama_--_The_Hirshhorn_Museum_%28DC%29_March_2017_%2834420154200%29.jpg/512px-%27Infinity_Mirrored_Room%E2%80%94The_Souls_of_Millions_of_Light_Years_Away%27_2013_by_Yayoi_Kusama_--_The_Hirshhorn_Museum_%28DC%29_March_2017_%2834420154200%29.jpg\"></a>');

-- --------------------------------------------------------

--
-- Table structure for table `format`
--

CREATE TABLE `format` (
  `id` int(4) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `format`
--

INSERT INTO `format` (`id`, `name`) VALUES
(1, 'Book'),
(2, 'Film');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(4) NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(51, 'abstract expressionism'),
(27, 'abstraction'),
(1, 'American'),
(44, 'architecture'),
(24, 'art nouveau'),
(25, 'Austrian'),
(9, 'baroque'),
(16, 'ceramics'),
(40, 'chess'),
(52, 'collector'),
(41, 'conceptual art'),
(61, 'contemporary'),
(42, 'cubism'),
(43, 'dada'),
(12, 'decorative arts'),
(14, 'design'),
(32, 'Dutch'),
(13, 'English'),
(54, 'etching'),
(2, 'expressionism'),
(28, 'fashion'),
(48, 'France'),
(10, 'French'),
(45, 'frescoes'),
(19, 'Gilot'),
(29, 'graffiti'),
(11, 'graphic arts'),
(38, 'India'),
(62, 'installation'),
(37, 'inventor'),
(6, 'Italian'),
(33, 'Italy'),
(63, 'Japanese'),
(15, 'letters'),
(20, 'Mexican'),
(4, 'modernism'),
(53, 'museum'),
(30, 'neo-expressionist'),
(21, 'new objectivity'),
(56, 'nudes'),
(5, 'painting'),
(7, 'Paris'),
(58, 'Patti Smith'),
(57, 'photographer'),
(18, 'Picasso'),
(46, 'poetry'),
(64, 'pop art'),
(3, 'portraits'),
(60, 'post-impressionism'),
(55, 'printing'),
(34, 'printmaking'),
(39, 'Rajasthan'),
(36, 'Renaissance'),
(35, 'romanticism'),
(8, 'sculpture'),
(47, 'Sistine Chapel'),
(49, 'Spanish'),
(59, 'still lifes'),
(31, 'street art'),
(22, 'surrealism'),
(23, 'symbolism'),
(50, 'theatre design'),
(26, 'Vienna Secession'),
(17, 'watercolor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `life_dates` (`life_dates`);

--
-- Indexes for table `artist_tag`
--
ALTER TABLE `artist_tag`
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `biography`
--
ALTER TABLE `biography`
  ADD PRIMARY KEY (`id`),
  ADD KEY `format_id` (`format_id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `format`
--
ALTER TABLE `format`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `biography`
--
ALTER TABLE `biography`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `format`
--
ALTER TABLE `format`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_tag`
--
ALTER TABLE `artist_tag`
  ADD CONSTRAINT `artist_tag_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `artist_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `biography`
--
ALTER TABLE `biography`
  ADD CONSTRAINT `biography_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `biography_ibfk_3` FOREIGN KEY (`format_id`) REFERENCES `format` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
