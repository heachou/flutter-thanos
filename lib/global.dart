import 'dart:io';
import 'package:flutter/material.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/storage.dart';

class Global {
  /// 用户配置
  static UserResponseLogin profile = UserResponseLogin(
    data: null,
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
    await StorageUtil.init();
    // 设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserResponseLogin.fromJson(_profileJSON);
      isOfflineLogin = true;
    }
  }

  static Future<bool> saveProfile(UserResponseLogin userResponse) {
    return StorageUtil()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }
}
