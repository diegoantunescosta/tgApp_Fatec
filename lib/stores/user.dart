import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_social/utils/api.dart';

part 'user.g.dart';

class User = UserBase with _$User;

final api = GetIt.I.get<API>();

abstract class UserBase with Store {
  @observable
  int currentIndex = 0;

  String nome = "";
  String sexo = "";
  String email = "";
  String phone = "";
  String password = "";

  register() {}
}
