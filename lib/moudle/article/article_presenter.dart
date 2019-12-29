import 'dart:async';

import 'package:wan_android/bean/empty_model.dart';
import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/http/http_export.dart';
import 'package:wan_android/moudle/article/model/article_item_model.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';
import 'package:wan_android/moudle/article/model/article_repository.dart';
import 'package:wan_android/moudle/article/model/article_top_model.dart';
import 'package:wan_android/moudle/common/list/list_export.dart';

import 'page/article_page.dart';

class ArticlePresenter extends ListPresenter<ArticlePageState> {
  final List<ArticleBean> _list = [];

  @override
  int getStartPage() {
    return 0;
  }

  @override
  Future loadPageData(int index) async {
    if (index == getStartPage()) {
      await loadTop();
      await loadList(index);
    } else {
      await loadList(index);
    }
  }

  Future loadTop() async {
    final response = await articleRepository.getTopArticleList();
    final res = ArticleTopList.fromJson(response.data);
    WanHttpResultObservable<ArticleTopList>(res).watch((result) {
      _list.clear();
      _list.addAll(result.data);
    }, (code, message) {
      view.onError(code, message);
    });
  }

  Future loadList(int index) async {
    final response = await articleRepository.getArticleList(index);
    final res = ArticleListModel.fromJson(response.data);
    WanHttpResultObservable<ArticleListModel>(res).watch((result) {
      onDataChanged(result.data);
    }, (code, message) {
      view.onError(code, message);
    });
  }

  Future<bool> collectInsideArticle(int id) async {
    final response = await articleRepository.collectInsideArticle(id);
    final res = EmptyModel.fromJson(response.data);
    WanHttpResultObservable<EmptyModel>(res).watch((result) {
      return Future.value(true);
    }, (code, message) {
      view.onError(code, message);
      return Future.value(false);
    });
  }

  Future<bool> unCollectArticle(int id) async {
    final response = await articleRepository.unCollectArticle(id);
    final res = EmptyModel.fromJson(response.data);
    WanHttpResultObservable<EmptyModel>(res).watch((result) {
      return Future.value(false);
    }, (code, message) {
      view.onError(code, message);
      return Future.value(true);
    });
  }

  @override
  void finishLoad(Pagination page) {
    if (page.datas.isNotEmpty) {
      final list = page.datas as List<ArticleBean>;
      _list.addAll(list);
      view.provider.addAll(list);
    }
//    view.onDataSuccess(false);
  }

  @override
  void finishRefresh(Pagination page) {
    view.provider.clear();
    if (page.datas.isNotEmpty) {
      _list.addAll(page.datas as List<ArticleBean>);
      view.provider.addAll(_list);
    }
//    view.onDataSuccess(true);
  }
}
