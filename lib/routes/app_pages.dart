import 'package:get/get.dart';
import 'package:thanos/pages/splash/splash.dart';
import 'package:thanos/pages/login/login.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashPage()),
    GetPage(name: _Paths.HOME, page: () => SplashPage()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
  ];
}
