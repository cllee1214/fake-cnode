import 'package:flutter/material.dart';
import './loginDialog.dart';

void showLoginDialog(context) {
  showDialog(
    context: context,
    builder: (ctx) {
      return LoginDialog();
  });
}
