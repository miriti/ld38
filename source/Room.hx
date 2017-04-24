package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;

import common.State;

import motion.Actuate;

class Room extends State {
  public static var instance: Room;
  public var depressionLevel (default, set): Int = 0;
  public var money(default, set): Int;

  private var _bg:Bitmap = new Bitmap(Assets.getBitmapData('assets/s/room.png')); 
  private var _playerLayer: Sprite = new Sprite();
  private var _player: Player;
  private var _hanging: Hanging = new Hanging();

  private var _time: Text = new Text();

  public var time_hour: Int = 1;
  public var time_minutes: Int = 0;
  public var time_am: Bool = false;

  public var time_lock: Bool = false;

  public var gameOver: Bool = false;

  var _drunk: Bool = false;

  var moneyText: Text = new Text();
  var depression = new DepressionStatus();

  public function new() {
    super();
    instance = this;

    _player = new Player();
    autoScale = false;
    addChild(_bg);

    addChild(new Door());
    addChild(new Bathroom());
    addChild(new Sink());
    addChild(new Fridge());
    addChild(new Chair());

    _player.x = 140;
    _player.y = 160;

    addChild(_playerLayer);

    _hanging.x = 150;
    _playerLayer.addChild(_player);

    addChild(new PCTable());
    addChild(new Bed());

    moneyText = new Text("MONEY: $100");
    moneyText.y = 2;
    addChild(moneyText);

    _time.x = width - _time.width;
    _time.y = 2;
    addChild(_time);

    depression.x = (width - depression.width) / 2;
    depression.y = 2;
    addChild(depression);

    advenceTime(0);

    money = 100;

    addEventListener(Event.ADDED_TO_STAGE, addedToStage);
  }

  function addedToStage(e:Event) {
    y = 4;
    mintePassed();
    Assets.getSound("assets/music.ogg").play(0, 99999);
  }

  function mintePassed() {
    if(!time_lock) {
      advenceTime(1);
      depressionLevel += 1;
    }
    Actuate.timer(1).onComplete(mintePassed);
  }

  function timeString():String {
    var h_str:String = Std.string(time_hour);
    var h_min:String = Std.string(time_minutes);
    if(h_min.length == 1) h_min = '0' + h_min;
    return h_str + ":" + h_min + " " + (time_am ? "AM" : "PM");
  }

  public function advenceTime(minutes: Int) {
    while(minutes >= 60) {
      time_hour++;

      if(time_hour == 13) {
        time_hour = 1;
        time_am = !time_am;
      }

      minutes -= 60;
    }

    time_minutes += minutes;

    if(time_minutes >= 60) {
      time_hour++;

      if(time_hour == 13) {
        time_hour = 1;
        time_am = !time_am;
      }

      time_minutes -= 60;
    }

    _time.text = timeString();
    _time.x = 245;
  }

  function set_depressionLevel(value: Int): Int {
    if(value < 0) value = 0;
    if(value > 100) value = 100;
    if(value == 100) {
      time_lock = true;
      gameOver = true;
      Player.instance.dispatchEvent(new Event('walking'));
      addChild(new Blackout(function() {
        _playerLayer.removeChild(_player);
        _playerLayer.addChild(_hanging);
      }));
    }
    depression.value = value;
    return depressionLevel = value;
  }

  function set_money(value: Int): Int {
    money = value;
    moneyText.text = '$' + Std.string(money);
    return money;
  }

  public function drunk() {
    if(!_drunk) {
      _drunk = true;
      Actuate.tween(this, 3, { 
        scaleX: 1.1,
        scaleY: 1.1,
        x: -10,
        y: -10,
        rotation: 2
      }).ease(motion.easing.Sine.easeInOut).repeat(5).reflect().onComplete(function() {
        _drunk = false;
      });
    }
  }
}
