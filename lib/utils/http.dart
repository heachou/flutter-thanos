import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thanos/values/values.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      baseUrl: SERVER_API_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 10000,
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 5000,
      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    dio = new Dio(options);
    // Cookie管理
    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options; //continue
    }, onResponse: (Response response) {
      return response; // continue
    }, onError: (DioError e) {
      // ErrorEntity eInfo = createErrorEntity(e);
      // 错误交互处理
      // var context = e.request.extra["context"];
      // if (context != null) {
      //   switch (eInfo.code) {
      //     case 401: // 没有权限 重新登录
      //       goLoginPage(context);
      //       break;
      //     default:
      //   }
      // }
      return e;
    }));
  }
  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  Future post(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.merge(extra: {
      "context": context,
    });
    // Map<String, dynamic> _authorization = getAuthorizationHeader();
    // if (_authorization != null) {
    //   requestOptions = requestOptions.merge(headers: _authorization);
    // }
    var response = await dio.post(path,
        data: params, options: requestOptions, cancelToken: cancelToken);
    return response.data;
  }
}
