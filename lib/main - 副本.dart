import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter1'),
        ),
        body: new ListView(
            children: <Widget>[
               //导航开始
              Container(
                // color: Color(0xFFCCFF00),
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: [
                          IconButton(
                            icon: Icon(Icons.album),
                            iconSize: 55,
                            color: Colors.red,
                            onPressed: () => {
                              print(1)
                            }
                          ),
                          Text('私人FM')
                          ]
                        ),
                        Column(
                          children: [
                          IconButton(
                            icon: Icon(Icons.album),
                            iconSize: 55,
                            color: Colors.red,
                            onPressed: () => {
                              print(1)
                            }
                          ),
                          Text('每日推荐')
                          ]
                        ),
                        Column(
                          children: [
                          IconButton(
                            icon: Icon(Icons.album),
                            iconSize: 55,
                            color: Colors.red,
                            onPressed: () => {
                              print(1)
                            }
                          ),
                          Text('歌单')
                          ]
                        ),
                        Column(
                          children: [
                          IconButton(
                            icon: Icon(Icons.album),
                            iconSize: 55,
                            color: Colors.red,
                            onPressed: () => {
                              print(1)
                            }
                          ),
                          Text('排行榜')
                          ]
                        ),
                      ],
                    ),
                 
                  ],
                ),
              ),
              //导航结束


              //
              Container(
                color: Colors.grey,
                height: 1,
                width: 100,
                margin: EdgeInsets.only(top:20.0,bottom: 10.0),
              ),


              //推荐歌单
              Container(
                padding: EdgeInsets.only(left: 15.0,top:15.0,bottom: 10.0),
                child: Row(
                  children: <Widget>[
                      Text('推荐歌单', style: new TextStyle(fontWeight: FontWeight.bold)),
                      Icon(Icons.arrow_forward_ios,size: 15)
                  ],
                ),
              ),
              //推荐歌单结束

            //歌单列表
            GridView.count(
              shrinkWrap:true,
              primary: false,
              padding: const EdgeInsets.all(1.0),
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              crossAxisCount: 3,
              children: <Widget>[

                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),
                Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        'http://p1.music.126.net/FWno5P2JE6hKEHZkx9hqlw==/109951163920919304.jpg?param=140y140',
                        fit: BoxFit.scaleDown,
                        height: 90,
                        width: 90,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5),
                    ),
                    ),
                    Text('今天要挂复古风',style: TextStyle(fontSize: 10),textAlign: TextAlign.right)
                  ],
                ),

              ],
            )
            //歌单列表结束


            ],
          )
        ),
      );
  }
}
