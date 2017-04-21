package common;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

import motion.Actuate;
import motion.easing.*;

class Fade extends Sprite {
  public function new (fadein: Bool, time:Float, cb: Void -> Void = null) {
    super();

    graphics.beginFill(0x000000);
    graphics.drawRect(0, 0, 1920, 1080);
    graphics.endFill();

    var from_alpha = fadein ? 0 : 1;
    var to_alpha = fadein ? 1 : 0;

    alpha = from_alpha;

    addEventListener(Event.ADDED_TO_STAGE, function (e: Event): Void {
      Actuate.tween(this, time, {alpha: to_alpha}).ease(Sine.easeIn).onComplete(function() {
        parent.removeChild(this);

        if(cb != null) {
          cb();
        }
      }); 
    });
  }
}
