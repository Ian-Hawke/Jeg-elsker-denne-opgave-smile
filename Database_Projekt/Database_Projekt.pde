// Blev ikke færdig pga tid

import de.bezier.data.sql.*;
SQLite Database;
ArrayList<Input> input = new ArrayList<Input>();
Button loog = new Button(new PVector(20, 40), new PVector(50, 20), color(244), "Hay Day", 10, color(105));
InputBox mail = new InputBox(new PVector(140, 40), new PVector(50, 20), color(244), "Mail", 10, color(105));
InputBox password = new InputBox(new PVector(240, 40), new PVector(50, 20), color(244), "Password", 10, color(105));
User cUser = new User (mail.input);

void setup() {
  size(500, 500);

  input.add(loog);
  input.add(mail);
  input.add(password);
  Database = new SQLite(this, "Login.sqlite");
}
void draw() {
  loog.display();
  for (Input i : input) {
    i.display();
  }
}

void mousePressed() {
  for (Input f : input)
    if (f instanceof Button) { //Marcus: "instanceof" betyder at vi tjekker om "f" er et objekt af klassen "Button"
      Button b = (Button)f;
      b.clicked();
    }
  if (loog.isClicked) {
    loog();
    loog.isClicked = false;
  }



    if (mail.input.length() != 0 && password.input.length() != 0){
      //addAccount(mail.input, password.input, mail.input);
    }
 

  if (loog.isClicked) {
    loog();
    loog.isClicked = false;
  }

  }
void updateData() {
  mail.input = cUser.name;

}

  boolean updateUserData() {
    if (cUser.ID == 0) {
      println("User is not logged in");
      return false;
    }

    return true;
  }
  boolean loog() {
    if (Database.connect())
      Database.query("SELECT ID, Name, Mail, Pass FROM User");
    else {
      println("Database failed to connect");
      return false;
    }

    while (true) {
      if (Database.next()) {
        if (mail.input.equals(Database.getString("Mail")))
          break;
        else
          continue;
      }
      println("Email is incorrect");
      return false;
    }
    if (!password.input.equals(Database.getString("Pass"))) {
      println("Password is incorrect");
      return false;
    }

    cUser.getData(Database, Database.getInt("ID"));
    updateUserData();
    return true;
  }
