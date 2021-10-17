class Input {

  PVector pos;
  PVector size;
  color col;
  String text;
  int textSize;

  Input() {
  }

  Input(PVector pos, PVector size, color col, String text, int textSize) {
    this.pos = pos;
    this.size = size;
    this.col = col;
    this.text = text;
    this.textSize = textSize;
  }

  void display() {
    display(col, text);
  }

  void display(color col, String text) {
    stroke(0);
    fill(col);
    rect(pos.x, pos.y, size.x, size.y);
    fill(0);
    textSize(textSize);
    text(text, pos.x + textSize/2, pos.y + size.y - textSize*0.65);
  }
}
