import 'package:flutter/material.dart';
import 'package:wan_android/mvp/i_lifecycle.dart';

abstract class IMvpView {
  BuildContext getContext();
}

abstract class IMvpPresenter extends ILifecycle {}