import 'package:diarybootcamp/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

/// First Widget attached to the screen
class DiAryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiAry Bootcamp',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
