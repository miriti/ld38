package; 

import openfl.display.Sprite;

class Bar extends Sprite {
  public var value(default, set): Int;

  public var barWidth: Int;

  public function new(barWidth: Int = 60) {
    super();
    this.barWidth = barWidth;
  }

  function set_value(val: Int): Int {
    graphics.clear();
    graphics.beginFill(0x669bb7);
    graphics.drawRect(0, 0, barWidth, 6);
    graphics.endFill();

    if(val > 0) {
      graphics.beginFill(0x80c3e6);
      graphics.drawRect(1, 1, (barWidth - 2) * (val / 100), 4);
      graphics.endFill();
    }

    return value = val;
  }
}
