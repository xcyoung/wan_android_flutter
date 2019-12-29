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

  @override
  String toString() {
    return 'Pagination{over: $over, pageCount: $pageCount, total: $total, curPage: $curPage, offset: $offset, size: $size}';
  }


}
