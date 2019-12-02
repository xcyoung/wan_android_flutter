import 'package:wan_android/base/base_view_model.dart';
import 'package:wan_android/model/account_repository.dart';

class LoginViewModel extends BaseViewModel {
  final _repository = AccountRepository();

  void register() {
//    addSubscription(_repository.register('', '', ''));
  }
}
