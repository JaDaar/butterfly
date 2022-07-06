class User {
  int ID = 0;
  String FirstName = '';
  String LastName = '';
  String Email = '';

  User(this.Email, this.FirstName, this.ID, this.LastName);

  User.fromJson(List<dynamic> userMap) {
    for (int i = 0; i < userMap.length; i++) {
      print('Element id $i');
      this.ID = userMap[i]['ID'];
      this.FirstName = userMap[i]['FirstName'] ?? '';
      this.LastName = userMap[i]['LastName'] ?? '';
      this.Email = userMap[i]['Email'] ?? '';
    }
  }
}
