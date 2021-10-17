class Button extends Input {

  boolean isClicked;
  color colClicked;

  Button() {
  }

  Button(PVector pos, PVector size, color col, String text, int textSize, color colClicked) {
    super(pos, size, col, text, textSize);
    this.colClicked = colClicked;
  }

  void display() {
    if (isClicked) {
      super.display(colClicked, text);
    } else {
      super.display();
    }
  }

  void clicked() {
    if (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y && mouseY < pos.y + size.y) {
      isClicked = !isClicked;
    } else {
      isClicked = false;
    }
  }
}
