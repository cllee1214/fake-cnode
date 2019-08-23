import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class DetailPage extends StatefulWidget {
  String id;
  DetailPage({Key key, this.id}) : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map _renderData;
  Future _getData(id) async {
    try {
      var dio = new Dio();
      Response res = await dio.get("https://cnodejs.org/api/v1/topic/" + id + "/?mdrender=false");
      if (res.data['success'] == true) {
        print(res.data['data']);
        setState(() {
          _renderData = res.data['data'];
        });
      } else {
        print(res.data);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Widget> _renderReplyList(replies) {
    Map repliesAsMap = replies.asMap();
    return repliesAsMap.keys.map<Widget>((key) {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1,color: Colors.grey)
          )
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.network(
                    repliesAsMap[key]['author']['avatar_url'],
                    height: 40,
                    width: 40,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        repliesAsMap[key]['author']['loginname'],
                        style: TextStyle(fontSize: 13),
                      ),
                      Container(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Text('${key + 1}楼',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Container(
                            width: 10,
                          ),
                          Text(
                            repliesAsMap[key]['create_at'].split('T')[0],
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10, bottom: 10),
              child: MarkdownBody(data: repliesAsMap[key]['content'])
            )
          ],
        ),
      );
    }).toList();
  }

  Widget _renderPage() {
    return _renderData == null
        ? Text('dfdf')
        : Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image.network(
                      _renderData['author']['avatar_url'],
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _renderData['author']['loginname'],
                          style: TextStyle(fontSize: 13),
                        ),
                        Container(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              _renderData['create_at'].split('T')[0],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Container(
                              width: 10,
                            ),
                            Text('浏览${_renderData["visit_count"]}',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey)),
                            Container(
                              width: 10,
                            ),
                            Text(
                              '评论${_renderData["reply_count"]}',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.grey),
                        bottom: BorderSide(width: 1, color: Colors.grey))),
                padding: EdgeInsets.all(15),
                child: Text(
                  _renderData['title'],
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20),
                child: MarkdownBody(
                  data: _renderData['content'],
                )
              ),
              //回复
              Column(children: _renderReplyList(_renderData['replies']))
            ],
          );
  }

  @override
  void initState() {
    super.initState();
    _getData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('帖子详情'),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: _renderPage(),
          ),
        ),
      ),
    );
  }
}
