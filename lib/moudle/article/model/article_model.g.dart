// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListModel _$ArticleListModelFromJson(Map<String, dynamic> json) {
  return ArticleListModel()
    ..data = json['data'] == null
        ? null
        : ArticleList.fromJson(json['data'] as Map<String, dynamic>)
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..listData = (json['listData'] as List)
        ?.map((e) =>
            e == null ? null : ArticleList.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArticleListModelToJson(ArticleListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'listData': instance.listData,
    };
