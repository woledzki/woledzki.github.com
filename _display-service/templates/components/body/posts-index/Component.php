<?php
use Hoborg\Bundle\DisplayServiceBundle\Component\Component;

class PostsIndex extends Component {

	public function init() {
		parent::init();
	}

	public function prepareData() {

		parent::prepareData();
		foreach ($this->data->documentElement->childNodes as $component) {
			if ('folder' === $component->nodeName) {

				$folder = $component->nodeValue;
				$folderPath = $this->provider->getRootDir()
							. '/' . $this->provider->getSitePrefix()
							. '/' . $folder;
				$files = $this->scanDir($folderPath, $folder);

				foreach($files as $file) {
					$fileEl = $this->data->createElement('post', $file['title']);
					$fileEl->setAttribute('href', $file['href']);
					$fileEl->setAttribute('date', $file['date']);
					$this->data->documentElement->appendChild($fileEl);
				}
			}
		}
		unset($component);
	}

	protected function scanDir($path, $prefix) {
		$files = array();
		$dir = scandir($path);

		foreach ($dir as $entry) {
			if (0 === strpos($entry, '.')) {
				continue;
			}

			if (strpos($entry, '.page')) {
				// open page, get date and title
				$xml = new \DOMDocument();
				$xml->load("{$path}/{$entry}");
				$d = $xml->getElementsByTagName('data');
				$data = $d->item(0);
				$pageMeta = array();
				foreach ($data->childNodes as $el) {
					if ('date' === $el->nodeName) {
						$pageMeta['date'] = $el->nodeValue;
					} else if ('title' == $el->nodeName) {
						$pageMeta['title'] = $el->nodeValue;
					}
				}
				if (2 == count($pageMeta)) {
					$pageMeta['href'] = "/{$prefix}/" . str_replace('.page', '', $entry);
					$pageMeta['timestamp'] = strtotime($pageMeta['date']);
					$files[] = $pageMeta;
				}
			} else if (is_dir("{$path}/{$entry}")) {
				$files = array_merge($files, $this->scanDir("{$path}/{$entry}", "{$prefix}/{$entry}"));
			}
		}

		usort($files, function($a, $b) { return $b['timestamp'] - $a['timestamp']; });

		return $files;
	}
}
