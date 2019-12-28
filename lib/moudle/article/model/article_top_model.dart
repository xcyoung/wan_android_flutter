import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';

part 'article_top_model.g.dart';

@JsonSerializable()
class ArticleTopList extends WanResponse<List<ArticleBean>> {
  ArticleTopList() : super();

  factory ArticleTopList.fromJson(Map<String, dynamic> json) =>
      _$ArticleTopListFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleTopListToJson(this);
  }
}