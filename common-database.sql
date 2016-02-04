-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost:3306
-- Généré le :  Jeu 04 Février 2016 à 11:03
-- Version du serveur :  5.5.42
-- Version de PHP :  5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `tweets`
--

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
-- AUTO_INCREMENT pour la table `tp_user_preference`
--
ALTER TABLE `tp_user_preference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;