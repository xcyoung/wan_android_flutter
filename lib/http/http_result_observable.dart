import 'dart:async';

import 'package:wan_android/bean/wan_response.dart';

class WanHttpResultObservable<T> {
  final Future<WanResponse<T>> _future;

  WanHttpResultObservable(Future<WanResponse<T>> future)
      : this._future = future;

  void watch(
      void onSuccess(WanResponse<T> event), void onFailed(code, message)) {
    _future.then((result) {
      try {
        if (result.errorCode == 0) {
          onSuccess(result);
        } else {
          onFailed(result.errorCode, result.errorMsg);
        }
      } catch (e) {
        print(e);
      }
    });
//    return _observable.listen((event) {
//      if (event.errorCode == 0) {
//        onSuccess(event);
//      } else {
//        onFailed(event.errorCode, event.errorMsg);
//      }
//    }, onError: (e, stacktrace) {
//      print(e);
//      print(stacktrace);
//      onFailed(-1, stacktrace.toString());
//    }, onDone: () {});
  }
}
