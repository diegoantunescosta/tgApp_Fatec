import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_social/stores/home.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/views/tabs/chats.dart';
import 'package:flutter_social/views/tabs/feeds.dart';
import 'package:flutter_social/views/tabs/profile.dart';
import 'package:flutter_social/views/tabs/notifications.dart';
import 'package:flutter_social/views/tabs/information_plant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final home = GetIt.I.get<Home>();

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    FeedsPage(),
    ChatsPage(),
    NotificationsPage(),
    ProfilePage(),
    InformationPlant()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavBar = Observer(
      builder: (_) => BottomNavigationBar(
        onTap: (indexPage) => home.currentIndex = indexPage,
        currentIndex: home.currentIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.6),
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.comments),
            label: 'Mensagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.bell),
            label: 'Notificações',
          ),
          /* style: TextStyle(fontWeight: FontWeight.bold), */
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: 'Perfil',
          )
        ],
      ),
    );

    final body = Observer(builder: (_) => _pages[home.currentIndex]);

    return Scaffold(bottomNavigationBar: bottomNavBar, body: body);
  }
}
