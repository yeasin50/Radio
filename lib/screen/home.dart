import 'package:flutter/material.dart';
import 'package:radio/screen/radio_screen.dart';

import '../testWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [new RadioScreen(), new Text("page 2")];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: false,
        // body: _children[_currentIndex],
        //TODO:: to test data
        body: TestWidget(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            _buildNavBarItem(Icons.play_arrow, "Listen"),
            _buildNavBarItem(Icons.favorite, "Favorite"),
          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          showSelectedLabels: false,
          onTap: onTapEvent,
        ),
      ),
    );
  }

  onTapEvent(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }

  _buildNavBarItem(IconData iconData, String title) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: Colors.pink,
      ),
      activeIcon: Icon(
        iconData,
        color: Colors.yellow,
      ),
      title: Text(title),
    );
  }
}
