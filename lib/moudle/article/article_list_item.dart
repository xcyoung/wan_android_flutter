import 'package:flutter/material.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';

// ignore: must_be_immutable
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
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: <Widget>[
                Offstage(
                  offstage: !item.fresh,
                  child: Text(
                    '新',
                    style: TextStyle(color: Colors.blue, fontSize: 12),
                  ),
                ),
                Offstage(
                  offstage: item.tags.length <= 0,
                  child: Text(
                    item.tags.length > 0 ? item.tags[0].name : '',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
                Text(
                  item.author.isNotEmpty ? item.author : item.shareUser,
                  style: TextStyle(fontSize: 12),
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
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    item.superChapterName + '/' + item.chapterName,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Icon(item.collect ? Icons.favorite : Icons.favorite_border)
              ],
            ),
          )
        ],
      ),
    );
  }
}
