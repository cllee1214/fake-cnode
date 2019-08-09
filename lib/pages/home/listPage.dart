import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class ListPageWidget extends StatefulWidget {
  ListPageWidget({Key key, this.param}) : super(key: key);
  String param;
  _ListPageWidgetState createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  String _currentParam = '';
  List _renderData = new List();

  Future <Null> _handelRefresh () async {
    print('刷新');
  }

  void _updateRenderData () async {
    var url = 'https://cnodejs.org/api/v1/topics/?tab=' + _currentParam;
    var httpClient = new HttpClient();
    var result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print('====');
        print(data['data']);
      } else {
        result = 'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }
    setState(() {
     _renderData = ['xfdf','233ffd'];
    });
  }

  @override
  void initState() {
     _currentParam = widget.param;
     _updateRenderData();
    print(_currentParam);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handelRefresh,
      child: Column(
        children: <Widget>[
          Container(
            // height: 40,
            child: Row(
              children: <Widget>[
               Image.network(
                 "https://avatars0.githubusercontent.com/u/51469918?v=4&s=120",
                 height: 30,
                 width: 30,
                ),
                Column(
                  children: <Widget>[
                    Text('i5ting.分享'),
                    Text('最新回复.2天前')
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Text(
              '想起来忘了在这边放个广告, 周末在 NodeParty 分享过 React, 不知道有多少感兴趣的同学, 论坛的地址是 https://react-china.org/ 用了 CloudFlare 加速, 国内应该比直接访问 DigitalOcean 要好一点点. 微博的地址是 http://weibo.com/reactchina GitHub 账户是 https://github.com/react-china 论坛是用 Discourse, 所以前端是 Ember, 以后有能耐当然要自己捣腾一个的.. 近期需要考虑的事情是文档翻译, 虽然 API 文档小, 但是完整的官方文档那么大还是要考虑下. 有兴趣的同学可以一起来活跃下社区',
              maxLines: 3,
              ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Row(
                    children: <Widget>[
                       Icon(
                        Icons.visibility
                       ),
                       Text('1987')
                    ],
                  ),
                   Row(
                    children: <Widget>[
                       Icon(
                        Icons.message
                       ),
                       Text('127')
                    ],
                  ),
                 Text('创建于：2019-09-03')
              ],
            ),
          )
        ],
      )
    );
  }
}