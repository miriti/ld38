package;

import openfl.display.Sprite;

class DepressionStatus extends Sprite {
  public var value(default, set): Int;

  var bar:Bar = new Bar(60);

  public function new() {
    super();

    mouseEnabled = false;
    var depression = new Text("DEPRESSION");
    addChild(depression);

    bar.y = 8;
    addChild(bar);

    value = 50;
  }

  function set_value(newvalue: Int): Int {
    if(newvalue < 0) {
      newvalue = 0;
    }
    if(newvalue > 100) {
      newvalue = 100;
    }

    bar.value = newvalue;

    return value = newvalue;
  }

}
