import 'package:http/http.dart' as http;

class API {
  String url = 'http://localhost:3000/';

  Future<http.Response> login(String email, String password) async {
    Map<String, dynamic> bodyPost = {'email': email, 'senha': password};
    http.Response response =
        await http.post(Uri.parse(url + 'user/login'), body: bodyPost);
    return response;
  }

  Future<http.Response> chat(
      String message, String userId, String idPost, String idMessage) async {
    Map<String, dynamic> bodyPost = {
      'comentario': message,
      'idusuario': userId,
      'idPost': idPost,
      'idMessage': idMessage
    };
    http.Response response =
        await http.post(Uri.parse(url + 'comment'), body: bodyPost);
    return response;
  }
}
