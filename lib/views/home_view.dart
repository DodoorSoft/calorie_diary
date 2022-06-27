import 'package:calorie_diary/constants.dart';
import 'package:calorie_diary/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'diary_screen.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _views = [
    const HomeScreen(),
    const DiaryScreen(),
    Container(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _views.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kDarkBlue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        iconSize: 24,
        backgroundColor: Colors.white.withOpacity(.8),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index != 2) {
            setState(() {
              _selectedIndex = index;
            });
          } else {
            showModalBottomSheet(
                isScrollControlled: true,
                useRootNavigator: true,
                context: context,
                builder: (context) {
                  return Container();
                });
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar), label: 'Diary'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circlePlus,color: kDarkBlue,size: 42,), label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartLine), label: 'Progress'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
        ],
      ),
    );
  }
}