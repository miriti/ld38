package common;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.Lib;

import motion.Actuate;

class StateMachine extends Sprite {
  public var currentState:State = null;

  private var stateLayer: Sprite = new Sprite();
  private var stateStack: Array<State> = new Array<State>();

  public var resWidth(default, set): Float = 1920;
  public var resHeight(default, set): Float = 1080;

  public var clipMask(default, set):Bool;

  private var _clipMask:Sprite = null;

  public function new () {
    super();

    addChild(stateLayer);

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
  }

  function set_clipMask(value: Bool): Bool {
    if(value) {
      if(_clipMask == null) {
        _clipMask = new Sprite();
        _clipMask.graphics.beginFill(0x000000);
        _clipMask.graphics.drawRect(0, 0, resWidth, resHeight);
        _clipMask.graphics.endFill();
      }

      mask = _clipMask;
      addChild(_clipMask);
    } else {
      mask = null;
    }
    return clipMask = value;
  }

  function onAddedToStage(e:Event): Void {
    Lib.current.stage.focus = this;
    Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
  }

  function onKeyDown(e:KeyboardEvent): Void {
    if(currentState != null) {
      currentState.keyDown(e.keyCode);
    }
  }

  function onKeyUp(e:KeyboardEvent): Void {
    if(currentState != null) {
      currentState.keyUp(e.keyCode);
    }
  }

  public function onResize(e: Event): Void {
  }

  public function setState(newState: State, crossFade: Bool = true, time: Float = 1, history: Bool = true): Void {
    var nextState = function() {
      if(currentState != null) {
        stateLayer.removeChild(currentState);
      }
      stateLayer.addChild(newState);
      currentState = newState;

      if(crossFade) {
        stateLayer.addChild(new Fade(false, time/2));
        Actuate.timer(time/2).onComplete(function() {
          currentState.hasControl = true;
        });
      } else {
        currentState.hasControl = true;
      }
    }

    if(currentState != null) {
      currentState.hasControl = false;
      if (history) {
        stateStack.push(currentState);
      }

      if(crossFade) {
        stateLayer.addChild(new Fade(true, time/2, nextState));
      } else {
        nextState();
      }
    } else {
      nextState();
    }
  }
  
  public function popState(crossFade:Bool = true, time:Float = 1.0): Void {
    setState(stateStack.pop(), crossFade, time, false);
  }

  function set_resWidth(value: Float): Float {
    return resWidth = value;
  }

  function set_resHeight(value: Float): Float {
    return resHeight = value;
  }

}
