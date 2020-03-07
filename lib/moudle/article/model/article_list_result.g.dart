// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleBean _$ArticleBeanFromJson(Map<String, dynamic> json) {
  return ArticleBean(
    shareDate: json['shareDate'] as int,
    projectLink: json['projectLink'] as String,
    prefix: json['prefix'] as String,
    origin: json['origin'] as String,
    link: json['link'] as String,
    title: json['title'] as String,
    type: json['type'] as int,
    selfVisible: json['selfVisible'] as int,
    apkLink: json['apkLink'] as String,
    envelopePic: json['envelopePic'] as String,
    audit: json['audit'] as int,
    chapterId: json['chapterId'] as int,
    id: json['id'] as int,
    courseId: json['courseId'] as int,
    superChapterName: json['superChapterName'] as String,
    publishTime: json['publishTime'] as int,
    niceShareDate: json['niceShareDate'] as String,
    visible: json['visible'] as int,
    niceDate: json['niceDate'] as String,
    author: json['author'] as String,
    zan: json['zan'] as int,
    chapterName: json['chapterName'] as String,
    userId: json['userId'] as int,
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    superChapterId: json['superChapterId'] as int,
    fresh: json['fresh'] as bool,
    collect: json['collect'] as bool,
    shareUser: json['shareUser'] as String,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$ArticleBeanToJson(ArticleBean instance) =>
    <String, dynamic>{
      'shareDate': instance.shareDate,
      'projectLink': instance.projectLink,
      'prefix': instance.prefix,
      'origin': instance.origin,
      'link': instance.link,
      'title': instance.title,
      'type': instance.type,
      'selfVisible': instance.selfVisible,
      'apkLink': instance.apkLink,
      'envelopePic': instance.envelopePic,
      'audit': instance.audit,
      'chapterId': instance.chapterId,
      'id': instance.id,
      'courseId': instance.courseId,
      'superChapterName': instance.superChapterName,
      'publishTime': instance.publishTime,
      'niceShareDate': instance.niceShareDate,
      'visible': instance.visible,
      'niceDate': instance.niceDate,
      'author': instance.author,
      'zan': instance.zan,
      'chapterName': instance.chapterName,
      'userId': instance.userId,
      'tags': instance.tags,
      'superChapterId': instance.superChapterId,
      'fresh': instance.fresh,
      'collect': instance.collect,
      'shareUser': instance.shareUser,
      'desc': instance.desc,
    };

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

ArticleListResult _$ArticleListResultFromJson(Map<String, dynamic> json) {
  return ArticleListResult()
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

Map<String, dynamic> _$ArticleListResultToJson(ArticleListResult instance) =>
    <String, dynamic>{
      'over': instance.over,
      'pageCount': instance.pageCount,
      'total': instance.total,
      'curPage': instance.curPage,
      'offset': instance.offset,
      'size': instance.size,
      'datas': instance.datas,
    };

ArticleTopList _$ArticleTopListFromJson(Map<String, dynamic> json) {
  return ArticleTopList(
    (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : ArticleBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArticleTopListToJson(ArticleTopList instance) =>
    <String, dynamic>{
      'datas': instance.datas,
    };
