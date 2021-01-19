import 'package:thanos/entitys/entitys.dart';
import 'package:thanos/net/net.dart';

class UserApi {
  static login(
    UserRequestLogin params, {
    Function(UserResponseLogin) onSuccess,
  }) {
    DioUtils.instance.requestNetwork<UserResponseLogin>(
      Method.post,
      '/auth/login',
      params: params,
      onSuccess: onSuccess,
    );
  }
}
