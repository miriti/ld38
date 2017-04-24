package;

import openfl.display.Sprite;
import openfl.display.Bitmap;
import openfl.Assets;

class PCTable extends InteractiveObject {
  public function new() {
    super();

    bitmap = new Bitmap(Assets.getBitmapData('assets/s/pc-table.png'));
    addChild(bitmap);

    menu.title = "COMPUTER";
    menu.addItem("SURF", function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Room.instance.depressionLevel += 5;
          Room.instance.advenceTime(60);
          Room.instance.time_lock = false;
        }));
      });
    });
    menu.addItem("WORK", function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Room.instance.depressionLevel += 30;
          Room.instance.money += 100;
          Room.instance.advenceTime(60 * 8);
          Room.instance.time_lock = false;
        }));
      });
    });
    menu.addItem("FAP", function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Room.instance.depressionLevel -= 10;
          Room.instance.money -= 10;
          Room.instance.advenceTime(30);
          Room.instance.time_lock = false;
        }));
      });
    });
    menu.addItem("BUY GROCERIES", function() {
      Room.instance.time_lock = true;
      Player.instance.approach(this, function() {
        Room.instance.addChild(new Blackout(function() {
          Fridge.instance.bar.value = 100;
          Room.instance.depressionLevel += 5;
          Room.instance.money -= 50;
          Room.instance.advenceTime(30);
          Room.instance.time_lock = false;
        }));
      });
    });

    x = 60;
    y = 135;

    approachOffset.x = width / 2;
    approachOffset.y = height / 2;
  }
}
