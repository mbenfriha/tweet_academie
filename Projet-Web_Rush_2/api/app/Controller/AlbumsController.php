<?php
namespace App\Controller;

use Core\Controller\Controller;

class AlbumsController extends Controller {
    public function __construct() {
        $this->loadModel('Albums');
    }

    public function getAll()
    {
        $albums = $this->Albums->all();

        $this->render(compact('albums'), true);
    }
}