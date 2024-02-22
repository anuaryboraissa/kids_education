import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';
import 'details_screen.dart';
import 'group_screen.dart';
import 'home.dart';
import 'level_screen.dart';
import 'setting.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DetailsScreen(title: "Tutorials"),
    LevelScreen(
      operation: '',
    ),
    GroupScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).brightness == Brightness.dark?AppSettings.darkRed: baseBlue.withAlpha(250),
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? AppSettings.darkBlue
                : Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                ),
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.school_outlined,
                ),
                icon: Icon(
                  Icons.school_outlined,
                ),
                label: "Tutorials",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.equalizer,
                ),
                icon: Icon(
                  Icons.equalizer,
                ),
                label: "Levels",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.group_outlined,
                ),
                icon: Icon(
                  Icons.group_outlined,
                ),
                label: "Groups",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  // color: baseBlue.withAlpha(250),
                ),
                icon: Icon(
                  Icons.settings,
                  // color: baseBlue.withAlpha(250),
                ),
                label: "Settings",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            }),
      ),
    );
  }
}
