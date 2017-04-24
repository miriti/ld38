package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Bed extends InteractiveObject {
  public function new() {
    super();

    bitmap = new Bitmap(Assets.getBitmapData('assets/s/bed.png'));

    addChild(bitmap);

    menu.title = "BED";
    menu.addItem("SLEEP (8H)", sleep(8));
    menu.addItem("NAP (1H)", sleep(1));

    x = 198;
    y = 118;

    approachOffset.x = width / 4;
    approachOffset.y = height / 2;
  }

  function sleep(time: Int): Void -> Void {
    return function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Room.instance.depressionLevel -= time;
          Room.instance.advenceTime(time * 60);
          Room.instance.time_lock = false;
        }));
      });
    }
  }
}
