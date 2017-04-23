package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Fridge extends InteractiveObject {
  public function new() {
    super();

    var bmp: Bitmap = new Bitmap(Assets.getBitmapData('assets/s/fridge.png'));
    addChild(bmp);

    x = 0;
    y = 90;
  }
}
