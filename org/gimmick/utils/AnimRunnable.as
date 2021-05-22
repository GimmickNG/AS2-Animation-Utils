class org.gimmick.utils.AnimRunnable
{
	private var finished:Boolean;
	public function AnimRunnable() {
		finished = false
	}
	public function run():Boolean
	{
		finished = finished || execRoutine()
		return finished
	}
	private function execRoutine():Boolean {
		return false;
	}
}