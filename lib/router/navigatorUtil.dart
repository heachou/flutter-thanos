import 'package:flutter/material.dart';
import 'package:thanos/router/application.dart';
import 'package:thanos/router/routes.dart';

class NavigatorUtil {
  /// 返回
  static void goBack(BuildContext context) {
    /// 其实这边调用的是 Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 带参数的返回
  static void goBackWithParams(BuildContext context, result) {
    Navigator.pop(context, result);
  }

  /// 跳转到主页面
  static void goHomePage(BuildContext context) {
    Application.router.navigateTo(context, Routes.root, replace: true);
  }
}
