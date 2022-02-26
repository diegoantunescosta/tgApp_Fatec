class User {
  int id;
  String name;
  String photo;
  String location;
  String gender;
  int age;

  User({this.id, this.name, this.photo, this.gender, this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'], name: json['nome'], photo: json['imagePath']);
  }
}
