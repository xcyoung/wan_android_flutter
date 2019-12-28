import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:like_button/like_button.dart';
import 'package:wan_android/generated/i18n.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';
import 'package:wan_android/widget/label.dart';

typedef OnLikeCallback = Future<bool> Function(bool isLike, ArticleBean item);

class ArticleListItem extends StatefulWidget {
  ArticleBean item;
  OnLikeCallback likeCallback;

  ArticleListItem(this.item, this.likeCallback);

  @override
  _ArticleListItemState createState() => _ArticleListItemState();
}

class _ArticleListItemState extends State<ArticleListItem> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Offstage(
                offstage: !item.fresh,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(8))),
                      child: Text(
                        'New',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 2),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        item.author.isNotEmpty
                            ? S.of(context).wan_article_item_author(item.author)
                            : S
                                .of(context)
                                .wan_article_item_share(item.shareUser),
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Offstage(
                      offstage: item.tags.length <= 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                            children: item.tags.map((tag) {
                          return Label(
                            tag.name,
                          );
                        }).toList()),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.niceDate,
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
                child: Row(
                  children: <Widget>[
                    Offstage(
                      offstage: item.type != 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          S.of(context).wan_article_item_sticky,
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        item.superChapterName + '/' + item.chapterName,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    LikeButton(
                      isLiked: item.collect,
                      likeBuilder: (bool isLiked) {
                        return isLiked
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border,
                                color: Colors.black26);
                      },
                      circleColor:
                          CircleColor(start: Colors.redAccent, end: Colors.red),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.redAccent,
                      ),
                      onTap: (bool isLiked) {
                        final a = widget.likeCallback(isLiked, item);
                        return a;
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
