-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 11:26 AM
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
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `minute_item`
--

CREATE TABLE `minute_item` (
  `minute_item` int NOT NULL,
  `portfolio_item` int NOT NULL,
  `presentation` int NOT NULL,
  `child_of` int DEFAULT NULL,
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` varchar(50) NOT NULL,
  `detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `done` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE `portfolio` (
  `portfolio` int NOT NULL,
  `intern` int NOT NULL,
  `file` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_item`
--

CREATE TABLE `portfolio_item` (
  `portfolio_item` int NOT NULL,
  `intern` int NOT NULL,
  `portfolio` int DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `problem` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `plan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `outcome` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
-- Indexes for table `minute_item`
--
ALTER TABLE `minute_item`
  ADD PRIMARY KEY (`minute_item`),
  ADD KEY `minute` (`minute_item`,`presentation`,`portfolio_item`),
  ADD KEY `child_of` (`child_of`),
  ADD KEY `portfolio` (`portfolio_item`),
  ADD KEY `presentation` (`presentation`),
  ADD KEY `minute_item` (`minute_item`,`portfolio_item`);

--
-- Indexes for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`portfolio`),
  ADD KEY `intern` (`intern`,`file`),
  ADD KEY `file` (`file`),
  ADD KEY `portfolio` (`portfolio`);

--
-- Indexes for table `portfolio_item`
--
ALTER TABLE `portfolio_item`
  ADD PRIMARY KEY (`portfolio_item`),
  ADD UNIQUE KEY `id` (`portfolio_item`),
  ADD KEY `intern_id` (`intern`),
  ADD KEY `portfolio` (`portfolio_item`),
  ADD KEY `portfolio_2` (`portfolio`);

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
  MODIFY `file` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intern`
--
ALTER TABLE `intern`
  MODIFY `intern` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `minute_item`
--
ALTER TABLE `minute_item`
  MODIFY `minute_item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `portfolio` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolio_item`
--
ALTER TABLE `portfolio_item`
  MODIFY `portfolio_item` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `presentation` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contribution`
--
ALTER TABLE `contribution`
  ADD CONSTRAINT `contribution_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `contribution_ibfk_2` FOREIGN KEY (`minute_item`) REFERENCES `minute_item` (`minute_item`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `copy_ibfk_3` FOREIGN KEY (`file`) REFERENCES `file` (`file`);

--
-- Constraints for table `minute_item`
--
ALTER TABLE `minute_item`
  ADD CONSTRAINT `minute_item_ibfk_1` FOREIGN KEY (`portfolio_item`) REFERENCES `portfolio_item` (`portfolio_item`),
  ADD CONSTRAINT `minute_item_ibfk_2` FOREIGN KEY (`presentation`) REFERENCES `presentation` (`presentation`),
  ADD CONSTRAINT `minute_item_ibfk_3` FOREIGN KEY (`child_of`) REFERENCES `minute_item` (`minute_item`);

--
-- Constraints for table `portfolio`
--
ALTER TABLE `portfolio`
  ADD CONSTRAINT `portfolio_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`),
  ADD CONSTRAINT `portfolio_ibfk_2` FOREIGN KEY (`file`) REFERENCES `file` (`file`);

--
-- Constraints for table `portfolio_item`
--
ALTER TABLE `portfolio_item`
  ADD CONSTRAINT `portfolio_item_ibfk_1` FOREIGN KEY (`intern`) REFERENCES `intern` (`intern`);

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
