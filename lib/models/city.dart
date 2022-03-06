class City {
  int id;
  int stateId;
  String city;

  City({this.id, this.stateId, this.city});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['idCidade'],
      stateId: json['idEstado'],
      city: json['cidade'],
    );
  }
}
