# tweet_academie database

Base de donnée WAC/Epitech - Projet Tweet Academie

# Dernières modifications (Robin, 09/02/2015) :

- Les INT passe tous en UNSIGNED
- Suppression des INDEX (clef grise) sur les ID primaire
- Renommage des champs "date" en champ plus nominatif sur 3/4 des tables (fav_date, messsage_date, register_date, view_date)
- Ajout de champ date manquant sur certaines tables
- "picture" deviens "picture_url"
- Le champ "content" dans "tp_messages" passe en TEXT (twitter autorise depuis bien longtemps les messages privés de plus de 140 caractères)
- Passage en UTF-8 de tout les champs plutôt que LATIN
- De nombreux champs de la table "tp_users" deviennent optionnel (NULL autorisé) pour permettre l'inscription en 2 temps si nécessaire
- Ajouts des relations en cascade sur toutes les clef étrangères
- Condition UNIQUE sur "login" et "email" dans "tp_users"
- "mail" deviens "email" dans "tp_users"
- "picture" deviens "picture_url" dans "tp_pictures"

# Dernières modifications (Mohamed, 09/02/2015) :

-Ajout des champs "cpostal", "adress", "region", "departement" dans la table "tp_users" en null
