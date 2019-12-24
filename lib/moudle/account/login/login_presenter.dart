import 'package:wan_android/http/http_result_observable.dart';
import 'package:wan_android/moudle/account/model/account_repository.dart';
import 'package:wan_android/mvp/mvp_export.dart';

import 'login_page.dart';

class LoginPresenter extends BasePresenter<LoginPageState> {
  void login(String account, String password) {
    addSubscription(WanHttpResultObservable<Object>(
            accountRepository.login(account, password))
        .watch((result) {
      view.onLoginSuccess();
    }, (code, message) {
      view.onError(code, message);
    }));
  }

  void reg(String account, String password, String rePassword) {
    addSubscription(WanHttpResultObservable<Object>(
            accountRepository.register(account, password, rePassword))
        .watch((result) {
      view.onRegSuccess();
    }, (code, message) {
      view.onError(code, message);
    }));
  }
}
