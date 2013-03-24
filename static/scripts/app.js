if (!Function.prototype.bind) {
	Function.prototype.bind = function (oThis) {
		if (typeof this !== "function") {
			// closest thing possible to the ECMAScript 5 internal IsCallable function
			throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
		}

		var aArgs = Array.prototype.slice.call(arguments, 1), 
			fToBind = this, 
			fNOP = function () {},
			fBound = function () {
				return fToBind.apply(this instanceof fNOP && oThis
						? this
						: oThis, aArgs.concat(Array.prototype.slice.call(arguments)));
			};

		fNOP.prototype = this.prototype;
		fBound.prototype = new fNOP();

		return fBound;
	};
}

var app = window.app = {};

(function(context, window) {

	function Page(window) {
		this.document = window.document;
		this.onLoadCallbacks = [];

		window.onload = this.onLoad.bind(this);
		this.attachToPageOnLoad(this.hijackUrls.bind(this));
	};

	Page.prototype.onLoad = function(e) {
		for (var i in this.onLoadCallbacks) {
			this.onLoadCallbacks[i](e);
		}
	};

	Page.prototype.attachToPageOnLoad = function(callback) {
		this.onLoadCallbacks.push(callback);
	};

	Page.prototype.hijackUrls = function() {
		var allLinks = this.document.getElementsByClassName('tile-frame');
		for (var i = 0; i < allLinks.length; i++) {
			if (allLinks[i].hasAttribute('data-href')) {
				allLinks[i].onclick = function() {
					var url = this.getAttribute('data-href');
					window.location.href = url;
				};
				allLinks[i].style.cursor = 'pointer';
			}
		}
	};

	context.page = new Page(window);
})(app, window);