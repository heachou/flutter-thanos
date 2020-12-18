import 'package:flutter/material.dart';
import 'package:thanos/global.dart';
import './dd_login.dart';
import './telLogin.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Global.isRelease ? DdLoginPage() : TelLogin(),
    );
  }
}
