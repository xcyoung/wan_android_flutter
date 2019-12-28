import 'package:dio/dio.dart';
import 'package:wan_android/http/net_utils.dart';

class AccountService {
  Future<Response> register(
      String username, String password, String rePassword) {
    final url = 'user/register';
    final body = new FormData.fromMap(
        {"username": username, "password": password, "repassword": rePassword});
    final response = request(Method.post, url, params: body);
    return response;
  }

  Future<Response> login(String username, String password) {
    final url = 'user/login';
    final body =
        new FormData.fromMap({"username": username, "password": password});
    final response = request(Method.post, url, params: body);
    return response;
  }
}
