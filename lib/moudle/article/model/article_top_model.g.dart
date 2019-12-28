// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_top_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleTopList _$ArticleTopListFromJson(Map<String, dynamic> json) {
  return ArticleTopList()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : ArticleBean.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..listData = (json['listData'] as List)
        ?.map((e) => (e as List)
            ?.map((e) => e == null
                ? null
                : ArticleBean.fromJson(e as Map<String, dynamic>))
            ?.toList())
        ?.toList();
}

Map<String, dynamic> _$ArticleTopListToJson(ArticleTopList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'listData': instance.listData,
    };
