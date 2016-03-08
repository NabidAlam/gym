-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2016 at 12:53 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'sraboni', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `package_id` int(11) NOT NULL,
  `qualification` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`id`, `name`, `package_id`, `qualification`) VALUES
(1, 'Rahim Ahmed', 2, 'Expert muscle building exercise instructor. Widely acclaimed for body building consultancy.'),
(2, 'Rina Karim', 3, 'Expert power yoga instructor.Experience of over 5 years. '),
(3, 'Khadija Sultana', 4, 'Expert aerobics instructor. Over 4 years of experience. '),
(4, 'Rayhana Khatun', 6, 'Expert Cardio trainer with 6 years experience. Efficient in muscle building & fat burning training.'),
(5, 'Hasib Ahmed', 6, 'He is an expert in this criteria');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `registration_id` int(10) NOT NULL,
  `package_id` int(10) NOT NULL,
  `instructor_id` int(11) NOT NULL,
  `diet_plan` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`registration_id`, `package_id`, `instructor_id`, `diet_plan`) VALUES
(1, 2, 1, 'Diet Plan'),
(2, 1, 0, 'You have no diet plan yet'),
(3, 1, 0, 'You have no diet plan yet'),
(4, 1, 0, 'You have no diet plan yet'),
(5, 1, 0, 'you have no diet plan yet'),
(6, 1, 0, 'None'),
(8, 1, 0, 'you have no diet plan yet');

-- --------------------------------------------------------

--
-- Table structure for table `member_query`
--

CREATE TABLE IF NOT EXISTS `member_query` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `problem_date` date NOT NULL,
  `solution` varchar(255) NOT NULL,
  `solution_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member_query`
--

INSERT INTO `member_query` (`id`, `member_id`, `problem`, `problem_date`, `solution`, `solution_date`) VALUES
(1, 1, 'I am confused about the package choice process.', '2016-02-03', 'Just select your desired package from the package list and press choose button.', '2016-02-03'),
(2, 1, 'Will the gym be closed during Sharashwati Puja?', '2016-02-03', 'Yes', '2016-02-03'),
(3, 1, 'Inv fbfhnrg', '2016-02-03', 'Pending', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `fee` int(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `description`, `gender`, `schedule`, `fee`) VALUES
(1, 'Machine Exercise', 'Use treadmills, weights & other equipments for daily exercise & fitness.', 'Both', 'Everyday: 10.00am-8.00pm', 500),
(2, 'Muscle-Building Exercises', 'Train with your expert trainers for muscle building, bodybuilding, power lifting and strength training for that fit body you have been dreaming of.', 'Male', 'Friday : 4.00pm-6.00pm\r\nSaturday : 4.00pm-6.00pm', 1200),
(3, 'Power Yoga', 'This class is designed to teach you the poses of power yoga and ramp up your knowledge to feel comfortable taking a power yoga class. Flexibility not required.', 'Female', 'Sunday\r\n4.00pm-6.00pm\r\nWednesday\r\n4.00pm-6.00pm', 1200),
(4, 'Aerobics', 'Aerobics is considered one of the best ways of weight loss. Lose those extra pound with rhythmic aerobics routine to have fun while getting that shape you always wanted.', 'Female', 'Sunday\r\n6.00pm-8.00pm\r\nWednesday\r\n6.00pm-8.00pm', 1200),
(6, 'Cardiovascular Exercise', 'Join our cardio program - fast & effective fat burning exercise for fitness & energy.', 'Female', 'Sunday: 4.00pm-6.00pm Tuesday: 4.00pm-6.00pm', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `admin_confirmation` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `phone_no`, `email_id`, `gender`, `password`, `admin_confirmation`) VALUES
(1, 'Nusrat Mojumder', 1738451065, 'mojumdernusrat7@gmail.com', 'Gender', '123', 1),
(2, 'Nabid Alam', 1912094176, 'msa.nabid007@gmail.com', 'Male', '1234', 1),
(3, 'Nawshin Ahmed', 1716787678, 'nawshinahmed@gmail.com', 'Female', '123456', 1),
(4, 'Ridwana Karim', 1764667685, 'ridwanatuli@gmail.com', 'Female', '123456', 1),
(5, 'Rahim Ahmed', 1678904567, 'rahimahmed@gmail.com', 'Male', '123', 1),
(6, 'Rina Rahman', 1673656866, 'rina_rahman@gmail.com', 'Female', '123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`registration_id`);

--
-- Indexes for table `member_query`
--
ALTER TABLE `member_query`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `registration_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `member_query`
--
ALTER TABLE `member_query`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
