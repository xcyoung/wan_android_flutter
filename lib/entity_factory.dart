import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "WanResponse") {
      return WanResponse.fromJson(json) as T;
    } else if (T.toString() == "Pagination") {
      return Pagination.fromJson(json) as T;
    } else if (T.toString() == "ArticleList") {
      return ArticleList(json) as T;
    } else if (T.toString() == "ArticleBean") {
      return ArticleBean.fromJson(json) as T;
    } else {
      return null;
    }
  }
}
