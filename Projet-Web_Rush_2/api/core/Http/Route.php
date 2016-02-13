<?php
namespace Core\Http;

use Core\Config;
use Exception;

class Route
{
    private $path;
    private $callable;
    private $matches    = [];
    private $params     = [];
    private $middleware = [];

    public function __construct($path, $callable)
    {
        $this->path     = trim($path, '/');
        $this->callable = $callable;
    }

    public function with($param, $regex)
    {
        $this->params[$param] = str_replace('(', '(?:', $regex);

        return $this;
    }

    public function before(callable $invoke)
    {
        $this->middleware[] = $invoke;

        return $this;
    }

    public function match($url)
    {
        $url   = trim($url, '/');
        $path  = preg_replace_callback('#:([\w]+):#', [$this, 'paramMatch'], $this->path);
        $regex = "#^$path$#i";

        if (!preg_match($regex, $url, $matches)) {
            return false;
        }

        array_shift($matches);
        $this->matches = $matches;

        return true;
    }

    private function paramMatch($match)
    {
        if (isset($this->params[$match[1]])) {
            return '(' . $this->params[$match[1]] . ')';
        }

        return '([^/]+)';
    }

    public function getUrl($params)
    {
        $path = $this->path;

        foreach ($params as $k => $v) {
            $path = str_replace(":$k:", $v, $path);
        }

        return Config::getInstance()->get('url') . $path;
    }

    public function call()
    {
        foreach ($this->middleware as $callable) {
            call_user_func($callable);
            array_shift($this->middleware);
        }

        if (is_string($this->callable)) {
            $params = explode('->', $this->callable);

            if (count($params) < 2) {
                throw new Exception('Controller can not be loaded, we need arrow "->" to chain controller method');
            }

            $controller = "App\\Controller\\" . $params[0] . "Controller";
            $controller = new $controller();

            return call_user_func_array([$controller, $params[1]], $this->matches);
        }

        return call_user_func_array($this->callable, $this->matches);
    }
}