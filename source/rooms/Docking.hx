package rooms;

import adventure.*;
import objects.*;
import rooms.*;
import flixel.util.FlxColor;
import flixel.FlxG;

class Docking extends Room {

    var nudedone = false;
    var introdone = false;

    override public function create() {
        objects = [
                    new Space(49,13),
                    new RoomTrigger(6,Hallway2,110,36),
                    new Block(134),
        			new Player(118,37),
                    //new TwinkTrigger(20),
                    new SitTwink2(50,41),
                    new SitTwink(83,41),
                    new Hal(75,14),
                    new Bookcase(19,24),
                    new Tele(114,14)
                    ];
                    //FlxG.timeScale = 2;
        Global.fader.alpha = 1;
        Global.fader.fadeIn();

    }

    override public function update(d){
        super.update(d);
        if (nudedone){
            return;
        }
        if(Player.clothed == false){
            var twink:SitTwink = get(SitTwink);
            twink.say("Has it become unseasionable warm all of a sudden?"); ///CHANGE
            nudedone = true;
        }

        if(introdone) return;
        introdone = true;

        var player:Player = room.get(Player);
        var twink:SitTwink = get(SitTwink);
        var twink1:SitTwink2 = get(SitTwink2);
        var hal:Hal = get(Hal);

        var intro = [
            {time:0.0,run:function(){
                Global.cutscene = true;
                player.canControl = false;

                 player.customAnimation = "teleyIn";
                 player.afterAnimation (function(){
                     player.customAnimation = null;
                 });

            }},
            {time:1.0,run:function(){
                player.say("Ahhhhhhhhhhhhhhhhhhhhhh.", null, 6);
            }},
            {time:7.0,run:function(){
                player.say("Oh I'm here..", null, 4);
            }},
            {time:13.0,run:function(){
                hal.say("Welcome abord Mr Packqood, Lendord is waiting for you in the Penthouse.");
            }},

            {time:17.0,run:function(){
                twink.say("Another one of Luthsberge investments has come to kiss his feet.");
            }},
            {time:21.0,run:function(){
                twink1.say("Huh yeah and he looks like...");
            }},

            {time:23.0,run:function(){
                twink.say("Thats enough Steve.",null,5);
            }},
            {time:26.0,run:function(){
                twink1.say("Sorry Adam.");
            }},

            {time:28.0,run:function(){
                Global.cutscene = false;
                player.canControl = true;
            }},

        ];
        Event.run(intro, false);

    }



}

class TwinkTrigger extends Trigger{
    var done = false;

    function trigger (){
        if(done) return;
        done = true;
        var player:Player = room.get(Player);
        var twink1:SitTwink = room.get(SitTwink);
        var twink2:SitTwink2 = room.get(SitTwink2);

        var interact = [
            {time:0.0,run:function(){
                Global.cutscene = true;
                twink1.say("He doesnt even go here.", null, 2.5);
                FlxG.sound.play("assets/voices/docking/steve/go-here.ogg");
            }},
            {time:2.5,run:function(){
                twink2.say("I know right.", null,2);
                FlxG.sound.play("assets/voices/docking/adam/i-know-right.ogg");
            }},
            {time:4.5,run:function() { 
                player.flipX = true;
            }},
            {time:4.7,run:function(){
                player.say("Excuse me, what was that?", null,2.5);
                FlxG.sound.play("assets/voices/docking/rodger/excuse-me.ogg");
            }},
            {time:8.2,run:function(){
                twink1.say("Nothing, nothing.", null,2.5);
                FlxG.sound.play("assets/voices/docking/steve/nothing-skank.ogg");
            }},
            {time:10.2,run:function(){
                twink1.say("(Skank.)", null,1.5);
            }},
            {time:11.2,run:function(){
                player.canControl = true;
                Global.cutscene = false;
            }}
            ];

            Event.run(interact, false);
            player.canControl = false;
    }

}

class Tele extends Object {

    public function new(x,y){
        super (x,y);
        speechColor = FlxColor.RED;
        customName = "Teleporter";
        layer=BACK;
    }
    override function look(){
        var player:Player = room.get(Player);
        player.say("The only way off this ship.");
    }

    override function use(){
        var player:Player = room.get(Player);
        if(Player.complete == true){
            var outTro = [
            {time:0.0,run:function(){
                player.say("Here goes nothing.");
            }},
            {time:3.0,run:function(){
            player.customAnimation = "teleyOut";
                player.afterAnimation (function(){
                    game.switchRoom(EndCutscene);
                });
            }}
            ];
            Event.run(outTro, false);

        }
            else{
                say("ACCESS DENINED"); //CHANGE - ADD WALKTO
            }
        
    }
}
