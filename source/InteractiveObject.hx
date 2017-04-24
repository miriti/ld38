package;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.filters.ColorMatrixFilter;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.geom.ColorTransform;
import openfl.geom.Point;

class InteractiveObject extends Sprite {
  var _filter:ColorMatrixFilter = new ColorMatrixFilter([
      0, 1, 0, 0, 0, 
      1, 0, 0, 0, 0, 
      0, 0, 1, 0, 0, 
      0, 0, 0, 1, 0
  ]);
  var bitmap:Bitmap = null;
  var colorTransform:ColorTransform;
  var menu:Menu = new Menu();

  public var approachOffset: Point = new Point();

  public function new() {
    super();
    buttonMode = true;

    colorTransform = new ColorTransform();

    Player.instance.addEventListener('walking', function(e: Event) {
      menu.visible = false;
    });

    addEventListener(MouseEvent.MOUSE_OVER, function(e: MouseEvent) {
      if((!Player.instance.walking)&&(!Room.instance.gameOver)) {
        if(menu.parent == null) {
          addChild(menu);
        }

        menu.visible = true;
      }
    });

    addEventListener(MouseEvent.MOUSE_OUT, function(e: MouseEvent) {
      menu.visible = false;
    });
  }
}
