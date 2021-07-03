class User {
  String name;
  String email;

  User({this.name, this.email});

  void equalizeWith(User input) {
    name = input.name;
    email = input.email;
  }
}
