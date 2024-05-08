class User {
  final String name;
  String _userId;

  User(
    this.name,
    this._userId,
  );

  set userId(String id) {
    _userId = id;
  }

  void displayInfo() {
    print('User Id: $_userId');
    print('User Name: $name');
  }
}
