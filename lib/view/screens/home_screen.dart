import 'package:flutter/material.dart';

import 'about_us_page.dart';
import 'head_line_page.dart';
import 'news_list_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final _pages = [
    HeadLinePage(),
    NewsListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const[
            BottomNavigationBarItem(
              icon:  const Icon(Icons.highlight),
              label:   "トップニュース",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: "ニュース一覧",
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              label: "このニュースについて",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });},
        ),
      ),
    );
  }
}
