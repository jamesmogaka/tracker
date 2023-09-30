-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 12:50 PM
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
-- Database: `tracker_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `contribution` int NOT NULL,
  `intern` int NOT NULL,
  `minute_item` int NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(1, 'kangara_20230403.md'),
(2, 'kangara_20230410.md'),
(3, 'kangara_20230529.md'),
(4, 'kangara_20230508.md'),
(5, 'kibe_20230212.md'),
(6, 'kibe_20230406.md'),
(7, 'kibe_20230427.md'),
(8, 'kibe_20230511.md'),
(9, 'kungu_20230216.md'),
(10, 'kungu_20230317.md'),
(11, 'kungu_20230428.md'),
(12, 'kungu_20230512.md'),
(13, 'muli_20230330.md'),
(14, 'muli_20230413.md'),
(15, 'muli_20230504.md'),
(16, 'muli_20230525.md'),
(17, 'munya_20230404.md'),
(18, 'munya_20230411.md'),
(19, 'munya_20230502.md'),
(20, 'munya_20230516.md'),
(21, 'munya_20230530.md'),
(22, 'mwaniki_20230331.md'),
(23, 'mwaniki_20230424.md'),
(24, 'mwaniki_20230505.md'),
(25, 'mwaniki_20230519.md'),
(26, 'wanjiru_20230406.md'),
(27, 'wanjiru_20230419.md'),
(28, 'wanjiru_20230426.md'),
(29, 'wanjiru_20230510.md'),
(30, 'wanjiru_20230524.md'),
(31, 'wawira_20230405.md'),
(32, 'wawira_20230517.md'),
(33, 'weru_20230425.md'),
(34, 'kinyanjui_20230523.md'),
(35, 'kinyanjui_20230606.md'),
(36, 'wanjiru_20230607.md'),
(37, 'kibe_20230609.md'),
(38, 'kangara_20230612.md'),
(39, 'kangara.html'),
(40, 'kaniu.html'),
(41, 'karanja.html'),
(42, 'kibe.html'),
(43, 'kinyanjui.html'),
(44, 'kungu.html'),
(45, 'mugambi.html'),
(46, 'muli.html'),
(47, 'mungai.html'),
(48, 'munya.html'),
(49, 'mwaniki.html'),
(50, 'nduta.html'),
(51, 'wanjiru.html'),
(52, 'wawira.html'),
(53, 'weru.html'),
(54, 'munya_20230613.md'),
(55, 'wawira_20230614.md'),
(56, 'kungu_20230616.md');

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
  `university` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `intern`
--

INSERT INTO `intern` (`intern`, `name`, `surname`, `initials`, `day`, `start_date`, `end_date`, `image`, `qualification`, `year`, `university`) VALUES
(1, 'Andrew Mugambi', 'mugambi', 'AM', 'Monday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/portfolio/2023/image/drew.jpg', 'Bsc. Business Information Technology', 2016, 'African Nazarene University'),
(2, 'Bernard Muli', 'muli', 'BM', 'Friday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/v/images/muli.jpg', 'Certificate in IT', 2017, 'Daystar University'),
(3, 'Carol Wawira', 'wawira', 'CW', 'Wednesday', '2023-03-09', '9999-12-31', 'http://drive.google.com/uc?export=view&id=1xlKJbMwmZw6unrBj8RCWpXBytNXS4kKX', 'Diploma in Business Information Technology', 2022, 'Cooperative University'),
(4, 'Daniel Kaniu', 'kaniu', 'DK', 'Friday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/portfolio/2023/image/me.jpeg', 'Bsc. Business Information Technology ', 2019, 'Jomo Kenyatta University of Agriculture and Technology'),
(5, 'Francis Nyakundi', 'nyakundi', 'FN', 'Tuesday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/v/images/frank.jpg', 'Diploma in Information Technology', 2021, 'Nairobi Technical'),
(6, 'George Kangara', 'kangara', 'GK', 'Monday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/portfolio/2023/kangara.html', 'Bsc Computer Technology', 2019, 'Meru University'),
(7, 'George Munya', 'munya', 'GM', 'Tuesday', '2023-03-09', '9999-12-31', 'https://lh3.googleusercontent.com/x7nJjq2_nEWxboeNnPQq1lqGs55EZGVie8UatieTs31D9LSXZ0whOYX56QHZNpKaJyvBQY5iaT_V4vvVfWEpiGvo_HkBkGV-dX-MWV_LwaSlqtM2WpQBDynL_KZ6EUmgBFMg8j-nww=w600-h315-p-k', 'Diploma in Information Communication Technology', 2022, 'Kabete Technical'),
(8, 'Isaac Waweru', 'waweru', 'IW', 'Monday', '2023-03-09', '2023-06-05', 'http://206.189.207.206/tracker/portfolio/image/weru.jpg', 'Bsc. Mechatronics Engineering', 2019, 'Dedan Kimathi University of Technology'),
(9, 'James Kiberenge', 'kiberenge', 'JK', 'Thursday', '2023-03-09', '9999-12-31', 'https://lh3.googleusercontent.com/pw/AMWts8CyI5Nz8iqJYeK5oLBujhR23dm-FV4RtO-TUoxHoVMoT9_J0kpIi5StZsomLL4yeFi68a-fFvjjJashydaAYi4JnUAWYdE6qPGyefQ4yGkoa5_hCqi6B8CY_lO6xb0cg4qo-OEBqy0gU1Rtq74r-lrySQ=w708-h960-s-no?authuser=0', 'Diploma in Information Technology', 2020, 'KCA'),
(10, 'Joan Nduta', 'nduta', 'JN', 'Thursday', '2023-03-09', '2023-06-05', 'https://drive.google.com/uc?export=view&id=1gETpOsBaik0CumLnEZIEG1u4lkgi1ptl', 'Bsc Economics and Statistics', 2023, 'Egerton University'),
(11, 'Peter Kamau', 'kungu', 'PK', 'Friday', '2023-03-09', '9999-12-31', 'https://db3pap003files.storage.live.com/y4mYkTxSEdlNhFREDQ7FZvRrdtMGliIzvjGykN_dx2Y16yNfAx0pECbD0sPnKLa9Xmc4u0E--9P-m5PO02f5A2BiZxJd-Iz8d4FGlhV899pAgFC5tn_p2UIGUfyJUeW0kDeuTEGWqTvbvvb6W2dNW-nVWk-5knHb0dbsIdk21q-g5cI5mQjSMhznMMK1ksAMIWX?width=256&amp;height=256&amp;cropmode=none', 'Bsc.  Mathematics and Computer Science', 2019, 'Multimedia University'),
(12, 'Chris Ndungu', 'kinyanjui', 'CK', 'Tuesday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/portfolio/image/reece.jpeg', 'Bsc. Computer Science', 2024, 'Dedan Kimathi University of Technology'),
(13, 'Simon Mwangi', 'karanja', 'MK', 'Monday', '2023-06-02', '2023-08-31', NULL, 'Diploma in IT', 2023, 'Cooperative University'),
(14, 'James Oyondi', 'mogaka', 'JM', 'Monday', '2023-05-24', '2023-08-24', NULL, 'Bsc. Computer Science', 2024, 'Dedan Kimathi University of Technology'),
(15, 'Joseph Mwaniki', 'mwaniki', 'JM', 'Friday', '2023-03-09', '9999-12-31', 'http://206.189.207.206/tracker/portfolio/image/mwaniki.jpg', 'Bsc. Sales and Marketing', 2018, 'Presbyterian University'),
(16, 'Sharon Wanjiru', 'wanjiru', 'SW', 'Wednesday', '2023-03-09', '9999-12-31', '', 'Bsc. Informatics and Computer Science', 2023, 'Strathmore University'),
(17, 'Joshua Samuel Omondi', 'omondi', 'JS', 'Tuesday', '2023-06-06', '2023-08-01', NULL, 'Bsc.Computer Science', 2024, 'Dedan Kimathi University of Technology'),
(18, 'Kelvin Mungai Wanjiru', 'mungai', 'KM', 'Wednesday', '2023-06-05', '2023-09-05', NULL, 'Bsc.Information Technology', 2025, 'Masinde Muliro University'),
(19, 'Anne Wanjiru Mbugua', 'mbugua', 'AW', 'Friday', '2023-06-14', '9999-12-31', 'http://206.189.207.206/tracker/portfolio/image/mbugua.jpg', 'Bsc. Biochemistry', 2019, 'University of Nairobi');
-- --------------------------------------------------------

--
-- Table structure for table `minute`
--

CREATE TABLE `minute` (
  `minute` int NOT NULL,
  `project` int NOT NULL,
  `presentation` int NOT NULL,
  `child_of` int DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` varchar(50) NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `done` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `minute`
