import 'package:flutter/material.dart';

class AppConfig {
  static const appName = "Me dá uma Plantinha";
  static const appTagline = "Rede de Apoiadores ";
}

class AvailableFonts {
  static const primaryFont = "Quicksand";
}

class AvailableImages {
  static const postBanner = {
    'assetImage': AssetImage('lib/assets/images/post_banner.jpg'),
    'assetPath': 'lib/assets/images/post_banner.jpg',
  };

  static const emptyState = {
    'assetImage': AssetImage('lib/assets/images/empty.png'),
    'assetPath': 'lib/assets/images/empty.png',
  };

  static const homePage = const AssetImage('lib/assets/images/home_page.png');
  static const appLogo = const AssetImage('lib/assets/images/logo.png');
  static const loading = const AssetImage('lib/assets/images/loading.gif');
  static const user = const AssetImage('lib/assets/images/user.jpg');
}
