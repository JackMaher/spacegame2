package objects;
import adventure.*;
import flixel.util.FlxColor;



class Poptwink1 extends Object {

	public function new(x,y){
		super (x,y);
		speechColor = 0xfff1eada;
		customName = "Guy";
        loadGraphic("assets/images/poptwink1.png", true,21,26);
        animation.add("move",[0,1,2,3,4,4,4,4,4,4,4,4,4,4],8,true);
        animation.play("move");
		layer=BACK;
		ticks = [
	            {word:"LOOK", callback:function(){
	                look(); 
	            }},
	            {word:"TALK", callback:function(){
	                use(); 
	            }},
            ];
	}

	override function look(){
		var player:Player = room.get(Player);

		player.say("Looks like he's having a good time.");


	}
	override function use(){
		var player:Player = room.get(Player);

		var talk = [
		{time:0.0,run:function(){
			player.say("Hello",null, 2);
		}},
		{time:2.0,run:function(){
			player.say("Helllloooo?",null, 2);
		}},
		{time:4.0,run:function(){
			player.say("Earth.. umm Space to Guy?",null, 2);
		}},
		];
		Event.run(talk,false);

	}
}