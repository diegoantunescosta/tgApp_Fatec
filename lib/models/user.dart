class User {
  int id;
  int idAddress;
  String name;
  String photo;
  String email;
  String createdAt;
  String updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.idAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    json = json['user'];

    return new User(
      id: json['id'],
      name: json['nome'],
      email: json['email'],
      photo: json['imagePath'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      idAddress: json['idEndereco'],
    );
  }
}
