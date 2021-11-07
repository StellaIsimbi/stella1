-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 12:06 PM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `beam`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE IF NOT EXISTS `agent` (
  `Agent_No` int(11) NOT NULL,
  `Given_Name` varchar(30) NOT NULL,
  `Family_Name` varchar(30) NOT NULL,
  `Contact` varchar(11) NOT NULL,
  PRIMARY KEY (`Agent_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`Agent_No`, `Given_Name`, `Family_Name`, `Contact`) VALUES
(111, 'John', 'Ripov', '0203 456789'),
(222, 'Mary', 'Dancing', '0765 432024'),
(333, 'Anil', 'Rating', '0121 213032'),
(444, 'Lim', 'Popo', '0911 234543'),
(555, 'Mary', 'Ripov', '0203 456789');

-- --------------------------------------------------------

--
-- Table structure for table `band`
--

CREATE TABLE IF NOT EXISTS `band` (
  `Name` varchar(30) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Agent_No` int(11) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `fk_Band_Agent_idx` (`Agent_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `band`
--

INSERT INTO `band` (`Name`, `Description`, `Agent_No`) VALUES
('Future Explosion', 'Heavy Rock', 444),
('Green Dragons', 'Heavy Rock', 222),
('Killers', 'Heavy Rock', 555),
('Lazy Dancers', 'Garage', 111),
('The Vultures', 'Easy Listening', 333),
('Wellies', 'Easy Listening', 333);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `Member_ID` int(11) NOT NULL,
  `GIven_Name` varchar(30) NOT NULL,
  `Family_Name` varchar(30) NOT NULL,
  `job_type` varchar(20) NOT NULL,
  `Title` varchar(8) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Band_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Member_ID`),
  KEY `fk_Members_Band1_idx` (`Band_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`Member_ID`, `GIven_Name`, `Family_Name`, `job_type`, `Title`, `Status`, `Band_Name`) VALUES
(1111, 'Helen', 'Miranda', 'Lead Guitar', 'Ms', 'Active', 'Green Dragons'),
(1234, 'Jose', 'Jose Alves', 'Bass Guitar', 'Mr', 'Active', 'Green Dragons'),
(1333, 'Vito', 'Gelato', 'Voice Coach', 'Dr', 'Active', 'Wellies'),
(1344, 'Guy', 'Raymond', 'Make -up', 'Dr', 'Active', 'Killers'),
(1444, 'Maria', 'Partou', 'Vocals', 'Ms', 'Active', 'Wellies'),
(2111, 'Lindsay', 'White', 'Dancer', 'Ms', 'Cancelled', 'Future Explosion'),
(2121, 'David', 'Wilkinson', 'Backing', 'Mr', 'Cancelled', 'The Vultures'),
(3333, 'Olenka', 'Sama', 'Sound Tech', 'Ms', 'Active', 'Killers'),
(4545, 'Lee ', 'Ping', 'Lead Guitar', 'Ms', 'Active', 'Lazy Dancers'),
(5555, 'Sing', 'Song', 'Vocals', 'Ms', 'Active', 'The Vultures'),
(7271, 'Dan', 'Deary', 'Make up', 'Mr', 'Active', 'Wellies');

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE IF NOT EXISTS `performance` (
  `Band_Name` varchar(30) NOT NULL,
  `Stage_No` int(11) NOT NULL,
  `Performance_ID` int(10) NOT NULL,
  `Date_Time` datetime NOT NULL,
  PRIMARY KEY (`Performance_ID`),
  KEY `fk_Band_has_Stage_Stage1_idx` (`Stage_No`),
  KEY `fk_Band_has_Stage_Band1_idx` (`Band_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`Band_Name`, `Stage_No`, `Performance_ID`, `Date_Time`) VALUES
('Wellies', 1, 1, '2020-06-25 10:00:00'),
('Wellies', 2, 2, '2020-06-25 18:00:00'),
('The Vultures', 1, 3, '2020-06-27 12:00:00'),
('Wellies', 3, 4, '2020-06-26 18:00:00'),
('The Vultures', 3, 5, '2020-06-26 15:00:00'),
('Killers', 1, 6, '2020-06-25 13:00:00'),
('Wellies', 5, 7, '2020-06-26 13:00:00'),
('The Vultures', 6, 8, '2020-06-27 13:00:00'),
('Killers', 2, 9, '2020-06-26 13:00:00'),
('Green Dragons', 4, 10, '2020-06-25 16:00:00'),
('Wellies', 1, 11, '2020-06-27 14:00:00'),
('Lazy Dancers', 4, 12, '2020-06-25 17:00:00'),
('Green Dragons', 6, 13, '2020-06-26 18:00:00'),
('Lazy Dancers', 4, 14, '2020-06-26 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE IF NOT EXISTS `stage` (
  `Stage_No` int(11) NOT NULL,
  `Stage_Name` varchar(25) NOT NULL,
  `Capacity` varchar(8) NOT NULL,
  PRIMARY KEY (`Stage_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`Stage_No`, `Stage_Name`, `Capacity`) VALUES
(1, 'John Peel', '20'),
(2, 'The Bowl', '10'),
(3, 'Main', '30'),
(4, 'The Oasis', '20'),
(5, 'Jam Session', '3'),
(6, 'Premium', '50');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`first_name`, `last_name`, `username`, `password`, `user_id`) VALUES
('Sushmita', 'Kumari', 'Sushmita', '202cb962ac59075b964b07152d234b70', 1),
('Joss', 'Ramos', 'Joss', '81dc9bdb52d04dc20036dbd8313ed055', 2),
('Amber', 'Agnes', 'Amber', '202cb962ac59075b964b07152d234b70', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `band`
--
ALTER TABLE `band`
  ADD CONSTRAINT `fk_Band_Agent` FOREIGN KEY (`Agent_No`) REFERENCES `agent` (`Agent_No`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `fk_Members_Band1` FOREIGN KEY (`Band_Name`) REFERENCES `band` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `fk_Band_has_Stage_Band1` FOREIGN KEY (`Band_Name`) REFERENCES `band` (`Name`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Band_has_Stage_Stage1` FOREIGN KEY (`Stage_No`) REFERENCES `stage` (`Stage_No`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
