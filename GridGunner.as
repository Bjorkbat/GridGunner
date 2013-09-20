package {
	import org.flixel.*;
	import PlayState;
	
	//This bit here is pretty straightforward
	[SWF(width="448", height="640", backgroundColor = "000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class GridGunner extends FlxGame {
		public function GridGunner() {
			//Pretty straightforward.  The extra '1' argument defines the "zoom"
			//Try changing it to different values to see what happens
			super(448, 640, PlayState,1);
		}
	}
}