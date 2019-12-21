import 'package:wan_android/http/http_result_observable.dart';
import 'register_page.dart';
import 'package:wan_android/moudle/account/model/account_repository.dart';
import 'package:wan_android/mvp/mvp_export.dart';

class RegisterPresenter extends BasePresenter<RegisterPageState> {
  void login(String account, String password) {
    addSubscription(WanHttpResultObservable<Object>(
            accountRepository.login(account, password))
        .watch((result) {
      view.onRegSuccess();
    }, (code, message) {}));
  }
}
