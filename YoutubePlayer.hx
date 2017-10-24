package js.youtube;

import haxe.extern.EitherType;
import js.Browser;
import js.html.ScriptElement;
import js.html.IFrameElement;

typedef Event = {
	data   : Dynamic,
	target : YoutubePlayer
}

typedef PlayerParameter = {
	?autoplay       : Int,
	?cc_load_policy : Int,
	?color       : String,
	?controls    : Int,
	?disablekb   : Int,
	?enablejsapi : Int,
	?end : Int,
	?fs  : Int,
	?hl  : String,
	?iv_load_policy : Int,
	?list     : String,
	?listType : String,
	?loop     : Int,
	?modestbranding : Int,
	?origin   : Int,
	?playlist : Array<String>,
	?playsinline : Int,
	?rel      : Int,
	?showinfo : Int,
	?start    : Int
}

typedef Parameter = {
	?videoId : String,
	?width   : Int,
	?height  : Int,
	?playerVars : PlayerParameter,
	?events     : {
		?onReady       : Event->Void,
		?onStateChange : Event->Void,
		?onPlaybackQualityChange : Event->Void,
		?onPlaybackRateChange    : Event->Void,
		?onError     : Event->Void,
		?onApiChange : Event->Void
	}
}
 
@:native('YT.Player')
extern class YoutubePlayer {

	public function new(elementId:String,param:Parameter):Void;

	public function cueVideoById(param:{videoId:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:String}):Void;
	public function loadVideoById(param:{videoId:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:String}):Void;
	public function cueVideoByUrl(param:{mediaContentUrl:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:String}):Void;
	public function loadVideoByUrl(param:{mediaContentUrl:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:String}):Void;
	public function cuePlaylist(playlist:EitherType<String,Array<String>>,?index:Int,?startSeconds:Int,?suggestedQuality:String):Void;
	public function loadPlaylist(playlist:EitherType<String,Array<String>>,?index:Int,?startSeconds:Int,?suggestedQuality:String):Void;

	public function playVideo():Void;
	public function pauseVideo():Void;
	public function stopVideo():Void;

	public function seekTo(seconds:Int,allowSeekAhead:Bool):Void;
	public function clearVideo():Void;

	public function nextVideo():Void;
	public function previousVideo():Void;
	public function playVideoAt(index:Int):Void;

	public function mute():Void;
	public function unMute():Void; 
	public function isMuted():Bool;
	public function setVolume(volume:Int):Void;
	public function getVolume():Int;

	public function setSize(?width:Float,?height:Float):YoutubePlayer;

	public function getPlaybackRate():Float;
	public function setPlaybackRate(suggestedRate:Int):Void;
	public function getAvailablePlaybackRates():Array<Float>;

	public function setLoop(loopPlaylists:Bool):Void;
	public function setShuffle(shufflePlaylist:Bool):Void;

	public function getVideoLoadedFraction():Float;
	public function getPlayerState():Int;
	public function getCurrentTime():Int;

	public function getPlaybackQuality():String;
	public function setPlaybackQuality(suggestedQuality:String):Void;
	public function getAvailableQualityLevels():Array<String>;

	public function getDuration():Int;
	public function getVideoUrl():String;
	public function getVideoEmbedCode():String;

	public function getPlaylist():Array<String>;
	public function getPlaylistIndex():Int;

	public function addEventListener(event:String,listener:String):Void;
	public function removeEventListener(event:String,listener:String):Void;

	public function getIframe():IFrameElement;
	public function destroy():Void;

	public function getOptions(?module:String,?option:String):Dynamic;
	public function setOption(?module:String,?option:String,?value:String):Dynamic;

}