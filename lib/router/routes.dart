import 'package:fluro/fluro.dart';
import 'package:thanos/router/route_handlers.dart';

class Routes {
  static String root = "/";
  static String signIn = "/signIn";

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;

    router.define(root, handler: rootHandler);
    router.define(signIn,
        handler: signInHandler, transitionType: TransitionType.cupertino);
  }
}
