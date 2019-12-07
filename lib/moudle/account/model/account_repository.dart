import 'package:rxdart/rxdart.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:wan_android/service/account_service.dart';

AccountRepository _repository = new AccountRepository();

AccountRepository get accountRepository => _repository;

class AccountRepository {
  final _remote = AccountService();

  Observable<WanResponse<Object>> register(
      String username, String password, String rePassword) {
    return _remote.register(username, password, rePassword);
  }

  Observable<WanResponse<Object>> login(
      String username, String password) {
    return _remote.login(username, password);
  }
}
