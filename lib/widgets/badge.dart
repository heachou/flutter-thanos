import 'package:flutter/material.dart';
import 'package:thanos/utils/screen.dart';

Widget badge(String text) {
  return Container(
    color: Color.fromRGBO(245, 246, 247, 1),
    padding: EdgeInsets.fromLTRB(
      duSetWidth(15),
      duSetWidth(8),
      duSetWidth(15),
      duSetWidth(8),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: duSetFontSize(24),
        color: Color.fromRGBO(145, 148, 153, 1),
      ),
    ),
  );
}
