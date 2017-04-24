package;

import openfl.display.Sprite;
import openfl.events.Event;

class Blackout extends Sprite {
  private var cb: Void -> Void;

  function new(cb: Void -> Void) {
    super();

    this.cb = cb;

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  function onAddedToStage(e: Event) {
    Room.instance.addChild(new common.Fade(true, 1, function() {
      cb();
      Room.instance.addChild(new common.Fade(false, 1, function() {
      }));
    }));
  }
}
