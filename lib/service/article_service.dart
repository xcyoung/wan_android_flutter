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

  Future<Response> collectInsideArticle(int id) {
    final url = 'lg/collect/$id/json';
    return request(Method.post, url);
  }

  Future<Response> unCollectArticle(int id) {
    final url = "lg/uncollect_originId/$id/json";
    return request(Method.post, url);
  }
}
