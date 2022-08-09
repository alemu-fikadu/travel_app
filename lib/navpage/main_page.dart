import 'package:flutter/material.dart';
import 'package:travel_app/navpage/bar_item_page.dart';
import 'package:travel_app/misc/pages/home_page.dart';
import 'package:travel_app/navpage/my_page.dart';
import 'package:travel_app/navpage/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: 'bar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'bar'),
        ],
      ),
    );
  }
}
