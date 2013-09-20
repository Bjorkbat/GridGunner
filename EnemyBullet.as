package {
	import org.flixel.FlxG;
	
	public class EnemyBullet extends Bullet {
		[Embed(source = "enemy_projectile.png")]private var Projectile:Class;
		[Embed(source = "laser7.mp3")]private var laser:Class;
		
		private static const SPEED:int = 400;
		
		public function EnemyBullet() {
			super();
			loadGraphic(Projectile);
		}
		
		override public function update():void {
			super.update();
			
			if(y >= 640) {
				kill();
			}
		}
				
		public function shoot(X:int, Y:int):void {
			super.reset(X, Y);
			solid = true;
			velocity.y = SPEED;
			FlxG.play(laser, 1, false);
		}
	}
}