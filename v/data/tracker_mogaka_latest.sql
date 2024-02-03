-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2024 at 08:19 AM
-- Server version: 8.0.28
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tracker_mogaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `contribution` int NOT NULL,
  `intern` int NOT NULL,
  `minute` int NOT NULL,
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ref` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contribution`
--

INSERT INTO `contribution` (`contribution`, `intern`, `minute`, `summary`, `detail`, `ref`) VALUES
(1, 20, 223, 'I have lost track of problem at hand. \r\nThe emphasis on tools and methods is worrying, more academic than business. \r\nNo mention of last week\'s experience.\r\n Which of the tecs was useful for demo \r\nVideo show unsatisfactory \r\nShow us how you cropped the image on the demo', NULL, '2023-07-18 14:53:48'),
(2, 20, 231, 'Nothing on this?\r\nWhere do the boychild and marketing websites fit in your work plan?', NULL, '2023-07-18 14:51:48'),
(3, 20, 202, 'Left align text and right align ', NULL, '2023-07-18 14:56:41'),
(4, 20, 202, 'Show us get and set sumnary ', NULL, '2023-07-18 14:56:42'),
(5, 20, 202, 'Add rank summary  ', NULL, '2023-07-18 14:56:43'),
(6, 20, 202, 'Add bottom summary', NULL, '2023-07-18 14:51:42'),
(7, 20, 208, 'Show code for comments ', NULL, '2023-07-18 14:56:44'),
(8, 20, 208, 'Report progress on bundler Webpack ', NULL, '2023-07-18 14:56:45'),
(9, 20, 208, 'Scribble/encrypt names', NULL, '2023-07-18 14:56:50'),
(10, 20, 213, 'Sort the crumb cells ', NULL, '2023-07-18 14:56:46'),
(11, 20, 213, 'Remove green background', NULL, '2023-07-18 14:56:47'),
(12, 20, 213, 'Work on summaries, to show correct total, consider $-value', NULL, '2023-07-18 14:56:48'),
(13, 20, 215, 'Show progress with SMS invoicing', NULL, '2023-07-18 14:52:48'),
(14, 9, 202, 'Didn\'t take us through the interface. what does the subject column do?, debug services? ', NULL, '2023-07-18 14:56:40'),
(15, 9, 202, 'Have a way of seeing individual student performance.', NULL, '2023-07-18 14:56:48'),
(16, 18, 203, 'Maybe ranking by merit', NULL, '2023-07-18 14:56:48'),
(17, 14, 209, 'test contribution12', 'this and that', '2023-07-27 16:30:25'),
(18, 14, 211, 'Test is it done', NULL, '2023-07-29 20:53:37'),
(19, 14, 211, 'Test is it done', NULL, '2023-07-29 20:53:43'),
(20, 14, 212, 'test 123', '1015 if its us vs you who is it going to be', '2023-07-31 09:13:42'),
(21, 14, 212, 'good work', 'I dont like it', '2023-07-31 09:38:27'),
(22, 14, 212, 'good work kang\'ara', NULL, '2023-07-31 09:38:46'),
(27, 14, 214, 'james', 'test contribution. This is a test', '2023-09-02 20:22:42'),
(28, 14, 214, 'james', 'another test ...', '2023-09-02 22:58:25'),
(29, 14, 205, 'test contribution', 'tkasdjfhdkjsfjsajhdjhajjhdfsdsdfdsadsdd', '2023-09-04 12:58:07'),
(30, 14, 203, 'test', 'test 123', '2023-10-10 10:43:53'),
(31, 14, 205, 'good', 'great times', '2023-10-10 10:47:20'),
(32, 14, 206, 'jj', 'jjjjjjjjj', '2023-10-10 11:10:34'),
(33, 14, 204, 'jjjjjjjjj', 'fyuj', '2023-10-10 11:53:57'),
(34, 14, 205, 'jjjjjjjjj', 'da', '2023-10-10 11:56:24'),
(35, 14, 212, 'another test', 'Dj james', '2023-10-10 22:55:06'),
(36, 14, 210, 'new contribution', 'I was just testing ideas', '2023-12-03 23:02:46'),
(37, 14, 215, 'Take it slow', 'Rome wasn\'t built in a day. test', '2023-12-04 10:01:54'),
(38, 14, 211, 'sample', 'this is a test', '2023-12-18 18:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `copy` int NOT NULL,
  `intern` int NOT NULL,
  `presentation` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `file` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file`, `name`) VALUES
(87, 'kamau_20230728.md'),
(96, 'kamau_20230811.md'),
(1, 'kangara_20230403.md'),
(2, 'kangara_20230410.md'),
(4, 'kangara_20230508.md'),
(3, 'kangara_20230529.md'),
(38, 'kangara_20230612.md'),
(66, 'kangara_20230703.md'),
(83, 'kangara_20230724.md'),
(88, 'kangara_20230731.md'),
(97, 'kangara_20230814.md'),
(104, 'kangara_20230918.md'),
(39, 'kangara.html'),
(40, 'kaniu.html'),
(61, 'karanja_20230626.md'),
(78, 'karanja_20230717.md'),
(41, 'karanja.html'),
(42, 'kibe.html'),
(5, 'kiberenge_20230212.md'),
(6, 'kiberenge_20230406.md'),
(7, 'kiberenge_20230427.md'),
(8, 'kiberenge_20230511.md'),
(37, 'kiberenge_20230609.md'),
(60, 'kiberenge_20230622.md'),
(69, 'kiberenge_20230706.md'),
(81, 'kiberenge_20230720.md'),
(91, 'kiberenge_20230803.md'),
(95, 'kiberenge_20230810.md'),
(103, 'kiberenge_20230914.md'),
(107, 'kiberenge_20230928.md'),
(111, 'kiberenge_20231019.md'),
(34, 'kinyanjui_20230523.md'),
(35, 'kinyanjui_20230606.md'),
(58, 'kinyanjui_20230620.md'),
(43, 'kinyanjui.html'),
(9, 'kungu_20230216.md'),
(10, 'kungu_20230317.md'),
(11, 'kungu_20230428.md'),
(12, 'kungu_20230512.md'),
(56, 'kungu_20230616.md'),
(65, 'kungu_20230630.md'),
(44, 'kungu.html'),
(70, 'mbugua_20230707.md'),
(82, 'mbugua_20230721.md'),
(92, 'mbugua_20230804.md'),
(99, 'mbugua_20230818.md'),
(102, 'mbugua_20230908.md'),
(106, 'mbugua_20230922.md'),
(108, 'mbugua_20231006.md'),
(57, 'mogaka_20230619.md'),
(72, 'mogaka_20230710.md'),
(93, 'mogaka_20230807.md'),
(101, 'mogaka_20230828.md'),
(109, 'mogaka_20231009.md'),
(73, 'mogaka.html'),
(45, 'mugambi.html'),
(13, 'muli_20230330.md'),
(14, 'muli_20230413.md'),
(15, 'muli_20230504.md'),
(16, 'muli_20230525.md'),
(64, 'muli_20230629.md'),
(77, 'muli_20230713.md'),
(86, 'muli_20230727.md'),
(110, 'muli_20231012.md'),
(112, 'muli_20231019.md'),
(113, 'muli_20231102.md'),
(114, 'muli_20231116.md'),
(115, 'muli_20231130.md'),
(116, 'muli_20231214.md'),
(46, 'muli.html'),
(59, 'mungai_20230621.md'),
(63, 'mungai_20230628.md'),
(80, 'mungai_20230719.md'),
(90, 'mungai_20230802.md'),
(47, 'mungai.html'),
(17, 'munya_20230404.md'),
(18, 'munya_20230411.md'),
(19, 'munya_20230502.md'),
(20, 'munya_20230516.md'),
(21, 'munya_20230530.md'),
(54, 'munya_20230613.md'),
(62, 'munya_20230627.md'),
(75, 'munya_20230711.md'),
(84, 'munya_20230725.md'),
(89, 'munya_20230801.md'),
(98, 'munya_20230815.md'),
(105, 'munya_20230919.md'),
(48, 'munya.html'),
(22, 'mwaniki_20230331.md'),
(23, 'mwaniki_20230424.md'),
(24, 'mwaniki_20230505.md'),
(25, 'mwaniki_20230519.md'),
(71, 'mwaniki_20230707.md'),
(49, 'mwaniki.html'),
(50, 'nduta.html'),
(67, 'omondi_20230704.md'),
(79, 'omondi_20230718.md'),
(74, 'omondi.html'),
(26, 'wanjiru_20230406.md'),
(27, 'wanjiru_20230419.md'),
(28, 'wanjiru_20230426.md'),
(29, 'wanjiru_20230510.md'),
(30, 'wanjiru_20230524.md'),
(36, 'wanjiru_20230607.md'),
(76, 'wanjiru_20230712.md'),
(85, 'wanjiru_20230726.md'),
(94, 'wanjiru_20230809.md'),
(100, 'wanjiru_20230823.md'),
(51, 'wanjiru.html'),
(31, 'wawira_20230405.md'),
(32, 'wawira_20230517.md'),
(55, 'wawira_20230614.md'),
(68, 'wawira_20230705.md'),
(52, 'wawira.html'),
(33, 'weru_20230425.md'),
(53, 'weru.html');

-- --------------------------------------------------------

--
-- Table structure for table `intern`
--

CREATE TABLE `intern` (
  `intern` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `initials` varchar(2) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qualification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `university` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `intern`
--

INSERT INTO `intern` (`intern`, `name`, `surname`, `initials`, `day`, `start_date`, `end_date`, `image`, `qualification`, `year`, `university`, `user`) VALUES
(1, 'Andrew Mugambi', 'mugambi', 'AM', 'Monday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/portfolio/2023/image/drew.jpg', 'Bsc. Business Information Technology', 2016, 'African Nazarene University', 1316),
(2, 'Bernard Muli', 'muli', 'BM', 'Thursday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/v/images/muli.jpg', 'Certificate in IT', 2017, 'Daystar University', 1317),
(3, 'Carol Wawira', 'wawira', 'CW', 'Wednesday', '2023-03-09', '2023-12-31', 'http://drive.google.com/uc?export=view&id=1xlKJbMwmZw6unrBj8RCWpXBytNXS4kKX', 'Diploma in Business Information Technology', 2022, 'Cooperative University', 1318),
(4, 'Daniel Kaniu', 'kaniu', 'DK', 'Friday', '2023-03-09', '2023-12-31', 'http://206.189.207.206/tracker/portfolio/2023/image/me.jpeg', 'Bsc. Business Information Technology ', 2019, 'Jomo Kenyatta University of Agriculture and Technology', 173),
(5, 'Francis Nyakundi', 'nyakundi', 'FN', 'Tuesday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/v/images/frank.jpg', 'Diploma in Information Technology', 2021, 'Nairobi Technical', 1210),
(6, 'George Kangara', 'kangara', 'GK', 'Monday', '2023-03-09', '2023-12-31', 'http://206.189.207.206/tracker/portfolio/2023/kangara.html', 'Bsc Computer Technology', 2019, 'Meru University', 1319),
(7, 'George Munya', 'munya', 'GM', 'Tuesday', '2023-03-09', '2023-12-31', 'https://lh3.googleusercontent.com/x7nJjq2_nEWxboeNnPQq1lqGs55EZGVie8UatieTs31D9LSXZ0whOYX56QHZNpKaJyvBQY5iaT_V4vvVfWEpiGvo_HkBkGV-dX-MWV_LwaSlqtM2WpQBDynL_KZ6EUmgBFMg8j-nww=w600-h315-p-k', 'Diploma in Information Communication Technology', 2022, 'Kabete Technical', 1320),
(8, 'Isaac Waweru', 'waweru', 'IW', 'Monday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/portfolio/image/weru.jpg', 'Bsc. Mechatronics Engineering', 2019, 'Dedan Kimathi University of Technology', 1254),
(9, 'James Kiberenge', 'kibe', 'JK', 'Thursday', '2023-03-09', '9999-12-31', 'https://lh3.googleusercontent.com/pw/AMWts8CyI5Nz8iqJYeK5oLBujhR23dm-FV4RtO-TUoxHoVMoT9_J0kpIi5StZsomLL4yeFi68a-fFvjjJashydaAYi4JnUAWYdE6qPGyefQ4yGkoa5_hCqi6B8CY_lO6xb0cg4qo-OEBqy0gU1Rtq74r-lrySQ=w708-h960-s-no?authuser=0', 'Diploma in Information Technology', 2020, 'KCA', 1321),
(10, 'Joan Nduta', 'nduta', 'JN', 'Thursday', '2023-03-09', '2023-06-05', 'https://drive.google.com/uc?export=view&id=1gETpOsBaik0CumLnEZIEG1u4lkgi1ptl', 'Bsc Economics and Statistics', 2023, 'Egerton University', 1322),
(11, 'Peter Kamau', 'kungu', 'PK', 'Friday', '2023-03-09', '2023-12-31', 'https://db3pap003files.storage.live.com/y4mYkTxSEdlNhFREDQ7FZvRrdtMGliIzvjGykN_dx2Y16yNfAx0pECbD0sPnKLa9Xmc4u0E--9P-m5PO02f5A2BiZxJd-Iz8d4FGlhV899pAgFC5tn_p2UIGUfyJUeW0kDeuTEGWqTvbvvb6W2dNW-nVWk-5knHb0dbsIdk21q-g5cI5mQjSMhznMMK1ksAMIWX?width=256&amp;height=256&amp;cropmode=none', 'Bsc.  Mathematics and Computer Science', 2019, 'Multimedia University', 1323),
(12, 'Chris Ndungu', 'kinyanjui', 'CK', 'Tuesday', '2023-03-09', '2023-12-31', 'http://206.189.207.206/tracker/portfolio/image/reece.jpeg', 'Bsc. Computer Science', 2024, 'Dedan Kimathi University of Technology', 1324),
(13, 'Simon Mwangi', 'Karanja', 'MK', 'Monday', '2023-06-02', '9999-12-31', NULL, 'Diploma in IT', 2023, 'Cooperative University', 1325),
(14, 'James Oyondi', 'mogaka', 'JM', 'Monday', '2023-05-24', '9999-12-31', NULL, 'Bsc. Software Engineering', 2023, 'Kirinyaga University ', 1326),
(15, 'Joseph Mwaniki', 'mwaniki', 'JM', 'Friday', '2023-03-09', '2023-12-31', 'http://206.189.207.206/tracker/portfolio/image/mwaniki.jpg', 'Bsc. Sales and Marketing', 2018, 'Presbyterian University', 1327),
(16, 'Sharon Wanjiru', 'wanjiru', 'SW', 'Wednesday', '2023-03-09', '2023-12-31', '', 'Bsc. Informatics and Computer Science', 2023, 'Strathmore University', 1328),
(17, 'Joshua Samuel Omondi', 'omondi', 'JS', 'Tuesday', '2023-06-06', '2023-08-01', NULL, 'Bsc.Computer Science', 2024, 'Dedan Kimathi University of Technology', 1329),
(18, 'Kelvin Mungai Wanjiru', 'mungai', 'KM', 'Wednesday', '2023-06-05', '2023-09-05', NULL, 'Bsc.Information Technology', 2025, 'Masinde Muliro University', 1330),
(19, 'Anne Wanjiru Mbugua', 'mbugua', 'AW', 'Friday', '2023-06-14', '2023-12-31', 'http://206.189.207.206/tracker/portfolio/image/mbugua.jpg', 'Bsc. Biochemistry', 2019, 'University of Nairobi', 1331),
(20, 'Peter Kariuki Muraya', 'muraya', 'PM', 'Friday', '2023-06-28', '9999-12-31', NULL, NULL, NULL, NULL, 181),
(21, 'Margaret ', 'wanjiku', 'MW', 'Tuesday', '2022-10-01', '9999-12-31', NULL, 'IT', 2026, 'Nairobi technical training Institute', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `minute`
--

CREATE TABLE `minute` (
  `minute` int NOT NULL,
  `project` int DEFAULT NULL,
  `presentation` int NOT NULL,
  `child_of` int DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` varchar(50) NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `done` tinyint(1) DEFAULT NULL,
  `ref` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `minute`
--

INSERT INTO `minute` (`minute`, `project`, `presentation`, `child_of`, `number`, `summary`, `detail`, `done`, `ref`) VALUES
(1, 66, 33, NULL, '1.1', 'Do market research and consumer research.', NULL, 0, '2023-07-25 23:38:40'),
(2, 66, 33, NULL, '1.2', 'Check other virtual markets outside Kiserian.', NULL, 0, '2023-07-25 23:38:41'),
(3, 66, 33, NULL, '1.3', 'Formulate a problem statement', NULL, 0, '2023-07-25 23:38:42'),
(4, 66, 33, NULL, '1.4', 'Seek additional relevant information', 'Check on the meat suppliers because they may have more information', 0, '2023-07-25 23:38:46'),
(5, 66, 33, NULL, '1.5', 'List 5 ideas using website technology', NULL, 0, '2023-07-25 23:38:49'),
(6, 66, 33, NULL, '1.6', 'Demonstrate the ideas using techniques', NULL, 0, '2023-07-25 23:38:50'),
(7, 45, 35, NULL, '1.1', 'Automation of Image retrieval from google drive', 'Look at how you programmatically get photos from google drive to the database.', 0, '2023-07-25 23:38:47'),
(8, 45, 35, NULL, '1.2', 'Interface Design', 'Design the interface for the landing page for the central image repository.', 0, '2023-07-25 23:38:48'),
(9, 45, 35, NULL, '1.3', 'Add more keywords for easier searching of images.', NULL, 0, '2023-07-25 23:38:46'),
(10, 59, 28, NULL, '1.1', 'A proper craw foot', NULL, 1, '2023-07-25 23:38:01'),
(11, 59, 28, NULL, '1.2', 'Ensure metavisuo can run as standalone', NULL, 0, '2023-07-25 23:38:02'),
(12, 59, 28, NULL, '1.3', 'Check+Highlight invalid entities', NULL, 0, '2023-07-25 23:38:03'),
(13, 59, 28, NULL, '1.4', 'Implement CRUD functionality', NULL, 0, '2023-07-25 23:38:04'),
(14, 59, 28, NULL, '1.5', 'Crud for Entities', NULL, 0, '2023-07-25 23:38:05'),
(15, 59, 28, 14, '1.5.1', 'Crud for Attributes ', NULL, 0, '2023-07-25 23:38:06'),
(16, 59, 28, 14, '1.5.2', 'Crud for Relations ', NULL, 0, '2023-07-25 23:38:07'),
(17, 59, 28, NULL, '1.6', 'Implementation of metavisuo sub model', 'Confirm metav. Sub model is embedded+work in all dbs.', 0, '2023-07-25 23:38:08'),
(18, 60, 28, NULL, '2.1', 'work on your github portfolio and populate it', NULL, 0, '2023-07-25 23:38:09'),
(19, 60, 28, NULL, '2.2', 'Create a skeleton of your github portfolio', 'start by creating a skeleton of your github portfolio and demonstrate it', 0, '2023-07-25 23:38:10'),
(20, 60, 28, NULL, '2.3', 'learn on collaborating with others in github', NULL, 0, '2023-07-25 23:38:11'),
(21, 60, 28, NULL, '2.4', 'Demonstration on github functionality', 'explain to us what a commit,merge,push and pull is all about', 0, '2023-07-25 23:38:12'),
(22, 60, 28, NULL, '2.5', 'Push all your applications to github', NULL, 0, '2023-07-25 23:38:13'),
(23, 60, 28, NULL, '2.6', 'To be demonstrated', NULL, 0, '2023-07-25 23:38:14'),
(24, 61, 28, NULL, '3.1', 'Database design', 'design a database system which can accommodate the data that you have and can accommodate more data', 0, '2023-07-25 23:38:15'),
(25, 61, 28, NULL, '3.2', 'Data processing Ms.excel', 'Process the excel data to avoid repetition of names', 0, '2023-07-25 23:38:16'),
(26, 61, 28, NULL, '3.3', 'Addition of payment data', 'Take payment messages from Mr. Murayas group and add the data to help prepare for a future conference', 0, '2023-07-25 23:38:17'),
(27, 61, 28, NULL, '3.4', 'Develop registration website', 'Develop a website system to help in the registration process', 0, '2023-07-25 23:38:46'),
(28, 75, 30, NULL, '1.1', 'Once you open a file, copy it', NULL, 0, '2023-07-25 23:38:01'),
(29, 75, 30, NULL, '1.2', 'Save the copies in a pattern', NULL, 0, '2023-07-25 23:38:02'),
(30, 75, 30, NULL, '1.3', 'Split the date to a more friendly way', NULL, 0, '2023-07-25 23:38:03'),
(31, 75, 30, NULL, '1.4', 'Save information on local storage', NULL, 0, '2023-07-25 23:38:04'),
(32, 75, 30, NULL, '1.5', 'Ask for details on first occasion', 'If it is first time it asks who you are and appends it', 0, '2023-07-25 23:38:05'),
(33, 75, 30, NULL, '1.6', 'Separate code from data', NULL, 0, '2023-07-25 23:38:06'),
(34, 80, 30, NULL, '2.1', 'Improvements on the hub', 'The hub to include portfolio, minutes , cv and record of all things', 0, '2023-07-25 23:38:07'),
(35, 80, 30, NULL, '2.2', 'Work on db to retrieve minutes', 'Work on how only to extract your minutes- might need a database', 0, '2023-07-25 23:38:08'),
(36, 80, 30, NULL, '2.3', 'Including portfolio in Sharon hub', 'Let Portfolio be part of sharon hub accessible from timetable.', 0, '2023-07-25 23:38:09'),
(37, 80, 30, NULL, '2.4', 'Own minutes too should be accessible from hub', NULL, 0, '2023-07-25 23:38:10'),
(38, 75, 30, NULL, '3.1', 'Add surname to the column name of tracker', NULL, 0, '2023-07-25 23:38:11'),
(39, 75, 30, NULL, '3.2', 'Add presentation table', 'Add presentation table - with surname, reason and focus', 0, '2023-07-25 23:38:12'),
(40, 75, 30, NULL, '3.3', 'Query to inform on next presenter', 'Write a query to get most recent presenter- for next presenter and report the next presenter', 0, '2023-07-25 23:38:46'),
(41, 39, 25, NULL, '1.1', 'Investigation on content management systems', 'Have a good template for allowing you to manage your content properly. You can investigate content management systems such as Drupal or Wordpress.', 1, '2023-07-25 23:38:01'),
(42, 39, 25, NULL, '1.2', 'Improvements on Website appearance', 'Make the website attractive and easier to use. Add animation, use a background suitable for projection.', 1, '2023-07-25 23:38:02'),
(43, 39, 25, NULL, '1.3', 'Redesign of website', 'Redesign the page to have a Navigation bar that will make the website easier to use. This way you will have a chance of engaging the users.', 1, '2023-07-25 23:38:03'),
(44, 39, 25, NULL, '1.4', 'Buy me a coffee idea', 'Include the Buy me a coffee idea to engage the visitors to your website.', 0, '2023-07-25 23:38:04'),
(45, 39, 25, NULL, '1.5', 'Website modifications', 'Move the navigation to the right, rather than on the left.', 1, '2023-07-25 23:38:05'),
(46, 39, 25, NULL, '1.6', 'Inclusion of Teachings', 'Include what the young men were taught, so that parents can have a point of reference and reinforce what was taught.', 0, '2023-07-25 23:38:06'),
(47, 39, 25, 46, '1.6.1', 'Get the content taught previously', 'Ask Mr.Muraya to get you the poster for the previous year and add some of the things they were taught or check the certificates handed out to the graduates to get the content taught.', 0, '2023-07-25 23:38:07'),
(48, 39, 25, NULL, '1.7', 'Layout improvements', 'Layout the organizational chart(groups) in a horizontal manner to support more and more usages.', 1, '2023-07-25 23:38:08'),
(49, 39, 25, NULL, '1.8', 'Simplification of content organization', 'Organize the content into a simpler format .i.e, an excel sheet to support database integration(PK)', 0, '2023-07-25 23:38:09'),
(50, 39, 25, NULL, '1.9', 'Database modeling', 'Develop a model for the data in preparation of saving the data into the database.', 0, '2023-07-06 23:38:22'),
(51, 39, 25, 50, '1.9.1', 'Database modeling', 'Model the database based on the pages of the data you want to fetch', 0, '2023-07-25 23:38:12'),
(52, 40, 25, NULL, '2.1', 'Research on other system', 'Look at what Dennis and Kimotho were doing with regard to Real Estate.', 1, '2023-07-25 23:39:46'),
(53, 40, 25, 52, '2.1.1', 'Research on other system', 'Borrow the good Ideas from that project.', 0, '2023-07-25 23:38:13'),
(54, 40, 25, 52, '2.1.2', 'Think about data model', 'Get a feel of the data model and view the attributes that you might need.', 0, '1900-01-02 00:00:00'),
(55, 40, 25, NULL, '2.2', 'Data collection', 'Collect data from Dennis forms which will give you a slight idea of how you will organize the data so that it can be helpful to both the buyer and the seller.', 0, '2023-07-25 23:38:55'),
(56, 40, 25, NULL, '2.3', 'Data collection to inform the work', 'Interact with the surveyor (field work) to get a feel of how land data is collected and managed in order to develop a good mashamba website. Think about how you can manage the documents involved in transfer of ownership of lands.', 0, '2023-07-25 23:38:16'),
(57, 40, 25, 56, '2.3.1', 'Organize the data into excel sheets.', NULL, 1, '2023-07-25 23:38:17'),
(58, 40, 25, 56, '2.3.2', 'Develop a model', '', 1, '2023-07-25 23:38:59'),
(59, 40, 25, 56, '2.3.3', 'Develop a database and load data', 'Develop a database and load the data to have a feel of how it will work(PM/PK).', 0, '2023-07-05 00:00:00'),
(60, 40, 25, 56, '2.3.4', 'Timeline for collecting data', 'Have timeline for collecting the data from the field (JM).', 0, '2023-07-25 23:38:15'),
(61, 40, 25, 56, '2.3.5', 'Implement the first draft of the Interface', 'Implement the first draft of the Interface, that you will show to Nelson(PM).', 0, '2023-07-25 23:38:14'),
(62, 40, 25, 56, '2.3.6', 'Add the link to the scanned documents', 'Add the link to the scanned documents in Google Drive(PM).', 0, '2023-07-04 00:00:00'),
(63, 40, 25, NULL, '2.4', 'Complementary information about parcel of land', 'Provide complementary information about a parcel of land such as:', 0, '2023-07-25 23:38:41'),
(64, 40, 25, 63, '2.4.1', 'How far it is located from the main road.', NULL, 0, '2023-07-25 23:38:11'),
(65, 40, 25, 63, '2.4.2', 'Days they can take clients to view the land.', NULL, 0, '2023-07-25 23:38:10'),
(66, 40, 25, 63, '2.4.3', 'Proximity to social amenities', 'Proximity to social amenities such as schools and Hospitals.', 0, '2023-07-25 23:40:46'),
(67, 40, 25, 63, '2.4.4', 'Add information such as electricity and water.', NULL, 0, '2023-07-25 23:38:40'),
(68, 41, 25, NULL, '3.1', 'Good database design', 'Have  a good database to support all the data.', 0, '2023-07-25 23:50:46'),
(69, 41, 25, 68, '3.1.1', 'Login Registration', 'Use the mutall_users.user table for login registration.', 0, '2023-07-25 23:37:46'),
(70, 41, 25, 68, '3.1.2', 'Avoid colliding colors.', NULL, 0, '2023-07-25 23:36:46'),
(71, 41, 25, 68, '3.1.3', 'Thinking of a website Design', 'Think about presenting the data collected from the gym in the form of a html which you will support the layout of more data as compared to the current chart view.', 0, '2023-07-25 23:35:46'),
(72, 41, 25, NULL, '3.2', 'Develop a Good Webpage', 'Develop a Good Webpage, Be more creative and include concepts/aspects of Fitness or a gym, even before you login.', 0, '2023-07-25 23:34:46'),
(73, 41, 25, 72, '3.2.1', 'You can add an animation of people working out.', NULL, 0, '2023-07-25 23:33:46'),
(74, 41, 25, NULL, '3.3', 'Log in services', 'Look at the Federated Login Services to support login such Firebase to support Google/Facebook login.', 0, '2023-07-25 23:32:46'),
(75, 41, 25, NULL, '3.4', 'Data collection', 'Go to the gym and Collect Data to improve your website.', 0, '2023-07-25 23:31:46'),
(76, 41, 25, 75, '3.4.1', 'Data collection', 'Visit the GYM to collect data in excel sheets with the goal of collecting the various metrics needed to present the data(PK).', 0, '2023-07-25 23:30:46'),
(77, 44, 25, NULL, '4.1', 'Developing the journal', 'Develop your hub with the premise of the Journal App. This will support you in the management of your day to day operations.', 0, '2023-07-25 23:41:46'),
(78, 42, 25, NULL, '5.1', 'Add the Documentation to the web', 'Add the Documentation to the web, specifically into tracker, since it is designed to support new interns.', 0, '2023-07-25 23:42:46'),
(79, 42, 25, NULL, '5.2', 'Add the Documentation of file Uploads', 'Add the documentation for how to upload files and how to use fileZilla.', 0, '2023-07-16 00:00:00'),
(80, 42, 25, NULL, '5.3', 'Update the documentation', 'Clarify from the interns which sections of the documentation did not work and update the document the document.', 0, '2023-07-25 23:38:46'),
(81, 7, 26, NULL, '1.1', 'Additional info to Portfolio', 'Incorporate a video in your portfolio, describing yourself and the projects you are planning to complete.', 0, '2023-07-25 23:38:01'),
(82, 7, 26, NULL, '1.2', 'Have demos in the other projects.', NULL, 1, '2023-07-25 23:38:02'),
(83, 7, 26, 82, '1.2.1', 'Appending links to portfolio', 'PK added hyperlinks to open his applications from his portfolio but not all applications have been deployed yet.', 1, '2023-07-25 23:38:03'),
(84, 7, 26, NULL, '1.3', 'Ensure that my portfolio follows this pattern.', NULL, 1, '2023-07-25 23:38:04'),
(85, 1, 26, NULL, '2.1', 'Have a way to view previous chats', 'Have a way to view the previous chats when logged out. By Saving the chat to the database', 1, '2023-07-25 23:38:05'),
(86, 1, 26, NULL, '2.2', 'Issue with showing online users', 'Issue with showing the number of users online, problem is the application adds a user when you reload the page and also adds you back when you rejoin the chat.', 1, '2023-07-25 23:38:06'),
(87, 1, 26, NULL, '2.3', 'Integration', 'Integrate the chat system with our library, and what it takes to incorporate it to other systems.', 1, '2023-07-25 23:38:07'),
(88, 1, 26, NULL, '2.4', 'Integration ', 'Integrate the Chat system such that it is accessible from our timetable', 1, '2023-07-25 23:38:08'),
(89, 1, 26, 88, '2.4.1', 'Integration to timetable', ' Start by integrating the system to our timetable page.', 1, '2023-07-25 23:38:09'),
(90, 1, 26, 88, '2.4.2', '(SN) will help you in designing the interface.', NULL, 0, '2023-07-25 23:38:10'),
(91, 1, 26, NULL, '2.5', 'Incorporation of other media types to chat', 'How will you incorporate other media types like images, emoji etc in your chat system? - Currently PK intends to work on sending messages first then incorporate sharing other media in messages later.', 0, '2023-07-25 23:38:11'),
(92, 1, 26, NULL, '2.6', 'Inclusion of search bar', 'Have a search bar to in looking up for words/phrases in the application.', 0, '2023-07-25 23:38:12'),
(93, 1, 26, NULL, '2.7', 'Notifications', NULL, 0, '2023-07-25 23:38:13'),
(94, 1, 26, 93, '2.7.1', 'Notifications', 'Enable ssl in the server to allow notifications in the system.', 0, '2023-07-25 23:38:14'),
(95, 1, 26, 93, '2.7.2', 'Notifications', 'Notifications should quietly update the application messages panel as soon as a message is sent. All old chats are visible in the same panel.', 0, '2023-07-25 23:38:15'),
(96, 5, 26, NULL, '3.1.', 'Images from fieldwork', 'JK will provide images from his field work, also JK to oversee how things are done.', 0, '2023-07-25 23:38:16'),
(97, 5, 26, 96, '3.1.1', 'Have a demo on the next meeting.', NULL, 0, '2023-07-25 23:38:17'),
(98, 4, 26, NULL, '4.1', 'Navigation bar', 'Have the nav bar interactive, someone should be able to navigate to different section.', 1, '2023-07-25 23:38:18'),
(99, 4, 26, NULL, '4.2', 'Further Contribution by users', 'Allow Further contribution by Users via the Monaco editor.', 1, '2023-07-25 23:38:19'),
(100, 4, 26, NULL, '4.3', 'Deployment of the Monaco.', NULL, 1, '2023-07-25 23:38:20'),
(101, 2, 26, NULL, '5.1', 'Daraja API integration', 'Help in integrating the Daraja API to James and Georges application', 0, '2023-07-25 23:38:21'),
(102, 2, 26, NULL, '5.2', 'Get Mr. Muraya a personal till number account.', NULL, 0, '2023-07-25 23:38:22'),
(103, 2, 26, NULL, '5.3', 'Cash Item for M-PESA till Number.', NULL, 0, '2023-07-25 23:38:23'),
(104, 3, 26, NULL, '6.1.', 'Presentation on QuickBooks', 'Present the QuickBooks initiative jointly with Julius next time.', 0, '2023-07-25 23:38:24'),
(105, 3, 26, 104, '6.1.1', 'Loading office receipts', ' Office receipts to be loaded into Quick books to help in generation of data to be used in filing returns for Mutall Investments Company.', 0, '2023-07-25 23:38:25'),
(106, 74, 29, NULL, '1.1', 'Find a different problem on the internship.', NULL, 0, '2023-07-25 23:38:01'),
(107, 74, 29, NULL, '1.2', 'Financial support', 'Link to muli and the ward rep for financial support.', 0, '2023-07-25 23:38:02'),
(108, 74, 29, NULL, '1.3', 'Dream of a suitable name for the cyber.', NULL, 0, '2023-07-25 23:38:03'),
(109, 74, 29, NULL, '1.4', 'come up with other business ideas', NULL, 0, '2023-07-25 23:38:04'),
(110, 74, 29, NULL, '1.5', 'Revise the budget with muli.', NULL, 0, '2023-07-25 23:38:05'),
(111, 74, 29, NULL, '1.6', 'Add Networking package', 'Add a networking item(what you know) on the things you teach.', 0, '2023-07-25 23:38:46'),
(112, 9, 32, NULL, '1.1', 'upload to the server the school system', NULL, 0, '2023-07-25 23:38:01'),
(113, 9, 32, NULL, '1.2', ' look at how nemis system works', NULL, 0, '2023-07-25 23:38:02'),
(114, 9, 32, NULL, '1.3', 'change from textbook to school research', NULL, 1, '2023-07-25 23:38:03'),
(115, 9, 32, NULL, '1.4', 'other ideas , fees transport, exam, lunch', NULL, 1, '2023-07-25 23:38:04'),
(116, 11, 32, NULL, '2.1', 'Load the beneficiaries to the system.', NULL, 1, '2023-07-25 23:38:05'),
(117, 11, 32, NULL, '2.2', 'Add a data list to help us do searches.', NULL, 1, '2023-07-25 23:38:06'),
(118, 11, 32, NULL, '2.3', 'Add start date to every member.', NULL, 1, '2023-07-25 23:38:07'),
(119, 11, 32, NULL, '2.4', 'Add a column selector.', NULL, 0, '2023-07-25 23:38:08'),
(120, 11, 32, NULL, '2.5', 'Add the rest of the data.', NULL, 0, '2023-07-25 23:38:09'),
(121, 11, 32, NULL, '2.6', 'Add the crown section.', NULL, 1, '2023-07-25 23:38:10'),
(122, 11, 32, NULL, '2.7', 'Button for showing further details', 'Add a button for showing detailed and non detailed output', 0, '2023-07-25 23:38:11'),
(123, 8, 32, NULL, '3.1', 'Redesign', 'Redesign the showing of regions to take care of empty cases.,\r\nthis retaining the orientation region when there is no data in the body.', 0, '2023-07-25 23:38:12'),
(124, 8, 32, NULL, '3.2', 'Expansion of the drop areas', 'Expand the drop areas for accepting dragged factors,\r\nso that dropping to empty regions become meaningful. For instance,\r\ncrest and crumb factors can be dropped in the header topmost row.\r\nheader/crumb and body/crest areas are candidates for drop points\r\nbody/label is a natural drop point for crest factors\r\nbody/ crumb can never be a drop point as it is ambiguous.\r\nfilters is a drop point for crown factors', 0, '2023-07-25 23:38:13'),
(125, 8, 32, 124, '3.2.1', 'Color coding the worksheet', 'In this regard, color code the worksheet to show the type of factors (crown, crest or crumb) can be dropped there.', 0, '2023-07-25 23:38:14'),
(126, 8, 32, NULL, '3.3', 'Edit-score', 'Complete the \"edit-score\" option by implementing the save method using the questionnaire library', 0, '2023-07-25 23:38:15'),
(127, 8, 32, NULL, '3.4', 'Edit-score extension', 'Add option for creating and capturing new exam results by extending the \"edit-score\" option', 0, '2023-07-25 23:38:16'),
(128, 8, 32, NULL, '3.5', 'Summaries', 'Add the left and bottom margin summaries,\r\nthus extending the worksheet. Consider extending the the base and crest ctes to achieve this', 0, '2023-07-25 23:38:17'),
(129, 8, 32, NULL, '3.6', 'Hide user selected factors', '', 0, '2023-07-25 23:38:18'),
(130, 8, 32, NULL, '3.7', 'Review of header styling', 'Review header styling using multi-technology approach,\r\nincluding, detail/summary, grid area+display flex, fieldset, etc.', 0, '2023-07-25 23:38:19'),
(131, 8, 32, NULL, '3.8', 'Consider student progression through grades', ' Consider the fact that students graduate from one grade to another\r\nafter an year by creating new progressions.', 0, '2023-07-25 23:38:20'),
(132, 8, 32, NULL, '3.9', 'Display of oritech and chama data', 'Try and display chama and oritech data by creating matching\r\nbase ctes and re-using the sheet and query.ts libraries', 0, '2023-07-25 23:38:21'),
(133, 81, 32, NULL, '4.1', 'Add the invoice table to the database', NULL, 0, '2023-07-25 23:38:22'),
(134, 81, 32, NULL, '4.2', 'Queries to get data', 'Create a query to get the client, site, subscription identifies, and extract the year month and amount from the payment table', 0, '2023-07-25 23:38:23'),
(135, 81, 32, NULL, '4.3', 'Create a php file for loading the invoice data', NULL, 0, '2023-07-25 23:38:24'),
(136, 81, 32, NULL, '4.4', 'Load subscription cost', NULL, 0, '2023-07-25 23:38:25'),
(137, 81, 32, NULL, '4.5', 'update the loading php file', NULL, 0, '2023-07-25 23:38:46'),
(138, 82, 26, NULL, '7.1', 'Migration of mutall_co rental to DO', ' Migration of mutall_co rental to DO and updating it to PHP 8.1 to produce invoices in MutallCO.', 0, '2023-07-25 23:38:46'),
(139, 45, 36, NULL, '1.1', 'Deployment', 'Add a link to the actual product in the outcome section of your portfolio ', 0, '2023-07-25 23:38:01'),
(140, 45, 36, 139, '1.1.1', 'Work on deployment of the product.', NULL, 0, '2023-07-25 23:38:02'),
(141, 45, 36, NULL, '1.2', 'Improving load time', 'Work on loading of the images by improving loading time.', 0, '2023-07-25 23:38:03'),
(142, 45, 36, NULL, '1.3', 'Add border and keywords to the images', 'Add border and keywords to the images (showing further details regarding the images).', 0, '2023-07-25 23:38:04'),
(143, 45, 36, NULL, '1.4', 'Add the total image count', 'Add the total image count retrieved from the query.', 0, '2023-07-25 23:38:05'),
(144, 45, 36, NULL, '1.5', 'Work on pagination.', NULL, 0, '2023-07-25 23:38:06'),
(145, 45, 36, 144, '1.5.1', 'Limiting the query results', ' Add limit to the number of images returned by the query( lead to improvement on load time). ', 0, '2023-07-25 23:38:07'),
(146, 45, 36, 144, '1.5.2', 'Add a button to load the next page images.', NULL, 0, '2023-07-25 23:38:08'),
(147, 45, 36, NULL, '1.6', 'Work on the search functionality implementation.', NULL, 0, '2023-07-25 23:38:09'),
(148, 45, 36, 147, '1.6.1', 'Retrieve search keyword', NULL, 0, '2023-07-25 23:38:10'),
(149, 45, 36, 147, '1.6.2', 'Formulate the SQL', NULL, 0, '2023-07-25 23:38:11'),
(150, 45, 36, 147, '1.6.3', 'Run the SQL', NULL, 0, '2023-07-25 23:38:12'),
(151, 45, 36, 147, '1.6.4', 'Limit the search results to batches of 20 images.', NULL, 0, '2023-07-25 23:38:13'),
(152, 45, 36, 147, '1.6.5', 'Display the results', 'Display the results(Summary of total images returned from the query)', 0, '2023-07-25 23:38:14'),
(153, 45, 36, 147, '1.6.6', 'Display the images', 'Display the images from the query in the repository.', 0, '2023-07-25 23:38:15'),
(154, 45, 36, NULL, '1.7', 'Criteria for display of results', ' On opening the repository, random images from the database(from various sources) should be displayed on the screen.', 0, '2023-07-25 23:38:16'),
(155, 45, 36, NULL, '1.8', 'Categorization of the data in images and videos.', NULL, 0, '2023-07-25 23:38:17'),
(156, 45, 36, 9, '1.9', 'Add more keywords', ' Add more keywords (You are constrained by single keywords). ', 0, '2023-07-25 23:38:18'),
(157, 45, 36, NULL, '1.10', 'Interface for allowing people to add images', 'Interface for allowing people to add and load more images to the database/Repository.', 0, '2023-07-25 23:38:46'),
(158, 75, 37, NULL, '1.1', 'Add contribution column', 'Add another column that will show the contributors from different people', 0, '2023-07-25 23:38:01'),
(159, 75, 37, NULL, '1.2', 'Add a header which contains submit & create button', 'Add a header which contains submit button and create button', 0, '2023-07-25 23:38:02'),
(160, 75, 37, 40, '1.3', 'Write a query to get most recent presenter', 'Write a query to get most recent presenter- for next presenter and report the next presenter', 0, '2023-07-25 23:38:03'),
(161, 80, 37, NULL, '2.1', 'Add the technologies that you use', 'Add the technologies that you use in your sharon hub', 0, '2023-07-25 23:38:04'),
(162, 80, 37, 37, '2.2', 'Use database to select all minutes', NULL, 0, '2023-07-25 23:38:46'),
(163, 39, 38, 44, '1.1', 'Buy me Coffee', 'Include the Buy me a coffee idea to engage the visitors to your website.', 0, '2023-07-25 23:38:01'),
(164, 39, 38, 46, '1.2', 'Include what the young men were taught', 'so that parents can have a point of reference and reinforce what was taught.', 0, '2023-07-25 23:38:02'),
(165, 39, 38, 164, '1.2.1', 'Get poster from Mr.Muraya', 'Ask Mr.Muraya to get you the poster for the previous year and add some of the things they were taught or check the certificates handed out to the graduates to get the content taught.', 0, '2023-07-25 23:38:03'),
(166, 39, 38, 49, '1.3', 'Organize the content into a simpler format', '.i.e, an excel sheet to support database integration(PK).', 0, '2023-07-25 23:38:04'),
(167, 39, 38, 50, '1.4', 'Db modelling', 'Develop a model for the data in preparation of saving the data into the database.', 0, '2023-07-25 23:38:05'),
(168, 39, 38, 167, '1.4.1', 'Db modelling', 'Model the database based on the pages of the data you want to fetch.', 0, '2023-07-25 23:38:06'),
(169, 40, 38, 56, '2.1', 'Field work', 'Interact with the surveyor to get a feel of how land data is collected and managed in order to develop a good mashamba website. Think about how you can manage the documents involved in transfer of ownership of lands.', 0, '2023-07-25 23:38:07'),
(170, 40, 38, 169, '2.1.1', 'Have the save button working.', NULL, 0, '2023-07-25 23:38:08'),
(171, 40, 38, 169, '2.1.2', 'Transcribing', 'add details to like 5 mutations and title deeds, and have them get displayed on the transcription sectino in the interface.', 0, '2023-07-25 23:38:09'),
(172, 40, 38, 63, '2.2', 'Provide complementary information on land parcels', 'How far it is located from the main road. Days they can take clients to view the land. Proximity to social amenities such as schools and Hospitals. Add information such as electricity and water.', 0, '2023-07-25 23:38:10'),
(173, 40, 38, 55, '2.3', 'Data collection', 'Collect data from Dennis\'s forms which will give you a slight idea of how you will organize the data so that it can be helpful to both the buyer and the seller.', 0, '2023-07-25 23:38:11'),
(174, 41, 38, 75, '3.1', 'Collect Data to improve your website.', NULL, 0, '2023-07-25 23:38:12'),
(175, 41, 38, 72, '3.2', 'Develop a Good Webpage', 'Be more creative and include concepts/aspects of Fitness or a gym, even before you login.', 0, '2023-07-25 23:38:13'),
(176, 41, 38, 175, '3.2.1', 'You can add an animation of people working out.', NULL, 0, '2023-07-25 23:38:14'),
(177, 41, 38, 74, '3.3', 'Login System using Firebase', 'Look at the Federated Login Services to support login such Firebase to support Google/Facebook login.', 0, '2023-07-25 23:38:15'),
(178, 41, 38, 68, '3.4', 'Have  a good database to support all the data.', NULL, 0, '2023-07-25 23:38:16'),
(179, 41, 38, 178, '3.4.1', 'Use mutall_users.user for login registration.', 'Use the mutall_users.user table for login registration.', 0, '2023-07-25 23:38:17'),
(180, 41, 38, 178, '3.4.2', 'Avoid colliding colors.', NULL, 0, '2023-07-25 23:38:18'),
(181, 41, 38, 178, '3.4.3', 'Think about presenting the data collected', 'Think about presenting the data collected from the gym in the form of a html which you will support the layout of more data as compared to the current chart view.', 0, '2023-07-25 23:38:19'),
(182, 43, 38, 77, '4.1', 'Develop your hub.', NULL, 0, '2023-07-25 23:38:20'),
(183, 42, 38, 80, '5.1', 'Update the documentation', 'Clarify from the interns which sections of the documentation did not work and update the document the document.', 0, '2023-07-25 23:38:21'),
(184, 42, 38, 183, '5.1.1', 'Php Documentation.', NULL, 0, '2023-07-25 23:38:22'),
(185, 42, 38, 183, '5.1.2', 'Update xampp documentation', 'Update xampp documentation there are some steps missing and other arent clear.', 0, '2023-07-25 23:38:23'),
(186, 42, 38, 183, '5.1.3', 'Database connector for Netbeans.', NULL, 0, '2023-07-25 23:38:24'),
(187, 42, 38, 183, '5.1.4', 'How to create a new project in Netbeans.', NULL, 0, '2023-07-25 23:38:46'),
(202, 8, 39, NULL, '1.1', 'Remove the color(Green)', 'significant color are pink, sky blue', 0, '2023-07-25 23:38:01'),
(203, 8, 39, NULL, '1.2', 'Ranking of students', '(by subject, alphabetical, summaries)', 0, '2023-07-25 23:38:02'),
(204, 8, 39, NULL, '1.3', 'Color coding', 'Hide values(the raw numbers ie values) and only show relevant colors in the respective cells. ', 0, '2023-07-25 23:38:03'),
(205, 8, 39, NULL, '1.4', 'upload to the server the school system', NULL, 0, '2023-07-25 23:38:04'),
(206, 8, 39, 126, '1.5', 'Complete the \'edit-score\' option', ' by implementing the save method using the questionnaire library', 0, '2023-07-25 23:38:05'),
(207, 8, 39, 127, '1.6', 'Add option for creating and capturing exam results', 'by extending the \'edit-score\' option', 0, '2023-07-25 23:38:06'),
(208, 8, 39, NULL, '1.7', 'Add the left and bottom margin summaries', 'thus extending the worksheet', 0, '2023-07-25 23:38:07'),
(209, 8, 39, NULL, '1.8', 'Hide user', 'selected factor levels from display - This will allow users to focus on what matters at the time.Consider using checkboxes for filter.select options', 0, '2023-07-25 23:38:08'),
(210, 8, 39, 131, '1.9', 'Students graduation.', 'Consider the fact that students graduate from one grade to another after an year by creating new progressions.', 0, '2023-07-25 23:38:09'),
(211, 9, 39, 113, '2.1', 'Investigate on NEMIS documentation', ' To see similarities and differences with reference to your shule system', 0, '2023-07-25 23:38:10'),
(212, 11, 39, NULL, '3.1', 'Do a query', 'where (add relevant numbers 1 -4 which will show colors on each blank value in the contributions)', 0, '2023-07-25 23:38:11'),
(213, 11, 39, 122, '3.2', 'Add a button', 'For showing detailed and non detailed output', 0, '2023-07-25 23:38:12'),
(214, 81, 39, NULL, '4.1', 'Include additional info', 'Add the subscription - rather what the client paid for', 0, '2023-07-25 23:38:13'),
(215, 81, 39, NULL, '4.2', 'Color code to show balances', NULL, 0, '2023-07-25 23:38:46'),
(216, 65, 40, NULL, '1.1', 'Incorporate functions on buttons', 'e.g., you can have crop 300 x 300 button', 0, '2023-07-25 23:38:01'),
(217, 65, 40, NULL, '1.2', 'Check on python libraries to try and automate', NULL, 0, '2023-07-25 23:38:02'),
(218, 65, 40, NULL, '1.3', 'First learn the basics of python', NULL, 0, '2023-07-25 23:38:03'),
(219, 65, 40, NULL, '1.4', 'Start by always saying the problem', NULL, 0, '2023-07-25 23:38:04'),
(220, 65, 40, NULL, '1.5', 'Choose an IDE for python such as pyCharm', NULL, 0, '2023-07-25 23:38:05'),
(221, 65, 40, NULL, '1.6', 'Choose a good reference for python', NULL, 0, '2023-07-25 23:38:06'),
(222, 65, 40, NULL, '1.7', 'Look for a good tutorial for python ', NULL, 0, '2023-07-25 23:38:07'),
(223, 65, 40, NULL, '1.8', 'Query', 'Write a query to get your images from the repository', 0, '2023-07-25 23:38:08'),
(224, 66, 40, NULL, '2.1', 'Add feedback on your website', NULL, 0, '2023-07-25 23:38:09'),
(225, 66, 40, NULL, '2.2', 'Start working on ken\'s inventory', NULL, 0, '2023-07-25 23:38:10'),
(226, 66, 40, NULL, '2.3', 'Allow the user add recipes', NULL, 0, '2023-07-25 23:38:11'),
(227, 66, 40, NULL, '2.4', 'Market the products instead of recipes', NULL, 0, '2023-07-25 23:38:12'),
(228, 66, 40, NULL, '2.5', 'Add registration because of the carts', NULL, 0, '2023-07-25 23:38:13'),
(229, 66, 40, 1, '2.6', 'Do market research', NULL, 0, '2023-07-25 23:38:14'),
(230, 66, 40, 5, '2.7', 'Formulate your ideas in a website', NULL, 0, '2023-07-25 23:38:15'),
(231, 66, 40, NULL, '2.8', 'What will you add to bring customer loyalty', NULL, 0, '2023-07-25 23:38:46'),
(232, 59, 41, NULL, '1.1', 'Demonstration on metavisio installation', 'present how metavisio can be installed on other machines', 0, '2023-07-25 23:38:01'),
(233, 59, 41, NULL, '1.2', 'show the 3 tables in each database', NULL, 0, '2023-07-25 23:38:46'),
(234, 7, 42, NULL, '1.3.1', 'Tabular and layout', 'Have Sharon Develop a button to toggle between tabular and layout.', 0, '2023-07-25 23:38:01'),
(235, 7, 42, NULL, '1.4', 'Add an outcome section to the projects section.JM', NULL, 0, '2023-07-25 23:38:02'),
(236, 1, 42, NULL, '2.6.2', 'Simon will help you in designing the interface.', NULL, 0, '2023-07-25 23:38:03'),
(237, 1, 42, NULL, '2.9.3', 'What is holding the SSL(PM)?', 'What is holding the SSL(PM)? the domain we need to run all these is Mutall.co.ke. However the domain Mutall.co.ke is currently tied to our DO server. Detaching the server from that domain name poses the risk of losing all the data and applications on that server. To that effect Mr. Muraya agreed that we wait till the connection to that server expires before moving forward and hopefully by then, we would have moved everything to DO.', 0, '2023-07-25 23:38:04'),
(238, 1, 42, NULL, '2.10.', 'Make the chat standalone.', NULL, 0, '2023-07-25 23:38:05'),
(239, 1, 42, NULL, '2.11', 'Saving Chats?.', 'Saving Chats?. the current system supports the saving of chats.', 0, '2023-07-25 23:38:06'),
(240, 1, 42, NULL, '2.12', 'Sending Direct messages to users(JM)', 'With the current web socket, its initial aim was to help groups communication. For future versions this will be customized.', 0, '2023-07-25 23:38:07'),
(241, 1, 42, NULL, '2.13', 'Access chat without additional steps', 'Access the chat directly from the chat timetable application.', 0, '2023-07-25 23:38:08'),
(242, 2, 42, NULL, '5.3.1', 'Clarify why it cannot be used(PM).', 'There is some technical hold up with regards to getting the credentials needed to deploy it to the server.', 0, '2023-07-25 23:38:09'),
(243, 3, 42, NULL, '6.1.2', 'What is the position?', 'Quick Books is installed on the local Server. I am to have a better clarification on the exact details from Julius.', 0, '2023-07-25 23:38:10'),
(244, 82, 42, NULL, '7.1', 'Migration of mutall_co rental to DO', 'Migration of mutall_co rental to DO and updating it to PHP 8.1 to produce invoices in MutallCO.', 0, '2023-07-25 23:38:11'),
(245, 82, 42, NULL, '7.2', 'Update. Report on where we are.', NULL, 0, '2023-07-25 23:38:12'),
(246, 82, 42, NULL, '7.3', 'Have a joint session with Muli.', NULL, 0, '2023-07-25 23:38:13'),
(247, 82, 42, NULL, '7.4', 'Help Mogaka with his Migration issue.', NULL, 0, '2023-07-25 23:38:14'),
(248, 83, 42, NULL, '8.1', 'Supporting Ann with Python.', NULL, 0, '2023-07-25 23:38:15'),
(249, 83, 42, NULL, '8.2', 'Suggestion for a Hand on Job for Ann.', NULL, 0, '2023-07-25 23:38:16'),
(250, 83, 42, NULL, '8.3', 'Help Kelvin Setup a chron job on Mutall Co.', NULL, 0, '2023-07-25 23:38:46'),
(251, 84, 43, NULL, '1.1', 'Input contributions to the users', NULL, 0, '2023-07-25 23:38:46'),
(252, 40, 46, NULL, '2.4', 'The interface.', NULL, 0, '2023-07-25 23:38:01'),
(253, 40, 46, NULL, '2.4.1 ', 'an image for zooming.', NULL, 0, '2023-07-25 23:38:02'),
(254, 40, 46, NULL, '2.4.2', 'Zoom in an image.', NULL, 0, '2023-07-25 23:38:03'),
(255, 40, 46, NULL, '2.4.3', 'Panning the image.', NULL, 0, '2023-07-25 23:38:04'),
(256, 40, 46, NULL, '2.4.4', 'Navigation during data entry', 'System wont allow you to navigate to a another document when there is half - data entered.', 0, '2023-07-25 23:38:05'),
(257, 41, 46, 174, '3.1.1', 'Improve data model', 'Model using the current data to areas of improvement.This is with regards to Data Collection.', 0, '2023-07-25 23:38:06'),
(258, 41, 46, 177, '3.3.1', 'Look at what Joshua is doing outlook.outlook.', NULL, 0, '2023-07-25 23:38:07'),
(259, 43, 46, 182, '4.1.1', 'Learning react', 'Will create a new version of my hub using ReactJs,to further learn the framework', 0, '2023-07-25 23:38:08'),
(260, 43, 46, 182, '4.1.2', 'Text difficult to read. Add navigation panel', NULL, 0, '2023-07-25 23:38:09'),
(261, 42, 46, 183, '5.1.5', 'Relevant screenshots', 'Include relevant screenshots and highlight key parts.To avoid missing crucial parts parent', 0, '2023-07-25 23:38:10'),
(262, 42, 46, 183, '5.1.6', 'Remove Filezilla documentation.', NULL, 0, '2023-07-25 23:38:11'),
(263, 42, 46, 183, '5.1.7', 'Video on setting up your environment', 'Include a video to help in seamless installation for various programs which i have seen are a bit more challenging for new interns.', 0, '2023-07-25 23:38:46'),
(264, 85, 47, NULL, '1.1', 'Create a simple interface', NULL, 0, '2023-07-25 23:38:01'),
(265, 85, 47, NULL, '1.1.1', 'Add a message form input with id and type Text', NULL, 0, '2023-07-25 23:38:02'),
(266, 85, 47, NULL, '1.1.2', 'Add a button with onclick attribute', NULL, 0, '2023-07-25 23:38:03'),
(267, 85, 47, NULL, '1.1.3', 'Add an output field with id', NULL, 0, '2023-07-25 23:38:04'),
(268, 85, 47, NULL, '1.2', 'Research on sockets', NULL, 0, '2023-07-25 23:38:05'),
(269, 86, 47, NULL, '2.1', 'Demonstrate ethical hacking skills', NULL, 0, '2023-07-25 23:38:06'),
(270, 86, 47, NULL, '2.2', 'Ask members for help', NULL, 0, '2023-07-25 23:38:46'),
(271, 65, 48, NULL, '1.1', 'Use images from the planting event', NULL, 0, '2023-07-25 23:38:01'),
(272, 65, 48, NULL, '1.2', 'check on python libraries', NULL, 0, '2023-07-25 23:38:02'),
(273, 65, 48, NULL, '1.3', 'Show the different technologies used in editing', NULL, 0, '2023-07-25 23:38:03'),
(274, 65, 48, NULL, '1.4', 'Make the portfolio header brighter', NULL, 0, '2023-07-25 23:38:04'),
(275, 66, 48, NULL, '2.1', 'Add feedback on your website', NULL, 0, '2023-07-25 23:38:05'),
(276, 66, 48, NULL, '2.2', 'Start working on ken\'s inventory', NULL, 0, '2023-07-25 23:38:06'),
(277, 66, 48, NULL, '2.3', 'Allow the user add recipes', NULL, 0, '2023-07-25 23:38:07'),
(278, 66, 48, NULL, '2.4', 'Market the products instead of recipes', NULL, 0, '2023-07-25 23:38:08'),
(279, 66, 48, NULL, '2.5', 'Add registration because of the carts', NULL, 0, '2023-07-25 23:38:09'),
(280, 66, 48, NULL, '2.6', 'Do market research', NULL, 0, '2023-07-25 23:38:10'),
(281, 66, 48, NULL, '2.7', 'Formulate your ideas in a website', NULL, 0, '2023-07-25 23:38:11'),
(282, 66, 48, NULL, '2.8', 'What will you add to bring customer loyalty', NULL, 0, '2023-07-25 23:38:46'),
(283, 89, 50, NULL, '2.1', ' Open a fixed account to help in savings', NULL, NULL, '2024-01-08 07:00:13'),
(284, 89, 50, NULL, '2.2', 'Give a report on the progress', NULL, NULL, '2024-01-08 07:00:13'),
(291, 92, 50, NULL, '3.1', 'The financial feasibility for the cybercafe', NULL, NULL, '2024-01-08 07:10:46'),
(292, 92, 50, NULL, '3.2', 'Do a survey on other cybers.', NULL, NULL, '2024-01-08 07:10:46'),
(293, 92, 50, NULL, '3.3', 'Look at the documents James and Dennis collects', 'check how they can help e.g land search', NULL, '2024-01-08 07:10:46'),
(294, 92, 50, NULL, '3.4', 'Design business card. You are to work with Elias', NULL, NULL, '2024-01-08 07:10:46'),
(295, 92, 50, NULL, '3.5', 'List your cybercafe services', NULL, NULL, '2024-01-08 07:10:46'),
(296, 92, 50, NULL, '3.6', 'Check on softwares like gimp,Photoshop to design', NULL, NULL, '2024-01-08 07:10:46'),
(297, 90, 50, NULL, '4.1', 'Explain the problem to be solve through css', NULL, NULL, '2024-01-08 07:19:50'),
(298, 90, 50, NULL, '4.2', 'Produce the monthly invoice for this month', NULL, NULL, '2024-01-08 07:19:50'),
(299, 90, 50, NULL, '4.3', 'Learn SQL to interrogate data', NULL, NULL, '2024-01-08 07:19:50'),
(300, 90, 50, NULL, '4.4', 'Check how electricity bill is taken manually', NULL, NULL, '2024-01-08 07:19:50'),
(301, 90, 50, NULL, '4.5', 'Improve user interface', NULL, NULL, '2024-01-08 07:19:50'),
(302, 90, 50, NULL, '4.6', 'Set the Report detail to open by default', NULL, NULL, '2024-01-08 07:19:50'),
(303, 90, 50, NULL, '4.7', 'Select the default value of execute to display', NULL, NULL, '2024-01-08 07:19:50'),
(304, 90, 50, NULL, '4.8', 'set the default of layout to tabular', NULL, NULL, '2024-01-08 07:19:50'),
(305, 90, 50, NULL, '4.9', 'set the default of level to summary', NULL, NULL, '2024-01-08 07:19:50'),
(306, 90, 50, NULL, '4.10', 'set the date to current date', NULL, NULL, '2024-01-08 07:19:50'),
(307, 91, 50, NULL, '5.1', 'You can start by something small', 'do not restrain yourself', NULL, '2024-01-08 07:21:41'),
(308, 91, 50, NULL, '5.2', 'Do a short course on counselling', NULL, NULL, '2024-01-08 07:21:41'),
(309, 91, 50, NULL, '5.3', 'Challenging you do a talk on friday', 'For even just 5 minutes', NULL, '2024-01-08 07:21:41'),
(310, 91, 50, NULL, '5.4', ' have the short talks you have on Wednesdays ', 'in your site', NULL, '2024-01-08 07:21:41'),
(311, 7, 51, NULL, '1.1', 'Add an outcome section to the projects section', NULL, NULL, '2024-01-08 07:56:48'),
(312, 7, 51, NULL, '1.2', 'Balance your programming', 'Balance between programming for living and for learning You don\'t need advanced programming for survival.PM\r\n', NULL, '2024-01-08 07:56:48'),
(313, 1, 51, NULL, '2.1', 'SSL', 'What is holding the SSL(PM)? the domain we need to run all these is Mutall.co.ke. However the domain Mutall.co.ke is currently tied to our DO server. Detaching the server from that domain name poses the risk of losing all the data and applications on that server. To that effect Mr. Muraya agreed that we wait till the connection to that server expires before moving forward and hopefully by then, we would have moved everything to DO.\r\n', NULL, '2024-01-08 08:01:26'),
(314, 1, 51, NULL, '2.2', 'Make the chat standalone', 'Consider different needs:-Training basics of socket vs limited local use for us vs multi-business scenario.', NULL, '2024-01-08 08:01:26'),
(315, 1, 51, NULL, '2.3', 'Saving Chats', 'The current system supports the saving of chats.\r\n', NULL, '2024-01-08 08:01:26'),
(316, 1, 51, NULL, '2.4', 'Accessibility form the timetable', 'Access the chat directly from the chat timetable application.\r\n', NULL, '2024-01-08 08:01:26'),
(317, 2, 51, NULL, '5.1', 'Daraja integration for buy me coffee', 'Are we overemphasizing automated payment? For high volumes? Yes, but where are they\r\nConsider Indirect methods?', NULL, '2024-01-08 08:04:36'),
(318, 2, 51, NULL, '5.2', 'Clarify why it cannot be used', 'Clarify why it cannot be used(PM). There is some technical hold up with regards to getting the credentials needed to deploy it to the server.\r\n', NULL, '2024-01-08 08:04:36'),
(324, 8, 52, NULL, '1.1', 'Left align text and right align', NULL, NULL, '2024-01-08 08:36:22'),
(325, 8, 52, NULL, '1.2', 'Show us get and set summary', NULL, NULL, '2024-01-08 08:36:22'),
(326, 8, 52, NULL, '1.3', 'Add rank summary', NULL, NULL, '2024-01-08 08:36:22'),
(327, 8, 52, NULL, '1.4', 'Add option for capturing new exam results', 'Add option for creating and capturing new exam results - by extending the \'edit-score\' option', NULL, '2024-01-08 08:36:22'),
(328, 8, 52, NULL, '1.5', 'Scribble/encrypt names', NULL, NULL, '2024-01-08 08:36:22'),
(329, 9, 52, NULL, '2.1', 'Investigate on NEMIS documentation', 'Investigate on NEMIS documentation - to see similarities and differences with reference to your shule system\r\n', NULL, '2024-01-08 08:38:14'),
(330, 11, 52, NULL, '3.1', 'Sort the crumb cells', NULL, NULL, '2024-01-08 08:40:43'),
(331, 11, 52, NULL, '3.2', 'Remove green background', NULL, NULL, '2024-01-08 08:40:43'),
(332, 11, 52, NULL, '3.3', ' Work on summaries', 'To show correct total, consider $-value', NULL, '2024-01-08 08:40:43'),
(333, 81, 52, NULL, '4.1', 'Color code to show balances', 'Show progress with sms invoicing\r\n', NULL, '2024-01-08 08:43:32'),
(334, 10, 52, NULL, '5.1', 'Show code for comments ', NULL, NULL, '2024-01-08 08:44:52'),
(335, 10, 52, NULL, '', 'Report progress on bundler Webpack', NULL, NULL, '2024-01-08 08:44:52'),
(336, 87, 53, NULL, '1.1', 'Target a business for this session.', NULL, NULL, '2024-01-08 10:19:23'),
(337, 87, 53, NULL, '1.2', 'Form On input clear the error message', NULL, 1, '2024-01-08 10:19:23'),
(338, 87, 53, NULL, '1.3', 'Clarify logic for multiple scenarios', NULL, 1, '2024-01-08 10:19:23'),
(339, 87, 53, NULL, '1.4', 'Log in logic', 'If previously logged in, get in without further ado, until logged out', NULL, '2024-01-08 10:19:23'),
(340, 87, 53, NULL, '1.5', 'Allow users to register new businesses', NULL, 1, '2024-01-08 10:19:23'),
(341, 39, 55, NULL, '1.1', 'WhatsApp images', NULL, NULL, '2024-01-08 10:43:41'),
(342, 39, 55, NULL, '1.1.1', 'Images to excel file', 'First is to add all images to an excel file, an image with its caption.', NULL, '2024-01-08 10:43:41'),
(356, 40, 55, NULL, '2.1', 'Zoom out an image.', NULL, NULL, '2024-01-08 11:14:30'),
(357, 40, 55, NULL, '2.1.1', 'Select class to highlight the image when clicked', NULL, NULL, '2024-01-08 11:14:30'),
(358, 40, 55, NULL, '2.1.2', '', 'Change query to display the first empty doc, then use the doc.doc as the counter on the interface when your previous it goes to previous doc.', NULL, '2024-01-08 11:14:30'),
(359, 40, 55, NULL, '2.2', '', 'Change query to display the first empty doc, then use the doc.doc as the counter on the interface when your previous it goes to previous doc.', NULL, '2024-01-08 11:14:30'),
(360, 40, 55, NULL, '2.3', 'Deploy the application.', ' is the system is already on the server but images are locally stored.', NULL, '2024-01-08 11:14:30'),
(361, 40, 55, NULL, '2.4', 'Have the images uploaded', 'Change the url of the images.\r\n    ', NULL, '2024-01-08 11:14:30'),
(362, 40, 55, NULL, '2.5', 'Link with mutal users table', 'Link the mutall_users user table with mashamba db.\r\n  ', NULL, '2024-01-08 11:14:30'),
(363, 40, 55, NULL, '2.6', 'Have a button for data modelling.', 'The server.js has an issue.\r\n    ', NULL, '2024-01-08 11:14:30'),
(364, 40, 55, NULL, '2.7', 'Data Validation.', NULL, NULL, '2024-01-08 11:14:30'),
(365, 40, 55, NULL, '2.7.1', 'Cant save data if Title no', 'And person if interest is empty.\r\n', NULL, '2024-01-08 11:14:30'),
(366, 40, 55, NULL, '2.7.2', 'Navigation to the next document', 'System wont allow you to navigate to another document when there is half-data entered.\r\n', NULL, '2024-01-08 11:14:30'),
(367, 40, 55, NULL, '2.7.3', 'Navigation  to next document', 'User cant move to next document if title no and persons of interest are empty.\r\n', NULL, '2024-01-08 11:14:30'),
(368, 40, 55, NULL, '2.8', 'System to highight', 'System to highight the empty fields with a red border', NULL, '2024-01-08 11:14:30'),
(369, 41, 55, NULL, '3.1', 'Have  a good database to support all the data.', NULL, NULL, '2024-01-08 13:53:18'),
(370, 89, 61, NULL, '2.1', 'Side hustle/tell us more', '', 1, '2024-01-28 09:56:53'),
(371, 39, 65, NULL, '1.2', 'Add an image to the link', 'so as users dont think its a virus making them hestitate to clicking them.', 1, '2024-01-28 09:56:54'),
(372, 39, 65, NULL, '1.3', ' Add feedback section', 'Add a section where we can get feedback from users.', 1, '2024-01-28 09:56:54'),
(373, 40, 65, NULL, '2.3.1', 'Data upload to the server', ' Find a way on how you can upload the data using the library to the server. First assume the images are on the server. Next how can we assume its on another computer.', 1, '2024-01-28 09:56:54'),
(374, 43, 65, NULL, '4.1', 'Text difficult to read. Add navigation panel.', '', 1, '2024-01-28 09:56:54'),
(375, 84, 77, NULL, '1.1', 'Add edit and delete buttons to a contribution', '', 1, '2024-01-28 09:56:54'),
(376, 84, 77, NULL, '1.2', 'Rewrite the query', 'Rewrite the query starting with a contribution progressing to the presentation\r\n', 1, '2024-01-28 09:56:54'),
(377, 84, 77, NULL, '1.3', 'Indent the contributions', '', 1, '2024-01-28 09:56:55'),
(378, 84, 77, NULL, '1.4', 'Split contribution to detail and summary', 'Split the content in the contribution into detail and summary in the data model', 1, '2024-01-28 09:56:55'),
(379, 65, 59, NULL, '1.1', 'color contrast', 'color contrast for the friends of ngong hills website', 0, '2024-01-28 10:06:00'),
(380, 65, 59, NULL, '1.2', 'Use python to bridge the gap', 'The gap between Davinci resolve and the output you get.', 0, '2024-01-28 10:06:01'),
(381, 65, 59, NULL, '1.3', 'Add captions to your videos', '', 0, '2024-01-28 10:06:01'),
(382, 65, 59, NULL, '1.4', 'Use python for image compilation and compression', '', 0, '2024-01-28 10:06:01'),
(383, 65, 59, NULL, '1.5', 'check on text formatting', ' The image photo to make it more exciting', 0, '2024-01-28 10:06:01'),
(384, 65, 59, NULL, '1.6', 'Work with a database for your images', '', 0, '2024-01-28 10:06:01'),
(385, 65, 59, NULL, '1.7', 'Rapid editing/sorting under to time pressure', '', 0, '2024-01-28 10:06:01'),
(386, 65, 59, NULL, '1.8', 'General template', '', 0, '2024-01-28 10:06:01'),
(387, 66, 59, NULL, '2.1', 'Check on the products layout', 'For the chick joint website', 0, '2024-01-28 10:06:01'),
(388, 66, 59, NULL, '2.2', 'Optimize the website code', 'By reducing line of code', 0, '2024-01-28 10:06:01'),
(389, 66, 59, NULL, '2.3', 'Use actual images for kens website', '', 0, '2024-01-28 10:06:01'),
(390, 66, 59, NULL, '2.4', 'Upload the images in the repository with keywords', '', 0, '2024-01-28 10:06:01'),
(391, 66, 59, NULL, '2.5', 'Work with the mutall Imagery', 'To get the images out of the system', 0, '2024-01-28 10:06:02'),
(392, 66, 59, NULL, '2.6', 'Benchmark on various e-commerce sites available', '', 0, '2024-01-28 10:06:02'),
(393, 75, 60, NULL, '1.1', 'For next presenter compare with presentation table', '', 0, '2024-01-28 10:06:02'),
(394, 75, 60, NULL, '1.2', 'Create an empty File for current minutes', 'For the current minutes create an empty file then open editor', 0, '2024-01-28 10:06:02'),
(395, 75, 60, NULL, '1.3', 'Write queries with only one quote', '', 0, '2024-01-28 10:06:02'),
(396, 75, 60, NULL, '1.4', 'Execute workplan with libraries', '', 0, '2024-01-28 10:06:02'),
(397, 75, 60, NULL, '1.5', 'Write extract workplan in javascript', '', 0, '2024-01-28 10:06:02'),
(398, 75, 60, NULL, '1.6', 'Get the days presenter', 'Use the intern and presentation table to get the presenter of that date', 0, '2024-01-28 10:06:02'),
(399, 77, 60, NULL, '2.1', 'Work with Anne to check quality', '', 0, '2024-01-28 10:06:02'),
(400, 89, 61, NULL, '2.1', 'Side hustle/tell us more', '', 1, '2024-01-28 10:06:03'),
(401, 92, 61, NULL, '3.1', 'create a website to showcase your services', '', 0, '2024-01-28 10:06:03'),
(402, 92, 61, NULL, '3.2', 'Web page design', 'Design a webpage the and illustrates all the services available from your cybercafe.', 0, '2024-01-28 10:06:03'),
(403, 92, 61, NULL, '3.3', 'Resarch on the cyber problem', 'To be clear on your cybercafe services, you can do analysis such as problem identification, market research , unique value being added and feasibility study.s', 0, '2024-01-28 10:06:03'),
(404, 90, 61, NULL, '4.1', 'What is the water consumption for this month ', '', 0, '2024-01-28 10:06:03'),
(405, 90, 61, NULL, '4.2', 'Electricity bill charges', 'Is the e bill for this month larger or lower than last', 0, '2024-01-28 10:06:03'),
(406, 90, 61, NULL, '4.3', 'The interface was pure php.change to js.', '', 0, '2024-01-28 10:06:03');
INSERT INTO `minute` (`minute`, `project`, `presentation`, `child_of`, `number`, `summary`, `detail`, `done`, `ref`) VALUES
(407, 88, 61, NULL, '5.1', 'Getting me to grow my project', '', 0, '2024-01-28 10:06:03'),
(408, 39, 65, NULL, '1.1', 'Work on the autoplay js.', '', 0, '2024-01-28 10:06:03'),
(409, 39, 65, NULL, '1.2', 'Add an image to the link', 'so as users dont think its a virus making them hestitate to clicking them.', 1, '2024-01-28 10:06:03'),
(410, 39, 65, NULL, '1.3', ' Add feedback section', 'Add a section where we can get feedback from users.', 1, '2024-01-28 10:06:03'),
(411, 39, 65, NULL, '1.4', 'Get ideas to improve on next site', 'which will have the 2023 irua event.', 0, '2024-01-28 10:06:04'),
(412, 40, 65, NULL, '2.1', 'Have a button for data modelling.', 'button was created that links metaversio and my application.', 0, '2024-01-28 10:06:04'),
(413, 40, 65, NULL, '2.1.1', 'Open the mashamba once the button is opened.', '', 0, '2024-01-28 10:06:04'),
(414, 40, 65, NULL, '2.2', 'Load Data.', '', 0, '2024-01-28 10:06:04'),
(415, 40, 65, NULL, '2.3.1', 'Data upload to the server', ' Find a way on how you can upload the data using the library to the server. First assume the images are on the server. Next how can we assume its on another computer.', 1, '2024-01-28 10:06:04'),
(416, 41, 65, NULL, '3.1', 'Model usind the current data', 'Model usind the current data to areas of improvement. This is with regards to Data Collection.', 0, '2024-01-28 10:06:04'),
(417, 41, 65, NULL, '3.4', 'Have  a good database to support all the data.', '', 0, '2024-01-28 10:06:04'),
(418, 43, 65, NULL, '4.1', 'Text difficult to read. Add navigation panel.', '', 1, '2024-01-28 10:06:04'),
(419, 8, 67, NULL, '1.1', 'right align right summaries', '', 0, '2024-01-28 10:06:04'),
(420, 8, 67, NULL, '1.2', 'Complete the bottom summary section', '', 0, '2024-01-28 10:06:04'),
(421, 66, 68, NULL, '5.1', 'Use css for image transition', '', 0, '2024-01-28 10:06:04'),
(422, 75, 69, NULL, '1.1', 'Put the strategy in writing', 'what is the problem, what is the strategy', 0, '2024-01-28 10:06:05'),
(423, 75, 69, NULL, '1.2', 'Develop execution plan', '', 0, '2024-01-28 10:06:05'),
(424, 75, 69, NULL, '1.3', 'Rename minutes to presentation', '', 0, '2024-01-28 10:06:05'),
(425, 75, 69, NULL, '1.4', 'Use workplan extraction to learn javascript', '', 0, '2024-01-28 10:06:05'),
(426, 92, 70, NULL, '2.1', 'create a new business plan', '', 0, '2024-01-28 10:06:05'),
(427, 92, 70, NULL, '2.2', 'Design the cybercafe website', 'Use the workplan template to design the cybercafe website', 0, '2024-01-28 10:06:05'),
(428, 91, 70, NULL, '3.1', 'start a podcast.', '', 0, '2024-01-28 10:06:05'),
(429, 88, 70, NULL, '4.1', 'Learn data management', '', 0, '2024-01-28 10:06:05'),
(430, 84, 77, NULL, '1.1', 'Add edit and delete buttons to a contribution', '', 1, '2024-01-28 10:06:05'),
(431, 84, 77, NULL, '1.2', 'Rewrite the query', 'Rewrite the query starting with a contribution progressing to the presentation\r\n', 1, '2024-01-28 10:06:05'),
(432, 84, 77, NULL, '1.3', 'Indent the contributions', '', 1, '2024-01-28 10:06:05'),
(433, 84, 77, NULL, '1.4', 'Split contribution to detail and summary', 'Split the content in the contribution into detail and summary in the data model', 1, '2024-01-28 10:06:05'),
(434, 75, 78, NULL, '1.1', 'Add workplan to database', 'Convert workplan to minutes and add to the database', 0, '2024-01-28 10:06:06'),
(435, 75, 78, NULL, '1.2', 'Design the create minutes page', 'What will the page for create minutes look like?- design the page', 0, '2024-01-28 10:06:06'),
(436, 66, 82, NULL, '6.1', 'Use actual images for kens website', '', 0, '2024-01-28 10:06:06'),
(437, 66, 82, NULL, '6.2', 'Mobile view for the site', '', 0, '2024-01-28 10:06:06'),
(438, 75, 84, NULL, '1.1', 'Work on the workplan', '', 0, '2024-01-28 10:06:06'),
(439, 79, 84, NULL, '2.1', 'Develop kibe\'s copy method', '', 0, '2024-01-28 10:06:06'),
(440, 79, 84, NULL, '2.2', 'Develop water query', '', 0, '2024-01-28 10:06:06'),
(441, 84, 85, NULL, '1.1', 'Work on intergration with sharon\'s project', '', 0, '2024-01-28 10:06:06'),
(442, 84, 85, NULL, '1.1.1', 'Folder structure organisation', 'Organisation of our folder structure to enable collaboration', 0, '2024-01-28 10:06:06'),
(443, 84, 85, NULL, '1.1.2', 'Optimization', 'Optimisation on the number of times the data from the db is fetched', 0, '2024-01-28 10:06:06'),
(444, 84, 85, NULL, '1.1.3', 'Get the data collection from from the html doc', 'Extract the dialog from the html document and create it programatically', 0, '2024-01-28 10:06:06'),
(445, 84, 85, NULL, '1.1.4', 'Deployment', 'Work on the deployment issues i.e view.ts and registaration.ts should be in the server', 0, '2024-01-28 10:06:06'),
(446, 84, 85, NULL, '1.1.5', 'Separation of a contribution from presentation', 'Work on separation of the contribution processes from the presentation class', 0, '2024-01-28 10:06:06'),
(447, 84, 85, NULL, '1.2', 'Work on editing a contribution', 'Work on the implementation of the edit contribution option', 0, '2024-01-28 10:06:07'),
(448, 84, 85, NULL, '1.3', 'Implement the abstract methods', 'Work on the concrete implementations of the submit and populate methods of the dialog class', 0, '2024-01-28 10:06:07'),
(449, 40, 87, NULL, '1.1', 'Deploy the application.', '', 0, '2024-01-28 10:06:07'),
(450, 40, 87, NULL, '1.2', 'work on the registration system', '', 0, '2024-01-28 10:06:07'),
(451, 40, 87, NULL, '1.3', 'uploading of images.', '', 0, '2024-01-28 10:06:07'),
(452, 40, 87, NULL, '1.4', 'Link the mutall_users user table with mashamba db.', 'have a \"upload images\" button.If its a single document have a way to capture the document.if its multiple documents have a way to upload them all.using a upload input element.specify the folder you want to upload the images in the databaseif there is no folder which you want to have the images in create a new one.\r\n\r\n', 0, '2024-01-28 10:06:07'),
(453, 40, 87, NULL, '1.5', 'App Template.', 'Nelson button shows the docs site. Boundary Conflict resolution.', 0, '2024-01-28 10:06:07'),
(454, 42, 87, NULL, '5.1', 'Update the documentation', 'Clarify from the interns which sections of the documentation did not work and update the document the document.', 0, '2024-01-28 10:06:07'),
(455, 42, 87, NULL, '5.1', 'Database connector for Netbeans.', '', 0, '2024-01-28 10:06:07'),
(456, 42, 87, NULL, '5.3', 'How to create a new project in Netbeans.', '', 0, '2024-01-28 10:06:07'),
(457, 42, 87, NULL, '5.4', 'Xamp installation documentation', 'Include a video to help in seamless installation for various programs which i have seen are a bit more chalenging for new interns like Xampp.', 0, '2024-01-28 10:06:07'),
(458, 42, 87, NULL, '5.4.1', 'Apache.', '', 0, '2024-01-28 10:06:08'),
(459, 42, 87, NULL, '5.5', 'Add Ds map.', '', 0, '2024-01-28 10:06:08'),
(460, 8, 88, NULL, '1.1', 'Complete the bottom summary section', '', 0, '2024-01-28 10:06:08'),
(461, 8, 88, NULL, '1.2', 'Add rank summary', '', 0, '2024-01-28 10:06:08'),
(462, 8, 88, NULL, '1.3', 'upload to the server the school system', '(talk to peter)', 0, '2024-01-28 10:06:08'),
(463, 8, 88, NULL, '1.4', 'Complete the \'edit-score\' option ', 'by implementing the save method using the questionnaire library', 0, '2024-01-28 10:06:08'),
(464, 8, 88, NULL, '1.5', 'Students graduation.', ' Consider the fact that students graduate from one grade to another after an year by creating new progressions.', 0, '2024-01-28 10:06:09'),
(465, 10, 88, NULL, '2.1', 'Webpack invesigation', 'Report progress on bundler Webpack see if it solves the problem we had', 0, '2024-01-28 10:06:09'),
(466, 10, 88, NULL, '2.2', 'Do the testing with other excel files and report', '', 0, '2024-01-28 10:06:09'),
(467, 66, 89, NULL, '7.1', 'Mobile view for the site', '', 0, '2024-01-28 10:06:09'),
(468, 39, 91, NULL, '1.1', 'Have a db to handle the feeback.', '', 0, '2024-01-28 10:06:09'),
(469, 39, 91, NULL, '1.2', 'App Template.', '', 0, '2024-01-28 10:06:09'),
(470, 39, 91, NULL, '1.3', 'have buttons for 2022 an 2023 event.', 'use the outlook template. show the various page when the buttons are clicked. the 2023 one should show the wordpress 2022 design site. and 2022 to show the current html page.\r\n', 0, '2024-01-28 10:06:09'),
(471, 40, 91, NULL, '1.4', 'App Template.', '', 0, '2024-01-28 10:06:09'),
(472, 40, 91, NULL, '1.5', 'Nelson button shows the docs site', '', 0, '2024-01-28 10:06:09'),
(473, 40, 91, NULL, '1.6', 'Boundary Conflict resolution.', '', 0, '2024-01-28 10:06:09'),
(474, 14, 93, NULL, '1.1', 'Focus on projects rather ', 'Work on the timetable application to ensure that the minutes of the days presenter are opened by default and the minute that was opened is highlighted on the navigation pannel', 0, '2024-01-28 10:06:09'),
(475, 90, 94, NULL, '2.1', 'Client contract extraction', 'Design a query for extracting client contract details', 0, '2024-01-28 10:06:10'),
(476, 90, 94, NULL, '2.2', 'Add a facility for tracking customer deposits', '', 0, '2024-01-28 10:06:10'),
(477, 88, 94, NULL, '3.1', 'Create Balansys Transcription database', '', 0, '2024-01-28 10:06:10'),
(478, 88, 94, NULL, '3.1.1', 'Display the database on metavisuo   ', '', 0, '2024-01-28 10:06:10'),
(479, 88, 94, NULL, '3.2', 'Design transcription dbase', 'Design a transcription form that matches its database  ', 0, '2024-01-28 10:06:10'),
(480, 88, 94, NULL, '3.2.1', 'show the size of the image for security reasons', '', 0, '2024-01-28 10:06:10'),
(481, 88, 94, NULL, '3.2.2', 'Make the image large to fit the image area  ', '', 0, '2024-01-28 10:06:10'),
(482, 92, 94, NULL, '4.1', 'create a website to showcase your services', '', 0, '2024-01-28 10:06:10'),
(483, 92, 94, NULL, '4.2', 'Produce invoices on request', '', 0, '2024-01-28 10:06:10'),
(484, 92, 94, NULL, '4.2.1', 'Do research on CORS Origin policy', '', 0, '2024-01-28 10:06:10'),
(485, 89, 94, NULL, '5.1', 'Report on progress', '', 0, '2024-01-28 10:06:10'),
(486, 91, 94, NULL, '6.1', 'Report on progress', '', 0, '2024-01-28 10:06:11'),
(487, 90, 97, NULL, '2.1', 'Design a new client registration form', '', 0, '2024-01-28 10:06:11'),
(488, 88, 97, NULL, '3.1', 'Recipts Transcription', 'Get all receipts transcribed on the balansys workbook', 0, '2024-01-28 10:06:11'),
(489, 88, 97, NULL, '3.2', 'Merge Mogaka and Kibe\'s code', '', 0, '2024-01-28 10:06:11'),
(490, 88, 97, NULL, '3.3', 'Style the transcription interface with Munya', '', 0, '2024-01-28 10:06:11'),
(491, 88, 97, NULL, '3.4', 'Loading images to the database  ', '', 0, '2024-01-28 10:06:11'),
(492, 90, 98, NULL, '2.1', 'Design a new client registration form    ', '', 0, '2024-01-28 10:06:11'),
(493, 90, 99, NULL, '1.1', 'Draft a new client registration form on paper  ', '', 0, '2024-01-28 10:06:11'),
(494, 88, 99, NULL, '2.1', 'Add a time stamp on uploaded images', '', 0, '2024-01-28 10:06:11'),
(495, 88, 99, NULL, '2.2', 'Document Balansys', '', 0, '2024-01-28 10:06:11'),
(496, 88, 99, NULL, '2.3', 'Image upload software', 'Develop a software to upload images to the database', 0, '2024-01-28 10:06:11'),
(497, 88, 99, NULL, '2.3.1', 'Android app for image upload', 'Develop an android application to save images staight from  phone to db ', 0, '2024-01-28 10:06:12'),
(498, 88, 99, NULL, '2.3.2', 'Add a logo', 'add balansys logo on the top left of all balansys interfaces', 0, '2024-01-28 10:06:12'),
(499, 88, 99, NULL, '2.3.3', 'add the name of the interface in the middle', '', 0, '2024-01-28 10:06:12'),
(500, 88, 99, NULL, '2.3.4', 'Add the developers to the footer', 'put the names of developers in  the middle grid and add links on their names to their hubs', 0, '2024-01-28 10:06:12'),
(501, 88, 99, NULL, '2.3.5', 'Mobile view', 'on stock management interface, make the middle grid independent for the sake of phone view', 0, '2024-01-28 10:06:12'),
(502, 88, 99, NULL, '2.3.6', 'Increase image size', 'make the image on transcription interface large by default', 0, '2024-01-28 10:06:12'),
(503, 88, 99, NULL, '2.3.7', 'Button event listener', 'add an onclick event listener on select radio buttons that open a list  ', 0, '2024-01-28 10:06:12'),
(504, 88, 99, NULL, '2.3.8', 'fix bug on add row code', '', 0, '2024-01-28 10:06:12'),
(505, NULL, 61, NULL, '1.1', 'Work on the my hub button', '', 1, '2024-01-28 10:17:55'),
(506, NULL, 61, NULL, '1.2', 'Comment your css', 'comment your css this will help you eliminate conflicting css', 0, '2024-01-28 10:17:55'),
(507, NULL, 61, NULL, '1.2.1', 'Check on which css conflic', 'For the css, you can try and check which css overrides the previous by checking the latest updates', 0, '2024-01-28 10:17:55'),
(508, NULL, 61, NULL, '1.4', 'Read them from imagery', '', 0, '2024-01-28 10:17:55'),
(509, NULL, 64, NULL, '1.1', 'Crone job', 'Setup a crone job in the co server pertaining the 4 events earlier issued.', 0, '2024-01-28 10:17:55'),
(510, NULL, 64, NULL, '1.2', 'Test crone job', 'Add a cron job for each intern birthday and national holidays', 0, '2024-01-28 10:17:56'),
(511, NULL, 64, NULL, '1.3', 'Set up cron jobs using the do server', '', 0, '2024-01-28 10:17:56'),
(512, NULL, 64, NULL, '2.1', 'Add member pictures', 'add the pictures to match the actual no of memebers', 0, '2024-01-28 10:17:56'),
(513, NULL, 64, NULL, '2.2', 'enhance the visibility of the members', 'by (animation,add right margin)', 0, '2024-01-28 10:17:56'),
(514, NULL, 65, NULL, '5.1', 'Install Leaflet', 'On Mr Muraya\'s Computer and my computer.', 1, '2024-01-28 10:17:56'),
(515, NULL, 65, NULL, '5.2', 'Try and show a map using the technology.', '', 1, '2024-01-28 10:17:56'),
(516, NULL, 65, NULL, '5.3', 'Get the coordinates  of area of interest', 'Get the coordinates from PM and layout the area of interest.', 0, '2024-01-28 10:17:56'),
(517, NULL, 65, NULL, '7.1', 'Copying minutes', 'Help Mogaka in copying and pasting contribution items.', 0, '2024-01-28 10:17:56'),
(518, NULL, 66, NULL, '1.1', 'Learn different HTML tags ', 'To help with formating the document.', 1, '2024-01-28 10:17:56'),
(519, NULL, 66, NULL, '1.2', 'Add a search button on the header', '', 1, '2024-01-28 10:17:57'),
(520, NULL, 66, NULL, '1.3', 'Learn a bit of Javascript ', 'While managing the document', 1, '2024-01-28 10:17:57'),
(521, NULL, 66, NULL, '2.1', 'Download softwares used to code in python', '', 1, '2024-01-28 10:17:57'),
(522, NULL, 66, NULL, '2.2', 'Look for suitable tutorial videos', ' That can be used to learn the language', 1, '2024-01-28 10:17:57'),
(523, NULL, 66, NULL, '2.3', 'Use python to query ranix datbase', '', 1, '2024-01-28 10:17:57'),
(524, NULL, 66, NULL, '3.1', 'Apply to different Japanese Universities', '', 1, '2024-01-28 10:17:57'),
(525, NULL, 66, NULL, '3.2', 'Emails to admission offices /professors', 'Write/ answer emails from admission offices/ Professors.', 1, '2024-01-28 10:17:57'),
(526, NULL, 68, NULL, '1.1', 'Multiple selector', '', 0, '2024-01-28 10:17:58'),
(527, NULL, 68, NULL, '1.2', 'Search criteria- size,time or location', '', 0, '2024-01-28 10:17:58'),
(528, NULL, 68, NULL, '1.3', 'Change the imagery database to a new version', '', 0, '2024-01-28 10:17:58'),
(529, NULL, 68, NULL, '1.4', 'Loading more images-php file', '', 0, '2024-01-28 10:17:58'),
(530, NULL, 68, NULL, '1.5', 'Separate videos from non videos in imagery', '', 0, '2024-01-28 10:17:58'),
(531, NULL, 68, NULL, '1.6', 'Exporting links to websites', '', 0, '2024-01-28 10:17:58'),
(532, NULL, 68, NULL, '2.1', 'Hosting the site', '', 0, '2024-01-28 10:17:58'),
(533, NULL, 68, NULL, '2.2', 'Take up Android app from mogaka. Get it to work', '', 0, '2024-01-28 10:17:58'),
(534, NULL, 68, NULL, '3.1', 'Drag and drop', '', 0, '2024-01-28 10:17:58'),
(535, NULL, 68, NULL, '3.2', 'Adding keywords to imagery rapidly', '', 0, '2024-01-28 10:17:58'),
(536, NULL, 68, NULL, '4.1', 'Python classes to manage your codes', '', 0, '2024-01-28 10:17:58'),
(537, NULL, 70, NULL, '1.1', 'Other videos related to your work/display random', 'Research on other videos related to your work/display random', 0, '2024-01-28 10:17:58'),
(538, NULL, 70, NULL, '1.2', 'Re-design the workplan template from scratch', '', 0, '2024-01-28 10:17:58'),
(539, NULL, 70, NULL, '5.1', 'Support your minutes with demonstrations', '', 0, '2024-01-28 10:17:59'),
(540, NULL, 70, NULL, '5.2', 'Minutes up to date', 'check the already done items in your minutes to keep them up to date', 0, '2024-01-28 10:17:59'),
(541, NULL, 70, NULL, '5.3', 'Learn to do a cleaner folder structure', '', 0, '2024-01-28 10:17:59'),
(542, NULL, 76, NULL, '1.1', 'Alert box for search', 'Add an Alert box that can search out the words RENT and VAT', 1, '2024-01-28 10:17:59'),
(543, NULL, 76, NULL, '1.2', 'Add my CV at the end of the document', '', 1, '2024-01-28 10:17:59'),
(544, NULL, 76, NULL, '1.3', 'Add item 0 to the list- Parties to the Agreement', '', 1, '2024-01-28 10:17:59'),
(545, NULL, 76, NULL, '1.4', 'Add a margin to all different sections', 'Add a div element to add a margin to all the different sections', 1, '2024-01-28 10:17:59'),
(546, NULL, 76, NULL, '1.5', 'Agreement template', 'Encase the agreement conmponents into Munya\'s template', 1, '2024-01-28 10:17:59'),
(547, NULL, 76, NULL, '1.6', 'Use Javascript to ensure the GO button works', '', 0, '2024-01-28 10:17:59'),
(548, NULL, 76, NULL, '1.7', 'Compile the code', '', 0, '2024-01-28 10:17:59'),
(549, NULL, 76, NULL, '2.1', 'Python to query dbase', 'Use a python function to find out how many cars visited the car park from 1st August 2023', 1, '2024-01-28 10:17:59'),
(550, NULL, 76, NULL, '2.2', 'Ensure the python array from the flow data works.', '', 1, '2024-01-28 10:17:59'),
(551, NULL, 76, NULL, '3.1', 'Reading on Material', 'Read up on the research material that both Professors have handed to me.', 1, '2024-01-28 10:18:00'),
(552, NULL, 77, NULL, '2.1', 'Registration implementation', 'Illustrate the implementation of the registration system', 1, '2024-01-28 10:18:00'),
(553, NULL, 77, NULL, '3.1', 'Work on upload of images to db', 'Work on getting data to be uploaded to the imagery database from the user', 0, '2024-01-28 10:18:00'),
(554, NULL, 77, NULL, '4.1', 'Work on the mutall_rental rent query', '', 0, '2024-01-28 10:18:00'),
(555, NULL, 82, NULL, '1.1', 'use metavisio', '', 0, '2024-01-28 10:18:00'),
(556, NULL, 82, NULL, '1.2', 'work on migration to the new database', '', 0, '2024-01-28 10:18:00'),
(557, NULL, 82, NULL, '1.3', 'option for loading:server side-php file', '', 0, '2024-01-28 10:18:00'),
(558, NULL, 82, NULL, '2.1', 'Use fetch ', 'consider using fetch method rather than the template method for mlima panels', 0, '2024-01-28 10:18:00'),
(559, NULL, 82, NULL, '2.2', ' login to work\r\n', '', 0, '2024-01-28 10:18:00'),
(560, NULL, 82, NULL, '3.1', 'formulate a plan for the categorization work ', '', 0, '2024-01-28 10:18:00'),
(561, NULL, 82, NULL, '3.2', 'search panel categorization plan navigation panel', '', 0, '2024-01-28 10:18:00'),
(562, NULL, 82, NULL, '4.1', 'An sql query for debit and credit\r\n', '', 0, '2024-01-28 10:18:00'),
(563, NULL, 82, NULL, '5.1', 'Python classes', 'Research on grouping python code to classes-indentation also\r\n', 0, '2024-01-28 10:18:00'),
(564, NULL, 83, NULL, '1.1', 'Retrieve agreement details', 'Retrive agreement contract details from the database.', 1, '2024-01-28 10:18:01'),
(565, NULL, 84, NULL, '3.1', 'Mark entities/files with errors in red', '', 0, '2024-01-28 10:18:01'),
(566, NULL, 84, NULL, '3.2', 'Errors', 'If you hover on red entity the error should show up', 0, '2024-01-28 10:18:01'),
(567, NULL, 84, NULL, '3.3', 'Mark Identification attributes', 'Mark attributes that are used for identification with a \"*\"', 0, '2024-01-28 10:18:01'),
(568, NULL, 84, NULL, '3.4', 'Attributes that are mandatory should be underlined', '', 0, '2024-01-28 10:18:01'),
(569, NULL, 84, NULL, '3.5', 'Metavisuo ', 'Relationships should show in a black color- unless they have an error which is shown in red', 0, '2024-01-28 10:18:01'),
(570, NULL, 84, NULL, '3.6', 'Drag and drop', 'Add smooth drag and drop functionality using Kangara\'s research', 0, '2024-01-28 10:18:01'),
(571, NULL, 85, NULL, '2.1', 'Work on log out', ' Work on the log out implementation in different projects', 0, '2024-01-28 10:18:01'),
(572, NULL, 85, NULL, '2.2', 'Implement the forgot password option ts', '', 0, '2024-01-28 10:18:01'),
(573, NULL, 85, NULL, '2.2.1', 'Implement the forgot password functionality in php', '', 0, '2024-01-28 10:18:01'),
(574, NULL, 85, NULL, '2.3', 'Think about the change password option', '', 0, '2024-01-28 10:18:01'),
(575, NULL, 85, NULL, '3.1', 'Create dialog', 'Create and show the dialog that will be used to collect the data', 0, '2024-01-28 10:18:01'),
(576, NULL, 85, NULL, '3.2', 'Data collection from user', 'Wait for the user to upload then start the data collection from the dialog', 0, '2024-01-28 10:18:01'),
(577, NULL, 85, NULL, '3.3', 'Upload image function', 'Continue writing the upload image functionality till each intern is clear on where his method is to be places', 0, '2024-01-28 10:18:02'),
(578, NULL, 85, NULL, '3.4', 'Return type on save', 'Investigate on the sutable return type of the various save methods', 0, '2024-01-28 10:18:02'),
(579, NULL, 85, NULL, '3.5', 'Xml', 'Look at how javascript can handle xml documents to get the appropriate return type from the save operations', 0, '2024-01-28 10:18:02'),
(580, NULL, 85, NULL, '4.1', 'Sketch the expected results before the query', '', 0, '2024-01-28 10:18:02'),
(581, NULL, 85, NULL, '4.2', 'Include the period table to the rent query', '', 0, '2024-01-28 10:18:02'),
(582, NULL, 85, NULL, '5.1', 'Develop a structure to hold the query data', 'Look at the mlima database and model the structure to hold data from the user(Imember)', 0, '2024-01-28 10:18:02'),
(583, NULL, 85, NULL, '5.2', 'Work on opening of the dialog', '', 0, '2024-01-28 10:18:02'),
(584, NULL, 85, NULL, '5.3', 'Dialog for user input', 'Work on collection of the user inputs from the dialog', 0, '2024-01-28 10:18:02'),
(585, NULL, 86, NULL, '1.1', 'Add coments to your code', 'Add comments on the function/method on the typescript document. ', 0, '2024-01-28 10:18:02'),
(586, NULL, 86, NULL, '1.2', 'Get clients unique identifiers', 'Read through the document and identify other id tags that are unique to the individual client.', 0, '2024-01-28 10:18:02'),
(587, NULL, 86, NULL, '3.1', 'Get agreement details from db', 'Retrive agreement contract details from the database.', 0, '2024-01-28 10:18:02'),
(588, NULL, 86, NULL, '4.1', 'Install Metavisuo', '', 0, '2024-01-28 10:18:03'),
(589, NULL, 88, NULL, '3.1', 'Work on getting the image number from the loop', '', 0, '2024-01-28 10:18:03'),
(590, NULL, 88, NULL, '3.2', 'Get the url of the image we come in with', '', 0, '2024-01-28 10:18:03'),
(591, NULL, 88, NULL, '3.3', 'Work on getting the alias of the image', '', 0, '2024-01-28 10:18:03'),
(592, NULL, 88, NULL, '3.4', 'Saving data on the serevr', 'Work on saving the data in php from DO and other server', 0, '2024-01-28 10:18:03'),
(593, NULL, 88, NULL, '4.1', 'Sketch the table results on an excel file', '', 0, '2024-01-28 10:18:03'),
(594, NULL, 88, NULL, '4.2', 'Mutall rental query', 'Include dates 3years and 5 years from now to include the revisions that have been done on the contract', 0, '2024-01-28 10:18:03'),
(595, NULL, 89, NULL, '1.1', 'work on migration to the new database', '', 0, '2024-01-28 10:18:03'),
(596, NULL, 89, NULL, '1.2', 'use the move_upload_file php function', '', 0, '2024-01-28 10:18:03'),
(597, NULL, 89, NULL, '2.1', 'create a form for editing images for the members', '', 0, '2024-01-28 10:18:03'),
(598, NULL, 89, NULL, '2.2', 'use the dialog library', '', 0, '2024-01-28 10:18:03'),
(599, NULL, 89, NULL, '3.1', 'use plain javascript-not interact.js', '', 0, '2024-01-28 10:18:03'),
(600, NULL, 89, NULL, '3.2', 'leave just the drop zones', '', 0, '2024-01-28 10:18:04'),
(601, NULL, 89, NULL, '4.1', 'An sql query for debit and credit note', '', 0, '2024-01-28 10:18:04'),
(602, NULL, 89, NULL, '5.1', 'An sql query for debit and credit note', '', 0, '2024-01-28 10:18:04'),
(603, NULL, 89, NULL, '6.1', 'python classes,indentation and methods', '', 0, '2024-01-28 10:18:04'),
(604, NULL, 90, NULL, '1.1', 'Add a search button on the header', '', 0, '2024-01-28 10:18:04'),
(605, NULL, 90, NULL, '1.2', 'Make the header colour a little lighter', '', 0, '2024-01-28 10:18:04'),
(606, NULL, 90, NULL, '1.3', 'Add extract data button', 'Add a button called, Extract Data, for viewing id tags that have been identified in the document', 0, '2024-01-28 10:18:04'),
(607, NULL, 90, NULL, '1.4', 'Key value pair of all data-id fields', 'Make a list of all the Id tags identified plus the interchangeable value they represent', 0, '2024-01-28 10:18:04'),
(608, NULL, 90, NULL, '1.5', 'Tree walker fo highligting words', 'Use treewalker to list all the highlighted nodes in the makubaliano document', 0, '2024-01-28 10:18:04'),
(609, NULL, 90, NULL, '2.1', 'Metavisuo debugging', 'Debug the version of Metavisuo that\'s been installed.', 0, '2024-01-28 10:18:04'),
(610, NULL, 90, NULL, '3.1', 'Placement letters to embasy', 'Submit LOAs and Placement Preference letters to the embassy of Japan before deadline 5.3', 0, '2024-01-28 10:18:04'),
(611, NULL, 93, NULL, '2.1', 'Level 2 registration', 'Finalize the general registration by getting the business detils from the user', 0, '2024-01-28 10:18:04'),
(612, NULL, 93, NULL, '2.2', 'Registration version 2', 'Work on the version 2 form to make it more responsive to user action and ready for data collection using the get_value method', 0, '2024-01-28 10:18:05'),
(613, NULL, 93, NULL, '2.3', 'Registration implementation', 'Work on the usage of the registration to ensure that the relevant message is shown given the presence or absence of a user', 0, '2024-01-28 10:18:05'),
(614, NULL, 93, NULL, '2.4', 'Document the registration system', '', 0, '2024-01-28 10:18:05'),
(615, NULL, 93, NULL, '3.1', 'Work on the dialog functionality', '', 0, '2024-01-28 10:18:05'),
(616, NULL, 93, NULL, '3.1.1', 'Form preparation on dialog', 'Implement the form preparation method (Add error reporting and required marks on inputs)', 0, '2024-01-28 10:18:05'),
(617, NULL, 93, NULL, '3.1.2', 'Clear all the errors on input', '', 0, '2024-01-28 10:18:05'),
(618, NULL, 93, NULL, '3.1.3', 'Do extensive tests on the dialog', '', 0, '2024-01-28 10:18:05'),
(619, NULL, 93, NULL, '3.1.4', 'Document the dialog class', '', 0, '2024-01-28 10:18:05'),
(620, NULL, 93, NULL, '3.2', 'Test the code we developed as a group', '', 0, '2024-01-28 10:18:05'),
(621, NULL, 93, NULL, '4.1', 'Start writing the rent qury', '', 0, '2024-01-28 10:18:05'),
(622, NULL, 93, NULL, '4.2', 'Work on the mutall_rental loan query', '', 0, '2024-01-28 10:18:05'),
(623, NULL, 93, NULL, '4.2.1', 'Sketch the expected results of the loan query', '', 0, '2024-01-28 10:18:05'),
(624, NULL, 93, NULL, '5.1', 'Search functionality in the makubaliano', 'Help Anne to implement the search functionality in the makubaliano document', 0, '2024-01-28 10:18:05'),
(625, NULL, 93, NULL, '5.2', 'Display of images form dbase', 'Work with Muli to get images from the database to his webpage', 0, '2024-01-28 10:18:06'),
(626, NULL, 93, NULL, '5.3', 'Testing of the flactuate code', 'Test the mother.ts project and ensure it works for all radio forms i.e., registration, images and sheetjs(MW)', 0, '2024-01-28 10:18:06'),
(627, NULL, 93, NULL, '5.4', 'General app template', 'Develop a php application template and in that template work on implementing the login and messaging functionality(SK)', 0, '2024-01-28 10:18:06'),
(628, NULL, 93, NULL, '5.5', 'Get value testing', 'Ensure that the get_value method of the view works given the new form design constrains', 0, '2024-01-28 10:18:06'),
(629, NULL, 93, NULL, '5.6', 'Think about the set_value method of the view', '', 0, '2024-01-28 10:18:06'),
(630, NULL, 94, NULL, '1.1', 'Event listener for image display', 'Add an onclick event listener to display images on the  right had panel', 0, '2024-01-28 10:18:06'),
(631, NULL, 94, NULL, '1.1.1', 'Highlight the clicked item', '', 0, '2024-01-28 10:18:06'),
(632, NULL, 94, NULL, '1.2', 'Add a facility for tracking customer deposits', '', 0, '2024-01-28 10:18:06'),
(633, NULL, 95, NULL, '1.1', 'Get electicity data from mutall_rental database.', '', 0, '2024-01-28 10:18:06'),
(634, NULL, 95, NULL, '1.1.1', 'Sketch the data ill be collecting.', '', 0, '2024-01-28 10:18:06'),
(635, NULL, 95, NULL, '1.1.2', 'Create a query for retrieving the data.', '', 0, '2024-01-28 10:18:06'),
(636, NULL, 96, NULL, '1.1', 'Get relevant images for your workplan', 'Download images that represent items on the workplan ', 0, '2024-01-28 10:18:06'),
(637, NULL, 96, NULL, '2.1', 'Cyber web page', 'Design a webpage the and illustrates all the services available from your cybercafe.  ', 0, '2024-01-28 10:18:06'),
(638, NULL, 96, NULL, '3.1', 'Client registration mutall rental', 'Study inturn registration form and use it on mutall rental for new client registration', 0, '2024-01-28 10:18:06'),
(639, NULL, 96, NULL, '3.2', 'Work with Ann to improve mutall rental', '', 0, '2024-01-28 10:18:07'),
(640, NULL, 96, NULL, '3.3', 'Mutall rental contract renewall', 'Improve mutall rental to review contracts automatically', 0, '2024-01-28 10:18:07'),
(641, NULL, 96, NULL, '3.4', 'Customer Deposits', '', 0, '2024-01-28 10:18:07'),
(642, NULL, 96, NULL, '3.5', 'Study Mutall Rental data model relationships', '', 0, '2024-01-28 10:18:07'),
(643, NULL, 96, NULL, '4.1', 'Report progress on data collection', '', 0, '2024-01-28 10:18:07'),
(644, NULL, 96, NULL, '4.2', 'Design a data collection system', '', 0, '2024-01-28 10:18:07'),
(645, NULL, 96, NULL, '4.3', 'Db image display', 'Get help from Mogaka to display images from the database', 0, '2024-01-28 10:18:07'),
(646, NULL, 96, NULL, '4.3.1', 'Display an image using an image tag', '', 0, '2024-01-28 10:18:07'),
(647, NULL, 96, NULL, '4.4', 'Transcription interface', 'Get Kibe to help with the receipts transcription interface', 0, '2024-01-28 10:18:07'),
(648, NULL, 96, NULL, '4.5', 'Change stock taking interface colours', '', 0, '2024-01-28 10:18:07'),
(649, NULL, 96, NULL, '4.6', 'Tabular layout ', 'Use tabular fomat of data collection on all balansys interfaces', 0, '2024-01-28 10:18:07'),
(650, NULL, 96, NULL, '4.7', 'Remove placeholders ', 'Remove place holders on the balansys stock user interface', 0, '2024-01-28 10:18:07'),
(651, NULL, 97, NULL, '1.1', 'Work on your work plan', 'Understand, Refine and expound on items on the workplan with Mr Muraya   ', 0, '2024-01-28 10:18:08'),
(652, NULL, 97, NULL, '1.1.1', 'Investigate on Annes work', 'What is exactly the task that Ann and I are supposed to work on  ', 0, '2024-01-28 10:18:08'),
(653, NULL, 97, NULL, '1.2', 'Learn how to create a zoom meeting  ', '', 0, '2024-01-28 10:18:08'),
(654, NULL, 97, NULL, '1.3', 'Learning git hub', '', 0, '2024-01-28 10:18:08'),
(655, NULL, 97, NULL, '1.4', 'Learning CMD to help me navigate github', '', 0, '2024-01-28 10:18:08');

-- --------------------------------------------------------

--
-- Table structure for table `presentation`
--

CREATE TABLE `presentation` (
  `presentation` int NOT NULL,
  `intern` int NOT NULL,
  `file` int DEFAULT NULL,
  `date` date NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `presentation`
--

INSERT INTO `presentation` (`presentation`, `intern`, `file`, `date`, `reason`) VALUES
(1, 16, 28, '2023-04-26', NULL),
(18, 9, 7, '2023-04-27', NULL),
(19, 11, 11, '2023-04-28', NULL),
(20, 7, 19, '2023-05-02', NULL),
(21, 2, 15, '2023-05-04', NULL),
(22, 15, 24, '2023-05-05', NULL),
(23, 6, 4, '2023-05-08', NULL),
(24, 16, 29, '2023-05-10', NULL),
(25, 9, 8, '2023-05-11', NULL),
(26, 11, 12, '2023-05-12', NULL),
(27, 2, 20, '2023-05-16', NULL),
(28, 3, 32, '2023-05-17', NULL),
(29, 15, 25, '2023-05-19', NULL),
(30, 16, 30, '2023-05-24', NULL),
(31, 2, 16, '2023-05-25', NULL),
(32, 6, 3, '2023-05-29', NULL),
(33, 7, 21, '2023-05-30', NULL),
(34, 6, NULL, '2023-05-22', NULL),
(35, 12, 34, '2023-05-23', NULL),
(36, 12, 35, '2023-06-06', NULL),
(37, 16, 36, '2023-06-07', NULL),
(38, 9, 37, '2023-06-08', NULL),
(39, 6, 38, '2023-06-12', NULL),
(40, 7, 54, '2023-06-13', NULL),
(41, 3, 55, '2023-06-14', NULL),
(42, 11, 56, '2023-06-16', NULL),
(43, 14, 57, '2023-06-19', NULL),
(44, 12, 58, '2023-06-20', NULL),
(45, 18, 59, '2023-06-21', NULL),
(46, 9, 60, '2023-06-22', NULL),
(47, 13, 61, '2023-06-26', NULL),
(48, 7, 62, '2023-06-27', NULL),
(49, 18, 63, '2023-06-28', NULL),
(50, 2, 64, '2023-06-29', NULL),
(51, 11, 65, '2023-06-30', NULL),
(52, 6, 66, '2023-07-03', NULL),
(53, 17, 67, '2023-07-04', NULL),
(54, 3, 68, '2023-07-05', NULL),
(55, 9, 69, '2023-07-06', NULL),
(56, 19, 70, '2023-07-07', NULL),
(57, 15, 71, '2023-07-07', NULL),
(58, 14, 72, '2023-07-10', NULL),
(59, 7, 75, '2023-07-11', NULL),
(60, 16, 76, '2023-07-12', NULL),
(61, 2, 77, '2023-07-13', NULL),
(62, 13, 78, '2023-07-17', NULL),
(63, 17, 79, '2023-07-18', NULL),
(64, 18, 80, '2023-07-19', NULL),
(65, 9, 81, '2023-07-20', NULL),
(66, 19, 82, '2023-07-21', NULL),
(67, 6, 83, '2023-07-24', NULL),
(68, 7, 84, '2023-07-25', NULL),
(69, 16, 85, '2023-07-26', NULL),
(70, 2, 86, '2023-07-27', NULL),
(71, 11, 87, '2023-07-28', NULL),
(72, 6, 88, '2023-07-31', NULL),
(73, 7, 89, '2023-08-01', NULL),
(74, 18, 90, '2023-08-02', NULL),
(75, 10, 91, '2023-08-03', NULL),
(76, 19, 92, '2023-08-04', NULL),
(77, 14, 93, '2023-08-07', NULL),
(78, 16, 94, '2023-08-09', NULL),
(79, 10, 95, '2023-08-10', NULL),
(80, 11, 96, '2023-08-11', NULL),
(81, 6, 97, '2023-08-14', NULL),
(82, 7, 98, '2023-08-15', NULL),
(83, 19, 99, '2023-08-18', NULL),
(84, 16, 100, '2023-08-23', NULL),
(85, 14, 101, '2023-08-28', NULL),
(86, 19, 102, '2023-09-08', NULL),
(87, 9, 103, '2023-09-14', NULL),
(88, 6, 104, '2023-09-18', NULL),
(89, 7, 105, '2023-09-19', NULL),
(90, 19, 106, '2023-09-22', NULL),
(91, 9, 107, '2023-09-28', NULL),
(92, 19, 108, '2023-10-06', NULL),
(93, 14, 109, '2023-10-09', NULL),
(94, 2, 110, '2023-10-12', NULL),
(95, 9, 111, '2023-10-19', NULL),
(96, 2, 112, '2023-10-19', NULL),
(97, 2, 113, '2023-11-02', NULL),
(98, 2, 114, '2023-11-16', NULL),
(99, 2, 115, '2023-11-30', NULL),
(100, 2, 116, '2023-12-14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project` int NOT NULL,
  `workplan` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `outcome` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `termination` date NOT NULL DEFAULT '9999-12-31',
  `comment` varchar(50) DEFAULT NULL,
  `theme` varchar(50) DEFAULT NULL COMMENT 'A general thematic area of computing where the project falls under'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project`, `workplan`, `name`, `problem`, `plan`, `outcome`, `termination`, `comment`, `theme`) VALUES
(1, 6, 'Chat', 'Real-time communication between users has been a problem with the Mutall Outlook/Schema Library.With WebSockets, as a compliment to the existing messaging system .i.e, the Mutall Messaging and Emailing System.The development of the Chat System will enable real time communication and an application that will Rival WhatsApp.', 'Develop a Chat System so well established that it will compete with WhatsApp and our users will instead use the Mutall Chat(For lack of a better naming) instead.', 'http://206.189.207.206/sockets', '9999-12-31', NULL, NULL),
(2, 6, 'Payment', 'With the introduction of Cashless payments systems such as Mobile Payments and Bank Payments on the go, at Mutall we are faced with the management of transactions made/done on our platform. Introducing and Integrating mobile payments is a good way of managing mobile payments.', 'Develop a payment system that Integrates, M-PESA, EQUITY BANK TRANSFER, and PayPal', NULL, '9999-12-31', NULL, NULL),
(3, 6, 'Accounting', 'Handling Transactions within our applications has become a huge problem which has prevented us from managing further payments done within our system.', 'Develop an Accounting system, that can effectively manage the transactions done on our platform.', NULL, '9999-12-31', NULL, NULL),
(4, 6, 'Documentation', 'Code Developed 2-3years ago of the MUTALL system has no point of reference. This makes it harder to introduce New Interns into our Library with the aim of enlisting their help to develop the system or utilize the existing framework to develop projects to Solve their Problems.Documenting to Release the tutorials and guidelines will make it easier to onboard Interns and motivate developer across the world to use our Framework.', 'Provide Documentation for our Schema and methods of accessing the Schema directly.Develop a documentation System that allows collaboration through out the documentation process Publish the documented classes & Methods to the world', 'http://206.189.207.206/documentation/v/monaco/', '9999-12-31', NULL, NULL),
(5, 6, 'Image Management', 'The Mutall Carpark system is a good avenue of image management learning and practise.Currently, there is a pool of image data just waiting to be utilized, and with proven techniques, it is possible to manage the vehicle images and extend their usage to develop an automated system that captures vehicle number plates as they leave or enter the Mutall Business Center.', 'An Image management System that will help us manage Images collected within our carpark system.', NULL, '9999-12-31', NULL, NULL),
(6, 6, 'Speech Recognition', 'Transferring audio recordings or podcasts to a word document(transcription) is such a tedious task and in audio with multiple languages, translation becomes a harder task especially if the translator does not understand another language apart from the primary language in the audio.', 'Build a mobile/web application that will allow users to generate audio transcriptions from multiple ethnicities.', NULL, '9999-12-31', NULL, NULL),
(7, 6, 'Portfolio', 'Exposing visible projects to the world is a not possible by just showing code from Github. Sure, developers will know from the webpage, but my primary focus is how I solved a problem, and that way, I can get more clients to help promote my skills as I solve problems relevant to their businesses.', 'Build a portfolio web app that will illustrate my problem solving capacity and capability in identifying and solving real world problems.', 'Demonstrations will also be part of the illustrating the solved problems packaged within either a mobile or web application.', '9999-12-31', NULL, NULL),
(8, 1, 'Shule', 'Design, add a label for ticking, next to the crestlet row. Customization, different pages should be created from one page the main one, the others can be created by dragging the the factors to the page header or row factor. Have a restore button when a filter is selected and an empty page appers, this takes the user back to the previous populated page. Arranging the code in a object oriented manner that will help us navigate through the code using classes and their methods. Fixing a wrong input by allowing editing of results on the web-page ', 'The plan is to develop a system that will be user-friendly ', 'The system will help in managing school results and make it easier to retrieve results anytime and anywhere. The school can also load scores that are not in the system. Get better managed code that will be easy to manage, debug and teach', '9999-12-31', NULL, NULL),
(9, 1, 'School Research', 'Identify Problems that schools are facing which may be finance related, book keeping, communicating to parents etc', 'See if there are other school problems i can solve using a system to make their work easier ', 'Help the school easily manage their resources without much effort.', '9999-12-31', NULL, NULL),
(10, 1, 'SheetJs', 'Unable to load excel files directly to the database ', 'Using SheetJS library we can read and display excel data in HTML Table ', 'Data loaded directly from excel', '9999-12-31', NULL, NULL),
(11, 1, 'Chama', 'Add the crown part, add a column selector, add a start date to every member, reload the data ', 'Work on chama system and have funtionalities that will help the user navigate through the application and in future be able to add their contributions', 'Have a system that is easier to navigate and that is presentable both on phone and big screen', '9999-12-31', NULL, NULL),
(12, 2, 'Kentionary', 'There is a language barrier in Kenya where people from different ethnic groups experience challenges in communicating especially if they are not fluent in Kenyas official languages.', 'The plan is to have a platform that helps in translating Kenyan local languages.', 'This may facilitate better communication between people from the different ethnic groups.', '9999-12-31', NULL, NULL),
(13, 2, 'Sacco Application', 'The sacco company has no dynamic way to capture members information, they register new users through excel work book and that is how they store the data.', 'The plan is to build them a simple application that will be useful in registering new users, even on-the-go, using a mobile phone.', 'Hopefully the application helps simplifies the companys way of operation and helps it gain more traction.', '9999-12-31', NULL, NULL),
(14, 2, 'Church Application', 'There is a challenge of registering new users or new believers hence following up on them may be difficult. New church members/believers are registered in a book Also, when having meetings, e.g., members who attend leaders meetings register themselves in a book. So unless someone has the book, you can not know the attendees.', 'The plan is to have a platform that can help in digitally registering new users/believers. The platform can also process/analyze the data provided, e.g., show the attendance trends.', 'Hopefully the application will help the church handle the data it collects in digital way.', '9999-12-31', NULL, NULL),
(39, 4, 'Kiama Kia Ma', 'The Kiama Kia Ma group has alot of data currently on their whatsApp groups and other platforms but its not easy to manage all of it.', 'To develop a website to hold their content, show various sub groups with their officials and members.', 'Hoping at the end of the year will have a working website showing all officials and the website will also replace circumcision posters.', '9999-12-31', NULL, NULL),
(40, 4, 'Mashamba', 'My client doesnt have a website to display his properties, buildings.', 'Have a website to show the lands\' location, value and other details.', 'Have a website where his clients can view properties with ease and also contact the seller.', '9999-12-31', NULL, NULL),
(41, 4, 'Fitness Tracker', 'Problem at hand is I dont have an app for tracking my fitness journey, with i hope the app will help in checking my body weight and height progress, my body muscle progresss, my BMI progress, my set and reps progress, my dieting progress.', 'The plan is to build them a simple site to help in keep a track of my fitness journey', 'Hopefully it will aid in setting more goals in gym, helping out in my daily diet, keep a track progress for my body.', '9999-12-31', NULL, NULL),
(42, 4, 'Interns Getting Started Documentation', 'Currently Mutall Data group doesnt have a documentation on how to install various softwares with their various configurations.', 'To create one to aid interns in installing the softwares on their systems easily.', 'It will help interns and other mutall data users install the softwares with ease.', '9999-12-31', NULL, NULL),
(43, 4, 'KibeHub', 'Dont have a website to showcase my projects and also how to reach me.', 'Create a website page to have all my complete projects, my CV and my contacts information', 'It will help clients reach me easily.', '9999-12-31', NULL, NULL),
(44, 4, 'Journal', 'Unable to manage your daily activities and tasks.Unable to track your goals and set new ones.Unable to see milestones achieved.Unable to see your daily emotions', 'The plan is to help in managing your activities and goals, see which goals/tasks are completed and which others arent.', 'With this application it will me productive in knowing which tasks i have to complete and how i will complete them and when they should be completed.', '9999-12-31', NULL, NULL),
(45, 5, 'Imagery', 'Fragmented images that have no orderly or systemic retrieval', 'Build a repository that houses all the image data in Mutall company', 'A central repository where users can access all the image data in Mutall company', '9999-12-31', NULL, NULL),
(46, 9, 'Ranics system', 'The current system does not provide information on how long a car stays in parking, how many of the cars parked are of people visiting the bank and the duration they stay in the bank. We also need to find out if it\'ll be economical to charge the car park.', 'The plan is to incorporate data analysis techniques to Ranics and improve its features on data analytics.', 'The new system will be able to determine how much to charge the car park users based on how long they stay and also answer the question of whether it is prolific.', '9999-12-31', NULL, NULL),
(47, 9, 'Ordination contribution list', 'The problem is presentation of large amounts of video data.', 'The plan is to use svg and video editing techniques to make the video data presentable.', 'The plan is to use svg and video editing techniques to make the video data presentable.', '9999-12-31', NULL, NULL),
(59, 12, 'Metavisio Application', 'Mutall Data Managers cant visualize the data models/class diagrams in the 8.1 version', 'Do an application by the name metavisuo to aid in diagram generation. Acquire more knowledge on SVG,Js,Ts', NULL, '9999-12-31', NULL, NULL),
(60, 12, 'tracker', 'Research on how to use github to track changes and my projects', 'git knowledge', NULL, '9999-12-31', NULL, NULL),
(61, 12, 'Registrar', 'There is conjestion and mismanagement of time esecially when the people turn up in large numbers and all have to be registered to be allowed to come in to the venue.', 'Build a registration system for self registration of members on arrival to the conference, In future think of building an entire management system apart from registration part, Think of how to assure security for members providing their details, Visit at least two conferences and call a person who have experience in conference management to aid in research on how they are managed.', NULL, '9999-12-31', NULL, NULL),
(62, 12, 'Masai Cafe website', 'Poor marketing strategies of the cafe, whereby currently they are depending on the facebook platform and whatsapp.', 'Improve the Maasai cafe website to include services like; Food/beverage marketing support, Food sales execution, Outside catering and many others', NULL, '9999-12-31', NULL, NULL),
(63, 13, 'Secure Parking', 'Plant and soil health in agriculture is a big neccessity,many detection of any anomalies are done too late after the damage has been done.', 'Use spectroscopy technology for detection of plant and soil health', NULL, '9999-12-31', NULL, NULL),
(64, 13, 'Smart Farming', 'Real time monitoring of farm conditions i.e Soil moisture ,alkalinity temperature and sending this parameters remotely to any location on a personal mobile.', 'Embracing technology in our Farms.', NULL, '9999-12-31', NULL, NULL),
(65, 10, 'Digital Imagery', 'Retrieval or locating specific images from a large database of images, Presentation of uploaded images that might be unclear and distorted, Large videos that are long and large increases the load time in a website when uploaded, Videos in a website need to be activated manually for them to play, Its hard managing a large pool of images and saving them locally', 'Work on image Indexing which will give me the ability to quickly search for and retrieve scanned images without having to manually comb through all the images, Use of different image processing and optimization APIs that offers a set of functions and tools to manipulate or change an image programmatically to use in my websites for better SEO performance through modifications, Video Processing/Editing where i will work on shortening long videos and also work on combining different videos and putting them together in an orderly arrangement, Use of javaScript to insert autoplay activities which will include the sound, I will use the google cloud storage facilities to store my data on the cloud where i can access it anywhere', 'Through Image Processing,i will be able to manage all my image and video data by ensuring that they are of the highest quality and arranged in a manner that it takes the shortest time to display and is clearly arranged in an orderly way. I will use the processed images to enhance my development in dynamic and interactive web pages that are visually appealing and user-friendly to the people accessing my websites.', '9999-12-31', NULL, NULL),
(66, 10, 'Virtual Market', 'Many Livestock sellers have to haul their animals around the country so as to get to places where they can market their cattle for sale. Livestock buyers have a limited pool to choose from for their purchase of livestock, as they mostly have to choose from their local area. They lack a platform to connect them to people who want to check on the condition of the animals that they are buying or selling. They lack somewhere where they can be linked with animal buyers and sellers.', 'I will build a managed database system connecting all the livestock market stakeholders, which will have enough information to help the different individuals to make more informed decisions depending on their specific wants. I will build a dynamic website for my virtual market using a platform like wordpress that shortens the time taken in building a website.', 'The system will help the groups or individuals in getting clients for any services or goods that they may be offering', '9999-12-31', NULL, NULL),
(67, 10, 'Intern Support', 'There is alot of images from different people that need to be managed properly', 'Building a database that will manage all the images from different individuals', 'The intern will at one hand learn mySql and also create a platform that will help manage pictures for different peoplein mutall.', '9999-12-31', NULL, NULL),
(68, 10, 'Personal Goals', 'I have not yet set up my Academic goals or personal objectives related to my educational journey', 'I need to choose an institution where i can get certified for my targeted education goal', 'Earn a career credential or prepare for a certification with the Professional Certificate program', '9999-12-31', NULL, NULL),
(69, 11, 'Oritech', 'Data recording-some data were not recorded, methods of recording data is wanting', 'create client excel tables with clients all data', 'have all clients in excel format, use the data to develop a customer relationship management systems', '9999-12-31', NULL, NULL),
(70, 11, 'Invices', 'Generate past,current invoices by use of mobitech. Past and current ivoices have not been captured well data quality is low', 'improve data quality-by issuing invoices and recording all transctions, generate past invoices, generate current invoices, issue current ivoices to clients by use of mobitech, accept payments from sms messages, support payments from direct daraja api using paybill', 'automate the billing process, use the available data to create customer relationship management systems (CRM)', '9999-12-31', NULL, NULL),
(71, 11, 'Passion', 'Use CRM approach to improve Oritech-improve communication with clients', 'develop intergrated system', 'Double my profit', '9999-12-31', NULL, NULL),
(72, 11, 'Education', 'Gain data management skills to run Oritech successfully - improve skills i have', 'register on a course i.e satification diploma in IT', 'Diploma in IT/Membership of It proffessionals', '9999-12-31', NULL, NULL),
(73, 11, 'Rentize', 'Rationalizing Mutall electricity bills - high bills', 'develop ideas on how to minimize high bills', 'educate users to save energies, adopt natural energy i.e solar energy,windmills, use less-energy using devices like led bulbs', '9999-12-31', NULL, NULL),
(74, 11, 'Internship', 'Support(post-graduate) interns to be self-employed - inadequate sources of income', 'develop ideas how interns can be self-employed', 'interns be able to have extra income, create job opportunities to the interns and society', '9999-12-31', NULL, NULL),
(75, 3, 'Timetable & Minutes', 'Minutes not well recorded and timetable needs improvement - The timetable does not display specific presenters for a day, The minutes are not well recorded.', 'Standardisation of minutes and improve the timetable - Display a specific presenter on the timetable. Make sure all the minutes are standardised. Split the presenter and the date. Record keeping for all presenters', 'Well recorded minutes and improved timetable - The timetable clearly displays who is required to present at a particular date. Minutes are well written and easily tracked', '9999-12-31', NULL, NULL),
(76, 3, 'Personal goals', 'Improve my academics and skills - There is no clear indication of my goals in 2 years from my undergraduate. Think in terms of progressing with education,employability or starting a business.', 'Think of ways to achieve my goals in 2 years - Develop a personal project in an area that I have interest. Think about future eductaion goals i.e Masters and Certtification programmes', 'A developed solution to an identified problem, Start a Masters Program in an year and do more certifications after graduation', '9999-12-31', NULL, NULL),
(77, 3, 'Ranics', 'Improve the data quality - No queries for checking data quality. The data is not being used sufficiently.', 'Write queries to check on data - Query the ranics database and check on the ranics software, Check whether Elias is following good data capturing practise', ' Improved data quality and utilised properly - Improved data quality. Data is being used properly', '9999-12-31', NULL, NULL),
(78, 3, 'Metavisio', 'Metavisio not accessible from the timetable - Metavisio is not deployed', 'To deploy metavisio', 'Have a working metavisio application that is will be used by all interns', '9999-12-31', NULL, NULL),
(79, 3, 'Support for interns', 'Interns not accustomed to work environment', 'Give help to interns - Help them in in their assignments and guiding them', 'Interns get used to work environment - The interns learn from their attachment', '9999-12-31', NULL, NULL),
(80, 3, 'Portfolio', 'There is no hub which is like a main website which things related to my details, work and skills.', 'Develop a hub with all the details - Add the portfolio to the hub. Add own minutes to the hub. Add own projects to the hub. Add personal details to the hub.', 'A functional Sharonhub with all the details - A hub to showcase my works and details.', '9999-12-31', NULL, NULL),
(81, 1, 'Oritech', 'Tabulation of oritech data', 'Display oritech data using school library', 'Well tabulated oritech data with invoices', '9999-12-31', NULL, NULL),
(82, 6, 'Migration', 'Before the migration of our Library to PHP 8.1 , all our applications ran on PHP 7.4. Mutall Rental was hosted on a server that caused us issues, every now and then. Further more, we wanted to move to our DO server, and do away with our CO server. To this effect, the migration to DO from MutallCO and to PHP 8.1 from PHP 7.4 became wanting', 'Migrate the Mutall Rental from Mutall CO, to Digital Ocean. Upgrade Mutall Rental to work with PHP8.1 and deploy it on Digital Ocean. Later On, upgrade the MutallCO server to work with typescript and our library', NULL, '9999-12-31', NULL, NULL),
(83, 6, 'Intern Support', 'All our Interns / Attache\'s need to come to us with little to no knowledge of computing, and it is our job as Mutall Data Managers to help them cultivate good Data Management practices', 'Provide progressive support to interns in terms of Debugging, Motivation, Way forward, and help them become better developers using Standard Mutall Data Managers Operating procedures. Eventually, and with time, they will become professional data Managers', NULL, '9999-12-31', NULL, NULL),
(84, 14, 'Minutes Content Management', 'The minutes for interns are normally recorded in a markdown files whereby the files should follow a specified format. Currently the interns do not follow the specified format leading to minutes presentation(display) problems. The current system lacks a criteria of compiling contributions from various sources into the minutes session of next presentation.', 'To develop a system that solves the shortcomings of the current minute management system which will manage each minute as an item rather than at the file level. This will be solved by creating a database model that will be used to record the currently existing minutes in the markdown file as items.\r\n\r\n', 'An automated minutes system that will be capable of recording contributions from various users.', '9999-12-31', NULL, NULL),
(85, 15, 'KKM Chat System', 'Inefficient communication and collaboration among team members.\r\n', 'Identify the key features that you want in your chama chat system interface.', 'Improved communication and collaboration among chama members.', '9999-12-31', NULL, NULL),
(86, 15, 'Personal goals', 'One of the main challenges of ethical hacking is the need to stay up-to-date with the latest security threats and vulnerabilities. This requires ongoing training and education to keep pace with the rapidly evolving threat landscape\r\n', 'plan', 'As an ethical hacker, my ultimate goal should be to make use of nondestructive hacking techniques, determine whether or not vulnerabilities exist and demonstrate this to the system’s owner, close the flaws and improve the overall security of the system .', '9999-12-31', NULL, NULL),
(87, 16, 'Registrar ', 'Most of the registration systems of today are single-business oriented.\r\nThere are scarcely any multi-businesses registration systems.', 'Simple registration and log in forms\r\nRegistration to be one-time for users of sub-systems of the multi-business.\r\nLogging in to be user-centric that is, the user should be able to choose which system of the multi-business that they want to interact with.\r\nProper record-keeping of users of the sub-systems used by the multi-business', 'A working web application that allows for registration of users in a multi-business scenario.', '9999-12-31', NULL, NULL),
(88, 8, 'Balansys', 'Building my project from scratch. I have no computing background', 'learn general programming', 'Be a full stack developer', '9999-12-31', NULL, NULL),
(89, 8, 'Diploma', 'Improving My Credentials. ', 'Raise money for fees and Acquire an efficient time management strategy', NULL, '9999-12-31', NULL, NULL),
(90, 8, 'Rentize', 'Prompt Production of Invoices. I have very little knowledge of how the system works', 'Interact with the system to understand how it works by doing the following tasks', 'Redesign and improve mutall rental', '9999-12-31', NULL, NULL),
(91, 8, 'Mshauri', 'Empowering The Youth. I need to identify my audience and learn the topics that affect them', 'Study in depth my focus topics and improve my communication skills', 'Be articulate and have a deep understanding of the focus topics', '9999-12-31', NULL, NULL),
(92, 8, 'Cyber Cafe', 'Bringing IT Services Closer to Mutall Clients. There is a scarcity of it services in mutall', 'Identify the services that are mostly required in the building', 'Streamlined service provision', '9999-12-31', NULL, NULL),
(93, 8, 'Support for interns', 'Getting the interns started. Interns not accustomed to work environment\r\nThe interns are not yet accustomed to the work environment.', 'Give help to interns. Help them in in their assignments and guiding them', 'Interns get used to work environment\r\nThe interns learn from their attachment', '9999-12-31', NULL, NULL),
(94, 19, 'FitPal', 'Investigaten on firebase log in? What it is and what it does? Simmilar to what simon is doing with sheetjs. Explore the role of webpack in bundling code from different libraries', '', '', '9999-12-31', 'Firebase', NULL),
(95, 19, 'KKM', 'How to get data from whats app group whithout a third party. Document the mutall class for working with whats app messeges. Problems with exporting media (with captions)', '', '', '9999-12-31', 'Whats app', NULL),
(96, 19, 'Documentation database', 'Manage all the documentation we have. Have a method to count words and think of other improvements to the documentation system. Investigate on image hotspots to help in documentation of the user interfaces of our application.', '', '', '9999-12-31', 'karanja, muli', NULL),
(97, 19, 'Image Processing', 'Upgrade and support  the mutall imegery dbase. Car number plate extraction. Python for extracting handwritten data form documents to support transcriptions', '', '', '9999-12-31', 'OCR/ Handwritting', NULL),
(98, 19, 'Mashamba', 'Publish current titles. Level 2 registration of mashamba users. Migration of the data from the previous data model to the new model. Do research on GIS to help in land disputes and identification of amenities near a parcel of land', '', '', '9999-12-31', 'Nelson presentation', NULL),
(99, 19, 'Registration', 'Proceed to register users for the various applications', '', '', '9999-12-31', 'X', NULL),
(100, 19, 'KibeHub', 'Investigate how to use react ot create applications. Have all links ot your system avilable on your hub', '', '', '9999-12-31', 'X', NULL),
(101, 20, 'Metavisuo', 'Work on CRUD for data and metadata. Design and write a user intreface documentation for the new version of metavisuo', '', '', '9999-12-31', 'CRUD', NULL),
(102, 20, 'Rentize', 'Get all the rental cte\'s and ensure they are completed and up to standard', '', '', '9999-12-31', 'CTE\'s', NULL),
(103, 20, 'Billing', 'Work on acquisition of electricity bills usint an Android platform(Contract for mutall)', '', '', '9999-12-31', 'KPLC/ Android', NULL),
(104, 20, 'Chama', 'Work on a chama management system using an Android platform. Identify a chama you are close to also get the diaspora data model (For self Advancement)', '', '', '9999-12-31', 'X', NULL),
(105, 20, 'Registration', 'Work on documentation and mainstreaming of the level 1 registration and also work on level 2 registartion for various projects am working on', '', '', '9999-12-31', 'Registrar/ Label / IO', NULL),
(106, 20, 'Tracker', 'Work on planning aspect. Also work on a presentation loading .Define a general template of workplan and populate it with data form the database', '', '', '9999-12-31', 'Academic', NULL),
(107, 17, 'Balansys', 'Receipt and stock control project. Continue with bmj stock control. Enter data in the database and then to quickbooks', '', '', '9999-12-31', 'Recipt / Stock control', 'new test'),
(108, 17, 'Rentize', 'Client registration and query consolidation. In conjunction with anne\'s contract management system', '', '', '9999-12-31', 'Contracts  + Client registration', 'test'),
(109, 17, 'Event planner', 'Learning linux and understanding how the server works', '', '', '9999-12-31', 'Linux / CRON', NULL),
(110, 17, 'Tracker', 'Managing the financial aspect of the internship e.g, tracking intern loans, Kitchen consumption, monthly stipends. This project will involve kibe with his documentation work and Mogaka who will help with development of the database', '', '', '9999-12-31', 'Accounting / Finance', NULL),
(111, 17, 'Cybercafe', 'Exploring how to communicate legitimately across origins. Mogaka and karanja to investigate communication headers with help from peter. ', '', '', '9999-12-31', 'CORS', NULL),
(112, 17, 'Relentless', 'Building and learning the ins and outs of a business. Raising school fees for Diploma. (Self  Initiative)', '', '', '9999-12-31', 'X', NULL),
(113, 17, 'MuliHub', 'showcasing my programming journey and skills', '', '', '9999-12-31', 'X', NULL),
(114, 17, 'Intern Support', 'Getting interns accustomed to the work environment. Setting up of the intern\'s computers using kibes documentation', '', '', '9999-12-31', 'X', NULL),
(115, 17, 'Diploma', 'Doing a course in Software systems and principles at Nibs technical college Nairobi', '', '', '9999-12-31', 'X', NULL),
(116, 17, 'Mshauri', 'Empowering the youth', '', '', '9999-12-31', 'X', NULL),
(117, 17, 'Registration', 'Proceed to register users for the various applications', '', '', '9999-12-31', 'Registrar / Balansys', NULL),
(118, 18, 'Mlima', 'Pick up the pieces of mlima website and make it work together. In mlima the objective should go on the left', '', '', '9999-12-31', 'Consolidate code / Hotspot documentation', NULL),
(119, 18, 'Chat', 'Getting familiar with sockets.  A stand alone application for saving chats. Investigate on monaco editor. Investigate the posibility of using elixir for the sockets', '', '', '9999-12-31', 'Sockets / Elixir', NULL),
(120, 18, 'Sheetjs', 'Working with sheet js library  on balansys. Load the last five list to the balansys database', '', '', '9999-12-31', 'Exam system', NULL),
(121, 18, 'Cyber security', 'Focus on security of data', '', '', '9999-12-31', 'X', NULL),
(122, 18, 'Registration', 'Proceed to register mlima members ( Level 2 registration). Previewing images, factuate , and upload images', '', '', '9999-12-31', 'Registrar / Mlima', NULL),
(123, 21, 'Data views', 'Work on a module to tabulate data independent of the source. Use Shule, Oritech and Chama to further the agenda', '', '', '9999-12-31', 'Label format / Tabulation / Tree view', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `workplan`
--

CREATE TABLE `workplan` (
  `workplan` int NOT NULL,
  `intern` int NOT NULL,
  `file` int DEFAULT NULL,
  `year` int NOT NULL COMMENT 'This is the year of the workplan, i.e., 2023'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `workplan`
--

INSERT INTO `workplan` (`workplan`, `intern`, `file`, `year`) VALUES
(1, 6, 39, 2023),
(2, 4, 40, 2023),
(3, 16, 51, 2023),
(4, 9, 42, 2023),
(5, 12, 43, 2023),
(6, 11, 44, 2023),
(7, 1, 45, 2023),
(8, 2, 46, 2023),
(9, 10, 50, 2023),
(10, 7, 48, 2023),
(11, 15, 49, 2023),
(12, 3, 52, 2023),
(13, 8, 53, 2023),
(14, 14, 73, 2023),
(15, 13, 41, 2023),
(16, 17, 74, 2023),
(17, 2, NULL, 2024),
(18, 13, NULL, 2024),
(19, 9, NULL, 2024),
(20, 14, NULL, 2024),
(21, 20, NULL, 2024);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`contribution`),
  ADD UNIQUE KEY `id` (`intern`,`ref`) USING BTREE,
  ADD KEY `intern_id` (`intern`,`minute`),
  ADD KEY `minute_item` (`minute`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`copy`),
  ADD UNIQUE KEY `copy` (`copy`),
  ADD UNIQUE KEY `id` (`name`,`file`,`intern`) USING BTREE,
  ADD KEY `copy_2` (`copy`),
  ADD KEY `intern` (`intern`,`presentation`,`file`),
  ADD KEY `presentation` (`presentation`),
  ADD KEY `file` (`file`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file`),
  ADD UNIQUE KEY `file` (`file`),
  ADD UNIQUE KEY `id` (`name`);

--
-- Indexes for table `intern`
--
ALTER TABLE `intern`
  ADD PRIMARY KEY (`intern`),
  ADD UNIQUE KEY `id` (`surname`) USING BTREE,
  ADD KEY `surname` (`surname`),
  ADD KEY `intern_user` (`user`);

--
-- Indexes for table `minute`
--
ALTER TABLE `minute`
  ADD PRIMARY KEY (`minute`),
  ADD KEY `child_of` (`child_of`),
  ADD KEY `portfolio` (`project`),
  ADD KEY `presentation` (`presentation`),
  ADD KEY `minute_item` (`minute`,`project`),
  ADD KEY `id` (`presentation`,`ref`) USING BTREE;

--
-- Indexes for table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`presentation`),
  ADD UNIQUE KEY `id` (`intern`,`date`) USING BTREE,
  ADD KEY `intern_id` (`intern`),
  ADD KEY `file` (`file`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project`),
  ADD UNIQUE KEY `id` (`name`,`workplan`) USING BTREE,
  ADD KEY `portfolio` (`project`),
  ADD KEY `portfolio_2` (`workplan`);

--
-- Indexes for table `workplan`
--
ALTER TABLE `workplan`
  ADD PRIMARY KEY (`workplan`),
  ADD KEY `file` (`file`),
  ADD KEY `portfolio` (`workplan`),
  ADD KEY `id` (`intern`,`year`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `contribution` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `copy`
--
ALTER TABLE `copy`
  MODIFY `copy` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `intern`
--
ALTER TABLE `intern`
  MODIFY `intern` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `minute`
--
ALTER TABLE `minute`
  MODIFY `minute` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=656;

--
-- AUTO_INCREMENT for table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `presentation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `workplan`
--
ALTER TABLE `workplan`
  MODIFY `workplan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contribution`
--
ALTER TABLE `contribution`
  ADD CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `contribution_ibfk_2` FOREIGN KEY (`minute`) REFERENCES `minute` (`minute`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `copy_ibfk_3` FOREIGN KEY (`file`) REFERENCES `file` (`file`);

--
-- Constraints for table `intern`
--
ALTER TABLE `intern`
  ADD CONSTRAINT `intern_user` FOREIGN KEY (`user`) REFERENCES `mutall_users`.`user` (`user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `minute`
--
ALTER TABLE `minute`
  ADD CONSTRAINT `minute_ibfk_1` FOREIGN KEY (`project`) REFERENCES `project` (`project`),
  ADD CONSTRAINT `minute_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `minute_ibfk_3` FOREIGN KEY (`child_of`) REFERENCES `minute` (`minute`);

--
-- Constraints for table `presentation`
--
ALTER TABLE `presentation`
  ADD CONSTRAINT `presentation_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `presentation_ibfk_2` FOREIGN KEY (`file`) REFERENCES `file` (`file`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`workplan`) REFERENCES `workplan` (`workplan`);

--
-- Constraints for table `workplan`
--
ALTER TABLE `workplan`
  ADD CONSTRAINT `workplan_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `workplan_ibfk_2` FOREIGN KEY (`file`) REFERENCES `file` (`file`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
