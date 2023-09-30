-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2023 at 02:24 PM
-- Server version: 8.0.32
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mutall_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `attachment` int NOT NULL,
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `intern` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"941","cy":"633"}';

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`attachment`, `company`, `designation`, `start_date`, `end_date`, `intern`) VALUES
(1, 'Mutall-data', 'programmer', '2022-08-29 14:46:45', '2022-08-29 14:46:45', 50),
(2, 'mutall_data', 'programmer', '2022-08-29 14:46:45', '2022-08-29 14:46:45', 50);

-- --------------------------------------------------------

--
-- Table structure for table `ceo`
--

CREATE TABLE `ceo` (
  `ceo` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` int NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":1642,"cy":833}';

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `certificate` int NOT NULL,
  `cert_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `institute` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` date NOT NULL DEFAULT '9999-12-31',
  `intern` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"299","cy":"1059"}';

--
-- Dumping data for table `certificate`
--

INSERT INTO `certificate` (`certificate`, `cert_name`, `institute`, `start_date`, `end_date`, `intern`) VALUES
(1, 'Degree', 'Technical University', NULL, '9999-12-31', 50),
(2, 'Diploma', 'Kenyatta university', NULL, '9999-12-31', 50);

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `content` int NOT NULL,
  `source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `originator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caption` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `definer` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"1223","cy":"426"}';

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`content`, `source`, `url`, `originator`, `caption`, `definer`) VALUES
(1, 'xml', 'http://206.189.207.206/mutall_data/home.php#workplan2022', 'me', 'Workplan for 2022', 7);

-- --------------------------------------------------------

--
-- Table structure for table `definer`
--

CREATE TABLE `definer` (
  `definer` int NOT NULL,
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caption` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seq` int DEFAULT NULL,
  `blobs` blob,
  `organization` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"1225","cy":"634"}';

--
-- Dumping data for table `definer`
--

