import 'package:wan_android/entity_factory.dart';

class Pagination<T> {
  bool over;
  int pageCount;
  int total;
  int curPage;
  int offset;
  int size;
  List<T> datas;

  Pagination(
      {this.over,
      this.pageCount,
      this.total,
      this.curPage,
      this.offset,
      this.size,
      this.datas});

  Pagination.fromJson(Map<String, dynamic> json) {
    over = json['over'];
    pageCount = json['pageCount'];
    total = json['total'];
    curPage = json['curPage'];
    offset = json['offset'];
    size = json['size'];
    if (json['datas'] != null) {
      datas = new List<T>();
      if (json['datas'] is List) {
        (json['datas'] as List).forEach((item) {
          datas.add(EntityFactory.generateOBJ<T>(item));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['over'] = this.over;
    data['pageCount'] = this.pageCount;
    data['total'] = this.total;
    data['curPage'] = this.curPage;
    data['offset'] = this.offset;
    data['size'] = this.size;
    if (this.datas != null) {
      data['datas'] = this.datas;
    }
    return data;
  }
}
