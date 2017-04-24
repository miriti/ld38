package;

import openfl.display.Sprite;

class Menu extends Sprite {
  private var items: Array<MenuItem> = [];
  private var _titleText: Text = null;

  public var title(default, set): String;

  public function new(title: String = "") {
    super();

    if(title != "") {
      this.title = title;
    }
  }

  public function addItem(title: String, action: Void -> Void = null) {
    var item = new MenuItem(title, action);
    item.y = (_titleText == null ? 0 : _titleText.height + 4) + (items.length * 8);
    items.push(item);
    addChild(item);
  }

  function set_title(value: String): String {
    value = " ** " + value + " **";
    if(this._titleText == null) {
      this._titleText = new Text(value);
      addChild(this._titleText);
    } else {
      this._titleText.text = value;
    }
    return title = value;
  }
}
