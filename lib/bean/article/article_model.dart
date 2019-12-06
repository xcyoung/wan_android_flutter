import 'package:wan_android/bean/pagination.dart';

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

  ArticleBean({this.shareDate, this.projectLink, this.prefix, this.origin, this.link, this.title, this.type, this.selfVisible, this.apkLink, this.envelopePic, this.audit, this.chapterId, this.id, this.courseId, this.superChapterName, this.publishTime, this.niceShareDate, this.visible, this.niceDate, this.author, this.zan, this.chapterName, this.userId, this.tags, this.superChapterId, this.fresh, this.collect, this.shareUser, this.desc});

  ArticleBean.fromJson(Map<String, dynamic> json) {
    shareDate = json['shareDate'];
    projectLink = json['projectLink'];
    prefix = json['prefix'];
    origin = json['origin'];
    link = json['link'];
    title = json['title'];
    type = json['type'];
    selfVisible = json['selfVisible'];
    apkLink = json['apkLink'];
    envelopePic = json['envelopePic'];
    audit = json['audit'];
    chapterId = json['chapterId'];
    id = json['id'];
    courseId = json['courseId'];
    superChapterName = json['superChapterName'];
    publishTime = json['publishTime'];
    niceShareDate = json['niceShareDate'];
    visible = json['visible'];
    niceDate = json['niceDate'];
    author = json['author'];
    zan = json['zan'];
    chapterName = json['chapterName'];
    userId = json['userId'];
    if (json['tags'] != null) {
      tags = new List<Tag>();
      json['datas'].forEach((v) {
        tags.add(Tag.fromJson(v)); //使用EntityFactory解析对象
      });
    }
    superChapterId = json['superChapterId'];
    fresh = json['fresh'];
    collect = json['collect'];
    shareUser = json['shareUser'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shareDate'] = this.shareDate;
    data['projectLink'] = this.projectLink;
    data['prefix'] = this.prefix;
    data['origin'] = this.origin;
    data['link'] = this.link;
    data['title'] = this.title;
    data['type'] = this.type;
    data['selfVisible'] = this.selfVisible;
    data['apkLink'] = this.apkLink;
    data['envelopePic'] = this.envelopePic;
    data['audit'] = this.audit;
    data['chapterId'] = this.chapterId;
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['superChapterName'] = this.superChapterName;
    data['publishTime'] = this.publishTime;
    data['niceShareDate'] = this.niceShareDate;
    data['visible'] = this.visible;
    data['niceDate'] = this.niceDate;
    data['author'] = this.author;
    data['zan'] = this.zan;
    data['chapterName'] = this.chapterName;
    data['userId'] = this.userId;
    if (this.tags != null) {
      data['tags'] =  this.tags;
    }
    data['superChapterId'] = this.superChapterId;
    data['fresh'] = this.fresh;
    data['collect'] = this.collect;
    data['shareUser'] = this.shareUser;
    data['desc'] = this.desc;
    return data;
  }
}

class Tag {
  String name;
  String url;

  Tag({this.name, this.url});

  Tag.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class ArticleList extends Pagination<ArticleBean> {

  ArticleList();
}