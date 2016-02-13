<?php
namespace App\Controller;

use App\App;
use Core\Controller\Controller;

class ProfileController extends Controller {
	/**
	 * Ajoute le modèle Profile
	 */
	public function __construct() {
		parent::__construct();

		$this->loadModel('User');

	}

	/**
	 * Affiche les conversations
	 * @return void
	 */
	public function userData() {

		$login = App::getInstance()->getSession()->get('username');

		$this->render('profile/profile', [
			"user" => $this->User->findByLogin($login),
		]);
	}

}