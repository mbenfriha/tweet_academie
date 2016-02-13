<?php
namespace Core\Controller;

use App\App;


<<<<<<< HEAD
class Controller
{
    protected function render(array $array, $debug = false)
    {
        if ($debug) {
            echo '<pre>';
        }

        echo json_encode($array);

        if ($debug) {
            echo '</pre>';
        }

        die;
    }
=======
class Controller {
	protected $twig;
	protected $twigLoader;

	/**
	 * Controller constructor with Twig cache if necessary
	 */
	public function __construct() {

		$this->twigLoader = new Twig_Loader_Filesystem(ROOT . '/app/View/');
		$this->twig = new Twig_Environment($this->twigLoader);

		$route = new Twig_SimpleFunction('route', function ($arg1) {
			echo App::getInstance()->getRouter()->url($arg1);
		});

		$routeParam = new Twig_SimpleFunction('routeParam', function ($arg1, $arg2, $arg3) {
			$array = [$arg2 => $arg3];
			echo App::getInstance()->getRouter()->url($arg1, $array);
		});

		$flash = new Twig_SimpleFunction('flash', function () {
			echo App::getInstance()->getFlash()->get();
		});

		$this->twig->addFunction($route);
		$this->twig->addFunction($flash);
		$this->twig->addGlobal('ABS_PATH', App::getInstance()->getConfig('url'));
		$this->twig->addFunction($routeParam);
>>>>>>> 5bf8617820ce22bd58b237c3dfb1de6cdc357448

	}

	/**
	 * Render Twig view
	 * @param $file
	 * @param array $params
	 * @return string
	 */
	protected function render($file, array $params = []) {
		echo $this->twig->render("{$file}.twig", $params);
	}

	/**
	 * Load model into controller
	 * @param string $model
	 * @return void
	 */
	protected function loadModel($model) {
		$this->$model = $this->app()->getTable($model);
	}

	/**
	 * App container
	 * @return object
	 */
	protected function app() {
		return App::getInstance();
	}
}