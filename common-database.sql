-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Jeu 04 Février 2016 à 11:06
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `tweets`
--

-- --------------------------------------------------------

--
-- Structure de la table `tp_favoris`
--

CREATE TABLE `tp_favoris` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `tweet_id` int(11) unsigned NOT NULL,
  `date_like` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_follow`
--

CREATE TABLE `tp_follow` (
  `id` int(10) unsigned NOT NULL,
  `follow_id` int(11) unsigned NOT NULL,
  `follower_id` int(11) unsigned NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_messages`
--

CREATE TABLE `tp_messages` (
  `id` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `destinataire_id` int(11) unsigned NOT NULL,
  `expediteur_id` int(11) unsigned NOT NULL,
  `destinataire_del` tinyint(1) unsigned NOT NULL,
  `expediteur_del` tinyint(1) unsigned NOT NULL,
  `view` tinyint(1) unsigned NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_pictures`
--

CREATE TABLE `tp_pictures` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `tweet_id` int(10) unsigned NOT NULL,
  `picture` varchar(255) NOT NULL
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
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_tweets`
--

CREATE TABLE `tp_tweets` (
  `id` int(11) unsigned NOT NULL,
  `content` varchar(140) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_users`
--

CREATE TABLE `tp_users` (
  `id` int(11) unsigned NOT NULL,
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
  `register` datetime NOT NULL,
  `last_connection` datetime NOT NULL,
  `sexe` enum('m','f') NOT NULL,
  `cover` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tp_user_preference`
--

CREATE TABLE `tp_user_preference` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preference_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `tp_favoris`
--
ALTER TABLE `tp_favoris`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`user_id`);

--
-- Index pour la table `tp_follow`
--
ALTER TABLE `tp_follow`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tp_messages`
--
ALTER TABLE `tp_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tp_pictures`
--
ALTER TABLE `tp_pictures`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tp_preference`
--
ALTER TABLE `tp_preference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_preference` (`id`);

--
-- Index pour la table `tp_replys`
--
ALTER TABLE `tp_replys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_reply` (`id`),
  ADD KEY `id__user` (`user_id`),
  ADD KEY `id_tweet` (`tweet_id`),
  ADD KEY `id_reply_2` (`id`),
  ADD KEY `id__user_2` (`user_id`),
  ADD KEY `id_tweet_2` (`tweet_id`);

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
  ADD KEY `id_user` (`id`);

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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;