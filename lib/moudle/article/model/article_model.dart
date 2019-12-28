import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/moudle/article/model/article_list_model.dart';

part 'article_model.g.dart';
@JsonSerializable()
class ArticleListModel extends WanResponse<ArticleList> {
  ArticleListModel() : super();

  factory ArticleListModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleListModelFromJson(json);
}