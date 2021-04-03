import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';
import 'package:front/theme/custom_icons.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/view/lend/lend_page.dart';
import 'package:front/view/notice/notice_page.dart';
import 'package:front/view/profile/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetNavigationOptions = <Widget>[
    HomePage(),
    LendPage(),
    NoticePage(),
    ProfilePage()
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.home),
      label: 'Início',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.heart),
      label: 'Pedidos',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.bell),
      label: 'Avisos',
    ),
    BottomNavigationBarItem(
      icon: Icon(CustomIcons.avatar),
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
        selectedItemColor: secondaryColor,
        unselectedItemColor: grayColor,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        iconSize: 26,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
