package js.youtube;
 
@:native('YT.PlayerState')
extern class YoutubePlayerState {

	public static var UNSTARTED : Int;
	public static var ENDED     : Int;
	public static var PLAYING   : Int;
	public static var PAUSED    : Int;
	public static var BUFFERING : Int;
	public static var CUED      : Int;

}