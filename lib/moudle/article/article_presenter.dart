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
    await articleRepository.getTopArticleList().then((response) {
      final res = ArticleTopList.fromJson(response.data);
      WanHttpResultObservable<ArticleTopList>(res).watch((result) {
        _list.clear();
        _list.addAll(result.data);
      }, (code, message) {
        view.onError(code, message);
      });
    });
  }

  Future loadList(int index) async {
    await articleRepository.getArticleList(index).then((response) {
      final res = ArticleListModel.fromJson(response.data);
      WanHttpResultObservable<ArticleListModel>(res)
          .watch((result) {
        onDataChanged(result.data);
      }, (code, message) {
        view.onError(code, message);
      });
    });
  }

  @override
  void finishLoad(Pagination page) {
    if (page.datas.isNotEmpty) {
      _list.addAll(page.datas as List<ArticleBean>);
      view.provider.addAll(_list);
    }
    view.onDataSuccess(false);
  }

  @override
  void finishRefresh(Pagination page) {
    view.provider.clear();
    if (page.datas.isNotEmpty) {
      _list.addAll(page.datas as List<ArticleBean>);
      view.provider.addAll(_list);
    }
    view.onDataSuccess(true);
  }
}
