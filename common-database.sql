-- phpMyAdmin SQL Dump
-- version 4.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Feb 03, 2016 at 03:01 PM
-- Server version: 10.0.22-MariaDB
-- PHP Version: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

-- --------------------------------------------------------

--
-- Table structure for table `tp_favoris`
--

CREATE TABLE IF NOT EXISTS `tp_favoris` (
  `id_user` int(11) unsigned NOT NULL,
  `id_tweet` int(11) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date_like` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_follow`
--

CREATE TABLE IF NOT EXISTS `tp_follow` (
  `id_follow` int(11) NOT NULL,
  `id_follower` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_messages`
--

CREATE TABLE IF NOT EXISTS `tp_messages` (
  `id_msg` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `id_dest` int(11) NOT NULL,
  `id_expe` int(11) NOT NULL,
  `delete_dest` tinyint(1) NOT NULL,
  `delete_exp` tinyint(1) NOT NULL,
  `view_msg_exp` tinyint(1) DEFAULT NULL,
  `view_msg_dest` tinyint(1) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_preference`
--

CREATE TABLE IF NOT EXISTS `tp_preference` (
  `id_preference` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_replys`
--

CREATE TABLE IF NOT EXISTS `tp_replys` (
  `id_reply` int(11) unsigned NOT NULL,
  `id__user` int(11) unsigned NOT NULL,
  `id_tweet` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_tweets`
--

CREATE TABLE IF NOT EXISTS `tp_tweets` (
  `id_tweet` int(11) unsigned NOT NULL,
  `content` varchar(140) NOT NULL,
  `id_user` int(11) unsigned NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_users`
--

CREATE TABLE IF NOT EXISTS `tp_users` (
  `id_user` int(11) unsigned NOT NULL,
  `login` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `theme` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `connect` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `birthday` date NOT NULL,
  `register` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tp_user_preference`
--

CREATE TABLE IF NOT EXISTS `tp_user_preference` (
  `id_user` int(11) NOT NULL,
  `id_preference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tp_messages`
--
ALTER TABLE `tp_messages`
  ADD PRIMARY KEY (`id_msg`);

--
-- Indexes for table `tp_preference`
--
ALTER TABLE `tp_preference`
  ADD PRIMARY KEY (`id_preference`),
  ADD KEY `id_preference` (`id_preference`);

--
-- Indexes for table `tp_replys`
--
ALTER TABLE `tp_replys`
  ADD KEY `id_reply` (`id_reply`),
  ADD KEY `id__user` (`id__user`),
  ADD KEY `id_tweet` (`id_tweet`),
  ADD KEY `id_reply_2` (`id_reply`),
  ADD KEY `id__user_2` (`id__user`),
  ADD KEY `id_tweet_2` (`id_tweet`);

--
-- Indexes for table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  ADD PRIMARY KEY (`id_tweet`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_tweet` (`id_tweet`),
  ADD KEY `id_user_2` (`id_user`);

--
-- Indexes for table `tp_users`
--
ALTER TABLE `tp_users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  ADD KEY `id_preference` (`id_preference`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_preference_2` (`id_preference`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tp_messages`
--
ALTER TABLE `tp_messages`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tp_preference`
--
ALTER TABLE `tp_preference`
  MODIFY `id_preference` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  MODIFY `id_tweet` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `id_user` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD CONSTRAINT `tp_favoris_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tp_users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  ADD CONSTRAINT `tp_tweets_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tp_users` (`id_user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `tp_users`
--
ALTER TABLE `tp_users`
  ADD CONSTRAINT `tp_users_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tp_replys` (`id__user`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
