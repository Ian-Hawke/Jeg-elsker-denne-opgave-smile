
class InputBox extends Button {


  String input = "";
  boolean isSecret = false;

  InputBox(PVector pos, PVector size, color col, String text, int textSize, color colClicked) {
    super(pos, size, col, text, textSize, colClicked);
  }

  InputBox(PVector pos, PVector size, color col, String text, int textSize, color colClicked, boolean isSecret) {
    super(pos, size, col, text, textSize, colClicked);
    this.isSecret = isSecret;
  }

  void display() {
    color col;
    String text;

    if (input.length() == 0 || input == null)
      text = this.text;
    else
      if (isSecret) text = getCensoredText(input);
      else          text = input;

    if (isClicked) col = colClicked;
    else col = this.col;
    
    super.display(col, text);
  }

  String getCensoredText(String input) {
    String text = "";
    for (int i = 0; i < input.length(); i++)
      text += "*";
    return text;
  }

  void addInput(char letter, int code) { //Marcus: Letter er det tegn (key), som skal lægges til inputtet, og code er keyboard-knappens kode (keyCode), som bruges til at tjekke, at man ikke har trykket på invalide knapper såsom CONTROL, CAPSLOCK, ALT osv.
    if (isClicked) {
      if (code != BACKSPACE &&
        code != TAB &&
        code != ENTER &&
        code != RETURN &&
        code != SHIFT &&
        code != CONTROL &&
        code != ALT &&
        code != LEFT &&
        code != RIGHT &&
        code != UP &&
        code != DOWN &&
        code != 20 //Dette er koden for CAPSLOCK
        )
        input += letter;
      if (code == BACKSPACE)
        removeInput();
    }
  }

  void removeInput() {
    if (input.length() > 0) {
      input = input.substring(0, input.length() - 1);
    }
  }
}
