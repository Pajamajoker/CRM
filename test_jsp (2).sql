-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 30, 2019 at 11:48 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_jsp`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmpID`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNum`) VALUES
(1, 'Pratham', 'Josh', 'jp@gmail.com', 'Nilgiri chowk,Pune', '8812345678'),
(2, 'Shib', 'Likh', 'sl@gmail.com', 'Kothrud,Pune', '9912345567'),
(3, 'Ishi', 'Jain', 'ij@gmail.com', 'Gandhi Nagar,Udaipur', '7812346657');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
CREATE TABLE IF NOT EXISTS `leads` (
  `LeadID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `PhoneNum` varchar(12) NOT NULL,
  `Status` int(11) NOT NULL,
  `Nature` int(11) NOT NULL,
  `Requirement` varchar(60) DEFAULT NULL,
  `Next_action` varchar(30) DEFAULT NULL,
  `Next_action_date` date NOT NULL,
  `TypeID` int(11) DEFAULT NULL,
  `EmpID` int(11) NOT NULL,
  `CreditCat` int(11) NOT NULL,
  PRIMARY KEY (`LeadID`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`LeadID`, `FirstName`, `LastName`, `Email`, `Address`, `PhoneNum`, `Status`, `Nature`, `Requirement`, `Next_action`, `Next_action_date`, `TypeID`, `EmpID`, `CreditCat`) VALUES
(1, 'Prathamesh', 'Joshi', 'prathamesh.98223@gmail.com', 'Nilgiri Chowk,Pune-46', '8805020280', 2, 1, 'A good product recommendation', 'call', '2019-09-20', 1, 1, 1),
(2, 'Gaurav', 'Kshirsagar', 'gkshirsagar1999@gmail.com', 'some useless place,PCMC', '8888123456', 2, 2, 'lots of requirements', 'email', '2019-09-20', 3, 1, 2),
(5, 'Mickey', 'Mouse', 'mickey@gmail.com', 'PICT,Pune,46', '1234567890', 2, 1, 'miney mouse', 'call', '2019-09-20', 2, 3, 3),
(6, 'Alrik', 'Fernandes', 'alrik.fernandes@gmail.com', 'swargate,pune', '12432567890', 3, 3, 'loan', 'call', '2019-09-20', 2, 1, 1),
(7, 'manav', 'Chordia', 'manavc@gmail.com', 'IUCAA,Pune', '1234567899', 2, 2, 'Someone,anyone will do', 'call', '2019-09-20', 1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `loandetails`
--

DROP TABLE IF EXISTS `loandetails`;
CREATE TABLE IF NOT EXISTS `loandetails` (
  `TypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  `InterestRate` float NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loandetails`
--

INSERT INTO `loandetails` (`TypeID`, `Type`, `InterestRate`) VALUES
(1, 'HomeLoan', 8.5),
(2, 'VehicleLoan', 10.5),
(3, 'EducationLoan', 10.75);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `LoaneeID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `EmpID` int(11) NOT NULL,
  `Duration` float NOT NULL,
  `Principal` double NOT NULL,
  `Monthly_inst` double NOT NULL,
  `Amt_paid` double NOT NULL,
  PRIMARY KEY (`LoaneeID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `pass` varchar(20) DEFAULT NULL,
  `EmpID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`EmpID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`pass`, `EmpID`) VALUES
('1234', 1),
('shibani', 2),
('ishita', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
