package js.youtube;

import js.Browser;
import js.html.Element;
import js.html.ScriptElement;
 
class Youtube {

	public static var isLoadedAPI    :Bool   = false;
	private static inline var API_URL:String = 'https://www.youtube.com/player_api';

	public static function init(?onAPIReady:Void->Void):Void {

		var firstElement:Element = Browser.document.getElementsByTagName('script')[0];
		var script:ScriptElement = Browser.document.createScriptElement();
		script.src = API_URL;
		firstElement.parentNode.insertBefore(script,firstElement);
		(cast Browser.window).onYouTubePlayerAPIReady = function() {
			isLoadedAPI = true;
			if (onAPIReady != null) onAPIReady();
		};

	}

}