import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/mvp/mvp_export.dart' show IMvpView,BasePresenter;

abstract class ListPresenter<V extends IMvpView> extends BasePresenter<V> {
  int curIndex;

  Future load(bool isClear) async {
    if (isClear) {
      curIndex = getStartPage();
      await loadPageData(curIndex);
    } else {
      await loadPageData(curIndex + 1);
    }
  }

  void onDataChanged(Pagination page) {
    if (curIndex == getStartPage()) {
      // refresh
      finishRefresh(page);
    } else {
      finishLoad(page);
    }

    curIndex = page.curPage;

    if (page.datas.isEmpty) {
      //  已无更多数据
    }
  }

  Future loadPageData(int index);

  int getStartPage();

  void finishRefresh(Pagination page);

  void finishLoad(Pagination page);
}
