package;

import openfl.display.Sprite;

import common.StateMachine;

class Main extends StateMachine {
  var room: Room;
	public function new () {
		super ();

    scaleX = scaleY = 4;

    room = new Room();
    room.x = 1;
    setState(room);
	}
	
}
