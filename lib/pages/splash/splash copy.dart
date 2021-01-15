import 'package:flutter/material.dart';
import 'package:thanos/entitys/entitys.dart';
// import 'package:thanos/net/net.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  void doLogin() async {
    final params = UserRequestLogin(
      authType: "PHONE_NUMBER_SMS_CODE",
      handPhone: "15196947186",
      authCode: 192019,
      loginChannel: 1,
    );
    // DioUtils.instance.requestNetwork<UserResponseLogin>(
    //   Method.post,
    //   '/auth/login',
    //   params: params,
    //   onSuccess: (data) {
    //     print(data.fullOrgText);
    //   },
    //   onError: (int code, String message) {
    //     print(message);
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('splash page'),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              doLogin();
            },
            child: Text('login'),
          )
        ],
      ),
    );
  }
}
