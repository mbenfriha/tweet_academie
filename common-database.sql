-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Mer 17 Février 2016 à 13:58
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `my_tweet`
--

-- --------------------------------------------------------

--
-- Structure de la table `tp_favoris`
--

CREATE TABLE `tp_favoris` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  `fav_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_follow`
--

CREATE TABLE `tp_follow` (
  `id` int(10) unsigned NOT NULL,
  `follow_id` int(11) unsigned NOT NULL,
  `follower_id` int(11) unsigned NOT NULL,
  `follow_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_messages`
--

CREATE TABLE `tp_messages` (
  `id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `destinataire_id` int(11) unsigned NOT NULL,
  `expediteur_id` int(11) unsigned NOT NULL,
  `destinataire_del` tinyint(1) unsigned DEFAULT NULL,
  `expediteur_del` tinyint(1) unsigned DEFAULT NULL,
  `view` tinyint(1) unsigned DEFAULT NULL,
  `view_date` datetime DEFAULT NULL,
  `message_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_pictures`
--

CREATE TABLE `tp_pictures` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  `picture_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `picture_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tp_preference`
--

CREATE TABLE `tp_preference` (
  `id` int(11) unsigned NOT NULL,
  `theme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_replys`
--

CREATE TABLE `tp_replys` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `reply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_retweets`
--

CREATE TABLE `tp_retweets` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  `content` varchar(140) CHARACTER SET utf8 NOT NULL,
  `date_retweet` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tp_tweets`
--

CREATE TABLE `tp_tweets` (
  `id` int(11) unsigned NOT NULL,
  `content` varchar(140) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_users`
--

CREATE TABLE `tp_users` (
  `id` int(11) unsigned NOT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `cpostal` int(6) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `departement` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `connect` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `last_connection` datetime DEFAULT NULL,
  `sexe` enum('m','f') DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_user_preference`
--

CREATE TABLE `tp_user_preference` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `preference_id` int(11) unsigned NOT NULL
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
-- Index pour la table `tp_retweets`
--
ALTER TABLE `tp_retweets`
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
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_preference`
--
ALTER TABLE `tp_preference`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_retweets`
--
ALTER TABLE `tp_retweets`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_tweets`
--
ALTER TABLE `tp_tweets`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_users`
--
ALTER TABLE `tp_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD CONSTRAINT `tp_favoris_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_favoris_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  ADD CONSTRAINT `tp_follow_ibfk_1` FOREIGN KEY (`follow_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_follow_ibfk_2` FOREIGN KEY (`follower_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  ADD CONSTRAINT `tp_messages_ibfk_1` FOREIGN KEY (`destinataire_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_messages_ibfk_2` FOREIGN KEY (`expediteur_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  ADD CONSTRAINT `tp_pictures_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_pictures_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  ADD CONSTRAINT `tp_replys_ibfk_1` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_retweets`
--
ALTER TABLE `tp_retweets`
  ADD CONSTRAINT `tp_retweets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_retweets_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tp_tweets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  ADD CONSTRAINT `tp_user_preference_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tp_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tp_user_preference_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `tp_preference` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
