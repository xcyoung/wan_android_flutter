import 'package:flutter/cupertino.dart';
import 'package:wan_android/http/http_export.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';
import 'package:wan_android/moudle/article/model/article_repository.dart';
import 'package:wan_android/mvp/mvp_export.dart';

import 'page/article_page.dart';

class ArticlePresenter extends BasePresenter<ArticlePageState> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addSubscription(WanHttpResultObservable<ArticleList>(
              articleRepository.getArticleList(0))
          .watch((result) {
        view.provider.clear();
        view.provider.addAll(result.data.datas);
      }, (code, message) {

      }));
    });
  }
}
