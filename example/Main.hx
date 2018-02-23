package ;

import js.Browser;
import js.html.Element;
import js.youtube.Youtube;
import js.youtube.YoutubePlayer;

class Main {

	public static function main():Void {

		Browser.window.addEventListener('DOMContentLoaded',init);

	}

	private static function init():Void {

		var target:Element = Browser.document.getElementById('video');

		function onAPIReady() {

			var player:YoutubePlayer = new YoutubePlayer(target.id,{
				videoId:target.dataset.videoId,
				events : {
					onReady:function(event:ReadyEvent) {
						trace(event);
					}
				}
			});

		}

		Youtube.init(onAPIReady);

	}

}
