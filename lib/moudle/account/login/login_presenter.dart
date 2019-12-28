import 'package:wan_android/bean/empty_model.dart';
import 'package:wan_android/http/http_result_observable.dart';
import 'package:wan_android/moudle/account/model/account_repository.dart';
import 'package:wan_android/mvp/mvp_export.dart';

import 'login_page.dart';

class LoginPresenter extends BasePresenter<LoginPageState> {
  void login(String account, String password) {
    accountRepository.login(account, password).then((response) {
      var res = EmptyModel.fromJson(response.data);
      WanHttpResultObservable<EmptyModel>(res).watch((result) {
        view.onLoginSuccess();
      }, (code, message) {
        view.onError(code, message);
      });
    });
  }

  void reg(String account, String password, String rePassword) {
    accountRepository.register(account, password, rePassword).then((response) {
      var res = EmptyModel.fromJson(response.data);
      WanHttpResultObservable<EmptyModel>(res).watch((result) {
        view.onLoginSuccess();
      }, (code, message) {
        view.onError(code, message);
      });
    });
  }
}
