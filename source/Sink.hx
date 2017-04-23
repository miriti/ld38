package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class Sink extends Sprite {
  public function new() {
    super();

    var bmp: Bitmap = new Bitmap(Assets.getBitmapData('assets/s/sink.png'));
    addChild(bmp);

    x = 20;
    y = 93;
  }
}
