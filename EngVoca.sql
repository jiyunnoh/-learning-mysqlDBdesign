-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2019 at 08:14 PM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `EngVoca`
--

-- --------------------------------------------------------

--
-- Table structure for table `Courses`
--

CREATE TABLE IF NOT EXISTS `Courses` (
  `CourseID` int(11) NOT NULL,
  `CourseName` varchar(255) DEFAULT NULL,
  `CourseDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Courses`
--

INSERT INTO `Courses` (`CourseID`, `CourseName`, `CourseDescription`) VALUES
(101, 'TOEFL', 'For users who take a TOEFL test as a foreigner'),
(102, 'TOEIC', 'For users who take a TOEIC test in South Korea'),
(103, 'SAT', 'For users who take a SAT test in USA to go to colleges'),
(104, 'Police Officer Test', 'For users who take a police officer test '),
(105, 'Government Officer test', 'For users to take a government officer test');

-- --------------------------------------------------------

--
-- Table structure for table `Discounts`
--

CREATE TABLE IF NOT EXISTS `Discounts` (
  `DiscountID` int(11) NOT NULL,
  `Discount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Discounts`
--

INSERT INTO `Discounts` (`DiscountID`, `Discount`) VALUES
(111, '0'),
(112, '5'),
(113, '10'),
(114, '15'),
(115, '20');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Nickname-password`
--
CREATE TABLE IF NOT EXISTS `Nickname-password` (
`UserNickName` varchar(255)
,`UserPassword` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `OrderDetails`
--

CREATE TABLE IF NOT EXISTS `OrderDetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `DiscountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `OrderID` (`OrderID`),
  KEY `CourseID` (`CourseID`),
  KEY `DiscountID` (`DiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailID`, `OrderID`, `CourseID`, `DiscountID`) VALUES
(500, 1000, 101, 112),
(501, 1001, 102, 112),
(502, 1002, 103, 113),
(503, 1003, 104, 113),
(504, 1004, 105, 112);

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `OrderID` int(11) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `ExpireDate` date DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `PlanID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `PlanID` (`PlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `StartDate`, `ExpireDate`, `UserID`, `PlanID`) VALUES
(1000, '2019-04-01', '2019-04-07', 1, 200),
(1001, '2019-05-14', '2019-05-20', 2, 200),
(1002, '2019-02-04', '2019-03-04', 3, 201),
(1003, '2019-05-29', '2019-11-29', 4, 202),
(1004, '2019-05-12', '2019-06-12', 5, 202);

-- --------------------------------------------------------

--
-- Table structure for table `Plans`
--

CREATE TABLE IF NOT EXISTS `Plans` (
  `PlanID` int(11) NOT NULL,
  `PlanType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PlanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Plans`
--

INSERT INTO `Plans` (`PlanID`, `PlanType`) VALUES
(200, 'a 7-days free trial'),
(201, '1 month'),
(202, '6 month'),
(203, '1 year'),
(204, 'a life-long');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Start-ExpireDate`
--
CREATE TABLE IF NOT EXISTS `Start-ExpireDate` (
`OrderDetailID` int(11)
,`StartDate` date
,`ExpireDate` date
);
-- --------------------------------------------------------

--
-- Table structure for table `Subscriptions`
--

CREATE TABLE IF NOT EXISTS `Subscriptions` (
  `SubscriptionID` int(11) NOT NULL,
  `Subscription` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`SubscriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Subscriptions`
--

INSERT INTO `Subscriptions` (`SubscriptionID`, `Subscription`) VALUES
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `TOEFL`
--
CREATE TABLE IF NOT EXISTS `TOEFL` (
`CourseID` int(11)
,`CourseName` varchar(255)
,`CourseDescription` varchar(255)
);
-- --------------------------------------------------------

--
-- Table structure for table `UserCourses`
--

CREATE TABLE IF NOT EXISTS `UserCourses` (
  `UserID` int(11) NOT NULL DEFAULT '0',
  `CourseID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`CourseID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserCourses`
--

INSERT INTO `UserCourses` (`UserID`, `CourseID`) VALUES
(1, 101),
(1, 102),
(2, 104),
(3, 105),
(4, 105);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `UserID` int(11) NOT NULL,
  `UserFirstName` varchar(255) DEFAULT NULL,
  `UserLastName` varchar(255) DEFAULT NULL,
  `UserNickName` varchar(255) DEFAULT NULL,
  `UserPassword` varchar(255) DEFAULT NULL,
  `UserPhoneNumber` varchar(14) DEFAULT NULL,
  `UserEmail` varchar(50) DEFAULT NULL,
  `SubscriptionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `SubscriptionID` (`SubscriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `UserFirstName`, `UserLastName`, `UserNickName`, `UserPassword`, `UserPhoneNumber`, `UserEmail`, `SubscriptionID`) VALUES
(1, 'Jiyun', 'Noh', 'jiyunnoh', 'a1234567890', '2365840694', 'j.noh@gmail.com', 300),
(2, 'Michael', 'Kim', 'michaelk', '102938475a', '2984738495', 'm.kim@gmail.com', 300),
(3, 'Elisa', 'DelRosario', 'elisa', 'a23456532', '23495784958', 'e.delrosario@gmail.com', 300),
(4, 'Mina', 'Lee', 'mina', 'a102347653', '2097374958', 'm.lee@gmail.com', 304),
(5, 'Rebecca', 'Harp', 'becca', 'a9874758693', '2349768592', 'r.harp@gmail.com', 304);

-- --------------------------------------------------------

--
-- Table structure for table `Vocabulary`
--

CREATE TABLE IF NOT EXISTS `Vocabulary` (
  `VocabID` int(11) NOT NULL,
  `Vocab` varchar(255) DEFAULT NULL,
  `VocabLevel` varchar(10) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`VocabID`),
  KEY `CourseID` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Vocabulary`
--

INSERT INTO `Vocabulary` (`VocabID`, `Vocab`, `VocabLevel`, `CourseID`) VALUES
(400, 'abstract', '1', 101),
(401, 'abandon', '2', 102),
(402, 'cultivation', '3', 102),
(403, 'intensify', '4', 103),
(404, 'photosynthesis\r\n', '5', 104);

-- --------------------------------------------------------

--
-- Structure for view `Nickname-password`
--
DROP TABLE IF EXISTS `Nickname-password`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jiyunnoh`@`%` SQL SECURITY DEFINER VIEW `Nickname-password` AS select `Users`.`UserNickName` AS `UserNickName`,`Users`.`UserPassword` AS `UserPassword` from `Users`;

-- --------------------------------------------------------

--
-- Structure for view `Start-ExpireDate`
--
DROP TABLE IF EXISTS `Start-ExpireDate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jiyunnoh`@`%` SQL SECURITY DEFINER VIEW `Start-ExpireDate` AS select `OrderDetails`.`OrderDetailID` AS `OrderDetailID`,`Orders`.`StartDate` AS `StartDate`,`Orders`.`ExpireDate` AS `ExpireDate` from (`OrderDetails` join `Orders` on((`OrderDetails`.`OrderID` = `Orders`.`OrderID`)));

-- --------------------------------------------------------

--
-- Structure for view `TOEFL`
--
DROP TABLE IF EXISTS `TOEFL`;

CREATE ALGORITHM=UNDEFINED DEFINER=`jiyunnoh`@`%` SQL SECURITY DEFINER VIEW `TOEFL` AS select `Courses`.`CourseID` AS `CourseID`,`Courses`.`CourseName` AS `CourseName`,`Courses`.`CourseDescription` AS `CourseDescription` from `Courses` where (`Courses`.`CourseName` = 'TOEFL');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD CONSTRAINT `OrderDetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`),
  ADD CONSTRAINT `OrderDetails_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`),
  ADD CONSTRAINT `OrderDetails_ibfk_3` FOREIGN KEY (`DiscountID`) REFERENCES `Discounts` (`DiscountID`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `Orders_ibfk_2` FOREIGN KEY (`PlanID`) REFERENCES `Plans` (`PlanID`);

--
-- Constraints for table `UserCourses`
--
ALTER TABLE `UserCourses`
  ADD CONSTRAINT `UserCourses_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `UserCourses_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `Users_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `Subscriptions` (`SubscriptionID`);

--
-- Constraints for table `Vocabulary`
--
ALTER TABLE `Vocabulary`
  ADD CONSTRAINT `Vocabulary_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `Courses` (`CourseID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
