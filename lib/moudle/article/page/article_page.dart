import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/moudle/article/article_list_item.dart';
import 'package:wan_android/moudle/article/article_presenter.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:wan_android/provider/list_provider.dart';

class ArticlePage extends StatefulWidget {
  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BaseState<ArticlePage, ArticlePresenter> with AutomaticKeepAliveClientMixin {
  ListProvider<ArticleBean> provider = ListProvider<ArticleBean>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ListProvider<ArticleBean>>(
      create: (_) => provider,
      child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Icon(FontAwesomeIcons.search)
            ],
          ),
          body: Consumer<ListProvider<ArticleBean>>(
            builder: (_, provider, __) {
              return ListView.builder(
                  itemCount: provider.list.length,
                  itemBuilder: (_, index) {
                    return ArticleListItem(provider.list[index]);
                  });
            },
          )),
    );
  }

  @override
  ArticlePresenter createPresenter() {
    return ArticlePresenter();
  }

  @override
  void onError(int code, String message) {

  }

  @override
  bool get wantKeepAlive => true;
}
