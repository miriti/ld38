package common;

import openfl.display.DisplayObject;

class Vector {
  public var x: Float;
  public var y: Float;
  public var length(get, never): Float;
  public var rotation(get, never): Float;

  /**
    Get vector between display objects
    **/
  public static function between(do1:DisplayObject, do2:DisplayObject, normal:Bool = false):Vector {
    return new Vector(do2.x - do1.x, do2.y - do1.y, normal);
  }

  public static function fromRotation(rotation:Float):Vector {
    return new Vector(Math.cos(rotation * (Math.PI / 180)), Math.sin(rotation * (Math.PI / 180)));
  }

  function get_rotation(): Float {
    return Math.atan2(y, x) * (180 / Math.PI);
  }

  function get_length(): Float {
    return Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
  }

  public function new(vx: Float = 0, vy: Float = 0, normal:Bool = false) {
    this.x = vx;
    this.y = vy;
  }

  public function normalize(len: Float = 1):Vector {
    this.x /= this.length;
    this.y /= this.length;

    return this;
  }
}
