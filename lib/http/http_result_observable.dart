import 'package:wan_android/bean/response_data.dart';

class WanHttpResultObservable {
  final ResultData _result;

  WanHttpResultObservable(ResultData result) : this._result = result;

  void watch(void onSuccess(ResultData event), void onFailed(code, message)) {
    if (this._result.code == 0) {
      onSuccess(this._result);
    } else {
      onFailed(this._result.code, this._result.message);
    }
  }
}
