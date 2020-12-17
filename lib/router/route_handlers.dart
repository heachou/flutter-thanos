import 'package:fluro/fluro.dart';
import 'package:thanos/pages/index/index.dart';
import 'package:thanos/pages/notFound/notFound.dart';
import 'package:thanos/pages/person/person.dart';
import 'package:thanos/pages/demos/demos.dart';
import 'package:thanos/pages/sign_in/sign_in.dart';

/// 首页
var rootHandler = Handler(
  handlerFunc: (context, parameters) {
    return IndexPage();
  },
);

/// 领人才,我的客户
var personHandler = Handler(
  handlerFunc: (context, parameters) {
    return PersonPage();
  },
);

/// 登录
var signInHandler = Handler(
  handlerFunc: (context, parameters) {
    return SignInPage();
  },
);

var demoHandler = Handler(
  handlerFunc: (context, parameters) {
    return DemoPage();
  },
);

/// 404页面
var notFoundHandler = Handler(
  handlerFunc: (context, parameters) {
    return NotFoundPage();
  },
);
