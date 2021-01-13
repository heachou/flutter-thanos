import 'package:get/get.dart';
import 'package:thanos/pages/splash/splash.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: _Paths.SPLASH, page: () => SplashPage())
  ];
}
