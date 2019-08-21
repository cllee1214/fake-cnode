import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/store.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class LoginDialog extends StatefulWidget {
  LoginDialog({Key key}) : super(key: key);

  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  String _url = 'https://cnodejs.org/api/v1/accesstoken';
  String _token = '';

  Future _scan() async {
    // try {
    //   String barcode = await scanner.scan();
    //   setState(() => _token = barcode);
    //   print('==============================');
    //   print(barcode);
    //   print('==============================');
    //   // Navigator.of(context).pop();
    // } catch (e) {
    //   print(e);
    // }
    _token = 'fee8b667-ca0b-4ad7-ac5b-61e3bc7aa6b3';
    var dio = new Dio();
    try {
      Response res = await dio.post(_url, data: {'accesstoken': _token});
      if (res.data['success']) {
        storeLoginInfo('user', json.encode(res.data));
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                children: <Widget>[Text('登录成功')],
              );
            });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //  title: Text('登录信息'),
      content: Text('登录后才能查看该板块，现在去登录吗？'),
      actions: <Widget>[
        FlatButton(
          child: Text('去扫码登录'),
          onPressed: () {
            _scan();
            print('确定啊');
            // Navigator.of(context).pop();
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
