<?php
/**
 * Route de base
 */
<<<<<<< HEAD
$router->get('/albums', 'Albums->getAll', 'albums.getAll');
$router->get('/artists', 'Artists->getAll', 'artists.getAll');
=======
//$router->get('/', 'Home->dashboard', 'home.dashboard')->before(new \App\Middleware\Authenticable());
$router->get('/', 'Dashboard->timeline', 'dashboard.timeline')->before(new \App\Middleware\Authenticable());

/**
 * Authentification
 */
$router->get('/login', 'Auth->login', 'auth.login');
$router->post('/login', 'Auth->postLogin', 'auth.postLogin');
$router->get('/register', 'Auth->register', 'auth.register');
$router->post('/register', 'Auth->postRegister', 'auth.postRegister');
$router->post('/disconnect', 'Auth->disconnect', 'auth.disconnect');
$router->get('/password', 'Auth->recoverPassword', 'auth.recoverPassword');

/**
 * Dashboard
 */
$router->get('/dashboard', 'Dashboard->timeline', 'dashboard.timeline')->before(new \App\Middleware\Authenticable());

/**
 * Profile
 */
$router->get('/profile', 'Profile->userData', 'profile.userData')->before(new \App\Middleware\Authenticable());

/**
 * Messages
 */
$router->get('/message', 'Message->all', 'message.all')->before(new \App\Middleware\Authenticable());
$router->get('/message/:id:', 'Message->single', 'message.single')->with('id', '[0-9]+')->before(new \App\Middleware\Authenticable());
$router->get('/message/archive', 'Message->all', 'message.archive')->before(new \App\Middleware\Authenticable());
$router->post('/message/search', 'Message->search', 'message.search')->before(new \App\Middleware\Authenticable());
>>>>>>> 5bf8617820ce22bd58b237c3dfb1de6cdc357448
