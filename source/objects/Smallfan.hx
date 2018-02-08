package objects;
import adventure.*;
import flixel.util.FlxColor;



class Smallfan extends Object {

	public function new(x,y){
		super (x,y);
        loadGraphic("assets/images/smallfan.png", true,6,6);
        animation.add("spin",[0,1,2],12,true);
        animation.play("spin");
		customName = " ";
		layer=BACK;
	}
}