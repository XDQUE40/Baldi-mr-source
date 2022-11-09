package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	private static var creditsStuff:Array<Dynamic> = [
		// Name - Icon name - Description - Link - BG Color
		['This Mod Dev'],
		[
			'Lego',
			'Lego',
			'Chart, New mechanics(ModChart), Programming',
			'https://www.youtube.com/channel/UC9RGwk6ymER-tzwf-96epMg',
			0xFF00FF00
		],
		[''],
		['Bald\'s Basics in Funkin (Demo) Devs'],
		[
			'AdvideGEP',
			'none',
			'Baldi Sprites, BG, GF Assets, etc',
			'https://www.youtube.com/channel/UCScVgt2AEqAGhVGBHC3WcyQ',
			0xFFFFFFFF
		],
		[
			'niffirg',
			'none',
			'Charted "Dismissal" and "Piracy"',
			'https://www.youtube.com/c/niffirg0',
			0xFFFFFFFF
		],
		[
			'Fidy50',
			'none',
			'Charted "Basics" and "Lesson"',
			'https://www.youtube.com/channel/UCgjhVE5MBsg3DObEE42WfDQ',
			0xFFFFFFFF
		],
		[
			'Dee_Dae',
			'none',
			'Composed "Basics"',
			'https://www.reddit.com/user/Dee_Dae/',
			0xFFFFFFFF
		],
		[
			'Cotiles',
			'none',
			'Composed "Lesson"',
			'https://www.youtube.com/channel/UClNnrTqtgzAQ16w4_eC7rwA',
			0xFFFFFFFF
		],
		[
			'Totally-Not-Genji',
			'none',
			'Composed "Dismissal" and "Metal Remedy"',
			'https://www.reddit.com/user/Totally-Not-Genji/',
			0xFFFFFFFF
		],
		[
			'Voidicus',
			'none',
			'Composed "Piracy"',
			'https://www.youtube.com/channel/UCzlUBifQXluYClL6yAEiVIA',
			0xFFFFFFFF
		],
		[
			'Oolexxx',
			'none',
			'Coding',
			'https://www.youtube.com/channel/UCLy6xgrwafZFu8OAxRbIknw',
			0xFFFFFFFF
		],
		[
			'Jack.exe',
			'none',
			'Coding',
			'https://www.youtube.com/channel/UCVv8S6fT_4TyaJOwk5YxBFA',
			0xFFFFFFFF
		],
		[
			'BitTech',
			'none',
			'Coding',
			'https://www.youtube.com/channel/UCgA-NerlKLU1cJKzxn3-a4w',
			0xFFFFFFFF
		],
		[
			'Artemiy Kopych',
			'none',
			'Suggestions, Video Editing, and Easter Eggs',
			'https://www.youtube.com/channel/UC0jFtUCwhLojBJYgSt9bguQ',
			0xFFffffff
		],
		[
			'Bamdad',
			'none',
			'Mechanic ideas/suggestions',
			'https://www.reddit.com/user/After-Satisfaction-3?utm_medium=android_app&utm_source=share',
			0xFFFFFFFF
		],
		[
			'ScorchVx',
			'none',
			'Baldi Voice Acting',
			'https://www.youtube.com/channel/UCeNrjhLGrnsFuOAUIQaBiOQ',
			0xFFFFFFFF
		],
		[
			'Banbuds',
			'none',
			'Paldo Voice Acting',
			'https://www.youtube.com/channel/UCavjwViDNkpJGVbcr8qJacw',
			0xFFFFFFFF
		],
		[''],
		['Baldi\'s Basics in funkin Medias'],
		[
			'Youtube',
			'alpha',
			'Baldis basics in funkin youtube channel',
			'https://www.youtube.com/channel/UChEFMo1dqDouQkaEBKf_7AQ',
			0xFFFFFFFF
		],
		[
			'Discord',
			'discord',
			'Baldis basics in funkin discord server',
			'https://discord.com/invite/XTGuMB4Nb5',
			0xFFFFFFFF
		],
		[
			'Twitter',
			'alpha',
			'Baldis basics in funkin twitter',
			'https://twitter.com/BaldiFunkin',
			0xFFFFFFFF
		],
		[''],
		['Psych Engine Team'],
		[
			'Shadow Mario',
			'shadowmario',
			'Main Programmer of Psych Engine',
			'https://twitter.com/Shadow_Mario_',
			0xFFFFDD33
		],
		[
			'RiverOaken',
			'riveroaken',
			'Main Artist/Animator of Psych Engine',
			'https://twitter.com/river_oaken',
			0xFFC30085
		],
		[''],
		['Engine Contributors'],
		[
			'shubs',
			'shubs',
			'New Input System Programmer',
			'https://twitter.com/yoshubs',
			0xFF4494E6
		],
		[
			'PolybiusProxy',
			'polybiusproxy',
			'.MP4 Video Loader Extension',
			'https://twitter.com/polybiusproxy',
			0xFFE01F32
		],
		[
			'gedehari',
			'gedehari',
			'Chart Editor\'s Sound Waveform base',
			'https://twitter.com/gedehari',
			0xFFFF9300
		],
		[
			'Keoiki',
			'keoiki',
			'Note Splash Animations',
			'https://twitter.com/Keoiki_',
			0xFFFFFFFF
		],
		[
			'SandPlanet',
			'sandplanet',
			'Mascot\'s Owner\nMain Supporter of the Engine',
			'https://twitter.com/SandPlanetNG',
			0xFFD10616
		],
		[
			'bubba',
			'bubba',
			'Guest Composer for "Hot Dilf"',
			'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',
			0xFF61536A
		],
		[''],
		["Funkin' Crew"],
		[
			'ninjamuffin99',
			'ninjamuffin99',
			"Programmer of Friday Night Funkin'",
			'https://twitter.com/ninja_muffin99',
			0xFFF73838
		],
		[
			'PhantomArcade',
			'phantomarcade',
			"Animator of Friday Night Funkin'",
			'https://twitter.com/PhantomArcade3K',
			0xFFFFBB1B
		],
		[
			'evilsk8r',
			'evilsk8r',
			"Artist of Friday Night Funkin'",
			'https://twitter.com/evilsk8r',
			0xFF53E52C
		],
		[
			'kawaisprite',
			'kawaisprite',
			"Composer of Friday Night Funkin'",
			'https://twitter.com/kawaisprite',
			0xFF6475F3
		]
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if (isSelectable)
			{
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			// optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if (isSelectable)
			{
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;

				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		
		#if android
		addVirtualPad(UP_DOWN, A_B);
		#end	
		
			super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.ACCEPT)
		{
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do
		{
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		}
		while (unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
		if (newColor != intendedColor)
		{
			if (colorTween != null)
			{
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween)
				{
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if (!unselectableCheck(bullShit - 1))
			{
				item.alpha = 0.6;
				if (item.targetY == 0)
				{
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool
	{
		return creditsStuff[num].length <= 1;
	}
}
