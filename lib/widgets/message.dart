import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanos/utils/utils.dart';

class Message {
  static void show(
    String msg, {
    int duration = 2000,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black26,
  }) async {
    if (msg == null) {
      return;
    }
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: duSetFontSize(32),
    );
  }

  static void cancelToast() async {
    await Fluttertoast.cancel();
  }
}
