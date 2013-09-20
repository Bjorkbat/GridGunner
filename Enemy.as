package {
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	
	public class Enemy extends FlxSprite {
		
		protected var startX:int;
		protected var startY:int;
		protected var killFlag:int;
		
		public function Enemy(X:Number, Y:Number) {
			super(X, Y);
			startX = X;
			startY = Y;			
			exists = false;
			killFlag = 0;
		}
		
		public override function update():void {
			if(!flickering && killFlag) {
				y = -100;
				killFlag = 0;
				super.kill();
			}
		}
		
		public override function kill(): void {
			if(!flickering && killFlag == 0) {
				flicker(0.1);
				killFlag = 1;
			}
			else {
				//Do absolutely nothing!
			}
		}
		
		override public function overlaps(ObjectOrGroup:FlxBasic,
			InScreenSpace:Boolean = false, Camera:FlxCamera = null): Boolean {
			if(exists) {
				return super.overlaps(ObjectOrGroup);
			}
			return false;
		}
		
		public function genEnemy():void {
			super.reset(startX, startY);
			solid = true;
		}
	}
}