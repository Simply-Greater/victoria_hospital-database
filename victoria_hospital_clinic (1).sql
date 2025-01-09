-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 05:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `victoria_hospital clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

CREATE TABLE `facility_type` (
  `Facility_type_ID` varchar(100) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL,
  `Date_Added` date DEFAULT current_timestamp(),
  `Date_Updated` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_facility`
--

CREATE TABLE `health_facility` (
  `Facility_ID` int(11) NOT NULL,
  `Facility_name` varchar(100) DEFAULT NULL,
  `Location_ID` int(11) NOT NULL,
  `Facility_type` int(11) NOT NULL,
  `Capacity` int(11) DEFAULT NULL,
  `Contact_Details` varchar(10) DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Facility_Head` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

CREATE TABLE `malaria_cases` (
  `Case_ID` int(11) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Facility_ID` int(11) DEFAULT NULL,
  `Date_of_Diagnosis` date NOT NULL,
  `Type_of_Malaria` varchar(50) DEFAULT NULL,
  `Treatment_ID` int(11) DEFAULT NULL,
  `Outcome_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_type`
--

CREATE TABLE `malaria_type` (
  `Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date DEFAULT NULL,
  `Added_By` int(11) NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_ID` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Gender` varchar(10) DEFAULT NULL CHECK (`Gender` in ('M','F')),
  `Phone_number` varchar(10) DEFAULT NULL,
  `Next_OF_kin` varchar(100) NOT NULL,
  `Location_ID` int(11) DEFAULT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visitor_records`
--

CREATE TABLE `visitor_records` (
  `Visit_ID` int(11) DEFAULT NULL,
  `Patient_ID` int(11) DEFAULT NULL,
  `Visit_number` int(11) DEFAULT NULL,
  `Visit_Date` date DEFAULT NULL,
  `Date_Added` date DEFAULT NULL,
  `Update_Date` date DEFAULT current_timestamp(),
  `Facillity_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD UNIQUE KEY `unique_facility_type` (`Facility_type`);

--
-- Indexes for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD UNIQUE KEY `Treatment_ID` (`Treatment_ID`);

--
-- Indexes for table `malaria_type`
--
ALTER TABLE `malaria_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_ID`),
  ADD UNIQUE KEY `Phone_number` (`Phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `malaria_type`
--
ALTER TABLE `malaria_type`
  MODIFY `Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
