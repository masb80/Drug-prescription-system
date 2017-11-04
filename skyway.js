var Skyway = {
	// Load URL traditionally (non-Ajax).
	loadUrlIntoFrame: function(url, frame) {
		if (frame == null || frame == '_self') {
			document.location.href = url;
		} else if (frame == '_blank') {
			window.open(url);
		} else if (frame == '_parent') {
			// TODO - not supported 
		} else if (frame == '_top') {
			top.document.location.href = url;
		} else {
			// TODO - Doesn't work unless you're referencing the IFRAME by name.
			window.frames[frame].document.location.href = url;
		}
	},
	submitForm: function(formName, asynchronous, elementId, onSuccess, onError, onComplete, onInteractive) {
		if (!SkywayAssert.formExists(formName)) return false;
		return SkywayInternal.loadUrl(document.forms[formName].action, asynchronous, elementId, formName, onSuccess, onError, onComplete, onInteractive);
	},
	loadUrl: function(url, asynchronous, elementId, onSuccess, onError, onComplete, onInteractive) {
		return SkywayInternal.loadUrl(url, asynchronous, elementId, null, onSuccess, onError, onComplete, onInteractive);
	}, 
	// Show element.  
	changeVisibility: function(h, s) {
		if (h) {
			h.split(',').trim().each(function(e) {
				if ($(e)) Element.hide(e);
				else SkywayInternal.error("Element " + e + " not found.  Attempting to hide an element that does not exist.");
			});
		}
		if (s) {
			s.split(',').trim().each(function(e) {
				if ($(e)) Element.show(e);
				else SkywayInternal.error("Element " + e + " not found.  Attempting to show an element that does not exist.");
			});
		}
	},
	// Toggle element.  
	toggle: function(e) {
		if (e) {
			e.split(',').trim().each(function(e) {
				if ($(e)) Element.toggle(e);
				else SkywayInternal.error("Element " + e + " not found.  Attempting to toggle the visibility of an element that does not exist.");
			});
		}
	},
	// Change classes on an element.  
	changeCss: function(e, a, r) {
		if (a) Skyway.addClass(e, a);
		if (r) Skyway.removeClass(e, r);
	},
	// Change classes on an element.  
	toggleCss: function(e, c) {
		e.split(',').trim().each(function(e) {
			c.split(',').trim().each(function(c) {
				if (Element.hasClassName(e, c)) Skyway.removeClass(e, c);
				else Skyway.addClass(e, c); 
			});
		});
	},
	// Sets the style of an element.  The style must be JSON. 
	setStyle: function(e, s) {
		var ea = e.split(',').trim();
		for (y=0; y < ea.length; y++) {
            if ($(ea[y])) Element.setStyle(ea[y], s);
            else SkywayInternal.error("Element " + ea[y] + " not found.  Attempting to set the style of an element that does not exist.");
		}
	},
	// Add class to element.  
	addClass: function(e, c) {
		e.split(',').trim().each(function(e) {
			c.split(',').trim().each(function(c) {
                if (c) {
	            	if ($(e)) Element.addClassName(e, c);
    	        	else SkywayInternal.error("Element " + e + " not found.  Attempting to add a CSS class to an element that does not exist.");
    	        }
			});
		});
	},
	// Remove class from element.  
	removeClass: function(e, c) {
		e.split(',').trim().each(function(e) {
			c.split(',').trim().each(function(c) {
                if (c) {
		            if ($(e)) Element.removeClassName(e, c);
		            else SkywayInternal.error("Element " + e + " not found.  Attempting to remove a CSS class from an element that does not exist.");
    	        }
			});
		});
	},
	// Move an element to an event position.
	moveToEventPos: function(e, event) {
		SkywayInternal.moveTo(e, Event.pointerX(event), Event.pointerY(event));
	},
	// Move an element absolutely or relative to another element.
	move: function(e, relativeTo, x, y) {
		if (relativeTo) {
			Element.absolutize(e);
			Element.clonePosition(e, relativeTo, {setWidth:false, setHeight:false, offsetLeft:x, offsetTop:y});
		} else {
			SkywayInternal.moveTo(e, x, y);
		}
	},
	// Swap one image for another.
	swapImage: function(s, d) {
		if (!$(s)) SkywayInternal.error("Image " + s + " not found.  Attempting to swap an image that does not exist.");
        if ($(s) && d) $(s).src = d.match(/\s*http:/i) ? d : $(d).src;
	},
	// Reloads the page or the specified layers
	reload: function(e) {
		if (e) {
			e.split(',').trim().each(function(e) {
				if ($(e)) {
					var o = $(e).getAttribute('origin');
					if (o) {
						Skyway.loadUrl(o, true, e); 
					}
				}
			});
		} else {
			window.location.href=window.location.href;	
		}
	}
}