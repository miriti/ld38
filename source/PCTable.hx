package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class PCTable extends InteractiveObject {
  public function new() {
    super();

    bitmap = new Bitmap(Assets.getBitmapData('assets/s/pc-table.png'));
    addChild(bitmap);

    x = 60;
    y = 135;
  }
}
