package js.youtube;

import haxe.extern.EitherType;
import js.html.IFrameElement;

typedef PlayerParameters = {
	?autoplay      :Int,
	?cc_load_policy:Int,
	?color         :Color,
	?controls      :Int,
	?disablekb     :Int,
	?enablejsapi   :Int,
	?end           :Int,
	?fs            :Int,
	?hl            :String,
	?iv_load_policy:Int,
	?list          :String,
	?listType      :ListType,
	?loop          :Int,
	?modestbranding:Int,
	?origin        :Int,
	?playlist      :Array<String>,
	?playsinline   :Int,
	?rel           :Int,
	?showinfo      :Int,
	?start         :Int
}

typedef Options = {
	?videoId   :String,
	?width     :Int,
	?height    :Int,
	?playerVars:PlayerParameters,
	?events    :Event
}

typedef Event = {
	?onReady                :ReadyEvent->Void,
	?onStateChange          :StateChangeEvent->Void,
	?onPlaybackQualityChange:PlaybackQualityChangeEvent->Void,
	?onPlaybackRateChange   :PlaybackRateChangeEvent->Void,
	?onError                :ErrorEvent->Void,
	?onApiChange            :ApiChangeEvent->Void
}

typedef ReadyEvent                 = { target:YoutubePlayer }
typedef StateChangeEvent           = { target:YoutubePlayer,data:YoutubePlayerState }
typedef PlaybackQualityChangeEvent = { target:YoutubePlayer,data:PlaybackQuality }
typedef PlaybackRateChangeEvent    = { target:YoutubePlayer,data:PlaybackQuality }
typedef ErrorEvent                 = { target:YoutubePlayer,data:Int }
typedef ApiChangeEvent             = { target:YoutubePlayer,data:Int }

@:native('YT.Player')
extern class YoutubePlayer {

	public function new(elementId:String,options:Options):Void;

	public function cueVideoById(param:{videoId:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:PlaybackQuality}):Void;
	public function loadVideoById(param:{videoId:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:PlaybackQuality}):Void;
	public function cueVideoByUrl(param:{mediaContentUrl:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:PlaybackQuality}):Void;
	public function loadVideoByUrl(param:{mediaContentUrl:String,?startSeconds:Int,?endSeconds:Int,?suggestedQuality:PlaybackQuality}):Void;
	public function cuePlaylist(playlist:EitherType<String,Array<String>>,?index:Int,?startSeconds:Int,?suggestedQuality:PlaybackQuality):Void;
	public function loadPlaylist(playlist:EitherType<String,Array<String>>,?index:Int,?startSeconds:Int,?suggestedQuality:PlaybackQuality):Void;

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

	public function getPlaybackQuality():PlaybackQuality;
	public function setPlaybackQuality(suggestedQuality:PlaybackQuality):Void;
	public function getAvailableQualityLevels():Array<PlaybackQuality>;

	public function getDuration():Int;
	public function getVideoUrl():String;
	public function getVideoEmbedCode():String;

	public function getPlaylist():Array<String>;
	public function getPlaylistIndex():Int;

	public function addEventListener<T>(event:String,listener:T->Void):Void;
	public function removeEventListener<T>(event:String,listener:T->Void):Void;

	public function getIframe():IFrameElement;
	public function destroy():Void;

	public function getOption(?module:OptionModule,?option:ModuleOption):Array<OptionModule>;
	public function setOption(?module:OptionModule,?option:ModuleOption,?value:EitherType<Int,Bool>):YoutubePlayer;

}

@:enum abstract PlaybackQuality(String) from String to String {
	var small   :String = 'small';
	var medium  :String = 'medium';
	var large   :String = 'large';
	var hd720   :String = 'hd720';
	var hd1080  :String = 'hd1080';
	var highres :String = 'highres';
	var _default:String = 'default';
}

@:enum abstract Color(String) from String to String {
    var red  :String = 'red';
    var white:String = 'white';
}

@:enum abstract ListType(String) from String to String {
	var search      :String = 'search';
	var user_uploads:String = 'user_uploads';
	var playlist    :String = 'playlist';
}

@:enum abstract OptionModule(String) from String to String {
	var cc:String = 'cc';
}

@:enum abstract ModuleOption(String) from String to String {
	var fontsize:String = 'fontsize';
	var reload  :String = 'reload';
}

@:enum abstract YoutubePlayerState(Int) {
	var UNSTARTED = -1;
	var ENDED     = 0;
	var PLAYING   = 1;
	var PAUSED    = 2;
	var BUFFERING = 3;
	var CUED      = 5;
}
