import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';
import 'package:wan_android/service/article_service.dart';

ArticleRepository _repository = new ArticleRepository();

ArticleRepository get articleRepository => _repository;

class ArticleRepository {
  final _remote = ArticleService();

  Future<WanResponse<ArticleList>> getArticleList(int pageIndex) {
    return _remote.getArticleList(pageIndex);
  }
}
