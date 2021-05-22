import org.gimmick.utils.*;
class org.gimmick.utils.ClipPlayer extends AnimRunnable
{
	private var frameTimeout:Number
	private var currFrame:Number
	private var targets:Array;
	public function ClipPlayer(targets:Array, frameTimeout:Number) {
		currFrame = 0;
		this.targets = targets;
		this.frameTimeout = frameTimeout;
	}
	
	private function execRoutine():Boolean
	{
		if(currFrame < frameTimeout) {
			++currFrame;
		}
		else
		{
			for(var i:Number = 0; i < targets.length; ++i) {
				MovieClip(targets[i]).play()
			}
			return true
		}
		return false
	}
}
