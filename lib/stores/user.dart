import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_social/utils/api.dart';
import 'package:flutter_social/stores/localData.dart';

part 'user.g.dart';

class User = UserBase with _$User;

final api = GetIt.I.get<API>();
final localData = GetIt.I.get<LocalData>();

abstract class UserBase with Store {
  @observable
  String name = "";
  String phone = "";
  String email = "";

  register() {}

  @action
  Future<bool> login(String email, String password) async {
    bool logged = false;
    final response = await api.login(email, password);
    if (response.statusCode == 201) {
      Map<String, dynamic> data = json.decode(response.body);
      data.removeWhere((key, value) => key == "auth");
      localData.save(data);
      logged = true;
    }
    return logged;
  }

  @action
  Future<bool> onAppInitTreatLogin() async {
    String token = await localData.getIfExists('token');
    bool logged = token.isNotEmpty && token != "";
    if (logged) {
      var tokenIsValid = await _verifyIfTokenIsValid(token);
      if (tokenIsValid) api.headers = {"token": token};
    }
    return logged;
  }

  Future<bool> _verifyIfTokenIsValid(String token) async {
    bool tokenIsValid = false;
    final response = await api.get('city/1');
    print(json.decode(response.body));
    if (response.statusCode == 200) tokenIsValid = true;
    return tokenIsValid;
  }
}
