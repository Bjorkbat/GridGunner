package {
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import flash.geom.Rectangle;

	public class PlayState extends FlxState {
	
		[Embed("background.png")]private var background:Class;
	
		protected static const ENEMY_DELAY:Number = 0.5;
		protected var player:Player;
		protected var playerbullets:FlxGroup;
		protected var enemybullets:FlxGroup;
		protected var tetraenemies:FlxGroup;
		protected var fighterenemies:FlxGroup;
		protected var genCoolDown:Number;
		private var scrollingBackground:FlxScrollZone;
		private var backgroundSprite:FlxSprite;
		
		override public function create():void {
			playerbullets = new FlxGroup;
			enemybullets = new FlxGroup
			tetraenemies = new FlxGroup;
			fighterenemies = new FlxGroup;
			//	If the FlxScrollZone Plugin isn't already in use, we add it here
			if (FlxG.getPlugin(FlxScrollZone) == null)
			{
				FlxG.addPlugin(new FlxScrollZone);
			}
			
			backgroundSprite = new FlxSprite(0,0);
			backgroundSprite.loadGraphic(background);
			FlxScrollZone.add(backgroundSprite, new Rectangle(0, 0, 448, 640), 0, 2);
			add(backgroundSprite);
			
			for(var i:int = 0; i < 32; i ++)
				playerbullets.add(new PlayerBullet());
			add(playerbullets);
			
			for(i = 0; i < 32; i ++)
				enemybullets.add(new EnemyBullet());
			add(enemybullets);
			
			for(i = 0; i < 7; i ++) {
				tetraenemies.add(new TetraEnemy((i*64 + 8), 0, enemybullets));
			}
			for(i = 0; i < 7; i ++) {
				fighterenemies.add(new EnemyFighter((i*64), 0));
			}
			add(tetraenemies);
			add(fighterenemies);
			add(player = new Player(240, 560, playerbullets));
			
			genCoolDown = ENEMY_DELAY;
		}
		
		override public function update():void {
		
			var nextTetra:TetraEnemy;
			var nextFighter:EnemyFighter;
			
			for(var i:int = 0; i < 7; i ++) {
				if(tetraenemies.members[i].overlaps(player)) {
					player.kill();
				}
				else if(fighterenemies.members[i].overlaps(player)) {
					player.kill();
				}
				for(var j:int = 0; j < 32; j ++) {
					if(playerbullets.members[j].overlaps(tetraenemies.members[i])) {
						playerbullets.members[j].kill();
						tetraenemies.members[i].kill();
					}
					else if(playerbullets.members[j].overlaps(fighterenemies.members[i])) {
						playerbullets.members[j].kill();
						fighterenemies.members[i].kill();
					}
					if(enemybullets.members[j].overlaps(player)) {
						enemybullets.members[j].kill();
						player.kill();
					}
				}
			}
			
			
			nextTetra = tetraenemies.getRandom() as TetraEnemy;
			nextFighter = fighterenemies.getRandom() as EnemyFighter;

			if(!(nextTetra.exists) && genCoolDown > ENEMY_DELAY) {
				nextTetra.genEnemy();
				genCoolDown = 0;
			}
			else if(!nextFighter.exists && genCoolDown > ENEMY_DELAY) {
				nextFighter.genEnemy();
				genCoolDown = 0;
			}
			genCoolDown += FlxG.elapsed;
			
			super.update();
			
		}
		
		public function firstWave():void {
			//tetraEnemies
		}
	}
}