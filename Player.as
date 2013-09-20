package {
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	
	public class Player extends FlxSprite {
	
		[Embed(source = "cybership.png")]public var PlayerFighter:Class;
		
		protected static const SPEED:int = 600;
		protected static const GUN_DELAY:Number = .1;
		protected var cooldown:Number;
		protected var bullets:FlxGroup;
		
		public function Player(X:int, Y:int, Bullets:FlxGroup):void {
			super(X, Y);
			loadGraphic(PlayerFighter, false, false);
			drag.x = SPEED * 8;
			drag.y = SPEED * 8;
			maxVelocity.x = SPEED;
			maxVelocity.y = SPEED;
			bullets = Bullets;
			cooldown = GUN_DELAY;
		}
		
		public override function update():void {
			super.update();
			acceleration.x = 0;
			acceleration.y = 0;
			
			cooldown += FlxG.elapsed;
			
			if(FlxG.keys.LEFT) {
				acceleration.x = -drag.x;
			}
			else if(FlxG.keys.RIGHT) {
				acceleration.x = drag.x;
			}
			else if(FlxG.keys.UP) {
				acceleration.y = -drag.x;
			}
			else if(FlxG.keys.DOWN) {
				acceleration.y = drag.x;
			}
			if(FlxG.keys.X) {
				shootBullet();
			}
		}
		
		private function shootBullet():void {
			var bulletXPos:int = x + 28;
			var bulletYPos:int = y + 32;
			
			var nextBullet:PlayerBullet;
			
			nextBullet = bullets.getFirstAvailable() as PlayerBullet;
			if(cooldown > GUN_DELAY) {
				nextBullet.shoot(bulletXPos, bulletYPos);
				cooldown = 0;
			}
		}
	}
}