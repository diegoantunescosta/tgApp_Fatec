class Country {
  int id;
  String country;

  Country({this.id, this.country});

  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(id: json['idPais'], country: json['pais']);
  }
}
