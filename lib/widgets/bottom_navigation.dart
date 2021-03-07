import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/view/lend/lend_page.dart';
import 'package:front/view/notice/notice_page.dart';
import 'package:front/view/profile/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 1;

  static List<Widget> _widgetNavigationOptions = <Widget>[
    HomePage(),
    LendPage(),
    NoticePage(),
    ProfilePage()
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Início',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Pedidos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Avisos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Perfil',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetNavigationOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarItem,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        iconSize: 30.0,
      ),
    );
  }
}
