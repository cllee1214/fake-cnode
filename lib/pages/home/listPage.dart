import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class ListPageWidget extends StatefulWidget {
  ListPageWidget({Key key, this.param}) : super(key: key);
  String param;
  _ListPageWidgetState createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> with AutomaticKeepAliveClientMixin<ListPageWidget>{
  String _currentParam = '';
  List _renderData = new List();

  Future<Null> _handelRefresh() async {
    print('刷新');
  }

  void _updateRenderData() async {
    var url = 'https://cnodejs.org/api/v1/topics/?tab=' + _currentParam + '&mdrender=false';
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        // print('====');
        print(data['data']);
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    setState(() {
      _renderData = ['xfdf', '233ffd'];
    });
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
        onRefresh: _handelRefresh,
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Image.network(
                            "https://avatars0.githubusercontent.com/u/51469918?v=4&s=120",
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
                                    'i5ting',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    '.分享',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '最新回复.2天前',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Text(
                      '想起来忘了在这边放个广告, 周末在 NodeParty 分享过 React, 不知道有多少感兴趣的同学, 论坛的地址是 https://react-china.org/ 用了 CloudFlare 加速, 国内应该比直接访问 DigitalOcean 要好一点点. 微博的地址是 http://weibo.com/reactchina GitHub 账户是 https://github.com/react-china 论坛是用 Discourse, 所以前端是 Ember, 以后有能耐当然要自己捣腾一个的.. 近期需要考虑的事情是文档翻译, 虽然 API 文档小, 但是完整的官方文档那么大还是要考虑下. 有兴趣的同学可以一起来活跃下社区',
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
                              '1987',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
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
                              '127',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                        Text(
                          '创建于：2019-09-03',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 15,     
                    color: Color(0xECEFF1FF)
                  )
                ],
              ),
            )
          ],
        ));
  }
}
