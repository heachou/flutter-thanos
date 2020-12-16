import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanos/router/application.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
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
        title: Text('index page'),
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
        ],
      ),
    );
  }

  void toSignIn() {
    Application.router.navigateTo(context, '/signIn');
  }

  void toPerson() {
    Application.router.navigateTo(context, '/person');
  }
}
