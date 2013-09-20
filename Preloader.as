package {
	import org.flixel.system.FlxPreloader;
	
	public class Preloader extends FlxPreloader {
		public function Preloader() {
			minDisplayTime = 2;
			className = "GridGunner";
			super.create();
		}
	}
}