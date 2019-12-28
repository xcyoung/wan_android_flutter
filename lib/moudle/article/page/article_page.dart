import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/moudle/account/login/login_page.dart';
import 'package:wan_android/moudle/article/article_list_item.dart';
import 'package:wan_android/moudle/article/article_presenter.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';
import 'package:wan_android/mvp/mvp_export.dart';
import 'package:wan_android/provider/list_provider.dart';
import 'package:wan_android/utils/toast_extension.dart';

class ArticlePage extends StatefulWidget {
  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BaseState<ArticlePage, ArticlePresenter>
    with AutomaticKeepAliveClientMixin {
  ListProvider<ArticleBean> provider = ListProvider<ArticleBean>();
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ListProvider<ArticleBean>>(
      create: (_) => provider,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45),
            child: AppBar(
              elevation: 0.5,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Icon(FontAwesomeIcons.search),
                )
              ],
            ),
          ),
          body: Consumer<ListProvider<ArticleBean>>(
            builder: (_, provider, __) {
              return EasyRefresh.custom(
                header: MaterialHeader(),
                footer: MaterialFooter(),
                controller: _easyRefreshController,
                enableControlFinishRefresh: true,
                enableControlFinishLoad: true,
                firstRefresh: true,
                emptyWidget: this.provider.list.isEmpty ? Text('empty!') : null,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return ArticleListItem(provider.list[index],
                          (isLike, item) {
                        print("isLike:$isLike");
                        if (!isLike) {
                          return this.presenter.collectInsideArticle(item.id);
                        } else {
                          return this.presenter.unCollectArticle(item.id);
                        }
                      });
                    }, childCount: provider.list.length),
                  )
                ],
                onRefresh: () {
                  return this.presenter.load(true);
                },
                onLoad: () {
                  return this.presenter.load(false);
                },
              );
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
    toastError(code, message);
  }

  void onDataSuccess(bool isRefresh) {
//    BotToast.showText(text: 'isRefresh:$isRefresh');
    setState(() {
      if (isRefresh)
        _easyRefreshController.finishRefresh();
      else
        _easyRefreshController.finishLoad();
    });
  }

  @override
  bool get wantKeepAlive => true;
}
