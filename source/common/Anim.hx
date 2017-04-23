package common;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.geom.Rectangle;

class Anim extends Bitmap {
  public var currentFrame(default, set): Int;
  public var fps: Int = 25;

  private var frames:Array<BitmapData> = [];
  private var lastTime: Float;
  private var frameTime: Float = 0;

  public function new (bitmapData: BitmapData, frameWidth: Int, frameHeight: Int, fps: Int = 25) {
    super();
    this.fps = fps;
    addEventListener(Event.ENTER_FRAME, onEnterFrame);

    addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

    for(n in 0...Std.int(bitmapData.width / frameWidth)) {
      var frame = new BitmapData(frameWidth, frameHeight);
      frame.copyPixels(bitmapData, new Rectangle(n * frameWidth, 0, frameWidth, frameHeight), new Point(0, 0));
      frames.push(frame);
    }

    currentFrame = 0;
  }

  function onAddedToStage(e: Event) {
    lastTime = Date.now().getTime();
  }

  function onEnterFrame(e: Event) {
    var currentTime = Date.now().getTime(); 
    var delta = currentTime - lastTime;
    var fpsTime:Int = Std.int(1000 / fps);

    frameTime += delta;

    if(frameTime >= fpsTime) {
      currentFrame++;

      frameTime = frameTime - fpsTime;
    }

    lastTime = currentTime;
  }

  function set_currentFrame(frame: Int): Int {
    if(frame > frames.length-1) {
      frame = 0;
    }

    bitmapData = frames[frame];

    return currentFrame = frame;
  }
}
