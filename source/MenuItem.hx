package;

import openfl.display.Sprite;
import openfl.events.MouseEvent;

class MenuItem extends Sprite {
  private var text: Text;
  private var title: String;

  private var action: Void -> Void = null;

  public function new(title: String, action: Void -> Void = null) {
    super();

    this.title = title;
    this.action = action;

    text = new Text(" " + title);
    addChild(text);

    addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
    addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
    addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
  }

  function onMouseOver(e: MouseEvent) {
    text.text = ">" + title;
  }

  function onMouseOut(e:MouseEvent) {
    text.text = " " + title;
  }

  function onMouseDown(e: MouseEvent) {
    if(action != null) {
      action();
    }
  }
}
