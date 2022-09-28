package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var textSong:FlxText;
	var textPitch:FlxText;
	var textLength:FlxText;
	var pitch:Float = 1;
	

	override public function create()
	{
		super.create();
		var song = 'assets/music/Music.ogg';
		FlxG.sound.playMusic(song);
		textSong = new FlxText(0, 0, 0, "Song Name: " + song.split("/")[song.split("/").length - 1], 25);
		textPitch = new FlxText(0, 50, 0, "", 25);
		textLength = new FlxText(0, 100, 0, "", 25);
		add(textSong);
		add(textPitch);
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.pressed.UP)
		{
			pitch += 0.05;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			pitch -= 0.05;
		}
		FlxG.sound.music.pitch = pitch;
		textPitch.text = "Pitch: " + Std.string(pitch);
		textLength.text = "Length Of the music: " + Std.string(Std.int(FlxG.sound.music.length / pitch));
		super.update(elapsed);
	}
}
