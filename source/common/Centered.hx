package common;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;

class Centered extends GameSprite {
  var bitmap: Bitmap;

  public function new(asset: String, hor: Bool = true, ver: Bool = true) {
    super();

    bitmap = new Bitmap(Assets.getBitmapData(asset));
    bitmap.x = hor ? -bitmap.width / 2 : 0;
    bitmap.y = ver ? -bitmap.height / 2 : 0;
    addChild(bitmap);
  }
}
