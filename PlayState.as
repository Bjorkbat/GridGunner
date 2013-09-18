package {
	import org.flixel.*;
	import Player;
	import Enemy;
	import Bullet;
	
	public class PlayState extends FlxState {
	
		protected static const ENEMY_DELAY:Number = 0.5;
		public var player:Player;
		protected var bullets:FlxGroup;
		protected var enemies:FlxGroup;
		protected var genCoolDown:Number;
		override public function create():void {
			bullets = new FlxGroup;
			enemies = new FlxGroup;
			
			for(var i:int = 0; i < 32; i ++)
				bullets.add(new Bullet());
			add(bullets);
			
			for(i = 0; i < 7; i ++) {
				enemies.add(new Enemy((i*64 + 16), 0));
			}
			add(enemies);
			add(player = new Player(240, 560, bullets));
			
			genCoolDown = ENEMY_DELAY;
		}
		
		override public function update():void {
			//on event of impact
			super.update();
			var nextEnemy:Enemy;
			for(var i:int = 0; i < 7; i ++) {
				if(enemies.members[i].overlaps(player) && enemies.members[i].alive) {
					player.kill();
				}
				for(var j:int = 0; j < 32; j ++) {
					if(bullets.members[j].overlaps(enemies.members[i]) && bullets.members[i].alive) {
						bullets.members[j].kill();
						enemies.members[i].kill();
					}
				}	
			}
			
			nextEnemy = enemies.getRandom() as Enemy;

			if(!(nextEnemy.exists) && genCoolDown > ENEMY_DELAY) {
				nextEnemy.genEnemy();
				genCoolDown = 0;
			}
			genCoolDown += FlxG.elapsed;
		}
	}
}