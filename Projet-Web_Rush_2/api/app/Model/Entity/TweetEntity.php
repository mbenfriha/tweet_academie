<?php
namespace App\Model\Entity;

use App\App;
use Core\Model\Entity\Entity;

class TweetEntity extends Entity {
	/**
	 * Ajoute des helpers si besoin
	 */
	public function __construct() {
	}

	/**
	 * Donne la route pour un utilisateur
	 * @return string
	 * TODO: créer la route vers un profil (type /user/[id] ou /user/[login])
	 */
	public function getUrl() {
		return App::getInstance()->getRouter()->url('user.get', ['id' => $this->id]);
	}
}