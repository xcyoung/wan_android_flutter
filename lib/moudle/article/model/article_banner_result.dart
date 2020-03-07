import 'package:json_annotation/json_annotation.dart';

part 'article_banner_result.g.dart';
@JsonSerializable()
class ArticleBannerBean {
  String desc;
  String imagePath;
  String title;
  String url;

  ArticleBannerBean(this.desc, this.imagePath, this.title, this.url);

  factory ArticleBannerBean.fromJson(Map<String, dynamic> json) =>
      _$ArticleBannerBeanFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleBannerBeanToJson(this);
  }
}
