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

    x = 198;
    y = 118;
  }
}
