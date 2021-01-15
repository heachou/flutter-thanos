import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:thanos/global.dart';
import './dd_login.dart';
import './tel_login.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double height = 1334 - 88 - 68.0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(750.0, height),
      allowFontScaling: true,
    );
    return Scaffold(
      body: Global.isRelease ? DdLoginPage() : TelLogin(),
    );
  }
}
