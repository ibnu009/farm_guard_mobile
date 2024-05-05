import 'package:farm_guard/pages/Home/home.dart';
import 'package:farm_guard/pages/Profile/profil.dart';
import 'package:flutter/material.dart';

class navbar extends StatefulWidget {
  static const routeName = "/navbar";

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    home(),
    profil(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff2E3AB5),
          unselectedItemColor: Colors.black,
          elevation: 50,
          iconSize: 30,
          backgroundColor: Color(0xffE0E1F4),
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ));
  }
}
