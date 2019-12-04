import 'package:dio/dio.dart';
import 'package:wan_android/controller/end_point_controller.dart';

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
  }

  Dio getDio() => _dio;

  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
