-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2016 at 10:35 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `live-forum`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`,`user_id`),
  KEY `user_token` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `topic_id`, `body`, `user_id`) VALUES
(1, 1, 'Cats', 10208164997939689),
(2, 1, 'CATZ', 10208164997939689),
(3, 1, 'les deux\r\n', 10153918184992072),
(4, 1, 'Gotlek Catz', 10208164997939689),
(5, 1, 'dogs\r\n', 10153918184992072),
(6, 1, 'lol\r\n', 10208164997939689);

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preamble` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subject` (`subject`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `subject`, `preamble`) VALUES
(1, 'Dogs vs Cats', 'Cat vs Dog comparison. Cats and dogs are the most popular pets in the world. Cats are more independent and are generally cheaper and less demanding pets.'),
(2, 'Free software', 'Free software, software libre, or libre software is computer software that gives users the freedom to run the software for any purpose as well as to study, change, and distribute the software and the adapted versions. The right to study and modify free software gives full access to its source code. For computer programs which are covered by copyright law this is achieved with a software license where the author grants users the aforementioned freedoms. Software which is not covered by copyright law, such as software in the public domain is free if the source code is in the public domain (or otherwise available without restrictions).'),
(3, 'Nodejs', 'Node.js is a JavaScript runtime built on Chrome''s V8 JavaScript engine. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient. Node.js'' package ecosystem, npm, is the largest ecosystem of open source libraries in the world.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(511) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `photo`) VALUES
(10153918184992072, 'Neila Zghidi', 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xtf1/v/t1.0-1/p50x50/12552588_10153923871397072_9162228340653066237_n.jpg?oh=814d2f697bd6bac01084b219588772c0&oe=5743E2A6&__gda__=1462705363_4aa1d01907044f97e53e65a5847c6944'),
(10208164997939689, 'Béchir Nemlaghi', 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash2/v/t1.0-1/p50x50/1907336_10205227340700094_3804108580745955476_n.jpg?oh=582efc055e250c55e81a345022fa9eb0&oe=57421307&__gda__=1462459209_c65247b23a58f0358a4b535a41df65e4');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
