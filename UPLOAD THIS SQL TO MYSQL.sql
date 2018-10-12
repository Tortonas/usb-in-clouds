-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2018 at 12:41 PM
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
(1, 'Tortonas', 'here is SHA512 ecrypted password', 'superadmin', 'admins ip', '9999-01-01 00:00:00'),
(2, 'Guest', 'here is SHA512 ecrypted password', 'admin', '', '2018-10-08 13:25:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverBadLogins`
--

INSERT INTO `serverBadLogins` (`id`, `ip`, `tries`, `bannedTill`, `lastLogin`) VALUES
(29, 'random banned ip', 3, '2018-09-07 20:04:21', '2018-09-07 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `serverFiles`
--

CREATE TABLE IF NOT EXISTS `serverFiles` (
  `id` int(11) NOT NULL,
  `fileName` varchar(128) NOT NULL,
  `fileVisibility` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverFiles`
--

INSERT INTO `serverFiles` (`id`, `fileName`, `fileVisibility`) VALUES
(0, 'neveikiancios.txt', 'admin'),
(8, 'record6120398233223380979.mp3', 'superadmin'),
(9, 'diskreciosios.7z', 'superadmin'),
(11, 'LB1.rar', 'superadmin'),
(13, 'SQL.txt', 'superadmin'),
(14, 'tapinas.jpg', 'superadmin'),
(15, 'tos.png', 'admin'),
(16, 'sel.mp4', 'admin'),
(17, 'webui.mp3', 'superadmin'),
(18, 'butyrka.mp4', 'admin'),
(37, 'Timer and Shutdowner.exe', 'admin'),
(39, 'L1_Kasteckis_Valentinas.docx', 'superadmin'),
(42, 'komparkulb2.png', 'superadmin'),
(43, 'KOMPARKAIlab2.asm', 'superadmin'),
(44, 'komp2lab.txt', 'superadmin'),
(48, 'L1_Kasteckis_Valentinas.zip', 'superadmin');

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
(4, 'test message');

-- --------------------------------------------------------

--
-- Table structure for table `serverWhiteListedFiles`
--

CREATE TABLE IF NOT EXISTS `serverWhiteListedFiles` (
  `id` int(11) NOT NULL,
  `file` varchar(128) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serverWhiteListedFiles`
--

INSERT INTO `serverWhiteListedFiles` (`id`, `file`) VALUES
(1, 'SQL.txt'),
(2, 'butyrka.mp4'),
(3, 'sel.mp4'),
(4, 'tos.png'),
(5, 'webui.mp3');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `serverFiles`
--
ALTER TABLE `serverFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `serverNotepad`
--
ALTER TABLE `serverNotepad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `serverWhiteListedFiles`
--
ALTER TABLE `serverWhiteListedFiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
