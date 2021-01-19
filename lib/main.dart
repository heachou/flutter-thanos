import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanos/controllers/login.dart';
import 'package:thanos/global.dart';
import 'package:thanos/net/init.dart';
import 'package:thanos/routes/app_pages.dart';
import 'package:thanos/utils/log_utils.dart';
import 'package:thanos/values/colors.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp() {
    Log.init();
    initDio();
  }

  // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '中台系统',
      initialRoute: Global.isFirstOpen
          ? AppPages.INITIAL
          : Global.isOfflineLogin
              ? AppPages.HOME
              : AppPages.LOGIN,
      getPages: AppPages.routes,
      routingCallback: (routing) {
        print(routing.current);
      },
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
