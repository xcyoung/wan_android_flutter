import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/http/http_export.dart';
import 'package:wan_android/moudle/article/model/article_model.dart';
import 'package:wan_android/moudle/article/model/article_repository.dart';
import 'package:wan_android/moudle/common/list/list_export.dart';

import 'page/article_page.dart';

class ArticlePresenter extends ListPresenter<ArticlePageState> {
  @override
  int getStartPage() {
    return 0;
  }

  @override
  Future loadPageData(int index) async {
    await WanHttpResultObservable<ArticleList>(
            articleRepository.getArticleList(index))
        .watch((result) {
          onDataChanged(result.data);
//      final page = result.data;
//      if (curIndex == getStartPage()) {
//        // refresh
//        view.onDataSuccess(true);
////        view.easyRefreshController.finishRefresh();
//        view.provider.list.clear();
//      } else {
//        view.onDataSuccess(false);
////        view.easyRefreshController.finishLoad();
//      }
////      curIndex = page.curPage;
//      if (page.datas.isEmpty) {
//        //  已无更多数据
//      }
//      if (page.datas.isNotEmpty) {
//        view.provider.addAll(page.datas);
//      }
    }, (code, message) {
      view.onError(code, message);
    });
  }

  @override
  void finishLoad(Pagination page) {
    if (page.datas.isNotEmpty) {
      view.provider.addAll(page.datas);
    }
    view.onDataSuccess(false);
  }

  @override
  void finishRefresh(Pagination page) {
    view.provider.clear();
    if (page.datas.isNotEmpty) {
      view.provider.addAll(page.datas);
    }
    view.onDataSuccess(true);
  }
}
