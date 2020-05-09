-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2020 at 08:39 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datahiding`
--

-- --------------------------------------------------------

--
-- Table structure for table `appintment`
--

CREATE TABLE `appintment` (
  `aid` int(11) NOT NULL,
  `doc` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `ctime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appintment`
--

INSERT INTO `appintment` (`aid`, `doc`, `uname`, `date`, `status`, `ctime`) VALUES
(1, 'sini.thankachan@yahoo.com', 'sinithankachan10315@gmail.com', '2018-03-19', 'approved', 14),
(2, 'sini.thankachan@yahoo.com', 'sinithankachan10315@gmail.com', '2018-03-26', 'approved', 14),
(3, 'sinibinoy2013@gmail.com', 'anju@gmai.com', '2020-04-20', 'approved', 11);

-- --------------------------------------------------------

--
-- Table structure for table `cate`
--

CREATE TABLE `cate` (
  `cid` int(5) NOT NULL,
  `cate` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cate`
--

INSERT INTO `cate` (`cid`, `cate`) VALUES
(1, 'Doctor'),
(2, 'Dentist'),
(3, 'Ayurveda'),
(4, 'Nutritionist'),
(5, 'Homeo Pathi');

-- --------------------------------------------------------

--
-- Table structure for table `consultingtime`
--

