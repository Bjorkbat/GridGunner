package {
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author David Bell
	 * shamelessly modified by Bjorkbat the Brave
	 */
	public class Enemy extends FlxSprite {
		[Embed(source = "cube_enemy.png")]public var Cube:Class;
		
		protected static const SPEED:int = 240;
		protected var startX:int;
		protected var startY:int;
		
		public function Enemy(X:Number, Y:Number) {
			super(X, Y);
			startX = X;
			startY = Y;
						
			loadGraphic(Cube);  //Set up the graphics
			
			exists = false;
			drag.y = SPEED * 7;
			maxVelocity.y = SPEED;
			
		}
		
		public override function update():void {
			
			if(!alive) {
				exists = false;
			}
			else if(y >= 360) {
				acceleration.y = 0;
			}
			else if(y < 360) {
				acceleration.y = drag.y;
			}
			
			super.update();
		}
		
		public function genEnemy():void {
			super.reset(startX, startY);
			solid = true;
		}
	
	}

}