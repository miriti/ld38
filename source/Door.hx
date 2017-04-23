package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Door extends InteractiveObject {
  public function new() {
    super();

    bitmap = new Bitmap(Assets.getBitmapData('assets/s/door.png'));
    addChild(bitmap);

    x = 212;
    y = 55;
  }
}
