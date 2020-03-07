// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_banner_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleBannerBean _$ArticleBannerBeanFromJson(Map<String, dynamic> json) {
  return ArticleBannerBean(
    json['desc'] as String,
    json['imagePath'] as String,
    json['title'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$ArticleBannerBeanToJson(ArticleBannerBean instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'url': instance.url,
    };
