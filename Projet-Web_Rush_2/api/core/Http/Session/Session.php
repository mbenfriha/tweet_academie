<?php
namespace Core\Http\Session;

class Session implements SessionInterface, \Countable, \ArrayAccess
{
    public function __construct()
    {
        session_start();
    }

    public function get($key)
    {
        if (isset($_SESSION[$key])) {
            return $_SESSION[$key];
        }

        return null;
    }

    public function set($key, $value)
    {
        $_SESSION[$key] = $value;
    }

    public function delete($key)
    {
        unset($_SESSION[$key]);
    }

    public function count()
    {
        return count($_SESSION);
    }

    public function offsetExists($offset)
    {
        return isset($_SESSION[$offset]);
    }

    public function offsetGet($offset)
    {
        return $this->get($offset);
    }

    public function offsetSet($offset, $value)
    {
        return $this->set($offset, $value);
    }

    public function offsetUnset($offset)
    {
        return $this->delete($offset);
    }

    public function hash($salt, $string)
    {
        return sha1($salt . $string);
    }
}