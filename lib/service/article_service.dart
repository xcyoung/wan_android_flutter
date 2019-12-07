import 'package:rxdart/rxdart.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/http/net_utils.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';

class ArticleService {
  Observable<WanResponse<ArticleList>> getArticleList(int pageIndex) {
    final url = 'article/list/$pageIndex/json';
    return request<ArticleList>(Method.get, url);
  }
}
