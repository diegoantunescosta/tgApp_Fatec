import 'package:mobx/mobx.dart';

part 'home.g.dart';

class Home = HomeBase with _$Home;

abstract class HomeBase with Store {
  @observable
  int currentIndex = 0;
}
