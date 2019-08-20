import 'package:flutter/material.dart';
import '../login/showLoginDialog.dart';


class CollectionPageWidget extends StatefulWidget {
  CollectionPageWidget({Key key}) : super(key: key);

  _CollectionPageWidgetState createState() => _CollectionPageWidgetState();
}

class _CollectionPageWidgetState extends State<CollectionPageWidget> {

   void _onpress () {
    showLoginDialog(context);
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
       child:  Container(
      child: RaisedButton(
        onPressed: _onpress,
        child: Text('收藏'),
      ),
    ),
    );
  }
}