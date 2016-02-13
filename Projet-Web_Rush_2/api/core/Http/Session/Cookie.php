<?php
namespace Core\Http\Session;

class Cookie implements SessionInterface
{
    public function get($key)
    {
        return isset($_COOKIE[$key]) ? unserialize($_COOKIE[$key]) : null;
    }

    public function set($key, $value)
    {
        setcookie($key, serialize($value));
    }

    public function delete($key)
    {
        if (isset($_COOKIE[$key])) {
            unset($_COOKIE[$key]);
            setcookie($key, '', time() - 3600);
        }
    }

    public function hash($salt, $string)
    {
        return sha1($salt . $string);
    }
}