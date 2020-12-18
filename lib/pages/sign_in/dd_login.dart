import 'package:flutter/material.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/values.dart';

class DdLoginPage extends StatefulWidget {
  DdLoginPage({Key key}) : super(key: key);

  @override
  _DdLoginPageState createState() => _DdLoginPageState();
}

class _DdLoginPageState extends State<DdLoginPage> {
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(427),
      height: duSetHeight(70),
      margin: EdgeInsets.only(top: duSetHeight(155)),
      child: Icon(
        Iconfont.iconzhongtai_logo,
        size: 40,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildPic() {
    return Container(
      width: duSetWidth(572),
      child: Image.asset(
        "assets/images/login_bg.png",
        fit: BoxFit.contain,
      ),
    );
  }

  ddLogin() {
    print('dd login');
  }

  Widget _buildButton() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(100)),
      width: duSetWidth(450),
      height: duSetHeight(100),
      child: RaisedButton.icon(
          onPressed: ddLogin,
          textColor: Colors.white,
          color: AppColors.primaryColor,
          icon: Icon(
            Iconfont.icondingding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          label: Text(
            '钉钉授权登录',
            style: TextStyle(fontSize: duSetFontSize(32)),
          )),
    );
  }

  Widget _buildTips() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(40)),
      child: Text(
        '数据来源于咕咕狗中台系统',
        style: TextStyle(color: AppColors.primaryText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            SizedBox(
              height: duSetHeight(75),
            ),
            _buildPic(),
            _buildButton(),
            _buildTips(),
          ],
        ),
      ),
    );
  }
}
