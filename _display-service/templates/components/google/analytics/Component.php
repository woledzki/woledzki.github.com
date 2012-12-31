<?php
namespace components\modules\google\analytics;

use Symfony\Component\EventDispatcher\EventDispatcher;

class Component extends \Hoborg\Bundle\DisplayServiceBundle\Component\Component {

	public function registerEventListeners(EventDispatcher $eventDispatcher) {
		//$eventDispatcher->
	}

	public function render() {
		$enabled = $this->data->getElementsByTagName('enabled');
		if ($enabled->length < 0) {
			return parent::render();
		}

		$env = $this->provider->getEnvironement();

		if ('dev' == $env || 'test' == $env) {
			$enabled = $enabled->item(0);
			$enabled->nodeValue = 0;
		}

		return parent::render();
	}
}