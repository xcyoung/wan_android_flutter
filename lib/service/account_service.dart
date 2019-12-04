import 'package:dio/dio.dart';
import 'package:wan_android/bean/wan_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wan_android/http/net_utils.dart';

class AccountService {
  Observable<WanResponse<Object>> register(
      String username, String password, String rePassword) {
    final url = 'user/register';
    final body = new FormData.fromMap(
        {"username": username, "password": password, "repassword": rePassword});
    final response = post<Object>(url, body: body);
    return response;
  }

  Observable<WanResponse<Object>> login(
      String username, String password) {
    final url = 'user/login';
    final body = new FormData.fromMap(
        {"username": username, "password": password});
    final response = post<Object>(url, body: body);
    return response;
  }
}
