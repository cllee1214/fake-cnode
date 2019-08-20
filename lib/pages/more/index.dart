import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MorePageWidget extends StatelessWidget {
  const MorePageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border(
          top: BorderSide(width: 1,color: Color(0xFF808080)),
          bottom: BorderSide(width: 1,color: Color(0xFF808080)),
        )
      ),
      margin: EdgeInsets.only(top:20),
      padding: EdgeInsets.only(bottom: 10,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top:5,right: 20,left: 10),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/default_head.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  ),
            ],
          )),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '请登录',
                  style: TextStyle(
                    fontSize: 14 
                  ),
                ),
                Text(
                  '查看个人主页',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                  ),
                )
                  
                ],
            ),
          )
        ],
      ),
    );
  }
}
