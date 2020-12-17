import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thanos/utils/utils.dart';

Future<bool> toastInfo({
  @required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: duSetFontSize(16),
  );
}
