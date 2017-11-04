var SkywayAssert = {
	elementExists: function(e) {
		if (!$(e)) {
			SkywayInternal.error("Element " + e.replace('<', '&lt;') + " not found.");
			return false;
		}
		return true;
	},
	elementHasInnerHTML: function(e) {
		if (!$(e).innerHTML) {
			SkywayInternal.error("Element " + e.replace('<', '&lt;') + " does not have an innerHTML attribute.  This can happen when you have an empty DIV element or you mistakenly have two different types of elements on the same page and they both have the same id.");
			return false;
		}
		return true;
	},
	urlIsNotBlank: function(url) {
        if (!url) {
            SkywayInternal.error("Missing URL.");
            return false;
        }
        return true;
	},
	formExists: function(f) {
		if (!document.forms[f]) {
			SkywayInternal.error("Form " + f + " not found.");
            return false;
		}
		return true;
	}
}

var SkywayArrayExtensions = {
	trim: function() {
		return SkywayInternal.trimArray(this);
	}
};
Object.extend(Array.prototype, SkywayArrayExtensions);

var SkywayInternal = {
	// Is this IE?
	ie: window.navigator.userAgent.toLowerCase().indexOf('msie') != -1,
	// Is this Opera?
	op: window.navigator.userAgent.toLowerCase().indexOf('opera') != -1,
    // Is this Firefox?
    ff: window.navigator.userAgent.toLowerCase().indexOf('firefox') != -1,
	// Is this old school NS?
	ns: document.layers,
	// Is undefined?
	un: function(o) {
		return o == null || typeof(o) == 'undefined';
	},
	inspect: function(o) {
		for (var k in o) {
			alert(k);
		}
	},
	loadUrl: function(url, asynchronous, elementId, formName, onSuccess, onError, onComplete, onInteractive) {
        if (!SkywayAssert.urlIsNotBlank(url)) return false;
        if (elementId && !SkywayAssert.elementExists(elementId)) return false;
        if (elementId && !SkywayAssert.elementHasInnerHTML(elementId)) return false;
		if (formName && !SkywayAssert.formExists(formName)) return false;
        
        if (!onError) onError = SkywayInternal.onError;

        if (elementId && !onSuccess && !onComplete) {
        	onSuccess = function(transport) {
        		var text = transport.responseText;
				// IE doesn't do well with innerHTML on empty elements.
				if (SkywayInternal.trim(text) == '') text = '&nbsp;';
				SkywayInternal.injectRichContent($(elementId), text);
        	}
        }
        
		var props = {
				'asynchronous': asynchronous, 
				'contentType': 'application/x-www-form-urlencoded',
				'encoding': 'UTF-8',
				'method': 'get', 
				'parameters': '_iGnOrE=' + (new Date().valueOf()),
				'evalJS': true, // returned content-type must be for scripting
				'evalJSON': true, // returned content-type must be application/json
				'onSuccess': onSuccess,
				'onComplete': onComplete, // Typically not used
				'onException': onError, 
				'onFailure': onError, 
				'onInteractive': onInteractive // Not guaranteed to be called
			}
			
		if (formName) {
			props['postBody'] = Form.serialize(document.forms[formName]);
			props['method'] = 'post';
		}
		
		var myAjax = new Ajax.Request(url, props); 
		if ($(elementId)) {
			$(elementId).origin = url;
		} 
		
		// Not accurate if asynchronous is true
		return myAjax.success();
    },
	resetErrorPanel: function() {
		$('skywayerror').innerHTML = "Errors&nbsp;&nbsp;&nbsp;[&nbsp;<a style='color:white;' href='javascript:void Element.hide(\"skywayerror\");'>hide</a>&nbsp;|&nbsp;<a style='color:white;' href='javascript:SkywayInternal.resetErrorPanel();'>clear</a>&nbsp;]<br/><br/>";		
	},
	setupErrorDiv: function() {
		if (!$('skywayerror')) {
			new Insertion.Top(document.body, "<div style='background-color:#E42217;color:white;font-size:11pt;font-family:sans-serif;font-weight:bold;padding:5px;border:1px solid #333' id='skywayerror'>&nbsp;</div>");
            SkywayInternal.resetErrorPanel();
		}
		Element.show($('skywayerror'));
	},
	error: function(msg) {
		SkywayInternal.setupErrorDiv();
		$('skywayerror').innerHTML += "" + msg + "<hr/>";
	},
	onError: function(o, exception) {
		// If an exception is passed, o is the requester (ie Ajax.Request).  Otherwise, o is the transport.
		if (exception != null) {
			text = exception.message;
		} else if (o.status == 404) {
			text = o.statusText + ' not available (404)';
		} else {
			text = o.statusText + ' (' + o.status + ')';
		}
		SkywayInternal.error(text);
	},
    // Injects rich content into an element.  Rich content contains SCRIPT or STYLE tags.
    injectRichContent: function(e, content) {
        if (SkywayInternal.ie) {
            // STYLE tags are non-scoped elements in IE, so they must be preceded by a scoped element when injecting using innerHTML; otherwise, they are stripped.
            // http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=909362&SiteID=1
            content = "<span style='display:none'>&nbsp;</span>" + content;
        }
		$(e).innerHTML=content;
		if (SkywayInternal.ie) {
			// Setting a 100ms delay on script execution.  IE 6 crashes in some cases where we're dynamically loading 
			// content and then accessing it immediately afterwards (e.g. requesting focus on a field in that content).
			SkywayInternal.delayedEvalScripts($(e), 100);
		} else {
			SkywayInternal.evalScripts($(e));
		}
    },
    delayedEvalScripts: function(e, delay) {
        var f = function() {
            SkywayInternal.evalScripts(e);
        }   
        setTimeout(f, delay);        
    },
	evalScripts: function(parentElement) {
        var scriptElementList = parentElement.getElementsByTagName("script");
        var scriptList = new Array();
		// Intentionally iterating backwards for remove.
        for (var anIndex = scriptElementList.length - 1; anIndex >= 0; anIndex--) {
			scriptList.push(scriptElementList[anIndex]);
			scriptElementList[anIndex].parentNode.removeChild(scriptElementList[anIndex]);
		}
		// Intentionally iterating backwards.
		for (var anIndex = scriptList.length - 1; anIndex >= 0; anIndex--) {
            var src = scriptList[anIndex].src;
            var text = scriptList[anIndex].text;
            if (src) {
                // This is a script include.
                SkywayInternal.include(src);
            } else {
                var script = document.createElement('script'); 
                script.text = text;
 			    script.type = 'text/javascript';
                parentElement.appendChild(script); 
            }
		}
	},
	// Dynamically load a script library
	include: function(script) {
		// Check to see if the library has already been loaded.
        var a = document.getElementsByTagName('script');
		for (x=0; a != null && x < a.length; x++) {
			if (a[x].src == script) {
                return false;
			}
		}
		var e = document.createElement('script');
        e.type = 'text/javascript';
		e.setAttribute('src', script);
        document.getElementsByTagName('head')[0].appendChild(e);
		return true;
	},
	requestFocus: function(e) {
        $(e).focus();
	},
    trim: function(s) {
        return s.replace(/^\s*/, "").replace(/\s*$/, "");
    },
    trimArray: function(sa) {
		for (x=0; x < sa.length; x++) {
			sa[x] = SkywayInternal.trim(sa[x]);
		}
		return sa;
    },
	// Returns the key press code for an event
	getKey: function(e) {
		if (window.event) {
			return window.event.keyCode;
		} else if (e) {
			return e.which;
		}
		return null;
	},
	// Move an element absolutely
	moveTo: function(e, x, y) {
		Element.absolutize(e);
		e = $(e);
		if (SkywayInternal.ns) {
			e.left = x;
			e.top = y;
		} else if (SkywayInternal.op) {
			e.style.pixelLeft = x;
			e.style.pixelTop = y;
		} else {
			e.style.left = x + 'px';
			e.style.top = y + 'px';
		}
	}
}