import 'package:flutter/cupertino.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Course')),
    Center(child: Text('Chat')),
    Center(child: Text('Profile')),
  ];

  return _widget[index];
}
