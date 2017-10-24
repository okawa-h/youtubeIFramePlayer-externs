package js.youtube;

import js.Browser;
import js.html.Element;
import js.html.ScriptElement;
 
class YoutubeManager {

	private static inline var API_URL : String = 'https://www.youtube.com/player_api';

	public static function init(?onAPIReady:Void->Void):Void {

		var script : ScriptElement = Browser.document.createScriptElement();
		script.src = API_URL;
		var firstTag : Element = Browser.document.getElementsByTagName('script')[0];
		firstTag.parentNode.insertBefore(script,firstTag);
		(cast Browser.window).onYouTubePlayerAPIReady = onAPIReady;

	}

}