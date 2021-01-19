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

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '中台系统',
      initialRoute: Global.isFirstOpen
          ? AppPages.INITIAL
          : userController.user?.token == null
              ? AppPages.LOGIN
              : AppPages.HOME,
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
