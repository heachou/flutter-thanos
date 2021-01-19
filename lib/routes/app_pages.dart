import 'package:get/get.dart';
import 'package:thanos/pages/home/home.dart';
import 'package:thanos/pages/splash/splash.dart';
import 'package:thanos/pages/login/login.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static const LOGIN = Routes.LOGIN;
  static const HOME = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashPage()),
    GetPage(name: _Paths.HOME, page: () => HomePage()),
    GetPage(name: _Paths.LOGIN, page: () => LoginPage()),
  ];
}
