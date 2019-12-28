import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan_android/bean/empty_model.dart';
import 'package:wan_android/service/account_service.dart';

AccountRepository _repository = new AccountRepository();

AccountRepository get accountRepository => _repository;

class AccountRepository {
  final _remote = AccountService();
  static String KEY_USER_ACCOUNT = "key_user_account";
  static String KEY_USER_PASSWORD = "key_user_password";
  Future<Response> register(
      String username, String password, String rePassword) {
    return _remote.register(username, password, rePassword);
  }

  Future<Response> login(
      String username, String password) {
    return _remote.login(username, password).then((response) async {
      final res = EmptyModel.fromJson(response.data);
      if (res.errorCode == 0) {
        //  TODO: 登录成功需要保存用户基本信息
        final sp = await SharedPreferences.getInstance();
        sp.setString(KEY_USER_ACCOUNT, username);
        sp.setString(KEY_USER_PASSWORD, password);
      }
      return Future.value(response);
    });
//    return _remote.login(username, password);
  }
}
