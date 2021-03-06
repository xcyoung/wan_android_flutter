import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan_android/http/interceptor/cookie_interceptor.dart';
import 'package:wan_android/http/interceptor/response_interceptor.dart';

class HttpManager {
  static HttpManager _instance;
  Dio _dio;

  static HttpManager getInstance() {
    if (_instance == null) _instance = HttpManager._();
    return _instance;
  }

  HttpManager._() {
    _dio = Dio();
    _dio.options = BaseOptions(
//        baseUrl: EndPointController.getInstance().getEndPoint().baseUrl,
        baseUrl: 'https://www.wanandroid.com/',
        connectTimeout: 30000,
        receiveTimeout: 30000);
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // config the http client
//      client.findProxy = (uri) {
//        //proxy all request to localhost:8888
//        return "PROXY 10.196.50.233:8888";
//      };
//      client.badCertificateCallback =
//          (X509Certificate cert, String host, int port) => true;
      // you can also create a new HttpClient to dio
      // return new HttpClient();
    };
  }

  Future init() async {
    await _addCookieInterceptors();
  }

  Dio getDio() => _dio;

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  Future _addCookieInterceptors() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path + "/dioCookie";
    print('DioUtil : http cookie path = $tempPath');
    CookieJar cj = PersistCookieJar(dir: tempPath, ignoreExpires: true);
    _dio.interceptors.add(CookieInterceptor(cj));
    _dio.interceptors.add(ResponseInterceptors());
  }
}
