import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thanos/entitys/user.dart';
import 'package:thanos/utils/utils.dart';
import 'package:thanos/values/values.dart';
 
class UserInfo with ChangeNotifier, DiagnosticableTreeMixin {
  UserData _userInfo = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY)
      ? UserData.fromJson(StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY))
      : null;
  // 整个用户信息
  UserData get userInfo => _userInfo;
  // token
  String get token => _userInfo != null ? _userInfo.token : '';
  // 用户头像
  String get photoPath => _userInfo != null ? _userInfo.photoPath : '';
// Provider.of<UserInfo>(context, listen: false);
  // 登录成功后设置值
  setUserInfo(UserData userinfo) {
    _userInfo = userinfo;
    notifyListeners();
  }
}
