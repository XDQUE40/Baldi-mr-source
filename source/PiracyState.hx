package;

import flixel.*;

class PiracyState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var isDebug:Bool = false;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('baldi/piracy/creepercreeper', 'shared'));
		bg.screenCenter();

		add(bg);

		FlxG.sound.playMusic(Paths.music('creepercreeper', 'shared'), 0);

		#if debug
		isDebug = true;
		#end

		FlxG.sound.music.fadeIn(4, 0, 0.7);
	}

	override function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ANY && !isDebug)
			Sys.exit(0);

		// when the
		if (FlxG.keys.justPressed.ANY && isDebug)
		{
			PlayState.SONG = Song.loadFromJson(Highscore.formatSong('Piracy', 2), 'piracy');
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = 2;
			LoadingState.loadAndSwitchState(new PlayState());
		}

		super.update(elapsed);
	}
}
