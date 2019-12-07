import 'package:flutter/material.dart';

import 'base_presenter.dart';
import 'mvps.dart';

abstract class BaseState<W extends StatefulWidget, P extends BasePresenter>
    extends State<W> implements IMvpView {
  P presenter;

  BaseState() {
    presenter = createPresenter();
    presenter.view = this;
  }

  P createPresenter();

  @override
  Widget build(BuildContext context) {
    return null;
  }

  @override
  void initState() {
    super.initState();
    presenter?.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    presenter?.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
    presenter?.deactivate();
  }

  @override
  void didUpdateWidget(W oldWidget) {
    super.didUpdateWidget(oldWidget);
    presenter?.didUpdateWidget<W>(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    presenter?.dispose();
  }

  @override
  BuildContext getContext() {
    return context;
  }
}
