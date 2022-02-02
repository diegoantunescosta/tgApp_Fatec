import 'package:flutter_social/models/user.dart';

class Chat {
  int id, userId, unreadCount;
  String userName, userImage;
  String message;

  Chat(this.id, this.userId, this.userName, this.userImage, this.unreadCount,
      this.message);
}


