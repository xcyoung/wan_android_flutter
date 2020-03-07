import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:wan_android/bean/response_data.dart';
import 'package:wan_android/common/route/route.dart';
import 'package:wan_android/http/http_export.dart';
import 'package:wan_android/model/repository.dart';
import 'package:wan_android/moudle/article/article_header_delegate.dart';
import 'package:wan_android/moudle/article/article_list_item.dart';
import 'package:wan_android/moudle/article/model/article_banner_result.dart';
import 'package:wan_android/moudle/article/model/article_list_result.dart';
import 'package:wan_android/utils/toast_extension.dart';
import 'package:wan_android/widget/empty_widget.dart';

class ArticlePage extends StatefulWidget {
  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage>
    with AutomaticKeepAliveClientMixin {
  final List<ArticleBean> articles = [];
  final List<ArticleBannerBean> banners = [];

//  LinkHeaderNotifier _linkNotifier;
  int curPage = 0;

  @override
  void initState() {
    super.initState();
//    _linkNotifier = LinkHeaderNotifier();
  }

  @override
  void dispose() {
    super.dispose();
//    _linkNotifier.dispose();
  }

  Future loadPageData(int index) async {
    if (index == 0) {
      curPage = 0;
      await loadBannerList();
      await loadTop();
      await loadList(index);
    } else {
      await loadList(index);
    }
  }

  Future loadTop() async {
    final response = await repository.getTopArticleList();
    final res = response;
    WanHttpResultObservable(res).watch((result) {
      this.articles.clear();
      List<ArticleBean> articles = [];
      final data = result.data;
      for (int i = 0; i < data.length; i++) {
        ArticleBean articleBean = ArticleBean.fromJson(data[i]);
        articles.add(articleBean);
      }
      this.articles.addAll(articles);
    }, (code, message) {
      widget.toastError(code, message);
    });
  }

  Future loadList(int page) async {
    final response = await repository.getArticleList(page);
    final res = response;
    WanHttpResultObservable(res).watch((result) {
      setState(() {
        curPage++;
        this.articles.addAll(ArticleListResult.fromJson(result.data).datas);
      });
    }, (code, message) {
      widget.toastError(code, message);
    });
  }

  Future loadBannerList() async {
    final response = await repository.getBannerList();
    final res = response;
    WanHttpResultObservable(res).watch((result) {
      this.banners.clear();
      List<ArticleBannerBean> banners = [];
      final data = result.data;
      for (int i = 0; i < data.length; i++) {
        ArticleBannerBean bannerBean = ArticleBannerBean.fromJson(data[i]);
        banners.add(bannerBean);
      }
      this.banners.addAll(banners);
    }, (code, message) {
      widget.toastError(code, message);
    });
  }

  Future<bool> collectInsideArticle(ArticleBean item) async {
    final response = await repository.collectInsideArticle(item.id);
    final res = response as ResultData;
    if (res.code == 0) {
      item.collect = true;
      return Future.value(true);
    } else {
      final code = res.code;
      final message = res.message;
      BotToast.showText(text: '[$code]$message');
      if (code == -1001) {
        RouteCenter.instance.goToLogin(context);
      }
      return Future.value(false);
    }
  }

  Future<bool> unCollectArticle(ArticleBean item) async {
    final response = await repository.unCollectArticle(item.id);
    final res = response as ResultData;
    if (res.code == 0) {
      item.collect = false;
      return Future.value(false);
    } else {
      final code = res.code;
      final message = res.message;
      BotToast.showText(text: '[$code]$message');
      if (code == -1001) {
        RouteCenter.instance.goToLogin(context);
      }
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final easyRefresh = EasyRefresh.custom(
//      header: LinkHeader(
//        _linkNotifier,
//        extent: 70.0,
//        triggerDistance: 70.0,
//        completeDuration: Duration(milliseconds: 500),
//      ),
      footer: MaterialFooter(),
      enableControlFinishRefresh: false,
      enableControlFinishLoad: false,
      firstRefresh: true,
      emptyWidget: this.articles.isEmpty ? EmptyWidget() : null,
      slivers: <Widget>[
        SliverPersistentHeader(
            pinned: true,
            delegate: ArticleHeaderDelegate(
                collapsedHeight: 64,
                expandedHeight: 200,
                banners: this.banners)),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ArticleListItem(articles[index], (isLike, item) {
              print("isLike:$isLike");
              if (!isLike) {
                return collectInsideArticle(item);
              } else {
                return unCollectArticle(item);
              }
            });
          }, childCount: this.articles.length),
        ),
      ],
      onRefresh: () {
        return loadPageData(0);
      },
      onLoad: () {
        return loadPageData(curPage);
      },
    );
    return Scaffold(
      body: SafeArea(
        child: easyRefresh,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
