// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleList _$ArticleListFromJson(Map<String, dynamic> json) {
  return ArticleList()
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as int
    ..total = json['total'] as int
    ..curPage = json['curPage'] as int
    ..offset = json['offset'] as int
    ..size = json['size'] as int
    ..datas = (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : ArticleBean.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ArticleListToJson(ArticleList instance) =>
    <String, dynamic>{
      'over': instance.over,
      'pageCount': instance.pageCount,
      'total': instance.total,
      'curPage': instance.curPage,
      'offset': instance.offset,
      'size': instance.size,
      'datas': instance.datas,
    };
