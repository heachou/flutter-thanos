import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/global.dart';
import 'package:thanos/values/values.dart';

class UserController extends GetxController {
  UserResponseLogin user;

  @override
  onInit() {
    user = SpUtil.getObj(
        STORAGE_USER_PROFILE_KEY, (v) => UserResponseLogin.fromJson(v));
    super.onInit();
  }

  setUser(UserResponseLogin params) {
    user = params;
    // 存储登录信息到本地
    Global.saveProfile(params);
  }

  clear() {
    user = null;
    Global.saveProfile(null);
  }
}
