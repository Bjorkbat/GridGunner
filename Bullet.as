package {
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	
	public class Bullet extends FlxSprite {
		
		public function Bullet() {
			super();
			exists = false;
		}
		
		override public function overlaps(ObjectOrGroup:FlxBasic,
			InScreenSpace:Boolean = false, Camera:FlxCamera = null):Boolean {
			if(exists) {
				return super.overlaps(ObjectOrGroup);
			}
			return false;
		}
	}
}