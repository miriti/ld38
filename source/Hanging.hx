package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.Event;

import motion.Actuate;
import motion.easing.*;

class Hanging extends Sprite {
  var bitmap: Bitmap = new Bitmap(Assets.getBitmapData("assets/anim/hanging.png"));

  var swingAngle: Float = 1.5;

  public function new() {
    super();

    bitmap.x = -bitmap.width / 2;
    addChild(bitmap);

    rotation = swingAngle;

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  function onAddedToStage(e:Event) {
    trace(this);
    Actuate.tween(this, 3, { rotation: -swingAngle }).ease(Sine.easeInOut).repeat().reflect();
  }
}
