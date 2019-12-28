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

  Future<Response> collectInsideArticle(int id) {
    return _remote.collectInsideArticle(id);
  }

  Future<Response> unCollectArticle(int id) {
    return _remote.unCollectArticle(id);
  }
}
