package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Chair extends Sprite {
  public function new() {
    super();

    var bmp: Bitmap = new Bitmap(Assets.getBitmapData('assets/s/chair.png'));
    addChild(bmp);

    x = 105;
    y = 130;
  }
}
