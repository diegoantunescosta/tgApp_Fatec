import 'package:mobx/mobx.dart';

part 'feed.g.dart';

class Feed = FeedBase with _$Feed;

abstract class FeedBase with Store {
  @observable
  int currentIndex = 0;
}
