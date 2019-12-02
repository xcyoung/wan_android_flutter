import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class BaseViewModel extends ChangeNotifier {
  CompositeSubscription _compositeSubscription = CompositeSubscription();

  /// add [StreamSubscription] to [compositeSubscription]
  ///
  /// 在 [dispose]的时候能进行取消
  addSubscription(StreamSubscription subscription) {
    _compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }
}
