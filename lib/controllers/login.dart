import 'package:get/get.dart';
import 'package:thanos/entitys/entitys.dart';

class UserController extends GetxController {
  UserResponseLogin user;
  setUser(UserResponseLogin params) {
    user = params;
  }

  clear() {
    user = null;
  }
}
