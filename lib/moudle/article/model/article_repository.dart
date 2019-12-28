import 'package:dio/dio.dart';
import 'package:wan_android/service/article_service.dart';

ArticleRepository _repository = new ArticleRepository();

ArticleRepository get articleRepository => _repository;

class ArticleRepository {
  final _remote = ArticleService();

  Future<Response> getArticleList(int pageIndex) {
    return _remote.getArticleList(pageIndex);
  }

  Future<Response> getTopArticleList() {
    return _remote.getTopArticleList();
  }
}
