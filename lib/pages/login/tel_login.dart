import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:thanos/apis/apis.dart';
import 'package:thanos/controllers/login.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/pages/login/widgets/dingdingButton.dart';
import 'package:thanos/routes/app_pages.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/colors.dart';
import 'package:thanos/widgets/widgets.dart';

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

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  final UserController userController = Get.find();

  // 执行登录
  _handleLogin() async {
    String handPhone = _inputController.value.text;
    String authCode = _codeController.value.text;

    if (!duCheckIsPhone(handPhone)) {
      return Message.show('请输入正确格式的电话号码', backgroundColor: Colors.red);
    }
    if (!duCheckStringLength(authCode, 6)) {
      return Message.show('验证码长度不正确', backgroundColor: Colors.red);
    }

    UserRequestLogin params = UserRequestLogin(
      authType: "PHONE_NUMBER_SMS_CODE",
      handPhone: handPhone,
      authCode: int.parse(authCode),
      loginChannel: 1,
    );
    UserApi.login(params, onSuccess: (data) {
      // 在这里存储登录信息
      userController.setUser(data);

      // 跳转到首页
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void initState() {
    super.initState();
    _inputController.text = '15196947186';
    _codeController.text = '192019';
  }

  // 表单登录
  Widget _buildInputForm() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          duSetWidth(40), duSetHeight(180), duSetWidth(40), 0),
      child: Column(
        children: [
          Center(
            child: Text(
              '手机号码登录',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: duSetFontSize(40),
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(
            height: duSetHeight(40),
          ),
          inputTextEdit(
              controller: _inputController,
              keyboardType: TextInputType.phone,
              focusNode: _nodeText1,
              hintText: "电话号码",
              marginTop: 0),
          inputTextEdit(
            controller: _codeController,
            keyboardType: TextInputType.number,
            focusNode: _nodeText2,
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
      body: Container(
        color: Colors.blueGrey,
        height: ScreenUtil().screenHeight,
        child: MyScrollView(
          keyboardConfig: Utils.getKeyboardActionsConfig(
              context, <FocusNode>[_nodeText1, _nodeText2]),
          tapOutsideToDismiss: true,
          children: [
            _buildInputForm(),
            SizedBox(
              height: duSetHeight(290),
            ),
            DividerText(
              text: '或者',
            ),
            DingdingButtonLogin(
              onTap: () {
                print('ddlogin');
              },
            ),
            SizedBox(
              height: duSetHeight(40),
            )
          ],
        ),
      ),
    );
  }
}
