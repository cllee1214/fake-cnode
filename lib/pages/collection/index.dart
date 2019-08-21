import 'package:flutter/material.dart';
import '../login/showLoginDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollectionPageWidget extends StatefulWidget {
  CollectionPageWidget({Key key}) : super(key: key);

  _CollectionPageWidgetState createState() => _CollectionPageWidgetState();
}

class _CollectionPageWidgetState extends State<CollectionPageWidget> {
  bool _isLogin = false;
  void _onpress () {
    showLoginDialog(context);
  }

  Future isLogin () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userinfo = prefs.getString('user');
    if(userinfo != null){
      setState(() {
       _isLogin = true; 
      });
    }
  }

  @override
  void initState() {
    isLogin();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Container(
      child: RaisedButton(
        onPressed: _onpress,
        child: _isLogin ? Text('已经登录'): Text('没登录'),
      ),
    ),
    );
  }
}