CREATE TABLE `consultingtime` (
  `CTIME` int(11) NOT NULL,
  `DOC` varchar(50) NOT NULL,
  `DAY` int(50) NOT NULL,
  `TIMEFROM` varchar(50) NOT NULL,
  `timeto` varchar(50) NOT NULL,
  `nobooking` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultingtime`
--

INSERT INTO `consultingtime` (`CTIME`, `DOC`, `DAY`, `TIMEFROM`, `timeto`, `nobooking`) VALUES
(1, 'ramyawilsonanu@gmail.com', 1, '10:00', '01:00', 10),
(5, 'ramyawilsonanu@gmail.com', 1, '02:00', '05:00', 10),
(6, 'ramyawilsonanu@gmail.com', 6, '10:00', '01:00', 10),
(7, 'findmein001@gmail.com', 1, '10:00', '01:00', 10),
(8, 'findmein001@gmail.com', 1, '02:00', '05:00', 10),
(9, 'shibysarababu@gmail.com', 2, '10:00', '02:00', 10),
(10, 'shibysarababu@gmail.com', 3, '10:00', '02:00', 10),
(11, 'sinibinoy2013@gmail.com', 2, '10.30', '5.30', 20),
(12, 'sinibinoy2013@gmail.com', 3, '10.30', '53.0', 20),
(13, 'sinibinoy2013@gmail.com', 6, '2:30', '6:00', 30),
(14, 'sini.thankachan@yahoo.com', 2, '10:30 am', '12:20 pm', 20);

-- --------------------------------------------------------

--
-- Table structure for table `docreg`
--

CREATE TABLE `docreg` (
  `id` int(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  `cid` int(5) NOT NULL,
  `sub_id` int(5) NOT NULL,
  `qual` varchar(50) NOT NULL,
  `spce` varchar(1000) NOT NULL,
  `hopnm` varchar(50) NOT NULL,
  `exp` varchar(20) NOT NULL,
  `cno` varchar(15) NOT NULL,
  `adr` varchar(150) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `status` varchar(15) NOT NULL,
  `pho` varchar(50) DEFAULT NULL,
  `mail` varchar(30) NOT NULL,
  `RegistrationNumber` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `docreg`
--

INSERT INTO `docreg` (`id`, `name`, `cid`, `sub_id`, `qual`, `spce`, `hopnm`, `exp`, `cno`, `adr`, `loc`, `status`, `pho`, `mail`, `RegistrationNumber`) VALUES
(1, 'Juan Binoy', 1, 1, '1', '1', 'St Joseph', '4', '1234567899', 'Sini Bhavann', 'Kottarakara', 'approved', 'Tulips.jpg', 'sinibinoy2013@gmail.com', ''),
(2, 'Seena', 2, 3, '2', '3', 'DH Hospital', '3', '9874334567', 'ABC lane', 'Kollam', 'approved', 'anu.png', 'sini.thankachan@yahoo.com', ''),
(3, 'Anjitha', 1, 2, 'MD', 'MD -Ortho', 'Ns', '2years', '9638527410', 'Kollam', 'Kollam', 'waiting', '', 'aaa@gmai.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `fid` int(11) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `messgae` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `doc` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filedetails`
--

CREATE TABLE `filedetails` (
  `fid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(800) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `uploadeddate` varchar(45) DEFAULT NULL,
  `secretkey` varchar(45) DEFAULT NULL,
  `fileflag` varchar(300) DEFAULT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filedetails`
--

INSERT INTO `filedetails` (`fid`, `filename`, `userid`, `uploadeddate`, `secretkey`, `fileflag`, `aid`) VALUES
(1, 'download88.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaCXXS24OB', 'waiting', 2),
(2, 'download44.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaFZJNEE6O', 'waiting', 2),
(3, 'download3.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaSEUEGQLI', 'waiting', 2),
(4, 'dwnld2.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaLDU2Y7JQ', 'waiting', 2),
(5, 'google.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaA6WY55VD', 'waiting', 2),
(6, 'images.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaLE08S0O0', 'waiting', 2),
(7, 'F1.large.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaKO7UD80S', 'waiting', 2),
(8, 'download22.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaZJPYK47E', 'waiting', 2),
(9, 'F1.large.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaFOQ2O10F', 'waiting', 2),
(10, 'F1.large.png', 'sinithankachan10315@gmail.com', '2018-03-09', 'sinithaN4VZ1S1N', 'waiting', 2);

-- --------------------------------------------------------

--
-- Table structure for table `largefile`
--

CREATE TABLE `largefile` (
  `fid` int(11) NOT NULL,
  `fname` int(11) NOT NULL,
  `key` int(11) NOT NULL,
  `llid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `uname` varchar(30) NOT NULL,
  `Pass` varchar(15) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`uname`, `Pass`, `role`) VALUES
('admin', 'admin', 'admin'),
('meenu@gmail.com', '123', 'pat'),
('mini@gmail.com', '321', 'pat'),
('anju@gmai.com', '125', 'pat'),
('sinibinoy2013@gmail.com', '124', 'doc'),
('sini.thankachan@yahoo.com', 'seenamol', 'doc'),
('sinithankachan10315@gmail.com', 'john', 'pat');

-- --------------------------------------------------------

--
-- Table structure for table `patientdetails`
--

CREATE TABLE `patientdetails` (
  `pid` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `paddress` varchar(100) DEFAULT NULL,
  `pphone` varchar(12) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patientdetails`
--

INSERT INTO `patientdetails` (`pid`, `name`, `dob`, `paddress`, `pphone`, `gender`, `uname`, `photo`) VALUES
(2, 'sree', '1999-12-31', 'sreekrishna jyothi bakker complex', '20000', 'on', 'anju@gmai.com', ''),
(3, 'Mini', '2000-01-01', 'Kollam', '9638527410', 'on', 'mini@gmail.com', NULL),
(7, 'Meenu', '1999-12-31', 'kollam', '9638527410', 'Female', 'meenu@gmail.com', 'images (1).jpg'),
(8, 'John', '1995-05-27', 'KN nivas', '9643456768', 'Male', 'sinithankachan10315@gmail.com', 'aaa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `randompos`
--

CREATE TABLE `randompos` (
  `rid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `p1` int(11) NOT NULL,
  `p2` int(11) NOT NULL,
  `xt2` int(11) NOT NULL,
  `yt2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `randompos`
--

INSERT INTO `randompos` (`rid`, `aid`, `p1`, `p2`, `xt2`, `yt2`) VALUES
(1, 1, 0, 0, 1, 1),
(2, 2, 0, 0, 1, 0),
(3, 3, 1, 0, 1, 0),
(4, 4, 0, 0, 0, 0),
(5, 5, 0, 0, 1, 0),
(6, 6, 0, 0, 0, 0),
(7, 7, 0, 0, 0, 0),
(8, 8, 1, 0, 0, 0),
(9, 9, 1, 0, 0, 0),
(10, 10, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reg`
--

CREATE TABLE `reg` (
  `uname` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `pwd` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg`
--

INSERT INTO `reg` (`uname`, `name`, `email`, `pwd`) VALUES
('q', 'ab', 'gff', 'a'),
('null', 'anu', 'q', 'null'),
('w', 'qee', 'qee', '1');

-- --------------------------------------------------------

--
-- Table structure for table `subcat`
--

CREATE TABLE `subcat` (
  `sub_id` int(5) NOT NULL,
  `cid` int(5) NOT NULL,
  `subcat` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcat`
--

INSERT INTO `subcat` (`sub_id`, `cid`, `subcat`) VALUES
(1, 1, 'Otho'),
(2, 1, 'Cardiologist'),
(3, 2, 'Surjan'),
(4, 2, 'Phisition'),
(5, 5, 'Pediatrician'),
(6, 3, 'Paediatrics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appintment`
--
ALTER TABLE `appintment`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `cate`
--
ALTER TABLE `cate`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `consultingtime`
--
ALTER TABLE `consultingtime`
  ADD PRIMARY KEY (`CTIME`);

--
-- Indexes for table `docreg`
--
ALTER TABLE `docreg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD UNIQUE KEY `mail_2` (`mail`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `filedetails`
--
ALTER TABLE `filedetails`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `largefile`
--
ALTER TABLE `largefile`
  ADD PRIMARY KEY (`llid`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `patientdetails`
--
ALTER TABLE `patientdetails`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `uname` (`uname`);

--
-- Indexes for table `randompos`
--
ALTER TABLE `randompos`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `reg`
--
ALTER TABLE `reg`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`sub_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appintment`
--
ALTER TABLE `appintment`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cate`
--
ALTER TABLE `cate`
  MODIFY `cid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `consultingtime`
--
ALTER TABLE `consultingtime`
  MODIFY `CTIME` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `docreg`
--
ALTER TABLE `docreg`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filedetails`
--
ALTER TABLE `filedetails`
  MODIFY `fid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `largefile`
--
ALTER TABLE `largefile`
  MODIFY `llid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patientdetails`
--
ALTER TABLE `patientdetails`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `randompos`
--
ALTER TABLE `randompos`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `subcat`
--
ALTER TABLE `subcat`
  MODIFY `sub_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
