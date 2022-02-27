import 'package:mobx/mobx.dart';

part 'register.g.dart';

class Register = RegisterBase with _$Register;

abstract class RegisterBase with Store {
  @observable
  int genderRadioBtnVal = -1;

  @action
  handleGenderChange(int value) => this.genderRadioBtnVal = value;
}
