-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 04, 2025 at 02:37 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HotelFinalProject`
--

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `Cust_Email` char(30) DEFAULT NULL,
  `Cust_Name` char(30) DEFAULT NULL,
  `Cust_ID` char(30) NOT NULL,
  `DOB` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`Cust_Email`, `Cust_Name`, `Cust_ID`, `DOB`) VALUES
('john.doe@gmail.com', 'John Doe', 'C001', '1990-01-15');

-- --------------------------------------------------------

--
-- Table structure for table `Emp_Name`
--

CREATE TABLE `Emp_Name` (
  `First_Name` char(30) DEFAULT NULL,
  `Last_Name` char(30) DEFAULT NULL,
  `Employee_ID` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Hotel`
--

CREATE TABLE `Hotel` (
  `Hotel_Registration` char(30) NOT NULL,
  `Rooms_Count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Hotel`
--

INSERT INTO `Hotel` (`Hotel_Registration`, `Rooms_Count`) VALUES
('H001', 100),
('H002', 50);

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE `Location` (
  `Street` char(30) DEFAULT NULL,
  `Postal` char(15) DEFAULT NULL,
  `City` char(30) DEFAULT NULL,
  `Hotel_Registration` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `Payment_ID` char(30) NOT NULL,
  `Cust_ID` char(30) DEFAULT NULL,
  `Amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Reservation`
--

CREATE TABLE `Reservation` (
  `Reservation_ID` char(30) NOT NULL,
  `Hotel_Registration` char(30) DEFAULT NULL,
  `Cust_ID` char(30) DEFAULT NULL,
  `Check_Out` char(15) DEFAULT NULL,
  `Check_In` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `Rating` int DEFAULT NULL,
  `Hotel_Registration` char(30) DEFAULT NULL,
  `Cust_ID` char(30) DEFAULT NULL,
  `Review_ID` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `Hotel_Registration` char(30) NOT NULL,
  `Room_Num` int NOT NULL,
  `Floor` int DEFAULT NULL,
  `Bathrooms` int DEFAULT NULL,
  `Beds` int DEFAULT NULL,
  `Reservation_ID` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `Employee_ID` char(30) NOT NULL,
  `Position` char(15) DEFAULT NULL,
  `Hotel_Registration` char(30) DEFAULT NULL,
  `Tenure` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Uses`
--

CREATE TABLE `Uses` (
  `Cust_ID` char(30) NOT NULL,
  `Hotel_Registration` char(30) NOT NULL,
  `Visits` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`Cust_ID`);

--
-- Indexes for table `Emp_Name`
--
ALTER TABLE `Emp_Name`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`Hotel_Registration`);

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`Hotel_Registration`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`Reservation_ID`),
  ADD KEY `fkReservation1` (`Hotel_Registration`),
  ADD KEY `fkReservation2` (`Cust_ID`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `fkReview1` (`Hotel_Registration`),
  ADD KEY `fkReview2` (`Cust_ID`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`Hotel_Registration`,`Room_Num`),
  ADD KEY `fkRoom2` (`Reservation_ID`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `Uses`
--
ALTER TABLE `Uses`
  ADD PRIMARY KEY (`Cust_ID`,`Hotel_Registration`),
  ADD KEY `fkUses2` (`Hotel_Registration`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Emp_Name`
--
ALTER TABLE `Emp_Name`
  ADD CONSTRAINT `emp_name_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `Staff` (`Employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Hotel_Registration`) REFERENCES `Hotel` (`Hotel_Registration`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `fkReservation1` FOREIGN KEY (`Hotel_Registration`) REFERENCES `Hotel` (`Hotel_Registration`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkReservation2` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `fkReview1` FOREIGN KEY (`Hotel_Registration`) REFERENCES `Hotel` (`Hotel_Registration`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkReview2` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Room`
--
ALTER TABLE `Room`
  ADD CONSTRAINT `fkRoom1` FOREIGN KEY (`Hotel_Registration`) REFERENCES `Hotel` (`Hotel_Registration`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkRoom2` FOREIGN KEY (`Reservation_ID`) REFERENCES `Reservation` (`Reservation_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Uses`
--
ALTER TABLE `Uses`
  ADD CONSTRAINT `fkUses1` FOREIGN KEY (`Cust_ID`) REFERENCES `Customer` (`Cust_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkUses2` FOREIGN KEY (`Hotel_Registration`) REFERENCES `Hotel` (`Hotel_Registration`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
