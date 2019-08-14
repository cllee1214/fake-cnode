import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class ListPageWidget extends StatefulWidget {
  ListPageWidget({Key key, this.param}) : super(key: key);
  String param;
  _ListPageWidgetState createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget>
    with AutomaticKeepAliveClientMixin<ListPageWidget> {
  String _currentParam = '';
  List _renderData = new List();
  Map _tabCnMap = {
    'all': '全部',
    'good':'精华',
    'share': '分享',
    'ask': '问答',
    'job': '招聘'
  };

  Future<Null> _handelRefresh() async {
    print('刷新');
  }

  void _updateRenderData() async {
    var url = 'https://cnodejs.org/api/v1/topics/?tab=' +
        _currentParam +
        '&mdrender=false';
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        // print('====');
        // print(data['data']);
        result = data['data'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    setState(() {
      // _renderData = ['xfdf', '233ffd'];
      _renderData = result;
      print(_renderData);
    });
  }

  List<Widget> _renderList() {
    return _renderData.map((data) {
      var lastReplyTimeISO = data['last_reply_at'].replaceAll('T', ' ');
      var now = new DateTime.now();
      // print(DateTime.parse(lastReplyTime).difference(now).inDays);
      var diff = now.difference(DateTime.parse(lastReplyTimeISO));
      var diffDays = diff.inDays;
      var diffHours = diff.inDays;
      var diffMin = diff.inMinutes;
      var lastReplyTime = '';
      print(diffDays);
      print(diffHours);
      print(diffMin);
      if(diffDays == 0){
        if(diffHours == 0){
          lastReplyTime = diffMin.toString() + '分钟前';
        }else{
           lastReplyTime = diffHours.toString() + "小时前";
        }
      }else{
        lastReplyTime = diffDays.toString() + "天前";
      }
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.network(
                      data['author']['avatar_url'],
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              data['author']['loginname'],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              '.${_tabCnMap[data["tab"]]}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '最新回复.${lastReplyTime}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text(
                data['content'],
                maxLines: 3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                      Text(
                        data['visit_count'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: Colors.grey,
                      ),
                      Text(
                        data['reply_count'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),
                  Text(
                    '创建于：${data["create_at"].split("T")[0]}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
            Container(height: 15, color: Color(0xECEFF1FF))
          ],
        ),
      );
    }).toList();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _currentParam = widget.param;
    _updateRenderData();
    // print('......');
    // print('initState');
    // print(_currentParam);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handelRefresh, child: Column(children: _renderList()));
  }
}
