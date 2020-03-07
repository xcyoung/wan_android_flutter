import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/generated/i18n.dart';
import 'package:wan_android/moudle/article/model/article_list_result.dart'
    show ArticleBean;
import 'package:wan_android/widget/label.dart';

typedef OnLikeCallback = Future<bool> Function(bool isLike, ArticleBean item);
typedef OnShareCallback = void Function(ArticleBean item);

class ArticleListItem extends StatefulWidget {
  ArticleBean item;
  OnLikeCallback likeCallback;
  OnShareCallback shareCallback;

  ArticleListItem(this.item, this.likeCallback, this.shareCallback);

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
          onTap: () {
            RouteCenter.instance.goToBrowser(context, item.link);
          },
          child: Stack(
            alignment: Alignment.center,
//            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                  right: 18.0,
                  child: Offstage(
                    offstage: !(item.fresh || item.type == 1),
                    child: Container(
                      padding: !item.fresh
                          ? const EdgeInsets.fromLTRB(0, 0, 16.0, 0)
                          : const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        !item.fresh
                            ? "resource/assets/bg_beer_celebration.svg"
                            : "resource/assets/bg_programmer.svg",
                        height: 120,
                        fit: BoxFit.fitWidth,
                        color: Color(0xCBFFFFFF),
                        colorBlendMode: BlendMode.dstOut,
                      ),
                    ),
                  )),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(height: 5.0),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 2),
                      child: Row(
                        children: <Widget>[
                          Offstage(
                            offstage: !item.fresh,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0, 2.0, 4.0, 0),
                              child: Text(
                                "新",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              item.author.isNotEmpty
                                  ? S
                                      .of(context)
                                      .wan_article_item_author(item.author)
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
                                  color: Color(0xFFF9A826),
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
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 4, 16, 8),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: <Widget>[
                          Offstage(
                            offstage: item.type != 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Text(
                                S.of(context).wan_article_item_sticky,
                                style: TextStyle(
                                    color: Color(0xFF00B0FF), fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item.superChapterName + '/' + item.chapterName,
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: LikeButton(
                              isLiked: item.collect,
                              likeBuilder: (bool isLiked) {
                                return isLiked
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite_border,
                                        color: Colors.black26);
                              },
                              circleColor: CircleColor(
                                  start: Colors.redAccent, end: Colors.red),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.redAccent,
                              ),
                              onTap: (bool isLiked) {
                                final a = widget.likeCallback(isLiked, item);
                                return a;
                              },
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                                icon: Icon(
                                  Icons.share,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  widget.shareCallback(item);
                                }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0)
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
