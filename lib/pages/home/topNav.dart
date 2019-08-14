import 'package:flutter/material.dart';
import './listPage.dart';
class TopNavWidget extends StatefulWidget {
  TopNavWidget({Key key}) : super(key: key);
  _TopNavWidgetState createState() => _TopNavWidgetState();
}

class _TopNavWidgetState extends State<TopNavWidget>  with SingleTickerProviderStateMixin{
  List _navConfigList = ['全部','精华','分享','问答','招聘'];
  Map _paramMap = {
    '全部': 'all',
    '精华': 'good',
    '分享': 'share',
    '问答': 'ask',
    '招聘': 'job'
  };
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(vsync: this, length: _navConfigList.length)..addListener((){
       if(_controller.index.toDouble() == _controller.animation.value){
         // todo
         print(_controller.index);
       }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _controller,
          tabs: _navConfigList.map((item){
            return Tab(text: item);
          }).toList()
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _navConfigList.map((item){
          // print(item);
          // print(_paramMap[item]);
          return ListPageWidget(param: _paramMap[item]);
        }).toList(),
      ),
    );
  }
}
