package {
	import org.flixel.*;
	import PlayState;
	
	//This bit here is pretty straightforward
	[SWF(width="480", height="640", backgroundColor = "000000")]
	
	public class GridGunner extends FlxGame {
		public function PixelAce() {
			//Pretty straightforward.  The extra '1' argument defines the "zoom"
			//Try changing it to different values to see what happens
			super(480, 640, PlayState,1);
		}
	}
}