<?php
namespace Core\Http;

use Exception;

class Router
{
    private $url;
    private $routes      = [];
    private $namedRoutes = [];

    public function __construct($url)
    {
        $this->url = $url;
    }

    public function isXhr()
    {
        return (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest');
    }

    public function get($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'GET');
    }

    public function post($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'POST');
    }

    public function put($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'PUT');
    }

    public function delete($path, $callable, $name = null)
    {
        return $this->add($path, $callable, $name, 'DELETE');
    }

    private function add($path, $callable, $name, $method)
    {
        $route = new Route($path, $callable);

        $this->routes[$method][] = $route;

        if (is_string($callable) && $name === null) {
            $name = $callable;
        }

        if ($name) {
            $this->namedRoutes[$name] = $route;
        }

        return $route;
    }

    public function run()
    {
        if (!isset($this->routes[$_SERVER['REQUEST_METHOD']])) {
            throw new Exception('HTTP REQUEST METHOD not found');
        }

        foreach ($this->routes[$_SERVER['REQUEST_METHOD']] as $route) {
            if ($route->match($this->url)) {
                return $route->call();
            }
        }

        throw new Exception('No matching routes');
    }

    public function url($name, $params = [])
    {
        if (!isset($this->namedRoutes[$name])) {
            throw new Exception('No route match for url maker');
        }

        return $this->namedRoutes[$name]->getUrl($params);
    }

    public function forbidden()
    {
        header('HTTP/1.0 403 Forbidden');
        die('403 Forbidden');
    }

    public function notFound()
    {
        header('HTTP/1.0 404 Not Found');
        die('404 Not Found');
    }

    public function redirect($name, $params = [])
    {
        header('Location: ' . $this->url($name, $params));
        exit;
    }
}