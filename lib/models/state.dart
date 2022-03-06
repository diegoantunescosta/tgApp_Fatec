class State {
  int id;
  String state;
  int countryId;

  State({this.id, this.state, this.countryId});

  factory State.fromJson(Map<String, dynamic> json) {
    return new State(
      id: json['idEstado'],
      state: json['estado'],
      countryId: json['idPais'],
    );
  }
}
