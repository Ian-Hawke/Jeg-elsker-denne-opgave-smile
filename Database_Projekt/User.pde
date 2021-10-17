class User {

  int ID;
  String name;



  User() {
  }

  User(String name) {
    setData(name);
  }


  void setData(String name) {
    this.name = name;

  }


  void getData(SQLite Database, int ID) {
    if (Database.connect())
      Database.query("SELECT * FROM User WHERE ID = " + ID);
    else {
      println("Database failed to connect");
      return;
    }
    this.ID = Database.getInt("ID");
    name = Database.getString("Name");
  }

  void saveData(SQLite Database, String name) {
    this.name = name;

    if (Database.connect())
      Database.query("UPDATE User SET Name = '" + name + "', WHERE ID = " + ID);
    else {
      println("Database failed to connect");
      return;
    }
  }
}
