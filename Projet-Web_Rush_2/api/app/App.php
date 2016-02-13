<?php
namespace App;

use Core\Config;
use Core\Http\Session\Flash;
use Core\Http\Session\Session;
use Core\Http\Router;
use Core\Model\Database;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;

class App
{
    private static $instance;
    private        $config_instance;
    private        $router_instance;
    private        $db_instance;
    private        $session_instance;
    private        $flash_instance;

    /**
     * Retourne l'instance du container App
     * @return self
     */
    public static function getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new App();
        }

        return self::$instance;
    }

    /**
     * Démarre l'application : date en français, minify le contenu, log toutes les actions
     * @return mixed
     */
    public function start()
    {
        date_default_timezone_set('Europe/Paris');
        setlocale(LC_TIME, 'fr_FR.utf8', 'fra');

        ob_start(function ($buffer) {
            $search  = ['/\>[^\S ]+/s', '/[^\S ]+\</s', '/(\s)+/s'];
            $replace = ['>', '<', '\\1'];
            $buffer  = preg_replace($search, $replace, $buffer);

            return $buffer;
        });

        if ($_SERVER['REQUEST_URI'] !== '/favicon.ico') {
            $date = new \DateTime();
            $log  = new Logger($this->getConfig('title'));
            $log->pushHandler(new StreamHandler(ROOT . '/log/' . $date->format('d-m-Y') . '.log', Logger::INFO));
            $log->info($_SERVER['REMOTE_ADDR'] . ' => ' . $_SERVER['REQUEST_METHOD'] . ' ' . $_SERVER['REQUEST_URI']);
        }

        $router = $this->getRouter(); // scoped into /config/route.php

        require(ROOT . '/config/route.php');

        return $this->getRouter()->run();
    }

    /**
     * Retourne l'instance du Router
     * @return \Core\Http\Router
     */
    public function getRouter()
    {
        if (is_null($this->router_instance)) {
            $this->router_instance = new Router($_GET['url']);
        }

        return $this->router_instance;
    }

    /**
     * Retourne l'instance de Config
     * @param string $key
     * @return \Core\Config
     */
    public function getConfig($key)
    {
        if (is_null($this->config_instance)) {
            $this->config_instance = Config::getInstance();
        }

        return $this->config_instance->get($key);
    }

    /**
     * Retourne l'instance de Database
     * @return \Core\Model\Database
     */
    public function getDb()
    {
        if (is_null($this->db_instance)) {
            $this->db_instance = new Database(
                $this->getConfig('db_name'),
                $this->getConfig('db_user'),
                $this->getConfig('db_pass'),
                $this->getConfig('db_host'),
                $this->getConfig('db_port')
            );
        }

        return $this->db_instance;
    }

    /**
     * Retourne l'instance de Session
     * @return \Core\Http\Session\Session
     */
    public function getSession()
    {
        if (is_null($this->session_instance)) {
            $this->session_instance = new Session();
        }

        return $this->session_instance;
    }

    /**
     * Retourne l'instance de Flash
     * @return \Core\Http\Session\Flash
     */
    public function getFlash()
    {
        if (is_null($this->flash_instance)) {
            $this->flash_instance = new Flash($this->getSession());
        }

        return $this->flash_instance;
    }

    /**
     * Retourne une table avec une instance de Database pour charger un modèle dans un controlleur
     * @param string $name
     * @return object
     */
    public function getTable($name)
    {
        $class_name = 'App\\Model\\Table\\' . ucfirst($name) . 'Table';

        return new $class_name($this->getDb());
    }

    /**
     * Encrypte un mot de passe avec l'algorithme RIPEMD160
     * @param string $string
     * @return string
     */
    public function hash($string)
    {
        return hash('ripemd160', $this->getConfig('hash_salt') . $string);
    }
}