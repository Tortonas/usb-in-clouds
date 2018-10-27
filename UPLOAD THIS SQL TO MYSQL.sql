-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2018 at 09:29 PM
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
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL,
  `number` varchar(20) NOT NULL,
  `year_made` date NOT NULL,
  `model` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `number`, `year_made`, `model`) VALUES
(1, 'OFS:574', '1998-01-01', 'bmw e46'),
(2, 'SWA:664', '1999-01-01', 'audi a4'),
(3, 'JKW:123', '2005-01-01', 'Honda Civic');

-- --------------------------------------------------------

--
-- Table structure for table `car_management`
--

CREATE TABLE IF NOT EXISTS `car_management` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `segments_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_management`
--

INSERT INTO `car_management` (`id`, `cars_id`, `segments_id`, `user_id`, `date_from`, `date_to`) VALUES
(1, 1, 1, 1, '2018-07-23', '2019-11-30'),
(2, 2, 2, 2, '2018-07-23', '2019-05-31'),
(3, 2, 3, 3, '2018-07-11', '2018-07-22'),
(4, 1, 4, 4, '2018-07-03', '2018-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `car_status`
--

CREATE TABLE IF NOT EXISTS `car_status` (
  `id` int(11) NOT NULL,
  `cars_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_status`
--

INSERT INTO `car_status` (`id`, `cars_id`, `status_id`, `date_from`, `date_to`) VALUES
(1, 1, 1, '2018-07-24', '2018-07-24'),
(2, 2, 2, '2018-07-25', '2018-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE IF NOT EXISTS `Comments` (
  `id` int(11) NOT NULL,
  `nickname` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(10000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`id`, `nickname`, `email`, `date`, `comment`) VALUES
(1, 'Tortonas', 'plankton546@gmail.com', '2018-07-11 00:00:00', 'This is a test comment.'),
(5, 'TESTAVIMAS', 'plankton546@gmail.com', '2018-07-11 12:02:18', 'JUHASFGIKUHASJFKAKHJFSFAS test'),
(6, 'admin', 'plankton546@gmail.com', '2018-07-11 12:02:01', 'hh'),
(7, 'Test', 'plankton546@gmail.com', '2018-07-11 12:57:52', 'Naujausias komentaras'),
(75, 'Testuotojas', 'plankton546@gmail.com', '2018-07-11 01:08:10', 'Pats naujausias grynas komentaras'),
(76, 'admin', 'plankton546@gmail.com', '2018-07-11 13:10:31', 'Pats naujausias komentaras'),
(77, 'admin', 'plankton546@gmail.com', '2018-07-11 13:10:45', 'Dar ciuciut naujesnis komentaras');

-- --------------------------------------------------------

--
-- Table structure for table `LaikiuxAdmins`
--

CREATE TABLE IF NOT EXISTS `LaikiuxAdmins` (
  `id` int(11) NOT NULL,
  `ip` varchar(128) NOT NULL,
  `nickname` varchar(128) NOT NULL,
  `level` varchar(128) NOT NULL,
  `steamid` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LaikiuxAdmins`
--

INSERT INTO `LaikiuxAdmins` (`id`, `ip`, `nickname`, `level`, `steamid`) VALUES
(1, '88.222.175.63', 'Tortonas', '2', '76561198044384206'),
(2, '78.57.243.28', 'In*Victus', '1', '76561198086184454');

-- --------------------------------------------------------

--
-- Table structure for table `LaikiuxHints`
--

CREATE TABLE IF NOT EXISTS `LaikiuxHints` (
  `id` int(11) NOT NULL,
  `hinttext` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `LaikiuxSubmission`
--

CREATE TABLE IF NOT EXISTS `LaikiuxSubmission` (
  `id` int(11) NOT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `prize` varchar(1000) NOT NULL,
  `HasAnyoneWon` varchar(1) NOT NULL,
  `photolink` varchar(1000) NOT NULL,
  `organizer` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LaikiuxSubmission`
--

INSERT INTO `LaikiuxSubmission` (`id`, `question`, `answer`, `prize`, `HasAnyoneWon`, `photolink`, `organizer`) VALUES
(1, 'Kokioje Å¡alyje yra Å¡i pilis? Ats raÅ¡yti lietuviÅ¡kai', 'rumunija', '1000', '0', 'https://i.imgur.com/nfwP1Yg.jpg', 'Tortonas');

-- --------------------------------------------------------

--
-- Table structure for table `LaikiuxWinners`
--

CREATE TABLE IF NOT EXISTS `LaikiuxWinners` (
  `id` int(11) NOT NULL,
  `Nickname` varchar(1000) NOT NULL,
  `organizer` varchar(1000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `LaikiuxWinners`
--

INSERT INTO `LaikiuxWinners` (`id`, `Nickname`, `organizer`) VALUES
(1, 'Re1den 1500 kreditai', ''),
(11, 'DvitaÅ¡kis 1500 kreditai', ''),
(12, 'DvitaÅ¡kis 1500 kreditai', ''),
(14, 'Markas 1000 kreditai', ''),
(16, 'zzz 1500 kreditai (sponsored)', ''),
(17, 'XxX_DAnkmemer_xXx 2000 kreditai (sponsored)', ''),
(18, 'Kappar 1500 kreditai', ''),
(19, 'Kappar 1500 kreditai (sponsored)', ''),
(20, 'DvitaÅ¡kis 2000 kreditai (sponsored)', ''),
(21, 'DvitaÅ¡kis 1500 kreditai (sponsored)', ''),
(22, 'Kappar 1500 kreditai (sponsored)', ''),
(23, 'DvitaÅ¡kis 1500 kreditai', ''),
(24, 'Re1Den 1000 kreditai', ''),
(25, 'Markas 1500 kreditai', ''),
(27, 'Slapyvardis 1500 kreditai', ''),
(28, 'XxX_DAnkmemer_xXx 1000 kreditai', ''),
(31, 'suva 1000 kreditai', 'Tortonas'),
(32, 'XxX_DAnkmemer_xXx 1500 kreditai', 'In*Victus'),
(33, 'suva 1500 kreditai', 'Tortonas');

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE IF NOT EXISTS `segments` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `segments`
--

INSERT INTO `segments` (`id`, `name`) VALUES
(1, 'UAB "Test"'),
(2, 'UAB "Audi"'),
(3, 'UAB "Bankrotas"'),
(4, 'UAB "Bmw bankrotas"');

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
(1, 'Tortonas', '32c6c075819ed0050ab179c57c1dd705c51d9a25bd48f3db2a719a82782dbf02926e2d0dd3b6df023f80abcefe4752f3396cefc963e5ee5246a85df6f7932c12', 'superadmin', '88.222.175.63', '9999-01-01 00:00:00'),
(2, 'Guest', '1120c497aa8c1bd060e03e7f94de8afd7c5c9e723e21078070de0e676cd1a96484a5c2284294f54840faf0e936a139b5ff0a595f8ad0351ef34de6f9709e736e', 'admin', '', '2018-10-27 23:53:25');

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
(8, 'record6120398233223380979.mp3', 'superadmin'),
(13, 'SQL.txt', 'admin'),
(14, 'tapinas.jpg', 'superadmin'),
(15, 'tos.png', 'admin'),
(16, 'sel.mp4', 'admin'),
(17, 'webui.mp3', 'superadmin'),
(18, 'butyrka.mp4', 'admin'),
(37, 'Timer and Shutdowner.exe', 'admin'),
(73, 'VALENTINAS KASTECKIS - Radiologinio tyrimo vertinimas  2018-10-13 (MONASTYRECKIENÄ– EGLÄ– (17250)).pdf', 'admin'),
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
(4, '91.211.247.93'),
(5, 'csgoserver'),
(6, 'ysTbgY9uwsw7pUAweddpjJCt'),
(7, 'db.laikiux.lt'),
(8, 'laikiux'),
(9, 'WPY2zZiIGhH8ys9yuap4B7AVUKQOZete8oIx7nA9ZSDVRMz2'),
(10, 'csgo'),
(11, 'GQnw8g7qAPcCOkXf'),
(12, 'jb rcon: FYAVEq5K4LnfVH0r');

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
(6, 'tapinas.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `SideComments`
--

CREATE TABLE IF NOT EXISTS `SideComments` (
  `id` int(11) NOT NULL,
  `mainCommentId` varchar(128) NOT NULL,
  `nickname` varchar(1000) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(10000) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `SideComments`
--

INSERT INTO `SideComments` (`id`, `mainCommentId`, `nickname`, `email`, `date`, `comment`) VALUES
(1, '1', 'Tortonas', 'fasd@inbox.lt', '2018-07-11 00:00:00', 'This is a test side comment.'),
(2, '5', 'Tortonas', 'plankton546@gmai.com', '2018-07-11 12:45:58', 'testuoju ranka'),
(3, '1', 'Tortonas', 'plankton546@gmai.com', '2018-07-11 12:46:45', 'vel testuoju'),
(4, '4', 'Tortonas', 'plankton546@gmai.com', '2018-07-11 12:47:01', 'vel testuoju'),
(5, '7', 'Test', 'plankton546@gmai.com', '2018-07-11 12:58:04', 'Naujausias side komentaras'),
(6, '7', 'Tortonas', 'plankton546@gmai.com', '2018-07-11 12:58:15', 'Dar naujesnis komentaras');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `parent_id`) VALUES
(1, 'nauja', 0),
(2, 'dauzta', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `segment_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `segment_id`) VALUES
(1, 'Valentinas', 1),
(2, 'Rokas', 2),
(3, 'Dovydas', 3),
(4, 'Kristupas', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_management`
--
ALTER TABLE `car_management`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LaikiuxAdmins`
--
ALTER TABLE `LaikiuxAdmins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LaikiuxHints`
--
ALTER TABLE `LaikiuxHints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LaikiuxSubmission`
--
ALTER TABLE `LaikiuxSubmission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `LaikiuxWinners`
--
ALTER TABLE `LaikiuxWinners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `SideComments`
--
ALTER TABLE `SideComments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `car_management`
--
ALTER TABLE `car_management`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `car_status`
--
ALTER TABLE `car_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Comments`
--
ALTER TABLE `Comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `LaikiuxAdmins`
--
ALTER TABLE `LaikiuxAdmins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `LaikiuxHints`
--
ALTER TABLE `LaikiuxHints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `LaikiuxSubmission`
--
ALTER TABLE `LaikiuxSubmission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `LaikiuxWinners`
--
ALTER TABLE `LaikiuxWinners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
--
-- AUTO_INCREMENT for table `SideComments`
--
ALTER TABLE `SideComments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
