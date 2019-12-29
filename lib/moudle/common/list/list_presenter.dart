import 'package:wan_android/bean/pagination.dart';
import 'package:wan_android/mvp/mvp_export.dart' show IMvpView, BasePresenter;

abstract class ListPresenter<V extends IMvpView> extends BasePresenter<V> {
  int curIndex;

  Future load(bool isClear) async {
    if (isClear) {
      curIndex = getStartPage();
      print("isClear:$isClear,curIndex:$curIndex");
      await loadPageData(curIndex);
    } else {
      curIndex++;
      print("isClear:$isClear,curIndex:${curIndex}");
      await loadPageData(curIndex);
    }
  }

  void onDataChanged(Pagination page) {
    print("onDataChanged:$page");
    if (curIndex == getStartPage()) {
      // refresh
      finishRefresh(page);
    } else {
      finishLoad(page);
    }

    if (page.datas.isEmpty) {
      //  已无更多数据
      if (curIndex != getStartPage()) {   //  上拉加载无更多数据时回退curIndex
        curIndex--;
      }
    }
  }

  Future loadPageData(int index);

  int getStartPage();

  void finishRefresh(Pagination page);

  void finishLoad(Pagination page);
}
