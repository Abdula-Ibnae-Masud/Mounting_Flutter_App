import 'package:flutter/material.dart';
import 'package:myapp/pages/navpages/bar_item_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/navpages/my_page.dart';
import 'package:myapp/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          // ignore: deprecated_member_use
          BottomNavigationBarItem(label: "Home", icon:Icon(Icons.apps)),
          // ignore: deprecated_member_use
          BottomNavigationBarItem(label: "Bar", icon:Icon(Icons.bar_chart_sharp)),
          // ignore: deprecated_member_use
          BottomNavigationBarItem(label: "Search", icon:Icon(Icons.search)),
          // ignore: deprecated_member_use
          BottomNavigationBarItem(label: "My", icon:Icon(Icons.person)),
        ],),
    );
  }
}