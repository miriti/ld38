package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Bathroom extends InteractiveObject {
  public function new() {
    super();

    var bmp: Bitmap = new Bitmap(Assets.getBitmapData('assets/s/wc.png'));

    addChild(bmp);

    menu.title = "BATHROOM";
    menu.addItem("USE", function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Room.instance.depressionLevel -= 5;
          Room.instance.advenceTime(10);
          Room.instance.time_lock = false;
        }));
      });
    });
    menu.x = width / 2;
    menu.y = height / 2;

    x = 74;
    y = 17;

    approachOffset.x = width / 2 + 20;
    approachOffset.y = height + 10;
  }
}
