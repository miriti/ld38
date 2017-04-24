package;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;

import common.Anim;

import motion.Actuate;
import motion.easing.*;

class Player extends Sprite {
  public static var instance: Player;
  public var walking(default, set): Bool;

  var currentAnim (default, set): Anim;

  var _walking: Anim;
  var _standing: Anim;

  var _target_x: Float;
  var _target_y: Float;
  var _v: Point;
  var _gocb: Void -> Void;

  public function new() {
    super();

    instance = this;

    _walking = new Anim(Assets.getBitmapData('assets/anim/walking.png'), 50, 100, 6);
    _standing = new Anim(Assets.getBitmapData('assets/anim/standing.png'), 50, 100, 3); 

    currentAnim = _standing;

    mouseEnabled = false;

    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  public function goto(tox: Float, toy: Float, cb: Void -> Void = null) { 
    _target_x = tox;
    _target_y = toy;

    _v = new Point(tox - x, toy - y);
    _v.normalize(1);

    walking = true;

    if(tox < x) {
      scaleX = -1;
    } else {
      scaleX = 1;
    }

    _gocb = cb;
  }

  public function approach(obj: InteractiveObject, cb: Void -> Void = null) {
    goto(obj.x + obj.approachOffset.x, obj.y + obj.approachOffset.y, cb);
  }

  function set_currentAnim(anim: Anim): Anim {
    if(currentAnim != null) {
      removeChild(currentAnim);
    }

    currentAnim = anim;

    addChild(currentAnim);
    currentAnim.x = -currentAnim.width / 2;
    currentAnim.y = -currentAnim.height;

    return currentAnim;
  }

  function set_walking(value: Bool): Bool {
    if(value) {
      currentAnim = _walking;
      dispatchEvent(new Event('walking'));
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
        if(_gocb != null) {
          _gocb();
        }
      } else {
        x += _v.x * stepSize;
        y += _v.y * stepSize;
      }
    }
  }

}
