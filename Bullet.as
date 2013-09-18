package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	
	public class Bullet extends FlxSprite {
		[Embed(source = "projectile.png")]public var Projectile:Class;
		
		protected static const SPEED:int = 800;
		
		public function Bullet() {
			super();
			loadGraphic(Projectile);
			exists = false;
		}
		
		override public function update():void {
			if(!alive) {
				exists = false;
			}
			else super.update();
			
			if(y <= 0) {
				kill();
			}
		}
				
		public function shoot(X:int, Y:int):void {
			super.reset(X, Y);
			solid = true;
			velocity.y = -800;
		}
	}
}