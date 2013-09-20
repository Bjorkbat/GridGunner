package {

	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	
	public class TetraEnemy extends Enemy {
		[Embed(source = "tetra.png")]public var Tetra:Class;
		
		private static const SPEED:int = 160;
		private static const GUN_DELAY:Number = 0.2;
		private static const PULSE_DELAY:Number = 0.8;
		private static const SHOT_NUMBER:int = 3;
		
		private var bullets:FlxGroup
		private var innerCoolDown:Number;
		private var outerCoolDown:Number;
		private var shots:int;
		
		public function TetraEnemy(X:Number, Y:Number, EnemyBullets:FlxGroup) {
			super(X, Y);
			startX = X;
			startY = Y;
						
			loadGraphic(Tetra);  //Set up the graphics
			
			exists = false;
			drag.y = SPEED * 7;
			maxVelocity.y = SPEED;
			bullets = EnemyBullets;
			innerCoolDown = 0;
			outerCoolDown = 0;
			shots = 0;
		}
		
		public override function update():void {
			//320, half the height of the screen, minus 32, half the height of the sprite
			if(y >= 296) {
				acceleration.y = 0;
				pulseShot();
			}
			else if(y < 296) {
				acceleration.y = drag.y;
			}
			innerCoolDown += FlxG.elapsed;
			outerCoolDown += FlxG.elapsed;
			super.update();
		}
		
		private function pulseShot():void {
			var bulletXPos:int = x + 20;
			var bulletYPos:int = y + 24;
			
			var nextBullet:EnemyBullet;
			nextBullet = bullets.getFirstAvailable() as EnemyBullet;
			
			if(outerCoolDown >= PULSE_DELAY && shots < SHOT_NUMBER) {
				if(innerCoolDown >= GUN_DELAY) {
					nextBullet.shoot(bulletXPos, bulletYPos);
					innerCoolDown = 0;
					shots += 1;
				}
				if(shots >= SHOT_NUMBER) {
					shots = 0;
					outerCoolDown = 0;
				}
			}
		}
	}
}