--

INSERT INTO `minute` (`minute`, `project`, `presentation`, `child_of`, `number`, `summary`, `detail`, `done`) VALUES
(1, 66, 33, NULL, '1.1', 'Do market research and consumer research.', NULL, 0),
(2, 66, 33, NULL, '1.2', 'Check other virtual markets outside Kiserian.', NULL, 0),
(3, 66, 33, NULL, '1.3', 'Formulate a problem statement', NULL, 0),
(4, 66, 33, NULL, '1.4', 'Seek additional relevant information', 'Check on the meat suppliers because they may have more information', 0),
(5, 66, 33, NULL, '1.5', 'List 5 ideas using website technology', NULL, 0),
(6, 66, 33, NULL, '1.6', 'Demonstrate the ideas using techniques', NULL, 0),
(7, 45, 35, NULL, '1.1', 'Automation of Image retrieval from google drive', 'Look at how you programmatically get photos from google drive to the database.', 0),
(8, 45, 35, NULL, '1.2', 'Interface Design', 'Design the interface for the landing page for the central image repository.', 0),
(9, 45, 35, NULL, '1.3', 'Add more keywords for easier searching of images.', NULL, 0),
(10, 59, 28, NULL, '1.1', 'A proper craw foot', NULL, 1),
(11, 59, 28, NULL, '1.2', 'Ensure metavisuo can run as standalone', NULL, 0),
(12, 59, 28, NULL, '1.3', 'Check+Highlight invalid entities', NULL, 0),
(13, 59, 28, NULL, '1.4', 'Implement CRUD functionality', NULL, 0),
(14, 59, 28, NULL, '1.5', 'Crud for Entities', NULL, 0),
(15, 59, 28, 14, '1.5.1', 'Crud for Attributes ', NULL, 0),
(16, 59, 28, 14, '1.5.2', 'Crud for Relations ', NULL, 0),
(17, 59, 28, NULL, '1.6', 'Implementation of metavisuo sub model', 'Confirm metav. Sub model is embedded+work in all dbs.', 0),
(18, 60, 28, NULL, '2.1', 'work on your github portfolio and populate it', NULL, 0),
(19, 60, 28, NULL, '2.2', 'Create a skeleton of your github portfolio', 'start by creating a skeleton of your github portfolio and demonstrate it', 0),
(20, 60, 28, NULL, '2.3', 'learn on collaborating with others in github', NULL, 0),
(21, 60, 28, NULL, '2.4', 'Demonstration on github functionality', 'explain to us what a commit,merge,push and pull is all about', 0),
(22, 60, 28, NULL, '2.5', 'Push all your applications to github', NULL, 0),
(23, 60, 28, NULL, '2.6', 'To be demonstrated', NULL, 0),
(24, 61, 28, NULL, '3.1', 'Database design', 'design a database system which can accommodate the data that you have and can accommodate more data', 0),
(25, 61, 28, NULL, '3.2', 'Data processing Ms.excel', 'Process the excel data to avoid repetition of names', 0),
(26, 61, 28, NULL, '3.3', 'Addition of payment data', 'Take payment messages from Mr. Murayas group and add the data to help prepare for a future conference', 0),
(27, 61, 28, NULL, '3.4', 'Develop registration website', 'Develop a website system to help in the registration process', 0),
(28, 75, 30, NULL, '1.1', 'Once you open a file, copy it', NULL, 0),
(29, 75, 30, NULL, '1.2', 'Save the copies in a pattern', NULL, 0),
(30, 75, 30, NULL, '1.3', 'Split the date to a more friendly way', NULL, 0),
(31, 75, 30, NULL, '1.4', 'Save information on local storage', NULL, 0),
(32, 75, 30, NULL, '1.5', 'Ask for details on first occasion', 'If it is first time it asks who you are and appends it', 0),
(33, 75, 30, NULL, '1.6', 'Separate code from data', NULL, 0),
(34, 80, 30, NULL, '2.1', 'Improvements on the hub', 'The hub to include portfolio, minutes , cv and record of all things', 0),
(35, 80, 30, NULL, '2.2', 'Work on db to retrieve minutes', 'Work on how only to extract your minutes- might need a database', 0),
(36, 80, 30, NULL, '2.3', 'Including portfolio in Sharon hub', 'Let Portfolio be part of sharon hub accessible from timetable.', 0),
(37, 80, 30, NULL, '2.4', 'Own minutes too should be accessible from hub', NULL, 0),
(38, 75, 30, NULL, '3.1', 'Add surname to the column name of tracker', NULL, 0),
(39, 75, 30, NULL, '3.2', 'Add presentation table', 'Add presentation table - with surname, reason and focus', 0),
(40, 75, 30, NULL, '3.3', 'Query to inform on next presenter', 'Write a query to get most recent presenter- for next presenter and report the next presenter', 0),
(41, 39, 25, NULL, '1.1', 'Investigation on content management systems', 'Have a good template for allowing you to manage your content properly. You can investigate content management systems such as Drupal or Wordpress.', 1),
(42, 39, 25, NULL, '1.2', 'Improvements on Website appearance', 'Make the website attractive and easier to use. Add animation, use a background suitable for projection.', 1),
(43, 39, 25, NULL, '1.3', 'Redesign of website', 'Redesign the page to have a Navigation bar that will make the website easier to use. This way you will have a chance of engaging the users.', 1),
(44, 39, 25, NULL, '1.4', 'Buy me a coffee idea', 'Include the Buy me a coffee idea to engage the visitors to your website.', 0),
(45, 39, 25, NULL, '1.5', 'Website modifications', 'Move the navigation to the right, rather than on the left.', 1),
(46, 39, 25, NULL, '1.6', 'Inclusion of Teachings', 'Include what the young men were taught, so that parents can have a point of reference and reinforce what was taught.', 0),
(47, 39, 25, 46, '1.6.1', 'Get the content taught previously', 'Ask Mr.Muraya to get you the poster for the previous year and add some of the things they were taught or check the certificates handed out to the graduates to get the content taught.', 0),
(48, 39, 25, NULL, '1.7', 'Layout improvements', 'Layout the organizational chart(groups) in a horizontal manner to support more and more usages.', 1),
(49, 39, 25, NULL, '1.8', 'Simplification of content organization', 'Organize the content into a simpler format .i.e, an excel sheet to support database integration(PK)', 0),
(50, 39, 25, NULL, '1.9', 'Database modeling', 'Develop a model for the data in preparation of saving the data into the database.', 0),
(51, 39, 25, 50, '1.9.1', 'Database modeling', 'Model the database based on the pages of the data you want to fetch', 0),
(52, 40, 25, NULL, '2.1', 'Research on other system', 'Look at what Dennis and Kimotho were doing with regard to Real Estate.', 1),
(53, 40, 25, 52, '2.1.1', 'Research on other system', 'Borrow the good Ideas from that project.', 0),
(54, 40, 25, 52, '2.1.2', 'Think about data model', 'Get a feel of the data model and view the attributes that you might need.', 0),
(55, 40, 25, NULL, '2.2', 'Data collection', 'Collect data from Dennis forms which will give you a slight idea of how you will organize the data so that it can be helpful to both the buyer and the seller.', 0),
(56, 40, 25, NULL, '2.3', 'Data collection to inform the work', 'Interact with the surveyor (field work) to get a feel of how land data is collected and managed in order to develop a good mashamba website. Think about how you can manage the documents involved in transfer of ownership of lands.', 0),
(57, 40, 25, 56, '2.3.1', 'Organize the data into excel sheets.', NULL, 1),
(58, 40, 25, 56, '2.3.2', 'Develop a model', 'Develop a model for the files and folders.', 1),
(59, 40, 25, 56, '2.3.3', 'Develop a database and load data', 'Develop a database and load the data to have a feel of how it will work(PM/PK).', 0),
(60, 40, 25, 56, '2.3.4', 'Timeline for collecting data', 'Have timeline for collecting the data from the field (JM).', 0),
(61, 40, 25, 56, '2.3.5', 'Implement the first draft of the Interface', 'Implement the first draft of the Interface, that you will show to Nelson(PM).', 0),
(62, 40, 25, 56, '2.3.6', 'Add the link to the scanned documents', 'Add the link to the scanned documents in Google Drive(PM).', 0),
(63, 40, 25, NULL, '2.4', 'Complementary information about parcel of land', 'Provide complementary information about a parcel of land such as:', 0),
(64, 40, 25, 63, '2.4.1', 'How far it is located from the main road.', NULL, 0),
(65, 40, 25, 63, '2.4.2', 'Days they can take clients to view the land.', NULL, 0),
(66, 40, 25, 63, '2.4.3', 'Proximity to social amenities', 'Proximity to social amenities such as schools and Hospitals.', 0),
(67, 40, 25, 63, '2.4.4', 'Add information such as electricity and water.', NULL, 0),
(68, 41, 25, NULL, '3.1', 'Good database design', 'Have  a good database to support all the data.', 0),
(69, 41, 25, 68, '3.1.1', 'Login Registration', 'Use the mutall_users.user table for login registration.', 0),
(70, 41, 25, 68, '3.1.2', 'Avoid colliding colors.', NULL, 0),
(71, 41, 25, 68, '3.1.3', 'Thinking of a website Design', 'Think about presenting the data collected from the gym in the form of a html which you will support the layout of more data as compared to the current chart view.', 0),
(72, 41, 25, NULL, '3.2', 'Develop a Good Webpage', 'Develop a Good Webpage, Be more creative and include concepts/aspects of Fitness or a gym, even before you login.', 0),
(73, 41, 25, 72, '3.2.1', 'You can add an animation of people working out.', NULL, 0),
(74, 41, 25, NULL, '3.3', 'Log in services', 'Look at the Federated Login Services to support login such Firebase to support Google/Facebook login.', 0),
(75, 41, 25, NULL, '3.4', 'Data collection', 'Go to the gym and Collect Data to improve your website.', 0),
(76, 41, 25, 75, '3.4.1', 'Data collection', 'Visit the GYM to collect data in excel sheets with the goal of collecting the various metrics needed to present the data(PK).', 0),
(77, 44, 25, NULL, '4.1', 'Developing the journal', 'Develop your hub with the premise of the Journal App. This will support you in the management of your day to day operations.', 0),
(78, 42, 25, NULL, '5.1', 'Add the Documentation to the web', 'Add the Documentation to the web, specifically into tracker, since it is designed to support new interns.', 0),
(79, 42, 25, NULL, '5.2', 'Add the Documentation of file Uploads', 'Add the documentation for how to upload files and how to use fileZilla.', 0),
(80, 42, 25, NULL, '5.3', 'Update the documentation', 'Clarify from the interns which sections of the documentation did not work and update the document the document.', 0),
(81, 7, 26, NULL, '1.1', 'Additional info to Portfolio', 'Incorporate a video in your portfolio, describing yourself and the projects you are planning to complete.', 0),
(82, 7, 26, NULL, '1.2', 'Have demos in the other projects.', NULL, 1),
(83, 7, 26, 82, '1.2.1', 'Appending links to portfolio', 'PK added hyperlinks to open his applications from his portfolio but not all applications have been deployed yet.', 1),
(84, 7, 26, NULL, '1.3', 'Ensure that my portfolio follows this pattern.', NULL, 1),
(85, 1, 26, NULL, '2.1', 'Have a way to view previous chats', 'Have a way to view the previous chats when logged out. By Saving the chat to the database', 1),
(86, 1, 26, NULL, '2.2', 'Issue with showing online users', 'Issue with showing the number of users online, problem is the application adds a user when you reload the page and also adds you back when you rejoin the chat.', 1),
(87, 1, 26, NULL, '2.3', 'Integration', 'Integrate the chat system with our library, and what it takes to incorporate it to other systems.', 1),
(88, 1, 26, NULL, '2.4', 'Integration ', 'Integrate the Chat system such that it is accessible from our timetable', 1),
(89, 1, 26, 88, '2.4.1', 'Integration to timetable', ' Start by integrating the system to our timetable page.', 1),
(90, 1, 26, 88, '2.4.2', '(SN) will help you in designing the interface.', NULL, 0),
(91, 1, 26, NULL, '2.5', 'Incorporation of other media types to chat', 'How will you incorporate other media types like images, emoji etc in your chat system? - Currently PK intends to work on sending messages first then incorporate sharing other media in messages later.', 0),
(92, 1, 26, NULL, '2.6', 'Inclusion of search bar', 'Have a search bar to in looking up for words/phrases in the application.', 0),
(93, 1, 26, NULL, '2.7', 'Notifications', NULL, 0),
(94, 1, 26, 93, '2.7.1', 'Notifications', 'Enable ssl in the server to allow notifications in the system.', 0),
(95, 1, 26, 93, '2.7.2', 'Notifications', 'Notifications should quietly update the application messages panel as soon as a message is sent. All old chats are visible in the same panel.', 0),
(96, 5, 26, NULL, '3.1.', 'Images from fieldwork', 'JK will provide images from his field work, also JK to oversee how things are done.', 0),
(97, 5, 26, 96, '3.1.1', 'Have a demo on the next meeting.', NULL, 0),
(98, 4, 26, NULL, '4.1', 'Navigation bar', 'Have the nav bar interactive, someone should be able to navigate to different section.', 1),
(99, 4, 26, NULL, '4.2', 'Further Contribution by users', 'Allow Further contribution by Users via the Monaco editor.', 1),
(100, 4, 26, NULL, '4.3', 'Deployment of the Monaco.', NULL, 1),
(101, 2, 26, NULL, '5.1', 'Daraja API integration', 'Help in integrating the Daraja API to James and Georges application', 0),
(102, 2, 26, NULL, '5.2', 'Get Mr. Muraya a personal till number account.', NULL, 0),
(103, 2, 26, NULL, '5.3', 'Cash Item for M-PESA till Number.', NULL, 0),
(104, 3, 26, NULL, '6.1.', 'Presentation on QuickBooks', 'Present the QuickBooks initiative jointly with Julius next time.', 0),
(105, 3, 26, 104, '6.1.1', 'Loading office receipts', ' Office receipts to be loaded into Quick books to help in generation of data to be used in filing returns for Mutall Investments Company.', 0),
(106, 74, 29, NULL, '1.1', 'Find a different problem on the internship.', NULL, 0),
(107, 74, 29, NULL, '1.2', 'Financial support', 'Link to muli and the ward rep for financial support.', 0),
(108, 74, 29, NULL, '1.3', 'Dream of a suitable name for the cyber.', NULL, 0),
(109, 74, 29, NULL, '1.4', 'come up with other business ideas', NULL, 0),
(110, 74, 29, NULL, '1.5', 'Revise the budget with muli.', NULL, 0),
(111, 74, 29, NULL, '1.6', 'Add Networking package', 'Add a networking item(what you know) on the things you teach.', 0),
(112, 9, 32, NULL, '1.1', 'upload to the server the school system', NULL, 0),
(113, 9, 32, NULL, '1.2', ' look at how nemis system works', NULL, 0),
(114, 9, 32, NULL, '1.3', 'change from textbook to school research', NULL, 1),
(115, 9, 32, NULL, '1.4', 'other ideas , fees transport, exam, lunch', NULL, 1),
(116, 11, 32, NULL, '2.1', 'Load the beneficiaries to the system.', NULL, 1),
(117, 11, 32, NULL, '2.2', 'Add a data list to help us do searches.', NULL, 1),
(118, 11, 32, NULL, '2.3', 'Add start date to every member.', NULL, 1),
(119, 11, 32, NULL, '2.4', 'Add a column selector.', NULL, 0),
(120, 11, 32, NULL, '2.5', 'Add the rest of the data.', NULL, 0),
(121, 11, 32, NULL, '2.6', 'Add the crown section.', NULL, 1),
(122, 11, 32, NULL, '2.7', 'Button for showing further details', 'Add a button for showing detailed and non detailed output', 0),
(123, 8, 32, NULL, '3.1', 'Redesign', 'Redesign the showing of regions to take care of empty cases.,\r\nthis retaining the orientation region when there is no data in the body.', 0),
(124, 8, 32, NULL, '3.2', 'Expansion of the drop areas', 'Expand the drop areas for accepting dragged factors,\r\nso that dropping to empty regions become meaningful. For instance,\r\ncrest and crumb factors can be dropped in the header topmost row.\r\nheader/crumb and body/crest areas are candidates for drop points\r\nbody/label is a natural drop point for crest factors\r\nbody/ crumb can never be a drop point as it is ambiguous.\r\nfilters is a drop point for crown factors', 0),
(125, 8, 32, 124, '3.2.1', 'Color coding the worksheet', 'In this regard, color code the worksheet to show the type of factors (crown, crest or crumb) can be dropped there.', 0),
(126, 8, 32, NULL, '3.3', 'Edit-score', 'Complete the \"edit-score\" option by implementing the save method using the questionnaire library', 0),
(127, 8, 32, NULL, '3.4', 'Edit-score extension', 'Add option for creating and capturing new exam results by extending the \"edit-score\" option', 0),
(128, 8, 32, NULL, '3.5', 'Summaries', 'Add the left and bottom margin summaries,\r\nthus extending the worksheet. Consider extending the the base and crest ctes to achieve this', 0),
(129, 8, 32, NULL, '3.6', 'Hide user selected factors', ' Hide user-selected factor levels from display,\r\nallowing users to focus on what matters at the time.\r\nConsider using checkboxes for filter.select options', 0),
(130, 8, 32, NULL, '3.7', 'Review of header styling', 'Review header styling using multi-technology approach,\r\nincluding, detail/summary, grid area+display flex, fieldset, etc.', 0),
(131, 8, 32, NULL, '3.8', 'Consider student progression through grades', ' Consider the fact that students graduate from one grade to another\r\nafter an year by creating new progressions.', 0),
(132, 8, 32, NULL, '3.9', 'Display of oritech and chama data', 'Try and display chama and oritech data by creating matching\r\nbase ctes and re-using the sheet and query.ts libraries', 0),
(133, 81, 32, NULL, '4.1', 'Add the invoice table to the database', NULL, 0),
(134, 81, 32, NULL, '4.2', 'Queries to get data', 'Create a query to get the client, site, subscription identifies, and extract the year month and amount from the payment table', 0),
(135, 81, 32, NULL, '4.3', 'Create a php file for loading the invoice data', NULL, 0),
(136, 81, 32, NULL, '4.4', 'Load subscription cost', NULL, 0),
(137, 81, 32, NULL, '4.5', 'update the loading php file', NULL, 0),
(138, 82, 26, NULL, '7.1', 'Migration of mutall_co rental to DO', ' Migration of mutall_co rental to DO and updating it to PHP 8.1 to produce invoices in MutallCO.', 0),
(139, 45, 36, NULL, '1.1', 'Deployment', 'Add a link to the actual product in the outcome section of your portfolio ', 0),
(140, 45, 36, 139, '1.1.1', 'Work on deployment of the product.', NULL, 0),
(141, 45, 36, NULL, '1.2', 'Improving load time', 'Work on loading of the images by improving loading time.', 0),
(142, 45, 36, NULL, '1.3', 'Add border and keywords to the images', 'Add border and keywords to the images (showing further details regarding the images).', 0),
(143, 45, 36, NULL, '1.4', 'Add the total image count', 'Add the total image count retrieved from the query.', 0),
(144, 45, 36, NULL, '1.5', 'Work on pagination.', NULL, 0),
(145, 45, 36, 144, '1.5.1', 'Limiting the query results', ' Add limit to the number of images returned by the query( lead to improvement on load time). ', 0),
(146, 45, 36, 144, '1.5.2', 'Add a button to load the next page images.', NULL, 0),
(147, 45, 36, NULL, '1.6', 'Work on the search functionality implementation.', NULL, 0),
(148, 45, 36, 147, '1.6.1', 'Retrieve search keyword', NULL, 0),
(149, 45, 36, 147, '1.6.2', 'Formulate the SQL', NULL, 0),
(150, 45, 36, 147, '1.6.3', 'Run the SQL', NULL, 0),
(151, 45, 36, 147, '1.6.4', 'Limit the search results to batches of 20 images.', NULL, 0),
(152, 45, 36, 147, '1.6.5', 'Display the results', 'Display the results(Summary of total images returned from the query)', 0),
(153, 45, 36, 147, '1.6.6', 'Display the images', 'Display the images from the query in the repository.', 0),
(154, 45, 36, NULL, '1.7', 'Criteria for display of results', ' On opening the repository, random images from the database(from various sources) should be displayed on the screen.', 0),
(155, 45, 36, NULL, '1.8', 'Categorization of the data in images and videos.', NULL, 0),
(156, 45, 36, 9, '1.9', 'Add more keywords', ' Add more keywords (You are constrained by single keywords). ', 0),
(157, 45, 36, NULL, '1.10', 'Interface for allowing people to add images', 'Interface for allowing people to add and load more images to the database/Repository.', 0),
(158, 75, 37, NULL, '1.1', 'Add contribution column', 'Add another column that will show the contributors from different people', 0),
(159, 75, 37, NULL, '1.2', 'Add a header which contains submit & create button', 'Add a header which contains submit button and create button', 0),
(160, 75, 37, 40, '1.3', 'Write a query to get most recent presenter', 'Write a query to get most recent presenter- for next presenter and report the next presenter', 0),
(161, 80, 37, NULL, '2.1', 'Add the technologies that you use', 'Add the technologies that you use in your sharon hub', 0),
(162, 80, 37, 37, '2.2', 'Use database to select all minutes', NULL, 0),
(163, 39, 38, 44, '1.1', 'Buy me Coffee', 'Include the Buy me a coffee idea to engage the visitors to your website.', 0),
(164, 39, 38, 46, '1.2', 'Include what the young men were taught', 'so that parents can have a point of reference and reinforce what was taught.', 0),
(165, 39, 38, 164, '1.2.1', 'Get poster from Mr.Muraya', 'Ask Mr.Muraya to get you the poster for the previous year and add some of the things they were taught or check the certificates handed out to the graduates to get the content taught.', 0),
(166, 39, 38, 49, '1.3', 'Organize the content into a simpler format', '.i.e, an excel sheet to support database integration(PK).', 0),
(167, 39, 38, 50, '1.4', 'Db modelling', 'Develop a model for the data in preparation of saving the data into the database.', 0),
(168, 39, 38, 167, '1.4.1', 'Db modelling', 'Model the database based on the pages of the data you want to fetch.', 0),
(169, 40, 38, 56, '2.1', 'Field work', 'Interact with the surveyor to get a feel of how land data is collected and managed in order to develop a good mashamba website. Think about how you can manage the documents involved in transfer of ownership of lands.', 0),
(170, 40, 38, 169, '2.1.1', 'Have the save button working.', NULL, 0),
(171, 40, 38, 169, '2.1.2', 'Transcribing', 'add details to like 5 mutations and title deeds, and have them get displayed on the transcription sectino in the interface.', 0),
(172, 40, 38, 63, '2.2', 'Provide complementary information on land parcels', 'How far it is located from the main road. Days they can take clients to view the land. Proximity to social amenities such as schools and Hospitals. Add information such as electricity and water.', 0),
(173, 40, 38, 55, '2.3', 'Data collection', 'Collect data from Dennis\'s forms which will give you a slight idea of how you will organize the data so that it can be helpful to both the buyer and the seller.', 0),
(174, 41, 38, 75, '3.1', 'Collect Data to improve your website.', NULL, 0),
(175, 41, 38, 72, '3.2', 'Develop a Good Webpage', 'Be more creative and include concepts/aspects of Fitness or a gym, even before you login.', 0),
(176, 41, 38, 175, '3.2.1', 'You can add an animation of people working out.', NULL, 0),
(177, 41, 38, 74, '3.3', 'Login System using Firebase', 'Look at the Federated Login Services to support login such Firebase to support Google/Facebook login.', 0),
(178, 41, 38, 68, '3.4', 'Have  a good database to support all the data.', NULL, 0),
(179, 41, 38, 178, '3.4.1', 'Use mutall_users.user for login registration.', 'Use the mutall_users.user table for login registration.', 0),
(180, 41, 38, 178, '3.4.2', 'Avoid colliding colors.', NULL, 0),
(181, 41, 38, 178, '3.4.3', 'Think about presenting the data collected', 'Think about presenting the data collected from the gym in the form of a html which you will support the layout of more data as compared to the current chart view.', 0),
(182, 43, 38, 77, '4.1', 'Develop your hub.', NULL, 0),
(183, 42, 38, 80, '5.1', 'Update the documentation', 'Clarify from the interns which sections of the documentation did not work and update the document the document.', 0),
(184, 42, 38, 183, '5.1.1', 'Php Documentation.', NULL, 0),
(185, 42, 38, 183, '5.1.2', 'Update xampp documentation', 'Update xampp documentation there are some steps missing and other arent clear.', 0),
(186, 42, 38, 183, '5.1.3', 'Database connector for Netbeans.', NULL, 0),
(187, 42, 38, 183, '5.1.4', 'How to create a new project in Netbeans.', NULL, 0),
(202, 8, 39, NULL, '1.1', 'Remove the color(Green)', 'significant color are pink, sky blue', 0),
(203, 8, 39, NULL, '1.2', 'Ranking of students', '(by subject, alphabetical, summaries)', 0),
(204, 8, 39, NULL, '1.3', 'Color coding', 'Hide values(the raw numbers ie values) and only show relevant colors in the respective cells. ', 0),
(205, 8, 39, NULL, '1.4', 'upload to the server the school system', NULL, 0),
(206, 8, 39, 126, '1.5', 'Complete the \'edit-score\' option', ' by implementing the save method using the questionnaire library', 0),
(207, 8, 39, 127, '1.6', 'Add option for creating and capturing exam results', 'by extending the \'edit-score\' option', 0),
(208, 8, 39, NULL, '1.7', 'Add the left and bottom margin summaries', 'thus extending the worksheet', 0),
(209, 8, 39, NULL, '1.8', 'Hide user', 'selected factor levels from display - This will allow users to focus on what matters at the time.Consider using checkboxes for filter.select options', 0),
(210, 8, 39, 131, '1.9', 'Students graduation.', 'Consider the fact that students graduate from one grade to another after an year by creating new progressions.', 0),
(211, 9, 39, 113, '2.1', 'Investigate on NEMIS documentation', ' To see similarities and differences with reference to your shule system', 0),
(212, 11, 39, NULL, '3.1', 'Do a query', 'where (add relevant numbers 1 -4 which will show colors on each blank value in the contributions)', 0),
(213, 11, 39, 122, '3.2', 'Add a button', 'For showing detailed and non detailed output', 0),
(214, 81, 39, NULL, '4.1', 'Include additional info', 'Add the subscription - rather what the client paid for', 0),
(215, 81, 39, NULL, '4.2', 'Color code to show balances', NULL, 0);

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
(39, 6, 38, '2023-06-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project` int NOT NULL,
  `work plan` int DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `outcome` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project`, `work plan`, `name`, `problem`, `plan`, `outcome`) VALUES
(1, 6, 'Chat', 'Real-time communication between users has been a problem with the Mutall Outlook/Schema Library.With WebSockets, as a compliment to the existing messaging system .i.e, the Mutall Messaging and Emailing System.The development of the Chat System will enable real time communication and an application that will Rival WhatsApp.', 'Develop a Chat System so well established that it will compete with WhatsApp and our users will instead use the Mutall Chat(For lack of a better naming) instead.', 'http://206.189.207.206/sockets'),
(2, 6, 'Payment', 'With the introduction of Cashless payments systems such as Mobile Payments and Bank Payments on the go, at Mutall we are faced with the management of transactions made/done on our platform. Introducing and Integrating mobile payments is a good way of managing mobile payments.', 'Develop a payment system that Integrates, M-PESA, EQUITY BANK TRANSFER, and PayPal', NULL),
(3, 6, 'Accounting', 'Handling Transactions within our applications has become a huge problem which has prevented us from managing further payments done within our system.', 'Develop an Accounting system, that can effectively manage the transactions done on our platform.', NULL),
(4, 6, 'Documentation', 'Code Developed 2-3years ago of the MUTALL system has no point of reference. This makes it harder to introduce New Interns into our Library with the aim of enlisting their help to develop the system or utilize the existing framework to develop projects to Solve their Problems.Documenting to Release the tutorials and guidelines will make it easier to onboard Interns and motivate developer across the world to use our Framework.', 'Provide Documentation for our Schema and methods of accessing the Schema directly.Develop a documentation System that allows collaboration through out the documentation process Publish the documented classes & Methods to the world', 'http://206.189.207.206/documentation/v/monaco/'),
(5, 6, 'Image Management', 'The Mutall Carpark system is a good avenue of image management learning and practise.Currently, there is a pool of image data just waiting to be utilized, and with proven techniques, it is possible to manage the vehicle images and extend their usage to develop an automated system that captures vehicle number plates as they leave or enter the Mutall Business Center.', 'An Image management System that will help us manage Images collected within our carpark system.', NULL),
(6, 6, 'Speech Recognition', 'Transferring audio recordings or podcasts to a word document(transcription) is such a tedious task and in audio with multiple languages, translation becomes a harder task especially if the translator does not understand another language apart from the primary language in the audio.', 'Build a mobile/web application that will allow users to generate audio transcriptions from multiple ethnicities.', NULL),
(7, 6, 'Portfolio', 'Exposing visible projects to the world is a not possible by just showing code from Github. Sure, developers will know from the webpage, but my primary focus is how I solved a problem, and that way, I can get more clients to help promote my skills as I solve problems relevant to their businesses.', 'Build a portfolio web app that will illustrate my problem solving capacity and capability in identifying and solving real world problems.', 'Demonstrations will also be part of the illustrating the solved problems packaged within either a mobile or web application.'),
(8, 1, 'Shule', 'Design, add a label for ticking, next to the crestlet row. Customization, different pages should be created from one page the main one, the others can be created by dragging the the factors to the page header or row factor. Have a restore button when a filter is selected and an empty page appers, this takes the user back to the previous populated page. Arranging the code in a object oriented manner that will help us navigate through the code using classes and their methods. Fixing a wrong input by allowing editing of results on the web-page ', 'The plan is to develop a system that will be user-friendly ', 'The system will help in managing school results and make it easier to retrieve results anytime and anywhere. The school can also load scores that are not in the system. Get better managed code that will be easy to manage, debug and teach'),
(9, 1, 'School Research', 'Identify Problems that schools are facing which may be finance related, book keeping, communicating to parents etc', 'See if there are other school problems i can solve using a system to make their work easier ', 'Help the school easily manage their resources without much effort.'),
(10, 1, 'SheetJs', 'Unable to load excel files directly to the database ', 'Using SheetJS library we can read and display excel data in HTML Table ', 'Data loaded directly from excel'),
(11, 1, 'Chama', 'Add the crown part, add a column selector, add a start date to every member, reload the data ', 'Work on chama system and have funtionalities that will help the user navigate through the application and in future be able to add their contributions', 'Have a system that is easier to navigate and that is presentable both on phone and big screen'),
(12, 2, 'Kentionary', 'There is a language barrier in Kenya where people from different ethnic groups experience challenges in communicating especially if they are not fluent in Kenyas official languages.', 'The plan is to have a platform that helps in translating Kenyan local languages.', 'This may facilitate better communication between people from the different ethnic groups.'),
(13, 2, 'Sacco Application', 'The sacco company has no dynamic way to capture members information, they register new users through excel work book and that is how they store the data.', 'The plan is to build them a simple application that will be useful in registering new users, even on-the-go, using a mobile phone.', 'Hopefully the application helps simplifies the companys way of operation and helps it gain more traction.'),
(14, 2, 'Church Application', 'There is a challenge of registering new users or new believers hence following up on them may be difficult. New church members/believers are registered in a book Also, when having meetings, e.g., members who attend leaders meetings register themselves in a book. So unless someone has the book, you can not know the attendees.', 'The plan is to have a platform that can help in digitally registering new users/believers. The platform can also process/analyze the data provided, e.g., show the attendance trends.', 'Hopefully the application will help the church handle the data it collects in digital way.'),
(39, 4, 'Kiama Kia Ma', 'The Kiama Kia Ma group has alot of data currently on their whatsApp groups and other platforms but its not easy to manage all of it.', 'To develop a website to hold their content, show various sub groups with their officials and members.', 'Hoping at the end of the year will have a working website showing all officials and the website will also replace circumcision posters.'),
(40, 4, 'Mashamba', 'My client doesnt have a website to display his properties, buildings.', 'Have a website to show the lands\' location, value and other details.', 'Have a website where his clients can view properties with ease and also contact the seller.'),
(41, 4, 'Fitness Tracker', 'Problem at hand is I dont have an app for tracking my fitness journey, with i hope the app will help in checking my body weight and height progress, my body muscle progresss, my BMI progress, my set and reps progress, my dieting progress.', 'The plan is to build them a simple site to help in keep a track of my fitness journey', 'Hopefully it will aid in setting more goals in gym, helping out in my daily diet, keep a track progress for my body.'),
(42, 4, 'Interns Getting Started Documentation', 'Currently Mutall Data group doesnt have a documentation on how to install various softwares with their various configurations.', 'To create one to aid interns in installing the softwares on their systems easily.', 'It will help interns and other mutall data users install the softwares with ease.'),
(43, 4, 'KibeHub', 'Dont have a website to showcase my projects and also how to reach me.', 'Create a website page to have all my complete projects, my CV and my contacts information', 'It will help clients reach me easily.'),
(44, 4, 'Journal', 'Unable to manage your daily activities and tasks.Unable to track your goals and set new ones.Unable to see milestones achieved.Unable to see your daily emotions', 'The plan is to help in managing your activities and goals, see which goals/tasks are completed and which others arent.', 'With this application it will me productive in knowing which tasks i have to complete and how i will complete them and when they should be completed.'),
(45, 5, 'Imagery', 'Fragmented images that have no orderly or systemic retrieval', 'Build a repository that houses all the image data in Mutall company', 'A central repository where users can access all the image data in Mutall company'),
(46, 9, 'Ranics system', 'The current system does not provide information on how long a car stays in parking, how many of the cars parked are of people visiting the bank and the duration they stay in the bank. We also need to find out if it\'ll be economical to charge the car park.', 'The plan is to incorporate data analysis techniques to Ranics and improve its features on data analytics.', 'The new system will be able to determine how much to charge the car park users based on how long they stay and also answer the question of whether it is prolific.'),
(47, 9, 'Ordination contribution list', 'The problem is presentation of large amounts of video data.', 'The plan is to use svg and video editing techniques to make the video data presentable.', 'The plan is to use svg and video editing techniques to make the video data presentable.'),
(59, 12, 'Metavisio Application', 'Mutall Data Managers cant visualize the data models/class diagrams in the 8.1 version', 'Do an application by the name metavisuo to aid in diagram generation. Acquire more knowledge on SVG,Js,Ts', NULL),
(60, 12, 'tracker', 'Research on how to use github to track changes and my projects', 'git knowledge', NULL),
(61, 12, 'Registrar', 'There is conjestion and mismanagement of time esecially when the people turn up in large numbers and all have to be registered to be allowed to come in to the venue.', 'Build a registration system for self registration of members on arrival to the conference, In future think of building an entire management system apart from registration part, Think of how to assure security for members providing their details, Visit at least two conferences and call a person who have experience in conference management to aid in research on how they are managed.', NULL),
(62, 12, 'Masai Cafe website', 'Poor marketing strategies of the cafe, whereby currently they are depending on the facebook platform and whatsapp.', 'Improve the Maasai cafe website to include services like; Food/beverage marketing support, Food sales execution, Outside catering and many others', NULL),
(63, 13, 'Secure Parking', 'Plant and soil health in agriculture is a big neccessity,many detection of any anomalies are done too late after the damage has been done.', 'Use spectroscopy technology for detection of plant and soil health', NULL),
(64, 13, 'Smart Farming', 'Real time monitoring of farm conditions i.e Soil moisture ,alkalinity temperature and sending this parameters remotely to any location on a personal mobile.', 'Embracing technology in our Farms.', NULL),
(65, 10, 'Digital Imagery', 'Retrieval or locating specific images from a large database of images, Presentation of uploaded images that might be unclear and distorted, Large videos that are long and large increases the load time in a website when uploaded, Videos in a website need to be activated manually for them to play, Its hard managing a large pool of images and saving them locally', 'Work on image Indexing which will give me the ability to quickly search for and retrieve scanned images without having to manually comb through all the images, Use of different image processing and optimization APIs that offers a set of functions and tools to manipulate or change an image programmatically to use in my websites for better SEO performance through modifications, Video Processing/Editing where i will work on shortening long videos and also work on combining different videos and putting them together in an orderly arrangement, Use of javaScript to insert autoplay activities which will include the sound, I will use the google cloud storage facilities to store my data on the cloud where i can access it anywhere', 'Through Image Processing,i will be able to manage all my image and video data by ensuring that they are of the highest quality and arranged in a manner that it takes the shortest time to display and is clearly arranged in an orderly way. I will use the processed images to enhance my development in dynamic and interactive web pages that are visually appealing and user-friendly to the people accessing my websites.'),
(66, 10, 'Virtual Market', 'Many Livestock sellers have to haul their animals around the country so as to get to places where they can market their cattle for sale. Livestock buyers have a limited pool to choose from for their purchase of livestock, as they mostly have to choose from their local area. They lack a platform to connect them to people who want to check on the condition of the animals that they are buying or selling. They lack somewhere where they can be linked with animal buyers and sellers.', 'I will build a managed database system connecting all the livestock market stakeholders, which will have enough information to help the different individuals to make more informed decisions depending on their specific wants. I will build a dynamic website for my virtual market using a platform like wordpress that shortens the time taken in building a website.', 'The system will help the groups or individuals in getting clients for any services or goods that they may be offering'),
(67, 10, 'Intern Support', 'There is alot of images from different people that need to be managed properly', 'Building a database that will manage all the images from different individuals', 'The intern will at one hand learn mySql and also create a platform that will help manage pictures for different peoplein mutall.'),
(68, 10, 'Personal Goals', 'I have not yet set up my Academic goals or personal objectives related to my educational journey', 'I need to choose an institution where i can get certified for my targeted education goal', 'Earn a career credential or prepare for a certification with the Professional Certificate program'),
(69, 11, 'Oritech', 'Data recording-some data were not recorded, methods of recording data is wanting', 'create client excel tables with clients all data', 'have all clients in excel format, use the data to develop a customer relationship management systems'),
(70, 11, 'Invices', 'Generate past,current invoices by use of mobitech. Past and current ivoices have not been captured well data quality is low', 'improve data quality-by issuing invoices and recording all transctions, generate past invoices, generate current invoices, issue current ivoices to clients by use of mobitech, accept payments from sms messages, support payments from direct daraja api using paybill', 'automate the billing process, use the available data to create customer relationship management systems (CRM)'),
(71, 11, 'Passion', 'Use CRM approach to improve Oritech-improve communication with clients', 'develop intergrated system', 'Double my profit'),
(72, 11, 'Education', 'Gain data management skills to run Oritech successfully - improve skills i have', 'register on a course i.e satification diploma in IT', 'Diploma in IT/Membership of It proffessionals'),
(73, 11, 'Rentize', 'Rationalizing Mutall electricity bills - high bills', 'develop ideas on how to minimize high bills', 'educate users to save energies, adopt natural energy i.e solar energy,windmills, use less-energy using devices like led bulbs'),
(74, 11, 'Internship', 'Support(post-graduate) interns to be self-employed - inadequate sources of income', 'develop ideas how interns can be self-employed', 'interns be able to have extra income, create job opportunities to the interns and society'),
(75, 3, 'Timetable & Minutes', 'Minutes not well recorded and timetable needs improvement - The timetable does not display specific presenters for a day, The minutes are not well recorded.', 'Standardisation of minutes and improve the timetable - Display a specific presenter on the timetable. Make sure all the minutes are standardised. Split the presenter and the date. Record keeping for all presenters', 'Well recorded minutes and improved timetable - The timetable clearly displays who is required to present at a particular date. Minutes are well written and easily tracked'),
(76, 3, 'Personal goals', 'Improve my academics and skills - There is no clear indication of my goals in 2 years from my undergraduate. Think in terms of progressing with education,employability or starting a business.', 'Think of ways to achieve my goals in 2 years - Develop a personal project in an area that I have interest. Think about future eductaion goals i.e Masters and Certtification programmes', 'A developed solution to an identified problem, Start a Masters Program in an year and do more certifications after graduation'),
(77, 3, 'Ranics', 'Improve the data quality - No queries for checking data quality. The data is not being used sufficiently.', 'Write queries to check on data - Query the ranics database and check on the ranics software, Check whether Elias is following good data capturing practise', ' Improved data quality and utilised properly - Improved data quality. Data is being used properly'),
(78, 3, 'Metavisio', 'Metavisio not accessible from the timetable - Metavisio is not deployed', 'To deploy metavisio', 'Have a working metavisio application that is will be used by all interns'),
(79, 3, 'Support for interns', 'Interns not accustomed to work environment', 'Give help to interns - Help them in in their assignments and guiding them', 'Interns get used to work environment - The interns learn from their attachment'),
(80, 3, 'Portfolio', 'There is no hub which is like a main website which things related to my details, work and skills.', 'Develop a hub with all the details - Add the portfolio to the hub. Add own minutes to the hub. Add own projects to the hub. Add personal details to the hub.', 'A functional Sharonhub with all the details - A hub to showcase my works and details.'),
(81, 1, 'Oritech', 'Tabulation of oritech data', 'Display oritech data using school library', 'Well tabulated oritech data with invoices'),
(82, 6, 'Migration', 'Before the migration of our Library to PHP 8.1 , all our applications ran on PHP 7.4. Mutall Rental was hosted on a server that caused us issues, every now and then. Further more, we wanted to move to our DO server, and do away with our CO server. To this effect, the migration to DO from MutallCO and to PHP 8.1 from PHP 7.4 became wanting', 'Migrate the Mutall Rental from Mutall CO, to Digital Ocean. Upgrade Mutall Rental to work with PHP8.1 and deploy it on Digital Ocean. Later On, upgrade the MutallCO server to work with typescript and our library', NULL),
(83, 6, 'Intern Support', 'All our Interns / Attache\'s need to come to us with little to no knowledge of computing, and it is our job as Mutall Data Managers to help them cultivate good Data Management practices', 'Provide progressive support to interns in terms of Debugging, Motivation, Way forward, and help them become better developers using Standard Mutall Data Managers Operating procedures. Eventually, and with time, they will become professional data Managers', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work plan`
--

CREATE TABLE `work plan` (
  `work plan` int NOT NULL,
  `intern` int NOT NULL,
  `file` int NOT NULL,
  `link` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `work plan`
--

INSERT INTO `work plan` (`work plan`, `intern`, `file`, `link`) VALUES
(1, 6, 39, ''),
(2, 4, 40, ''),
(3, 16, 51, ''),
(4, 9, 42, ''),
(5, 12, 43, ''),
(6, 11, 44, ''),
(7, 1, 45, ''),
(8, 2, 46, ''),
(9, 10, 50, ''),
(10, 7, 48, ''),
(11, 15, 49, ''),
(12, 3, 52, ''),
(13, 8, 53, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`contribution`),
  ADD UNIQUE KEY `id` (`contribution`),
  ADD KEY `intern_id` (`intern`,`minute_item`),
  ADD KEY `minute_item` (`minute_item`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`copy`),
  ADD UNIQUE KEY `copy` (`copy`),
  ADD KEY `copy_2` (`copy`),
  ADD KEY `intern` (`intern`,`presentation`,`file`),
  ADD KEY `presentation` (`presentation`),
  ADD KEY `file` (`file`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file`),
  ADD UNIQUE KEY `file` (`file`);

--
-- Indexes for table `intern`
--
ALTER TABLE `intern`
  ADD PRIMARY KEY (`intern`),
  ADD UNIQUE KEY `id` (`intern`);

--
-- Indexes for table `minute`
--
ALTER TABLE `minute`
  ADD PRIMARY KEY (`minute`),
  ADD KEY `minute` (`minute`,`presentation`,`project`),
  ADD KEY `child_of` (`child_of`),
  ADD KEY `portfolio` (`project`),
  ADD KEY `presentation` (`presentation`),
  ADD KEY `minute_item` (`minute`,`project`);

--
-- Indexes for table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`presentation`),
  ADD UNIQUE KEY `id` (`presentation`),
  ADD KEY `intern_id` (`intern`),
  ADD KEY `file` (`file`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project`),
  ADD UNIQUE KEY `id` (`project`),
  ADD KEY `portfolio` (`project`),
  ADD KEY `portfolio_2` (`work plan`);

--
-- Indexes for table `work plan`
--
ALTER TABLE `work plan`
  ADD PRIMARY KEY (`work plan`),
  ADD KEY `intern` (`intern`,`file`),
  ADD KEY `file` (`file`),
  ADD KEY `portfolio` (`work plan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contribution`
--
ALTER TABLE `contribution`
  MODIFY `contribution` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `copy`
--
ALTER TABLE `copy`
  MODIFY `copy` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `intern`
--
ALTER TABLE `intern`
  MODIFY `intern` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `minute`
--
ALTER TABLE `minute`
  MODIFY `minute` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT for table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `presentation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `work plan`
--
ALTER TABLE `work plan`
  MODIFY `work plan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contribution`
--
ALTER TABLE `contribution`
  ADD CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `contribution_ibfk_2` FOREIGN KEY (`minute_item`) REFERENCES `minute` (`minute`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `copy_ibfk_3` FOREIGN KEY (`file`) REFERENCES `file` (`file`);

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
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`work plan`) REFERENCES `work plan` (`work plan`);

--
-- Constraints for table `work plan`
--
ALTER TABLE `work plan`
  ADD CONSTRAINT `work plan_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `work plan_ibfk_2` FOREIGN KEY (`file`) REFERENCES `file` (`file`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
