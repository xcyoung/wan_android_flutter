import 'package:json_annotation/json_annotation.dart';
import 'package:wan_android/bean/pagination.dart';

part 'article_list_result.g.dart';
@JsonSerializable()
class ArticleBean {
  int shareDate;
  String projectLink;
  String prefix;
  String origin;
  String link;
  String title;
  int type;
  int selfVisible;
  String apkLink;
  String envelopePic;
  int audit;
  int chapterId;
  int id;
  int courseId;
  String superChapterName;
  int publishTime;
  String niceShareDate;
  int visible;
  String niceDate;
  String author;
  int zan;
  String chapterName;
  int userId;
  List<Tag> tags;
  int superChapterId;
  bool fresh;
  bool collect;
  String shareUser;
  String desc;

  ArticleBean(
      {this.shareDate,
        this.projectLink,
        this.prefix,
        this.origin,
        this.link,
        this.title,
        this.type,
        this.selfVisible,
        this.apkLink,
        this.envelopePic,
        this.audit,
        this.chapterId,
        this.id,
        this.courseId,
        this.superChapterName,
        this.publishTime,
        this.niceShareDate,
        this.visible,
        this.niceDate,
        this.author,
        this.zan,
        this.chapterName,
        this.userId,
        this.tags,
        this.superChapterId,
        this.fresh,
        this.collect,
        this.shareUser,
        this.desc});

  factory ArticleBean.fromJson(Map<String, dynamic> json) =>
      _$ArticleBeanFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleBeanToJson(this);
  }
}

@JsonSerializable()
class Tag {
  String name;
  String url;

  Tag({this.name, this.url});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);

  Map<String, dynamic> toJson() {
    return _$TagToJson(this);
  }
}

@JsonSerializable()
class ArticleListResult extends Pagination<ArticleBean> {

  ArticleListResult() : super();

  factory ArticleListResult.fromJson(Map<String, dynamic> json) =>
      _$ArticleListResultFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleListResultToJson(this);
  }
}

@JsonSerializable()
class ArticleTopList {
  List<ArticleBean> datas;

  ArticleTopList(this.datas);

  factory ArticleTopList.fromJson(Map<String, dynamic> json) =>
      _$ArticleTopListFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ArticleTopListToJson(this);
  }
}