import flash.geom.Point;
import org.gimmick.utils.*;
class org.gimmick.utils.ClipShaker extends AnimRunnable
{
	private var interFrameDelay:Number
	private var coords:Array;
	private var shakes:Number;
	private var currIndex:Number;
	private var delayFrames:Number;
	private var origPt:Point;
	private var targetMC:MovieClip;
	public function ClipShaker(target:MovieClip, numShakes:Number, delayFrames:Number, coordinates:Array)
	{
		targetMC = target
		shakes = numShakes;
		coords = coordinates;
		interFrameDelay = currIndex = 0;
		origPt = new Point(target._x, target._y);
	}
	private function execRoutine():Boolean
	{
		
		if(interFrameDelay < delayFrames) {
			interFrameDelay ++
		}
		else
		{
			interFrameDelay = 0
			targetMC._x = origPt.x + coords[currIndex * 2]
			targetMC._y = origPt.y + coords[currIndex * 2 + 1]
			++currIndex
			if(currIndex >= shakes) {
				targetMC._x = origPt.x;
				targetMC._y = origPt.y;
				return true
			}
		}
		return false
	}
}
