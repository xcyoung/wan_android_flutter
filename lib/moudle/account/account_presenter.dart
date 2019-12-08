import 'package:wan_android/http/http_result_observable.dart';
import 'package:wan_android/moudle/account/login/page/login_page.dart';
import 'package:wan_android/moudle/account/model/account_repository.dart';
import 'package:wan_android/mvp/mvp_export.dart';

class AccountPresenter extends BasePresenter<LoginPageState> {
  void login(String account, String password) {
    addSubscription(WanHttpResultObservable<Object>(
            accountRepository.login(account, password))
        .watch((result) {
          view.onLoginSuccess();
    }, (code, message) {

    }));
  }
}
