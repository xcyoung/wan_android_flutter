import 'package:dio/dio.dart';
import 'package:wan_android/http/net_utils.dart';

class ArticleService {
  Future<Response> getArticleList(int pageIndex) {
    final url = 'article/list/$pageIndex/json';
    return request(Method.get, url);
  }

  Future<Response> getTopArticleList() {
    final url = 'article/top/json';
    return request(Method.get, url);
  }
}
