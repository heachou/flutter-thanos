import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_util/sp_util.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/values/storage.dart';

class Global {
  /// 用户配置
  static UserResponseLogin profile = UserResponseLogin(
    token: null,
  );

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否是release
  static bool get isRelease => bool.fromEnvironment('dart.vm.product');

  /// 是否IOS
  static bool isIOS = Platform.isIOS;

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    // 工具初始
    await SpUtil.getInstance();
    // 设备第一次打开
    isFirstOpen =
        !SpUtil.getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, defValue: true);
    if (isFirstOpen) {
      SpUtil.putBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var profile = SpUtil.getObj(
        STORAGE_USER_PROFILE_KEY, (v) => UserRequestLogin.fromJson(v));

    if (profile != null) {
      isOfflineLogin = true;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<bool> saveProfile(UserResponseLogin userResponse) {
    return SpUtil.putObject(STORAGE_USER_PROFILE_KEY, userResponse);
  }
}
