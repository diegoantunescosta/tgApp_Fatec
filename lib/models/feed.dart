class Feed {
  int idPost;
  String legenda;
  String imagePath;
  int idUsuario;
  String nameUser = 'Nome do User';

  Feed(
      {this.idPost,
      this.legenda,
      this.imagePath,
      this.idUsuario,
      this.nameUser});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return new Feed(
        idPost: json['idPost'],
        legenda: json['legenda'],
        imagePath: json['imagePath'],
        idUsuario: json['idUsuario']);
  }
}
