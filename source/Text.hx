package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.geom.Rectangle;
import openfl.geom.Point;

class Text extends Bitmap {
  private static var font:BitmapData = null; 
  private static var cache:Map<String, BitmapData> = new Map<String, BitmapData>();

  public var text(default, set): String;

  public function new(text: String = "") {
    super();

    this.text = text;
  }

  function set_text(value: String): String {
    if(cache.exists(value)) {
      bitmapData = cache.get(value);
    } else {
      if(font == null) {
        font = Assets.getBitmapData('assets/font.png');
      }

      bitmapData = new BitmapData(value.length * 6, 6, true, 0x00000000);

      for(i in 0...value.length) {
        var c = value.charCodeAt(i);
        if((c>=33)&&(c<=90)) {
          bitmapData.copyPixels(font, new Rectangle((c - 33) * 6, 0, 6, 6), new Point(i * 6, 0));
        }
      }

      cache.set(value, bitmapData);
    }
    return text = value;
  }
}
