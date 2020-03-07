import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:wan_android/moudle/article/article_banner_item.dart';
import 'package:wan_android/moudle/article/model/article_banner_result.dart';

class ArticleHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final List<ArticleBannerBean> banners;

  ArticleHeaderDelegate(
      {this.collapsedHeight, this.expandedHeight, this.banners});

  Color getStickyHeaderBgColor(double shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color getStickyHeaderTextColor(double shrinkOffset) {
    if (shrinkOffset <= 50) {
      return Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  Color getStickyHeaderIconColor(double shrinkOffset) {
    if (shrinkOffset <= 50) {
      return Colors.blue;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
//          Container(
//            child: ScrollNotificationInterceptor(
//              child: Swiper(
//                itemWidth: MediaQuery.of(context).size.width,
//                itemBuilder: (BuildContext context, int index) {
//                  return ArticleBannerItem(banners[index]);
//                },
//                itemCount: banners.length,
//                viewportFraction: 1.0,
//                autoplay: false,
//                physics: FixedExtentScrollPhysics(),
//              ),
//            ),
//          ),
          Container(
            child: PageView(
              children: this.banners.map((f) => ArticleBannerItem(f)).toList(),
            )
          ),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                color: this.getStickyHeaderBgColor(shrinkOffset),
            height: this.collapsedHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Wan Android',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: this.getStickyHeaderTextColor(shrinkOffset)),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: this.getStickyHeaderIconColor(shrinkOffset),
                    ),
                    onPressed: null)
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  double get maxExtent => this.expandedHeight;

  @override
  double get minExtent => this.collapsedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
