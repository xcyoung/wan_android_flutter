import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:wan_android/bean/wan_response.dart';

class WanHttpResultObservable<T> {
  final Observable<WanResponse<T>> _observable;

  WanHttpResultObservable(Observable<WanResponse<T>> observable)
      : this._observable = observable;

  StreamSubscription<WanResponse<T>> watch(
      void onSuccess(WanResponse<T> event), void onFailed(code, message)) {
    _observable.doOnError(() {});
    return _observable.listen((event) {
      if (event.errorCode == 0) {
        onSuccess(event);
      } else {
        onFailed(event.errorCode, event.errorMsg);
      }
    }, onError: (e, stacktrace) {
      print(e);
      print(stacktrace);
      onFailed(-1, stacktrace.toString());
    }, onDone: () {});
  }
}
