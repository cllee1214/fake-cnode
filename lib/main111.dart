import 'package:flutter/material.dart';
import 'dart:ui';

final screenWidth = window.physicalSize;
final scrennPx = window.physicalSize.width /window.devicePixelRatio;

void test () {
  print(screenWidth);
}

void main() {
  test();
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter1'),
        ),
        body: new Column(
            children: <Widget>[
               //导航开始
                new Nay(),
              //导航结束
              new ContentList()
            ],
          )
        ),
      );
  }
}


//导航
class Nay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navHeight = MediaQuery.of(context).size.height / window.devicePixelRatio;
    return new Container(
      height: 50,
      decoration: new BoxDecoration(
        border: Border(bottom: new BorderSide(color: Color(0x30144255)))
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('全部'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
            Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('精华'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
            Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('分享'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
            Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('问答'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
            Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('招聘'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
            Container(
            alignment: Alignment.center,
            width: scrennPx / 6,
            child: Text('其他'),
            decoration: new BoxDecoration(
                border: Border(bottom: new BorderSide(color: Colors.lightBlue))
            ),
          ),
          
        ],
      ),
    );
  }
}


//主题列表
class ContentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
             Expanded(
              child: ListView(
                shrinkWrap: true,
                  children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                              Container(
                                // color: Colors.red,
                                width: 200,
                                padding: EdgeInsets.only(left: 10,top:10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[  
                                    ClipRRect(
                                        child: Image.network(
                                              'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                                              fit: BoxFit.scaleDown,
                                              height: 50,
                                              width: 50,
                                            ),
                                        borderRadius: BorderRadius.all(Radius.circular(5),
                                      ),
                                    ),  
                                
                                    Container(
                                      margin: EdgeInsets.only(top:0),
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Text('alsotandddddddg',style: new TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                                                      Icon(Icons.arrow_right, size: 10,),
                                                      Text(
                                                        '分享',
                                                        style: new TextStyle(fontSize: 10,color: Colors.grey),
                                                        )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text('最新回复-17小时前',style: new TextStyle(fontSize: 10,color: Colors.grey))
                                                    ],
                                                  )
                                              ],
                                              ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 70,
                                margin: EdgeInsets.only(top:10),
                                padding: EdgeInsets.only(right: 10),
                                child: FlatButton(
                                  color: Colors.lightBlue,
                                  child: Text('置顶'),
                                  textColor: Colors.white,
                                  onPressed: (){}
                                ),
                              )
                          ],
                        ),
                      ],  
                ),
              ),
      ],
    );
  }
}