-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2023 at 04:59 PM
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
-- Database: `tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `contribution`
--

CREATE TABLE `contribution` (
  `contribution` int NOT NULL,
  `intern` int NOT NULL,
  `minute` int NOT NULL,
  `content` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `copy` int NOT NULL,
  `intern` int NOT NULL,
  `presentation` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `file` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
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
(33, 'weru_20230425.md');

-- --------------------------------------------------------

--
-- Table structure for table `intern`
--

CREATE TABLE `intern` (
  `intern` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(50) NOT NULL,
  `initials` varchar(2) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `intern`
--

INSERT INTO `intern` (`intern`, `name`, `surname`, `initials`, `day`) VALUES
(1, 'Andrew Mugambi', 'Mugambi', 'AM', 'Monday'),
(2, 'Bernard Muli', 'Muli', 'BM', 'Friday'),
(3, 'Carol Wawira', 'Wawira', 'CW', 'Wednesday'),
(4, 'Daniel Kaniu', 'Kaniu', 'DK', 'Friday'),
(5, 'Francis Nyakundi', 'Nyakundi', 'FN', 'Tuesday'),
(6, 'George Kangara', 'Kangara', 'GK', 'Monday'),
(7, 'George Munya', 'Munya', 'GM', 'Tuesday'),
(8, 'Isaac Waweru', 'Waweru', 'IW', 'Monday'),
(9, 'James Kiberenge', 'Kiberenge', 'JK', 'Thursday'),
(10, 'Joan Nduta', 'Nduta', 'JN', 'Thursday'),
(11, 'Peter Kamau', 'Kungu', 'PK', 'Friday'),
(12, 'Chris Ndungu', 'Kinyanjui', 'CK', 'Tuesday'),
(13, 'Simon Mwangi', 'Karanja', 'MK', 'Monday'),
(14, 'James Oyondi', 'Mogaka', 'JM', 'Monday'),
(15, 'Joseph Mwaniki', 'Mwaniki', 'JM', 'Friday'),
(16, 'Sharon Wanjiru', 'Wanjiru', 'SW', 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `minute`
--

CREATE TABLE `minute` (
  `minute` int NOT NULL,
  `portfolio` int NOT NULL,
  `presentation` int NOT NULL,
  `child_of` int DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` varchar(50) NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `done` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `portfolio` int NOT NULL,
  `intern` int NOT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `problem` varchar(255) NOT NULL,
  `plan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `outcome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `presentation`
--

CREATE TABLE `presentation` (
  `presentation` int NOT NULL,
  `intern` int NOT NULL,
  `file` int NOT NULL,
  `date` date NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `presentation`
--

INSERT INTO `presentation` (`presentation`, `intern`, `file`, `date`, `reason`) VALUES
(1, 16, 28, '2023-04-26', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contribution`
--
ALTER TABLE `contribution`
  ADD PRIMARY KEY (`contribution`),
  ADD UNIQUE KEY `id` (`contribution`),
  ADD KEY `intern_id` (`intern`,`minute`),
  ADD KEY `minute` (`minute`);

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
  ADD KEY `minute` (`minute`,`presentation`,`portfolio`),
  ADD KEY `child_of` (`child_of`),
  ADD KEY `portfolio` (`portfolio`),
  ADD KEY `presentation` (`presentation`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`portfolio`),
  ADD UNIQUE KEY `id` (`portfolio`),
  ADD KEY `intern_id` (`intern`),
  ADD KEY `portfolio` (`portfolio`);

--
-- Indexes for table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`presentation`),
  ADD UNIQUE KEY `id` (`presentation`),
  ADD KEY `intern_id` (`intern`),
  ADD KEY `file` (`file`);

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
  MODIFY `file` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `intern`
--
ALTER TABLE `intern`
  MODIFY `intern` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `minute`
--
ALTER TABLE `minute`
  MODIFY `minute` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `portfolio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `presentation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Constraints for table `minute`
--
ALTER TABLE `minute`
  ADD CONSTRAINT `minute_ibfk_1` FOREIGN KEY (`portfolio`) REFERENCES `portfolio` (`portfolio`),
  ADD CONSTRAINT `minute_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `minute_ibfk_3` FOREIGN KEY (`child_of`) REFERENCES `minute` (`minute`);

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`portfolio`) REFERENCES `intern` (`intern`);

--
-- Constraints for table `presentation`
--
ALTER TABLE `presentation`
  ADD CONSTRAINT `presentation_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `presentation_ibfk_2` FOREIGN KEY (`file`) REFERENCES `file` (`file`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
