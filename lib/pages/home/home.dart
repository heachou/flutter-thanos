import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thanos/controllers/login.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenUtil.init(
      context,
      designSize: Size(750, 1334),
      allowFontScaling: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('index page ${userController.user.accountId}'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: toSignIn,
            child: Text('to signin'),
          ),
          RaisedButton(
            onPressed: toPerson,
            child: Text('to person'),
          ),
          RaisedButton(
            onPressed: toDemo,
            child: Text('to demo'),
          ),
          RaisedButton(
            onPressed: login,
            child: Text('login'),
          )
        ],
      ),
    );
  }

  void login() async {}

  void toSignIn() {}

  void toPerson() {}

  void toDemo() {}
}
