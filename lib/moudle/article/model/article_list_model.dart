import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleList extends Pagination<ArticleBean> {
  ArticleList() : super();

  factory ArticleList.fromJson(Map<String, dynamic> json) =>
      _$ArticleListFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleListToJson(this);
  }
}