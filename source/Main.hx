package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

import adventure.*;
import rooms.*;

class Main extends Sprite
{
	public function new()
	{
		super();
        Global.startingRoom = Hallway1;
		addChild(new FlxGame(1920, 1080, Game));
	}
}