INSERT INTO `definer` (`definer`, `id`, `caption`, `seq`, `blobs`, `organization`) VALUES
(7, 'workplan2022', 'Workplan for 2022', NULL, NULL, 3),
(8, 'Internship', 'Internship programmme', NULL, NULL, 3),
(9, 'identity', 'Identity', NULL, NULL, 3),
(10, 'mission', 'Mission and vision', NULL, NULL, 3),
(11, 'values', 'Values', NULL, NULL, 3),
(12, 'passion', 'Passion', NULL, NULL, 3),
(13, 'services', 'Applications', NULL, NULL, 3),
(14, 'clients', 'Clients', NULL, NULL, 3),
(15, 'training', 'Training', NULL, NULL, 3),
(16, 'staff', 'Staff', NULL, NULL, 3),
(17, 'funding', 'Funding', NULL, NULL, 3),
(18, 'contacts', 'Contacts', NULL, NULL, 3),
(19, 'our_folder', 'Our_Folder', NULL, NULL, 3),
(20, 'tools', 'Tools', NULL, NULL, 3),
(21, 'model_diagrams', 'Model Diagrams', NULL, NULL, 3),
(22, 'write_up', 'Call for Write-up', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `intern`
--

CREATE TABLE `intern` (
  `intern` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resume` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '{"url":true}',
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` date DEFAULT '9999-12-31',
  `requirement` enum('laptop','smartphone','others') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attachment` enum('post_graduate','under_graduate','icdl') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `available` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `self_sponsored` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `language` json DEFAULT NULL,
  `residence` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organization` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `kin` int DEFAULT NULL,
  `sponsor` int DEFAULT NULL,
  `referee` int DEFAULT NULL,
  `initials` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `portfolio` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qualification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `university` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"652","cy":"848"}';

--
-- Dumping data for table `intern`
--

INSERT INTO `intern` (`intern`, `name`, `email`, `title`, `resume`, `start_date`, `end_date`, `requirement`, `attachment`, `available`, `self_sponsored`, `language`, `residence`, `organization`, `user`, `kin`, `sponsor`, `referee`, `initials`, `day`, `image`, `portfolio`, `qualification`, `year`, `university`) VALUES
(51, 'Andrew Mugambi', NULL, NULL, NULL, '2023-03-09 08:51:51', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'AM', 'Monday', 'http://206.189.207.206/tracker/portfolio/2023/image/drew.jpg', 'http://206.189.207.206/tracker/portfolio/2023/mugambi.html', 'Bsc. Business Information Technology', 2016, 'Africa Nazarene University'),
(52, 'Bernard Muli', NULL, NULL, NULL, '2023-03-09 08:51:51', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'BM', 'Friday', 'https://lh3.googleusercontent.com/Ffxiv6kqEGP8ixQF1udakKYXQ--cdvQcyc7PlaIMbZT6UZMGZZRscOsfJ7QU7W5kMKSQ29K1WSR8h88INpHbZMRxcByaAYXpj620IuM6Ks7O4FzL40HDI420v29xNTmrRMBEisdPqw=w600-h315-p-k', 'http://206.189.207.206/tracker/portfolio/2023/muli.html', 'Certificate in IT', 2017, 'Daystar University'),
(53, 'Carol Wawira', NULL, NULL, NULL, '2023-03-09 08:51:51', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'CW', 'Wednesday', 'http://drive.google.com/uc?export=view&id=1xlKJbMwmZw6unrBj8RCWpXBytNXS4kKX', 'http://206.189.207.206/tracker/portfolio/2023/wawira.html', 'Diploma in Information Communication Technology', 2022, 'Cooperative University'),
(54, 'Daniel Kaniu', NULL, NULL, NULL, '2023-03-09 08:54:38', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'DK', 'Friday', 'http://206.189.207.206/tracker/portfolio/2023/image/me.jpeg', 'http://206.189.207.206/tracker/portfolio/2023/kaniu.html', 'Bsc. Business Information Technology', 2019, 'Jomo Kenyatta University of Agriculture and Technology'),
(55, 'Francis Nyakundi', NULL, NULL, NULL, '2023-03-09 08:54:38', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'FN', 'Tuesday', 'http://206.189.207.206/tracker/v/images/frank.jpg', 'http://206.189.207.206/tracker/portfolio/2023/francis.html', 'Diploma in Information Technology', 2021, 'Nairobi Technical'),
(56, 'George Kang\'ara', NULL, NULL, NULL, '2023-03-09 08:54:38', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'GK', 'Monday', 'http://drive.google.com/uc?export=view&id=10KYtxL82ANblZbwrAgMc_R7WoHTu8KKD', 'http://206.189.207.206/tracker/portfolio/2023/kangara.html', 'Bsc Computer Technology', 2019, 'Meru University'),
(57, 'George Munya', NULL, NULL, NULL, '2023-03-09 08:54:38', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'GM', 'Tuesday', 'https://lh3.googleusercontent.com/x7nJjq2_nEWxboeNnPQq1lqGs55EZGVie8UatieTs31D9LSXZ0whOYX56QHZNpKaJyvBQY5iaT_V4vvVfWEpiGvo_HkBkGV-dX-MWV_LwaSlqtM2WpQBDynL_KZ6EUmgBFMg8j-nww=w600-h315-p-k', 'http://206.189.207.206/tracker/portfolio/2023/Munya.html', 'Diploma in Information Communication Technology', 2022, 'Kabete Technical'),
(58, 'Isaac Waweru', NULL, NULL, NULL, '2023-03-09 13:24:59', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'IW', 'Monday', 'http://206.189.207.206/tracker/portfolio/2023/image/IMG_20190913_100204_8.jpg', 'http://206.189.207.206/tracker/portfolio/2023/weru.html', '', 2020, 'Multimedia University'),
(59, 'James Kiberenge', NULL, NULL, NULL, '2023-03-09 13:25:00', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'JK', 'Thursday', 'https://lh3.googleusercontent.com/pw/AMWts8CyI5Nz8iqJYeK5oLBujhR23dm-FV4RtO-TUoxHoVMoT9_J0kpIi5StZsomLL4yeFi68a-fFvjjJashydaAYi4JnUAWYdE6qPGyefQ4yGkoa5_hCqi6B8CY_lO6xb0cg4qo-OEBqy0gU1Rtq74r-lrySQ=w708-h960-s-no?authuser=0', 'http://206.189.207.206/tracker/portfolio/2023/kiberenge.html', 'Diploma In IT', 2020, 'KCA '),
(60, 'Joan Nduta', NULL, NULL, NULL, '2023-03-09 13:25:01', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'JN', 'Thursday', 'https://drive.google.com/uc?export=view&id=1gETpOsBaik0CumLnEZIEG1u4lkgi1ptl', 'http://206.189.207.206/tracker/portfolio/2023/nduta.html', 'Bsc Economics and Statistics', 2023, 'Egerton University'),
(61, 'Peter Kamau', NULL, NULL, NULL, '2023-03-09 13:30:43', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'PK', 'Friday', 'https://db3pap003files.storage.live.com/y4mYkTxSEdlNhFREDQ7FZvRrdtMGliIzvjGykN_dx2Y16yNfAx0pECbD0sPnKLa9Xmc4u0E--9P-m5PO02f5A2BiZxJd-Iz8d4FGlhV899pAgFC5tn_p2UIGUfyJUeW0kDeuTEGWqTvbvvb6W2dNW-nVWk-5knHb0dbsIdk21q-g5cI5mQjSMhznMMK1ksAMIWX?width=256&amp;height=256&amp;cropmode=none', 'http://206.189.207.206/tracker/portfolio/2023/kamau.html', 'Bsc. Mathematics and Computer Science', 2019, 'Multimedia University'),
(62, 'Sharon Wanjiru', NULL, NULL, NULL, '2023-03-09 13:30:44', '9999-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, NULL, 'SW', 'Wednesday', 'https://lh3.googleusercontent.com/Ffxiv6kqEGP8ixQF1udakKYXQ--cdvQcyc7PlaIMbZT6UZMGZZRscOsfJ7QU7W5kMKSQ29K1WSR8h88INpHbZMRxcByaAYXpj620IuM6Ks7O4FzL40HDI420v29xNTmrRMBEisdPqw=w600-h315-p-k', 'http://206.189.207.206/tracker/portfolio/2023/wanjiru.html', 'Bsc. Informatics and Computer Science', 2023, 'Strathmore University');

-- --------------------------------------------------------

--
-- Table structure for table `kin`
--

CREATE TABLE `kin` (
  `kin` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":448,"cy":670}';

--
-- Dumping data for table `kin`
--

INSERT INTO `kin` (`kin`, `name`, `email`, `phone`) VALUES
(2, 'carl', 'fans@gmail.com', 786575696);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module` int NOT NULL,
  `mod_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `application` int NOT NULL,
  `chair` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `todo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":-126,"cy":848}';

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module`, `mod_name`, `application`, `chair`, `todo`) VALUES
(2, 'Registrar', 23, 'francis', 2),
(3, 'CRUD', 29, 'Sharon', 3),
(4, 'Accountant', 23, 'Peter Kamau', 4),
(5, 'Messenger ', 30, 'Kaniu', 5),
(6, 'Event planner', 26, 'Peter Kamau', 6),
(7, 'Payment', 23, 'Peter Kamau', 7),
(8, 'Website', 31, 'Kaniu', 8),
(9, 'Migration', 24, 'James', 9);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `organization` int NOT NULL,
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `org_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ceo` int DEFAULT NULL,
  `business` int DEFAULT NULL,
  `events` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"1227","cy":"831"}';

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`organization`, `id`, `org_name`, `ceo`, `business`, `events`) VALUES
(3, 'mutall', 'mutall data', NULL, NULL, NULL),
(4, '50', 'CSR Program of Mutall Investiment Company', NULL, 51, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `referee`
--

CREATE TABLE `referee` (
  `referee` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"663","cy":"1156"}';

--
-- Dumping data for table `referee`
--

INSERT INTO `referee` (`referee`, `name`, `email`, `phone`) VALUES
(1, 'carlo', 'carlo@gmail.com', '0786579656');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `sponsor` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"1004","cy":"1052"}';

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `todo` int NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` date DEFAULT '9999-12-31',
  `intern` int DEFAULT NULL,
  `module` int DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_done` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='{"cx":"199","cy":"838","title":"","visible":false}';

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`todo`, `start_date`, `end_date`, `intern`, `module`, `description`, `id`, `is_done`) VALUES
(2, '2022-08-29 11:27:59', '9999-12-31', 25, 6, 'Research on how to use Composer in Php', 'PHP_Composer', NULL),
(3, '2022-08-29 11:27:59', '9999-12-31', 25, 3, 'Design a database for Ranics system', 'Ranics_DB', NULL),
(20, '2022-08-29 11:27:59', '9999-12-31', 7, 3, 'Restructure the forms to save data to the ranics database', 'Form re-structure', NULL),
(21, '2022-08-29 11:27:59', '9999-12-31', 25, 3, 'Research how to use got to collaborate on the Ranics assignments.', 'Git_Collaboration', NULL),
(22, '2022-08-29 11:27:59', '9999-12-31', 32, 3, 'Fix the navigation bar', 'Ranics_Nav', NULL),
(23, '2022-08-29 11:27:59', '9999-12-31', 31, 3, 'Style the Ranics code', 'Style_Ranics', NULL),
(24, '2022-08-29 11:27:59', '9999-12-31', 26, 2, 'Create method vue due assignments.', 'Due_assignments', NULL),
(25, '2022-08-29 11:27:59', '9999-12-31', 26, 2, 'What is needed to publish our library\'s to npm ', 'npm_install', NULL),
(26, '2022-08-29 11:27:59', '9999-12-31', 32, 5, 'Add a new grid to the existing model to include events planned and messages sent to the apllication', 'Grid_Restructure', NULL),
(27, '2022-08-29 11:27:59', '9999-12-31', 7, 5, 'Develop the create and reply message service.', 'Messenger_model', NULL),
(28, '2022-08-29 11:27:59', '9999-12-31', 7, 5, 'Create a message dialogue box under services to add messages to the message section and save to the database', 'Create_new_message', NULL),
(29, '2022-08-29 11:27:59', '9999-12-31', 25, 5, 'Code the message section. To display the messages sent to outlook', 'Message_section', NULL),
(30, '2022-08-29 11:27:59', '9999-12-31', 26, 5, 'Research on how to use an API to send a message to whatsapp.', 'Message_API', NULL),
(31, '2022-08-29 11:27:59', '9999-12-31', 31, 5, 'Design the html page for messenger module', 'Messenger_page', NULL),
(32, '2022-08-29 11:27:59', '9999-12-31', 23, 5, 'Research on how to send messages to email.', 'Messenger_Email', NULL),
(33, '2022-08-29 11:27:59', '9999-12-31', 25, 5, 'Research and report on the sms and its usage', 'Message_SMS', NULL),
(35, '2022-08-29 11:27:59', '9999-12-31', 7, 7, 'Research on Credit card and paypal as methods of payment', 'Payment_module', NULL),
(36, '2022-08-29 11:27:59', '9999-12-31', 26, 7, 'Add tea services to tracker.', 'Track_Tea', NULL),
(37, '2022-08-29 11:27:59', '9999-12-31', 32, 7, 'Design a tea delivery. Working with Kaniu', 'Tea_delivery', NULL),
(38, '2022-08-29 11:27:59', '9999-12-31', 7, 7, 'Work on the tea delivery form ok button. Collaborate with Sharon.', 'Ok_button', NULL),
(39, '2022-08-29 11:27:59', '9999-12-31', 31, 7, 'Design the tea payment form. Collaborate with Peter.', 'Tea_Payment', NULL),
(40, '2022-08-29 11:27:59', '9999-12-31', 25, 7, 'Develop the tea payment OK button. Collaborate with James.', 'OK_button1', NULL),
(41, '2022-08-29 11:27:59', '9999-12-31', 25, 3, 'Load existing data to the ranics database.\r\n', 'Data_loading', NULL),
(42, '2022-08-29 11:27:59', '9999-12-31', 31, 9, 'Report Familiarity.To make your work easier,familiarize yourself with the reports', 'Rental_familiarity', NULL),
(43, '2022-08-29 11:27:59', '9999-12-31', 26, 9, 'Code. Migrate the code to the mutall_rental code to `digital_ocean` and resolve the references to the server', 'Code_migration', NULL),
(44, '2022-08-29 11:27:59', '9999-12-31', 26, 9, 'Look at the water reading modules on mutall.co.ke.', 'Reading_water', NULL),
(45, '2022-08-29 11:27:59', '9999-12-31', 7, 9, 'Fix the ebill references once the modules are on Digital Ocean ', 'Ebill_references', NULL),
(46, '2022-08-29 11:27:59', '9999-12-31', 25, 9, 'Create a backup system that include a local backup for all databases and the files. The system should facilitate backups that go further than 5 months.', 'back_up', NULL),
(47, '2022-08-29 11:27:59', '9999-12-31', 25, 9, 'Create a backup system that include a local backup for all\r\n                databases and the files. **The system should facilitate backups\r\n                that go further than 5 months**', 'Rental_locally', NULL),
(48, '2022-08-29 11:27:59', '9999-12-31', 32, 9, 'Learn how to do a markup with a Table of Contents ', 'Table_of_contents', NULL),
(49, '2022-08-29 11:27:59', '9999-12-31', 11, 9, 'Train `James` on how to use the mutall_rental system', 'Rentize_usage', NULL),
(50, '2022-08-29 11:27:59', '9999-12-31', 11, 9, 'Pursue KRA reporting (Accounting Module)', 'KRA_accounting', NULL),
(51, '2022-08-29 11:27:59', '9999-12-31', 23, 9, ' Have a look at the errors generated from the movement of the water bill system to digital ocean.', 'Errors_DO', NULL),
(52, '2022-08-29 11:27:59', '9999-12-31', 23, 9, 'Conceive and integrate a migration module into the time table', 'Migration_module', NULL),
(53, '2022-08-29 11:27:59', '9999-12-31', 6, 4, '', 'Test_one', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`attachment`),
  ADD UNIQUE KEY `id` (`company`),
  ADD KEY `att_int` (`intern`);

