import 'package:wan_android/bean/wan_response.dart';

class WanHttpResultObservable<T extends WanResponse> {
  final T _result;

  WanHttpResultObservable(T result) : this._result = result;

  void watch(void onSuccess(T event), void onFailed(code, message)) {
    if (this._result.errorCode == 0) {
      onSuccess(this._result);
    } else {
      onFailed(this._result.errorCode, this._result.errorMsg);
    }
  }
}
