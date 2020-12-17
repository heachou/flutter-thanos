import 'package:flutter/material.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/values.dart';

Widget personTips(
    {@required int todayUpdate, @required int total, @required int coins}) {
  var labelGrayText = AppColors.labelGrayText;
  var grayTextStyle =
      TextStyle(color: labelGrayText, fontSize: duSetFontSize(24));
  return Row(
    children: [
      Text(
        '今日更新：$todayUpdate',
        style: grayTextStyle,
      ),
      SizedBox(
        width: duSetWidth(30),
      ),
      Text(
        '总计：$total',
        style: grayTextStyle,
      ),
      Spacer(),
      Text(
        '余额：',
        style: grayTextStyle,
      ),
      Icon(
        Iconfont.iconbi,
        size: duSetFontSize(32),
        color: Color.fromRGBO(245, 166, 35, 1),
      ),
      SizedBox(
        width: duSetWidth(3),
      ),
      Text(
        '$coins',
        style: TextStyle(
          color: Color.fromRGBO(245, 166, 35, 1),
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(28),
        ),
      )
    ],
  );
}
