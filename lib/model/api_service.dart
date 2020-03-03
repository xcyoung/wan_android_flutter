import 'package:dio/dio.dart';
import 'package:wan_android/bean/response_data.dart';
import 'package:wan_android/http/net_utils.dart';

class ApiService {
  Future<ResultData> register(
      String username, String password, String rePassword) {
    final url = 'user/register';
    final body = new FormData.fromMap(
        {"username": username, "password": password, "repassword": rePassword});
    final response = request(Method.post, url, params: body);
    return response;
  }

  Future<ResultData> login(String username, String password) {
    final url = 'user/login';
    final body =
        new FormData.fromMap({"username": username, "password": password});
    final response = request(Method.post, url, params: body);
    return response;
  }

  Future<ResultData> getArticleList(int pageIndex) {
    final url = 'article/list/$pageIndex/json';
    return request(Method.get, url);
  }

  Future<ResultData> getTopArticleList() {
    final url = 'article/top/json';
    return request(Method.get, url);
  }

  Future<ResultData> getBannerList() {
    final url = 'banner/json';
    return request(Method.get, url);
  }

  Future<ResultData> collectInsideArticle(int id) {
    final url = 'lg/collect/$id/json';
    return request(Method.post, url);
  }

  Future<ResultData> unCollectArticle(int id) {
    final url = "lg/uncollect_originId/$id/json";
    return request(Method.post, url);
  }
}
