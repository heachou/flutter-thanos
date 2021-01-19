import 'package:flutter/material.dart';
import 'package:thanos/utils/iconfont.dart';
import 'package:thanos/utils/screen.dart';
import 'package:thanos/values/values.dart';

class DingdingButtonLogin extends StatelessWidget {
  const DingdingButtonLogin({Key key, this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: duSetHeight(88),
      margin: EdgeInsets.symmetric(
        horizontal: duSetWidth(40),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5))),
                alignment: Alignment.center,
                child: Icon(
                  Iconfont.icondd,
                  color: Colors.white,
                  size: duSetFontSize(60),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(51, 119, 255, .85),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5))),
                alignment: Alignment.center,
                child: Text(
                  '钉钉快速登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: duSetFontSize(36),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
