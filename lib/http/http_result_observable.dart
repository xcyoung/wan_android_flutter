import 'dart:async';
import 'package:wan_android/bean/wan_response.dart';


class WanHttpResultObservable<T> extends StreamSubscription<WanResponse<T>> {
  @override
  Future<E> asFuture<E>([E futureValue]) {
    return null;
  }

  @override
  Future cancel() {
    return null;
  }

  @override
  bool get isPaused => null;

  @override
  void onData(void Function(WanResponse<T> data) handleData) {

  }

  @override
  void onDone(void Function() handleDone) {

  }

  @override
  void onError(Function handleError) {

  }

  @override
  void pause([Future resumeSignal]) {

  }

  @override
  void resume() {

  }

}