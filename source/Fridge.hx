package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.events.Event;

class Fridge extends InteractiveObject {
  public static var instance:Fridge;

  public var bar: Bar = new Bar(30);
  var beers:Int = 0;
  public function new() {
    super();

    instance = this;

    var bmp: Bitmap = new Bitmap(Assets.getBitmapData('assets/s/fridge.png'));
    addChild(bmp);

    menu.title = "FRIDGE";
    menu.addItem("HAVE A MEAL", function() {
      if(bar.value > 25) {
        Room.instance.time_lock = true;
        Player.instance.approach(this, function() {
          Room.instance.addChild(new Blackout(function() {
            bar.value -= 25;
            Room.instance.depressionLevel -= 10;
            Room.instance.advenceTime(25);
            Room.instance.time_lock = false;
          }));
        });
      }
    });

    menu.addItem("HAVE A BEER", function() {
      if(bar.value > 5) {
        Room.instance.time_lock = true;
        Player.instance.approach(this, function() {
          Room.instance.addChild(new Blackout(function() {
            bar.value -= 5;
            Room.instance.advenceTime(30);
            Room.instance.time_lock = false;
            if(beers < 4) {
              Room.instance.depressionLevel -= 10;
            } else {
              if(beers >= 10) {
                Room.instance.depressionLevel = 100;
              }
              Room.instance.depressionLevel += 25;
              Room.instance.drunk();
            }

            beers++;
          }));
        });
      }
    });

    x = 0;
    y = 90;

    bar.value = 100;
    bar.y = -10;
    bar.x = (width - bar.width) / 2;
    addChild(bar);

    approachOffset.x = width + 10;
    approachOffset.y = height;
  }
}
