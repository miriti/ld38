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

    x = 74;
    y = 17;
  }
}
