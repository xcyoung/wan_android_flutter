import 'package:flutter/material.dart';
import 'package:wan_android/moudle/article/model/article_banner_result.dart'
    show ArticleBannerBean;

class ArticleBannerItem extends StatefulWidget {
  ArticleBannerBean _item;

  ArticleBannerItem(this._item);

  @override
  _ArticleBannerItemState createState() => _ArticleBannerItemState();
}

class _ArticleBannerItemState extends State<ArticleBannerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.network(widget._item.imagePath),
          ),
//          Positioned(
//              child: Container(
//            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                begin: Alignment.bottomCenter,
//                end: Alignment(0, -0.1),
//                colors: <Color>[Colors.black26, Color(0x00000000)],
//              ),
//            ),
//          )),
//          Positioned(
//              bottom: 18.0,
//              left: 18.0,
//              child: Text(
//                widget._item.title,
//                style: TextStyle(fontSize: 20.0, color: Colors.white),
//              ))
        ],
      ),
    );
  }
}
