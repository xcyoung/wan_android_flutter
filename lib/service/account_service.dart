import 'package:wan_android/bean/wan_response.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wan_android/http/net_utils.dart';

class AccountService {
  Observable<WanResponse<String>> register(
      String username, String password, String rePassword) {
    final url = 'user/register';
    final body = {
      'username': username,
      'password': password,
      'repassword': rePassword
    };
    final response = post(url, body: body);
    return response;
  }
}
