import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../stores/user.dart';

final user = GetIt.I.get<User>();

class API {
  // static const url = 'http://localhost:3000/';
  static const url = 'http://192.168.56.1:3000/';
  Map<String, String> headers = {};

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

  Future<http.Response> get(String route,
          {Map<String, dynamic> headers}) async =>
      await http.get(Uri.parse(url + route), headers: this.headers);

  Future<http.Response> delete(String route) async =>
      await http.delete(Uri.parse(url + route));

  Future<http.Response> post(String route, Map body, {Map headers}) async {
    http.Response response =
        await http.post(Uri.parse(url + route), headers: headers, body: body);
    return response;
  }

  Future<http.Response> put(String route, Map headers, Map body) async {
    http.Response response =
        await http.put(Uri.parse(url + route), headers: headers, body: body);
    return response;
  }

  Future<http.Response> uploadSingleFile(
      String method,
      String route,
      Map body,
      String fieldName,
      String fileType,
      String fileSubtype,
      String path,
      String fileName,
      {Map headers}) async {
    var request = http.MultipartRequest(method, Uri.parse(url + route));
    var file = await http.MultipartFile.fromPath(fieldName, path,
        filename: fileName, contentType: MediaType(fileType, fileSubtype));
    request..files.add(file);
    body.forEach((key, value) {
      request..fields[key] = value;
    });
    if (headers.isNotEmpty) request..headers.addAll(headers);
    var requestStream = await request.send();
    http.Response response = await http.Response.fromStream(requestStream);
    return response;
  }
}
