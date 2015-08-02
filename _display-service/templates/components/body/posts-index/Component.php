<?php
use Hoborg\Bundle\DisplayServiceBundle\Component\Component;

date_default_timezone_set('UTC');

class PostsIndex extends Component {

	public function init() {
		parent::init();
	}

	public function prepareData() {

		parent::prepareData();
		foreach ($this->data->documentElement->childNodes as $component) {
			if ('folder' === $component->nodeName) {

				$folder = $component->nodeValue;
				$type = $component->getAttribute('type');
				$type = empty($type) ? 'list' : $type;

				$folderPath = $this->provider->getRootDir()
							. '/' . $this->provider->getSitePrefix()
							. '/' . $folder;

				if ('list' == $type) {
					$files = $this->scanDir($folderPath, $folder);
					foreach($files as $file) {
						$fileEl = $this->data->createElement('post', $file['title']);
						$fileEl->setAttribute('href', $file['href']);
						$fileEl->setAttribute('date', $file['date']);
						$this->data->documentElement->appendChild($fileEl);
					}
				} else if ('tags' == $type) {
					$tags = $this->scanDirForTags($folderPath, $folder);
					foreach($tags as $tag => $data) {
						$tagEl = $this->data->createElement('tag');
						$tagEl->setAttribute('name', $tag);
						foreach($data['files'] as $file) {
							$fileEl = $this->data->createElement('post', $file['title']);
							$fileEl->setAttribute('href', $file['href']);
							$fileEl->setAttribute('date', $file['date']);
							$tagEl->appendChild($fileEl);
						}
						$this->data->documentElement->appendChild($tagEl);
					}
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

	protected function scanDirForTags($path, $prefix) {
		$tags = array();
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
// 				$data = $d->item(0);
				$pageMeta = array(
					'tags' => array()
				);
				foreach ($d as $data) {
					foreach ($data->childNodes as $el) {
						if ('date' === $el->nodeName) {
							$pageMeta['date'] = $el->nodeValue;
						} else if ('tag' === $el->nodeName) {
							$pageMeta['tags'][] = $el->nodeValue;
						} else if ('title' == $el->nodeName) {
							$pageMeta['title'] = $el->nodeValue;
						}
					}
				}
				if (count($pageMeta) > 2) {
					$pageMeta['href'] = "/{$prefix}/" . str_replace('.page', '', $entry);
					$pageMeta['timestamp'] = strtotime($pageMeta['date']);

					foreach ($pageMeta['tags'] as $tag) {
						if (!isset($tags[$tag]) || !is_array($tags[$tag])) {
							$tags[$tag] = array('files' => array());
						}
						$tags[$tag]['files'][] = $pageMeta;
					}
				}
			} else if (is_dir("{$path}/{$entry}")) {
// 				$files = array_merge($files, $this->scanDirForTags("{$path}/{$entry}", "{$prefix}/{$entry}"));
			}
		}

// 		usort($files, function($a, $b) {
// 			return $b['timestamp'] - $a['timestamp'];
// 		});

		return $tags;
	}
}
