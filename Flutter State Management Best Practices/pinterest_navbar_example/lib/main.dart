import 'package:flutter/material.dart';
import 'package:pinterest_nav_bar/pinterest_nav_bar.dart';

import 'Pages/chat_page.dart';
import 'Pages/fav_page.dart';
import 'Pages/home_page.dart';
import 'Pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class YourApp extends StatefulWidget {
  const YourApp({Key? key}) : super(key: key);

  @override
  _YourAppState createState() => _YourAppState();
}

class _YourAppState extends State<YourApp> {
  int selectedPageIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    ChatPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: PinterestNavBar(
        currentIndex: selectedPageIndex,
        onTap: (i) {
          print('PinterestNavBar.onTap($i)');
          setState(() {
            selectedPageIndex = i;
          });
        },
        items: const [
          Icons.home,
          Icons.chat_bubble_outline,
          Icons.favorite,
          Icons.person
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const PinterestNavBarController(
      child: MaterialApp(
        home: YourApp(),
      ),
    );
  }
}
