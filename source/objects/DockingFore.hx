package objects;
import adventure.*;
import flixel.util.FlxColor;



class DockingFore extends Object {

	public function new(x,y){
		super (x,y);
		hidden = true;
		layer=FORE;
	}
}