package common;

import openfl.display.Sprite;
import openfl.display.StageDisplayState;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.Lib;
import openfl.ui.Mouse;

import lime.ui.GamepadButton;
import lime.ui.GamepadAxis;

class State extends GameSprite {
  public var hasControl: Bool = false;
  public var showCursor: Bool = true;
  public var autoScale: Bool = true;

  public static var target_width = 1920;
  public static var target_height = 1080;

  var lastTime:Float = -1;

  public function new() {
    super();

    Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

    Lib.current.stage.addEventListener(Event.RESIZE, function(e: Event): Void {
      resize();
    });

    Lib.current.stage.addEventListener(Event.FULLSCREEN, function(e: Event): Void {
      resize();
    }); 

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  function onAddedToStage(e:Event) {
    resize();
    if(!showCursor) {
      Mouse.hide();
    }
  }

  function onRemovedFromStage(e:Event) {
    if(!showCursor) {
      Mouse.show();
    }
  }

  function onEnterFrame(e:Event) {
#if neko
    update(1/Lib.current.stage.frameRate); // TODO: Real fps from project.xml
#else
    var currentTime:Float = Date.now().getTime();

    if(lastTime != -1) {
      var delta = currentTime - lastTime;
      update(delta / 1000);
    }

    lastTime = currentTime;
#end
  }

  function resize() {
    if(autoScale) {
      if(Lib.current.stage.stageWidth > Lib.current.stage.stageHeight) {
        scaleX = scaleY = Lib.current.stage.stageHeight / target_height;
      } else {
        scaleX = scaleY = Lib.current.stage.stageWidth / target_width;
      }   

      x = (Lib.current.stage.stageWidth - (target_width * scaleX)) / 2;
    }
  }

  public function gamepadAxis(axis: GamepadAxis, value: Float): Void {
  }

  public function gamepadButtonDown(button:GamepadButton): Void {
  }

  public function gamepadButtonUp(button:GamepadButton): Void {
  }

  public function keyDown(keyCode: Int): Void {
  }

  public function keyUp(keyCode: Int): Void {
  }
}
