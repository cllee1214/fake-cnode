import 'package:flutter/material.dart';

import './pages/home/index.dart';
import './pages/collection/index.dart';
import './pages/message/index.dart';
import './pages/more/index.dart';

class BottomNavWidget extends StatefulWidget {
  // name({Key key}) : super(key: key);

  _MyBottomNavWidget createState() => _MyBottomNavWidget();
}

class _MyBottomNavWidget extends State<BottomNavWidget> {
  int _currentIndex = 0;
  Map _pageMap = {
    0: {
      'page': HomePageWidget(),
      'name': '主页'
    },
     1: {
      'page': CollectionPageWidget(),
      'name': '收藏'
    },
     2: {
      'page': MessagePageWidget(),
      'name': '消息'
    },
     3: {
      'page': MorePageWidget(),
      'name': '更多'
    }
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNode',
      home: Scaffold(
        appBar: AppBar(
          title: Text(_pageMap[_currentIndex]['name']),
        ),
        body: _pageMap[_currentIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
             _currentIndex = index;
            });
            print(index);
          },
          selectedItemColor:Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('主页',)
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text('收藏')
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text('消息')
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.more),
              title: Text('更多')
            )
          ],
        ),
      )
    );
  }
}