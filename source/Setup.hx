package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class Setup extends Sprite {
  public function new() {
    super();

    addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
      this.startDrag();
    });

    addEventListener(MouseEvent.MOUSE_MOVE, function(e: MouseEvent) {
      trace(x, y);
    });

    addEventListener(MouseEvent.MOUSE_UP, function(e: MouseEvent) {
      this.stopDrag();
    });
  }
}
