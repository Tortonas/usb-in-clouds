-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2018 at 09:32 PM
-- Server version: 5.5.27
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galgaldas_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `serverAdmins`
--

CREATE TABLE IF NOT EXISTS `serverAdmins` (
  `id` int(11) NOT NULL,
  `nick` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `ip` varchar(128) NOT NULL,
  `accesTill` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverAdmins`
--

INSERT INTO `serverAdmins` (`id`, `nick`, `password`, `status`, `ip`, `accesTill`) VALUES
(1, 'Tortonas', 'ownerhashedpsw', 'superadmin', 'owner ip', '9999-01-01 00:00:00'),
(2, 'Guest', 'hashedpswsha512', 'admin', '', '2018-10-27 23:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `serverBadLogins`
--

CREATE TABLE IF NOT EXISTS `serverBadLogins` (
  `id` int(11) NOT NULL,
  `ip` varchar(1000) NOT NULL,
  `tries` int(11) NOT NULL,
  `bannedTill` datetime NOT NULL,
  `lastLogin` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverBadLogins`
--

INSERT INTO `serverBadLogins` (`id`, `ip`, `tries`, `bannedTill`, `lastLogin`) VALUES
(44, '2.203.177.74', 1, '0000-00-00 00:00:00', '2018-10-13 12:33:41'),
(47, '91.101.44.88', 3, '2018-10-20 16:39:23', '2018-10-20 16:19:23');

-- --------------------------------------------------------

--
-- Table structure for table `serverFiles`
--

CREATE TABLE IF NOT EXISTS `serverFiles` (
  `id` int(11) NOT NULL,
  `fileName` varchar(128) NOT NULL,
  `fileVisibility` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverFiles`
--

INSERT INTO `serverFiles` (`id`, `fileName`, `fileVisibility`) VALUES
(13, 'SQL.txt', 'admin'),
(15, 'tos.png', 'admin'),
(16, 'sel.mp4', 'admin'),
(17, 'webui.mp3', 'superadmin'),
(18, 'butyrka.mp4', 'admin'),
(37, 'Timer and Shutdowner.exe', 'admin'),
(78, 'skaidres.pptx', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `serverLogs`
--

CREATE TABLE IF NOT EXISTS `serverLogs` (
  `id` int(128) NOT NULL,
  `log` varchar(128) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverLogs`
--

INSERT INTO `serverLogs` (`id`, `log`, `date`) VALUES
(1, 'This is test log', '2018-10-27 01:07:31'),
(4, 'User (removedip) tried to connect without writing any data', '2018-10-28 00:15:51'),
(5, 'User (removedip) tried to connect with incorrect logins into system. He used his 1 tries', '2018-10-28 00:15:54'),
(6, 'User (removedip) tried to connect with incorrect logins into system. He used his 2 tries', '2018-10-28 00:15:56'),
(7, 'Tortonas uploaded a file (aikstele.jpg) into the server', '2018-10-28 00:25:26'),
(8, 'Tortonas deleted a file (aikstele.jpg) from the server', '2018-10-28 00:25:27');

-- --------------------------------------------------------

--
-- Table structure for table `serverNotepad`
--

CREATE TABLE IF NOT EXISTS `serverNotepad` (
  `id` int(11) NOT NULL,
  `text` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverNotepad`
--

INSERT INTO `serverNotepad` (`id`, `text`) VALUES
(12, 'test log');

-- --------------------------------------------------------

--
-- Table structure for table `serverWhiteListedFiles`
--

CREATE TABLE IF NOT EXISTS `serverWhiteListedFiles` (
  `id` int(11) NOT NULL,
  `file` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverWhiteListedFiles`
--

INSERT INTO `serverWhiteListedFiles` (`id`, `file`) VALUES
(1, 'SQL.txt'),
(2, 'butyrka.mp4'),
(3, 'sel.mp4'),
(4, 'tos.png'),
(5, 'webui.mp3'),

--
-- Indexes for dumped tables
--

--
-- Indexes for table `serverAdmins`
--
ALTER TABLE `serverAdmins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverBadLogins`
--
ALTER TABLE `serverBadLogins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverFiles`
--
ALTER TABLE `serverFiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverLogs`
--
ALTER TABLE `serverLogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverNotepad`
--
ALTER TABLE `serverNotepad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverWhiteListedFiles`
--
ALTER TABLE `serverWhiteListedFiles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `serverAdmins`
--
ALTER TABLE `serverAdmins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `serverBadLogins`
--
ALTER TABLE `serverBadLogins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `serverFiles`
--
ALTER TABLE `serverFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `serverLogs`
--
ALTER TABLE `serverLogs`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `serverNotepad`
--
ALTER TABLE `serverNotepad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `serverWhiteListedFiles`
--
ALTER TABLE `serverWhiteListedFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
