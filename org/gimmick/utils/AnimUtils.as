import org.gimmick.utils.*;
class org.gimmick.utils.AnimUtils extends MovieClip
{
	private var queued_functions:Array;
	private static var mainInstance:AnimUtils;
	/**
	 *	Initializes the animation utilities.
	 *	This is automatically called when the component is present on the stage.
	 *
	 *	Params:
	 * 		timekeeper	The timekeeper movieclip. Must be on the stage.
	 					Using _root as the timekeeper works almost all the time.
						If it does not work, try using a different timekeeper.
	 */
	public function AnimUtils()
	{
		if(mainInstance) {
			throw new Error("N.B.: If you're seeing this during the preview, you might have more than one instance of this component on the Stage. Ignore this note if you see this message while editing your file and you are sure there is no more than one instance on the Stage.")
		}
		else
		{
			this._visible = false
			queued_functions = []
			onEnterFrame = update;
			mainInstance = this;
		}
	}
	
	public function update():Void
	{
		for (var i:Number = queued_functions.length - 1; i >= 0; --i)
		{
			var refObj:AnimRunnable = AnimRunnable(queued_functions[i])
			if(refObj.run()) {
				queued_functions.splice(i, 1)
			}
		}
	}
	
	/**
	 *	Shakes the target {mc} every frame for {numShakes} frames for anywhere between +/-{maxMagnitude} pixels.
	 *	An optional delay can be provided which waits for {delayFrames} frames before shaking the screen.
	 *	The effective runtime of this script is {numShakes * delayFrames} frames.
	 */
	public function shake(mc:MovieClip, numShakes:Number, delayFrames:Number, maxMagnitude:Number):Void
	{
		mc = mc || _root
		delayFrames = delayFrames || 0
		numShakes = numShakes || 4
		maxMagnitude = maxMagnitude || 25
		var halfMax:Number = maxMagnitude / 2
		var coordinates:Array = []
		for(var i:Number = numShakes * 2; i >= 0; --i) {
			coordinates.push(random(maxMagnitude) - halfMax)
		}
		//queue shaking target
		queued_functions.push(new ClipShaker(mc, numShakes, delayFrames, coordinates))
	}
	
	/**
	 *	Stops the target {mc} and all clips nested within it for {timeout} frames, and then resumes them.
	 */
	public function hitStun(timeout:Number, mc:MovieClip):Void
	{
		mc = mc || _root
		var nestedClips:Array = getNestedClips(mc)
		//stops all clips 
		for(var i:Number = 0; i < nestedClips.length; ++i) {
			MovieClip(nestedClips[i]).stop()
		}
		//queue playing clips for later
		queued_functions.push(new ClipPlayer(nestedClips, timeout))
	}
	
	private static function getNestedClips(mc:MovieClip):Array
	{
		var all_mcs:Array = [mc]
		var resultArr:Array = []
		while(all_mcs.length != 0)
		{
			var top_mc:MovieClip = MovieClip(all_mcs.shift())
			if(!top_mc) {
				continue
			}
			resultArr.push(top_mc)
			for(var _mc in top_mc)
			{
				var curr_mc:MovieClip = MovieClip(top_mc[_mc])
				if(curr_mc && curr_mc != top_mc) {
					all_mcs.push(curr_mc)	
				}
			}
		}
		return resultArr
	}
	
	public static function getInstance():AnimUtils {
		return mainInstance;
	}
}