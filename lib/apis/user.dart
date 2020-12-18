import 'package:flutter/material.dart';
import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/utils/utils.dart';

class UserApi {
  static Future<UserResponseLogin> login({
    @required BuildContext context,
    UserRequestLogin params,
  }) async {
    var response = await HttpUtil().post(
      '/auth/login',
      context: context,
      params: params,
    );
    print(response);
    return UserResponseLogin.fromJson(response);
  }
}
