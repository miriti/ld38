package common;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

class GameSprite extends Sprite {
  private var childGameSprites:Array<GameSprite> = [];

  public function new() {
    super();
  }

  public function update(delta: Float): Void {
    for(child in childGameSprites) {
      child.update(delta);
    }
  }

  override public function addChild(child:DisplayObject): DisplayObject {
    if(Std.is(child, GameSprite)) {
      childGameSprites.push(cast child);
    }
    return super.addChild(child);
  }

  override public function removeChild(child:DisplayObject): DisplayObject {
    if(Std.is(child, GameSprite)) {
      childGameSprites.remove(cast child);
    }
    return super.removeChild(child);
  }

}
