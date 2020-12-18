import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/global.dart';
import 'package:thanos/provider/provider.dart';
import 'package:thanos/router/application.dart';
import 'package:thanos/utils/screen.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/colors.dart';
import 'package:thanos/widgets/widgets.dart';
import 'package:thanos/apis/apis.dart';

class TelLogin extends StatefulWidget {
  TelLogin({Key key}) : super(key: key);

  @override
  _TelLoginState createState() => _TelLoginState();
}

class _TelLoginState extends State<TelLogin> {
  // 手机号码的控制器
  final TextEditingController _inputController = TextEditingController();
  // 密码控制器
  final TextEditingController _codeController = TextEditingController();

  // 执行登录
  _handleLogin() async {
    String handPhone = _inputController.value.text;
    String authCode = _codeController.value.text;

    if (!duCheckIsPhone(handPhone)) {
      return toastInfo(msg: '请输入正确格式的电话号码', backgroundColor: Colors.red);
    }
    if (!duCheckStringLength(authCode, 6)) {
      return toastInfo(msg: '验证码长度不正确', backgroundColor: Colors.red);
    }

    UserRequestLogin params = UserRequestLogin(
      authType: "PHONE_NUMBER_SMS_CODE",
      handPhone: handPhone,
      authCode: int.parse(authCode),
      loginChannel: 1,
    );

    UserResponseLogin res =
        await UserApi.login(context: context, params: params);
    Global.saveProfile(res.data);

    UserInfo userInfo = Provider.of<UserInfo>(context, listen: false);
    userInfo.setUserInfo(res.data);
    Application.router.navigateTo(context, '/person', clearStack: true);
  }

  // 表单登录
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(600),
      margin: EdgeInsets.only(top: duSetHeight(160)),
      child: Column(
        children: [
          inputTextEdit(
              controller: _inputController,
              keyboardType: TextInputType.number,
              hintText: "电话号码",
              marginTop: 0),
          inputTextEdit(
            controller: _codeController,
            keyboardType: TextInputType.number,
            hintText: "验证码",
            isPassword: false,
          ),
          Container(
            width: double.infinity,
            height: duSetHeight(88),
            margin: EdgeInsets.only(top: duSetHeight(30)),
            child: RaisedButton(
              onPressed: _handleLogin,
              disabledTextColor: Colors.white,
              textColor: Colors.white,
              color: AppColors.primaryColor,
              child: Text(
                '登 录',
                style: TextStyle(
                  fontSize: duSetFontSize(36),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('测试登录'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [_buildInputForm()],
          ),
        ),
      ),
    );
  }
}
