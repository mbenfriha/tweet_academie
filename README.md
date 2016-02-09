# tweet_academie database

Base de donnée WAC/Epitech - Projet Tweet Academie

# Dernières modifications (Robin, 09/02/2015) :

- Les INT passe tous en UNSIGNED
- Suppression des INDEX (clef grise) sur les ID primaire
- Renommage des champs "date" en champ plus nominatif (fav_date, messsage_date, ...)
- Ajout de champ date manquant sur certaines tables
- "picture" deviens "picture_url"
- Le champ "content" dans "tp_messages" passe en TEXT (twitter autorise depuis bien longtemps les messages privés de plus de 140 caractères)
- Passage en UTF-8 de tout les champs plutôt que LATIN
- De nombreux champs de la table "tp_users" deviennent optionnel (NULL autorisé) pour permettre l'inscription en 2 temps si nécessaire
- Ajouts des relations en cascade sur toutes les clef étrangères