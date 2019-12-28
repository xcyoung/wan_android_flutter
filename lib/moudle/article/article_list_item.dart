import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wan_android/generated/i18n.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';
import 'package:wan_android/widget/label.dart';

class ArticleListItem extends StatefulWidget {
  ArticleBean item;

  ArticleListItem(this.item);

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
                    Expanded(
                      child: Text(
                        item.superChapterName + '/' + item.chapterName,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          item.collect = !item.collect;
                        });
                      },
                      child: Icon(
                        item.collect ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
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
