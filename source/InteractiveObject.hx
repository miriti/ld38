package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.filters.ColorMatrixFilter;
import openfl.events.MouseEvent;
import openfl.geom.ColorTransform;

class InteractiveObject extends Sprite {
  var _filter:ColorMatrixFilter = new ColorMatrixFilter([
      0, 1, 0, 0, 0, 
      1, 0, 0, 0, 0, 
      0, 0, 1, 0, 0, 
      0, 0, 0, 1, 0
  ]);

  var bitmap:Bitmap = null;
  var colorTransform:ColorTransform;

  public function new() {
    super();
    buttonMode = true;

    colorTransform = new ColorTransform();

    addEventListener(MouseEvent.MOUSE_OVER, function(e: MouseEvent) {
      if(bitmap != null) {
        bitmap.bitmapData.colorTransform(bitmap.getRect(bitmap), colorTransform);
      }
    });

    addEventListener(MouseEvent.MOUSE_OUT, function(e: MouseEvent) {
    });
  }
}
