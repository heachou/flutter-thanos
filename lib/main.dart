import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thanos/global.dart';
import 'package:thanos/provider/provider.dart';
import 'package:thanos/router/application.dart';
import 'package:thanos/router/routes.dart';
import 'package:thanos/values/colors.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  Global.init().then((value) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => UserInfo()),
          ],
          child: MyApp(),
        ),
      ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '中台系统',
      theme: ThemeData(
        primaryColor: AppColors.primaryBackground,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    );
  }
}
