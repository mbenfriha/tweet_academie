<?php
namespace Core\Model;

use \Exception;
use \PDO;

class Database
{
    private $db_name;
    private $db_user;
    private $db_pass;
    private $db_host;
    private $db_port;
    private $uniqid;
    private $pdo;

    public function __construct($db_name, $db_user = 'root', $db_pass = 'root', $db_host = 'localhost', $db_port = 3306)
    {
        $this->db_name = $db_name;
        $this->db_user = $db_user;
        $this->db_pass = $db_pass;
        $this->db_host = $db_host;
        $this->db_port = $db_port;
        $this->uniqid  = uniqid();
    }

    private function getPDO()
    {
        if ($this->pdo === null) {
            try {
                $pdo = new PDO("mysql:dbname={$this->db_name};host={$this->db_host};port={$this->db_port}", $this->db_user, $this->db_pass);
                $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $pdo->exec('SET NAMES "UTF8"');
                $this->pdo = $pdo;
            } catch (Exception $e) {
                throw new Exception('Failed to start new PDO instance : ' . $e->getMessage());
            }
        }

        return $this->pdo;
    }

    public function query($statement, $class_name = null, $one = false)
    {
        try {
            $req = $this->getPDO()->query($statement);

            if (
                strpos($statement, 'UPDATE') === 0 ||
                strpos($statement, 'INSERT') === 0 ||
                strpos($statement, 'DELETE') === 0
            ) {
                return $req;
            }

            if ($class_name === null) {
                $req->setFetchMode(PDO::FETCH_OBJ);
            } else {
                $req->setFetchMode(PDO::FETCH_CLASS, $class_name);
            }

            if ($one) {
                $data = $req->fetch();
            } else {
                $data = $req->fetchAll();
            }
        } catch (Exception $e) {
            throw new Exception('Failed to PDO query : ' . $e->getMessage());
        }

        return $data;
    }

    public function prepare($statement, $attributes, $class_name = null, $one = false)
    {
        try {
            $req = $this->getPDO()->prepare($statement);
            $res = $req->execute($attributes);

            if (
                strpos($statement, 'UPDATE') === 0 ||
                strpos($statement, 'INSERT') === 0 ||
                strpos($statement, 'DELETE') === 0
            ) {
                return $res;
            }

            if ($class_name === null) {
                $req->setFetchMode(PDO::FETCH_OBJ);
            } else {
                $req->setFetchMode(PDO::FETCH_CLASS, $class_name);
            }

            if ($one) {
                $data = $req->fetch();
            } else {
                $data = $req->fetchAll();
            }
        } catch (Exception $e) {
            throw new Exception('Failed to PDO prepare query : ' . $e->getMessage());
        }

        return $data;
    }

    public function lastInsertId()
    {
        return $this->getPDO()->lastInsertId();
    }
}