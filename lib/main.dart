import 'package:flutter/material.dart';
import 'bottomNav.dart';
void main() {
  return runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  // const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNode',
      home: BottomNavWidget()
    );
  }
}

