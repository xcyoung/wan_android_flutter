import 'package:rxdart/rxdart.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/service/account_service.dart';

class AccountRepository {
  final _remote = AccountService();

  Observable<WanResponse<String>> register(
      String username, String password, String rePassword) {
    return _remote.register(username, password, rePassword);
  }
}
