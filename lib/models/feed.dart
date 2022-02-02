import 'package:flutter_social/models/user.dart';
import 'package:flutter_social/utils/utils.dart';

class Feed {
  int id, userId;
  String createdAt;
  String description =
      'Acabei de plantar uma árvore, clique e saiba sobre a localização e muito mais !';
  String bannerImg = AvailableImages.postBanner['assetPath'];
  String userName, userImage;

  Feed(this.id, this.createdAt, this.userId, this.userName, this.userImage);
}

