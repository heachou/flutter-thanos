import 'package:dio/dio.dart';
import 'package:thanos/net/dio_utils.dart';
import 'package:thanos/net/intercept.dart';
import 'package:thanos/values/values.dart';

void initDio() {
  final List<Interceptor> interceptors = <Interceptor>[];

  /// 统一添加身份验证请求头
  // interceptors.add(AuthInterceptor());

  /// 刷新Token
  // interceptors.add(TokenInterceptor());

  /// 打印Log(生产模式去除)
  if (!Constant.inProduction) {
    interceptors.add(LoggingInterceptor());
  }

  /// 适配数据(根据自己的数据结构，可自行选择添加)
  interceptors.add(AdapterInterceptor());
  configDio(
    baseUrl: 'https://api.github.com/',
    interceptors: interceptors,
  );
}
