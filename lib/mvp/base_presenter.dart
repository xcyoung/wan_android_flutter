import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'mvps.dart';

abstract class BasePresenter<V extends IMvpView> extends IMvpPresenter {
  V view;

  CompositeSubscription _compositeSubscription;

  BasePresenter() {
    _compositeSubscription = CompositeSubscription();
  }

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    _compositeSubscription.add(subscription);
  }

  @override
  void deactivate() {}

  @override
  void didChangeDependencies() {}

  @override
  void didUpdateWidget<W>(W oldWidget) {}

  @override
  void dispose() {
    _compositeSubscription.dispose();
  }

  @override
  void initState() {}
}
