import 'package:dio/dio.dart';
import 'package:wan_android/service/account_service.dart';

AccountRepository _repository = new AccountRepository();

AccountRepository get accountRepository => _repository;

class AccountRepository {
  final _remote = AccountService();

  Future<Response> register(
      String username, String password, String rePassword) {
    return _remote.register(username, password, rePassword);
  }

  Future<Response> login(
      String username, String password) {
    return _remote.login(username, password);
  }
}
