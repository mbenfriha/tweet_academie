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

# Dernières modifications (Mohamed, 11/02/2015) :

-Ajout d'une table "tp_retweets"

# Dernières modifications (Mohamed, 17/02/2015) :

-Modification des champs "destinataire_del", "expediteur_del", "view", "view_date", "message_date" dans la table "tp_messages" en null
-Modification du champs "follow_date" dans la table "tp_follow" en null
-Modification du champs "picture_date" dans la table "tp_pictures" en null
-Modification du champs "reply_date" dans la table "tp_replys" en null
-Modification du champs "date_retweet" dans la table "tp_retweets" en null
-Modification du champs "tp_tweets" dans la table "tweet_date" en null
-Modification des champs "last_connection", "register_date", "token", "connect" dans la table "tp_users" en null

# Dernières modifications (Labinot, 17/02/2015) :

-Ajout du champs "active" dans la table "tp_follow" à null
