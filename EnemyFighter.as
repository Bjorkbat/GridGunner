package {

	import Enemy;
	
	public class EnemyFighter extends Enemy {
		[Embed(source = "enemy_fighter.png")]public var EFighter:Class;
		
		protected static const SPEED:int = 240;
		
		public function EnemyFighter(X:Number, Y:Number) {
			super(X, Y);
			startX = X;
			startY = Y;
						
			loadGraphic(EFighter);  //Set up the graphics
			
			exists = false;
			drag.y = SPEED * 7;
			maxVelocity.y = SPEED;
		}
		
		public override function update():void {
			//Fly to the bottom of the screen.  Once you reach the bottom, kill thyself
			if(y >= 640) {
				kill();
			}
			else
				acceleration.y = drag.y;
			super.update();
		}
	
	}

}