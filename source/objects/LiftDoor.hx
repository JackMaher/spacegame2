package objects;
import adventure.*;
import rooms.*;

class LiftDoor extends Door {
	public function new(x,y){
		super(x,y);
		newRoom=Hallway1;
		newPlayerX = 39;
		newPlayerY =10;
	}

	override function use() {

		var player = room.get(Player);
		
		if(player.canControl) {
			super.use();
		}

	}

}