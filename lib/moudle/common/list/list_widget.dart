import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class ListPage extends StatefulWidget {
  final void Function(bool isClear) loadPageData;
  final List<Widget> children;
  final bool enableRefresh;
  final bool enableLoad;
  final ListWidgetController controller;

  const ListPage(
      {Key key,
      @required this.loadPageData,
      @required this.controller,
      @required this.children,
      this.enableRefresh = true,
      this.enableLoad = true})
      : assert(children != null),
        assert(loadPageData != null),
        assert(controller != null),
        super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.controller != null) {
      widget.controller._bindListPageState(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      controller: _controller,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      header: widget.enableRefresh ? ClassicalHeader() : null,
      footer: widget.enableLoad ? ClassicalFooter() : null,
      onRefresh: widget.enableRefresh
          ? () async {
              await () {
                widget.loadPageData(true);
              };
            }
          : null,
      onLoad: widget.enableLoad
          ? () async {
              await () {
                widget.loadPageData(false);
              };
            }
          : null,
      slivers: widget.children,
    );
  }
}

class ListWidgetController {
  _ListPageState _listPageState;

  void _bindListPageState(_ListPageState state) {
    this._listPageState = state;
  }

  void finishRefresh() {
    _listPageState._controller.resetRefreshState();
  }

  void finishLoad() {
    _listPageState._controller.resetLoadState();
  }

  void dispose() {
    _listPageState = null;
  }
}
