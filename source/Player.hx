package;

import openfl.display.Sprite;
import openfl.Assets;
import openfl.events.Event;

import openfl.geom.Point;

import common.Anim;

import motion.Actuate;
import motion.easing.*;

class Player extends Sprite {

  var currentAnim (default, set): Anim;
  var walking(default, set): Bool;

  var _walking: Anim;
  var _standing: Anim;

  var _target_x: Float;
  var _target_y: Float;
  var _v: Point;

  public function new() {
    super();

    _walking = new Anim(Assets.getBitmapData('assets/anim/walking.png'), 50, 100, 6);
    _standing = new Anim(Assets.getBitmapData('assets/anim/standing.png'), 50, 100, 3); 

    currentAnim = _standing;

    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  public function goto(tox: Float, toy: Float) { 
    _target_x = tox;
    _target_y = toy;

    _v = new Point(tox - x, toy - y);
    _v.normalize(1);

    walking = true;
  }

  function set_currentAnim(anim: Anim): Anim {
    if(currentAnim != null) {
      removeChild(currentAnim);
    }

    currentAnim = anim;

    addChild(currentAnim);

    return currentAnim;
  }

  function set_walking(value: Bool): Bool {
    if(value) {
      currentAnim = _walking;
    } else {
      currentAnim = _standing;
    }

    return walking = value;
  }

  function onEnterFrame(e: Event) {
    if(walking) {
      var stepSize = 3;

      var dist = Point.distance(new Point(x, y), new Point(_target_x, _target_y));

      if(dist <= stepSize) {
        x = _target_x;
        y = _target_y;
        walking = false;
      } else {
        x += _v.x * stepSize;
        y += _v.y * stepSize;
      }
    }
  }

}
