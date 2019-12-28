// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_item_model.dart';

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
