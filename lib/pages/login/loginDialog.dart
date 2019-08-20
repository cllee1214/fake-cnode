import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  LoginDialog({Key key}) : super(key: key);

  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //  title: Text('登录信息'),
      content: Text('登录后才能查看该板块，现在去登录吗？'),
      actions: <Widget>[
        FlatButton(
          child: Text('去扫码登录'),
          onPressed: () {
            print('确定啊');
          },
        ),
        FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