--
-- Indexes for table `ceo`
--
ALTER TABLE `ceo`
  ADD PRIMARY KEY (`ceo`),
  ADD UNIQUE KEY `id` (`name`) USING BTREE,
  ADD KEY `use_name` (`user`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD PRIMARY KEY (`certificate`),
  ADD UNIQUE KEY `id` (`cert_name`),
  ADD KEY `int_cert` (`intern`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content`),
  ADD KEY `id` (`definer`);

--
-- Indexes for table `definer`
--
ALTER TABLE `definer`
  ADD PRIMARY KEY (`definer`),
  ADD UNIQUE KEY `id1` (`id`),
  ADD KEY `id` (`organization`) USING BTREE;

--
-- Indexes for table `intern`
--
ALTER TABLE `intern`
  ADD PRIMARY KEY (`intern`),
  ADD UNIQUE KEY `id` (`name`,`kin`,`sponsor`) USING BTREE,
  ADD KEY `organization_business` (`organization`),
  ADD KEY `user_int` (`user`),
  ADD KEY `intern_sponsor` (`sponsor`),
  ADD KEY `intern_referee` (`referee`),
  ADD KEY `intern_kin` (`kin`);

--
-- Indexes for table `kin`
--
ALTER TABLE `kin`
  ADD PRIMARY KEY (`kin`),
  ADD UNIQUE KEY `id` (`name`) USING BTREE;

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`module`),
  ADD KEY `module_todo` (`module`) USING BTREE,
  ADD KEY `appli` (`application`) USING BTREE,
  ADD KEY `id` (`mod_name`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`organization`),
  ADD UNIQUE KEY `id1` (`id`),
  ADD KEY `organization-ceo` (`ceo`),
  ADD KEY `business_organization` (`business`),
  ADD KEY `id` (`events`);

--
-- Indexes for table `referee`
--
ALTER TABLE `referee`
  ADD PRIMARY KEY (`referee`),
  ADD UNIQUE KEY `id` (`name`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`sponsor`),
  ADD UNIQUE KEY `id` (`name`) USING BTREE;

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`todo`),
  ADD UNIQUE KEY `id1` (`id`),
  ADD KEY `todo___developer` (`intern`),
  ADD KEY `module` (`module`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `attachment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ceo`
--
ALTER TABLE `ceo`
  MODIFY `ceo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificate`
--
ALTER TABLE `certificate`
  MODIFY `certificate` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `content` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `definer`
--
ALTER TABLE `definer`
  MODIFY `definer` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `intern`
--
ALTER TABLE `intern`
  MODIFY `intern` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `kin`
--
ALTER TABLE `kin`
  MODIFY `kin` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `module` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `organization` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `referee`
--
ALTER TABLE `referee`
  MODIFY `referee` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `sponsor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `todo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ceo`
--
ALTER TABLE `ceo`
  ADD CONSTRAINT `use_name` FOREIGN KEY (`user`) REFERENCES `mutall_users`.`user` (`user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
