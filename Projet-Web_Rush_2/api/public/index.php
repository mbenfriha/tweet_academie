<?php
error_reporting(E_ALL);
ini_set('display_errors', 'on');

define('ROOT', dirname(__DIR__));

require(ROOT . '/vendor/autoload.php');

App\App::getInstance()->start();