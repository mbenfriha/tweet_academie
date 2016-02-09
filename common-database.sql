-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 09 Février 2016 à 02:42
-- Version du serveur :  5.5.47-0ubuntu0.14.04.1
-- Version de PHP :  5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tweeter`
--

-- --------------------------------------------------------

--
-- Structure de la table `tp_favoris`
--

CREATE TABLE `tp_favoris` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tweet_id` int(11) UNSIGNED NOT NULL,
  `fav_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_follow`
--

CREATE TABLE `tp_follow` (
  `id` int(10) UNSIGNED NOT NULL,
  `follow_id` int(11) UNSIGNED NOT NULL,
  `follower_id` int(11) UNSIGNED NOT NULL,
  `follow_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_messages`
--

CREATE TABLE `tp_messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `destinataire_id` int(11) UNSIGNED NOT NULL,
  `expediteur_id` int(11) UNSIGNED NOT NULL,
  `destinataire_del` tinyint(1) UNSIGNED NOT NULL,
  `expediteur_del` tinyint(1) UNSIGNED NOT NULL,
  `view` tinyint(1) UNSIGNED NOT NULL,
  `view_date` datetime NOT NULL,
  `message_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_pictures`
--

CREATE TABLE `tp_pictures` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tweet_id` int(11) UNSIGNED NOT NULL,
  `picture_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `picture_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tp_preference`
--

CREATE TABLE `tp_preference` (
  `id` int(11) UNSIGNED NOT NULL,
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_replys`
--

CREATE TABLE `tp_replys` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tweet_id` int(11) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `reply_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_tweets`
--

CREATE TABLE `tp_tweets` (
  `id` int(11) UNSIGNED NOT NULL,
  `content` varchar(140) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `tweet_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_users`
--

CREATE TABLE `tp_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `connect` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `birthday` date DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `last_connection` datetime NOT NULL,
  `sexe` enum('m','f') DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_user_preference`
--

CREATE TABLE `tp_user_preference` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `preference_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `tweet_id` (`tweet_id`);

--
-- Index pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follow_id` (`follow_id`),
  ADD KEY `follower_id` (`follower_id`);

--
-- Index pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destinataire_id` (`destinataire_id`),
  ADD KEY `expediteur_id` (`expediteur_id`);

--
-- Index pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tweet_id` (`tweet_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `tp_preference`
--
ALTER TABLE `tp_preference`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tweet_id` (`tweet_id`);

--
-- Index pour la table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_tweet` (`id`),
  ADD KEY `id_user_2` (`user_id`);

--
-- Index pour la table `tp_users`
--
ALTER TABLE `tp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_preference` (`preference_id`),
  ADD KEY `id_user` (`user_id`),
  ADD KEY `id_preference_2` (`preference_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_preference`
--
ALTER TABLE `tp_preference`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD CONSTRAINT `tp_favoris_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_favoris_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  ADD CONSTRAINT `tp_follow_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_follow_ibfk_1` FOREIGN KEY (`follow_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  ADD CONSTRAINT `tp_messages_ibfk_2` FOREIGN KEY (`expediteur_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_messages_ibfk_1` FOREIGN KEY (`destinataire_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  ADD CONSTRAINT `tp_pictures_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_pictures_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  ADD CONSTRAINT `tp_replys_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  ADD CONSTRAINT `tp_tweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  ADD CONSTRAINT `tp_user_preference_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `tp_preference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_user_preference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
