-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2015 at 04:41 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `javaee`
--

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
`id` int(11) NOT NULL,
  `language` varchar(50) DEFAULT NULL,
  `iso1` varchar(10) DEFAULT NULL,
  `iso2` varchar(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `iso1`, `iso2`) VALUES
(1, 'English', 'en', 'eng'),
(2, 'Español', 'es', 'spa'),
(3, 'Suomi', 'fi', 'fin'),
(4, 'Svenska', 'sv', 'swe');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE IF NOT EXISTS `scores` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_practices` int(11) DEFAULT NULL,
  `successes` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `user_id`, `total_practices`, `successes`) VALUES
(1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE IF NOT EXISTS `translations` (
`id` int(11) NOT NULL,
  `word_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `translation` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `word_id`, `language_id`, `translation`) VALUES
(1, 1, 2, 'hello'),
(2, 1, 2, 'hello'),
(3, 1, 3, 'hei'),
(4, 1, 2, 'hola');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `language_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `language_id`) VALUES
(1, 'alvaro', 1),
(2, 'alvaro@gmail.com', 1),
(4, 'pepe', 2);

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE IF NOT EXISTS `words` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `word` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `user_id`, `language_id`, `word`) VALUES
(1, 1, 1, 'hello'),
(2, 1, 1, 'Welcome');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `language` (`language`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
 ADD PRIMARY KEY (`id`), ADD KEY `word_id_fk` (`word_id`), ADD KEY `language_id_fk` (`language_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`), ADD KEY `language_id_fk` (`language_id`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id_fk` (`user_id`), ADD KEY `language_id_fk` (`language_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `translations`
--
ALTER TABLE `translations`
ADD CONSTRAINT `translations_ibfk_1` FOREIGN KEY (`word_id`) REFERENCES `words` (`id`),
ADD CONSTRAINT `translations_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

--
-- Constraints for table `words`
--
ALTER TABLE `words`
ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
ADD CONSTRAINT `words_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
