import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanos/entitys/user.dart';
import 'package:thanos/apis/apis.dart';

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

  void login() async {
    UserRequestLogin params = UserRequestLogin(
      authType: "PHONE_NUMBER_SMS_CODE",
      handPhone: "15196947186",
      authCode: 192019,
      loginChannel: 1,
    );

    UserResponseLogin res =
        await UserApi.login(context: context, params: params);

    print(res.code);
  }

  void toSignIn() {}

  void toPerson() {}

  void toDemo() {}
}
