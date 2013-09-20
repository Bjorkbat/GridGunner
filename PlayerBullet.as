package {
	import org.flixel.FlxG;
	
	public class PlayerBullet extends Bullet {
		[Embed(source = "projectile.png")]public var Projectile:Class;
		[Embed(source = "laser1.mp3")]public var laser:Class;
		
		protected static const SPEED:int = 800;
		
		public function PlayerBullet() {
			super();
			loadGraphic(Projectile);
		}
		
		override public function update():void {
			super.update();
			
			if(y <= 0) {
				kill();
			}
		}
				
		public function shoot(X:int, Y:int):void {
			super.reset(X, Y);
			solid = true;
			velocity.y = -SPEED;
			FlxG.play(laser, 1, false);
		}
	}
}