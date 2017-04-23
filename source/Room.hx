package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;

import common.State;

class Room extends State {
  private var _bg:Bitmap = new Bitmap(Assets.getBitmapData('assets/s/room.png')); 

  private var _playerLayer: Sprite = new Sprite();

  private var _player: Player;

  private var _hanging: Hanging = new Hanging();

  public function new() {
    super();
    autoScale = false;
    addChild(_bg);

    addChild(new Door());
    addChild(new Bathroom());
    addChild(new Sink());
    addChild(new Fridge());
    addChild(new Chair());

    _player = new Player();
    _player.x = 140;
    _player.y = 60;

    addChild(_playerLayer);

    _hanging.x = 150;
    _playerLayer.addChild(_hanging);

    addChild(new PCTable());
    addChild(new Bed());

    addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
  }

  function onMouseDown(e: MouseEvent) {
  }
}
