import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

class CookieInterceptor extends Interceptor {
  CookieJar _cookieJar;

  CookieInterceptor(this._cookieJar);

  @override
  Future onRequest(RequestOptions options) async {
    final cookies = _cookieJar.loadForRequest(options.uri);
    cookies.removeWhere((cookie) {
      if (cookie.expires != null) {
        return cookie.expires.isBefore(DateTime.now());
      }
      return false;
    });
    String cookie = getCookies(cookies);
    if (cookie.isNotEmpty) options.headers[HttpHeaders.cookieHeader] = cookie;
    return options;
  }

  @override
  Future onResponse(Response response) async {
    _saveCookies(response);
    print("CookieInterceptor：onResponse");
    return response;
  }

  @override
  Future onError(DioError err) async {
    _saveCookies(err.response);
    return err;
  }

  _saveCookies(Response response) {
    if (response != null && response.headers != null) {
      String uri = response.request.uri.toString();
      List<String> cookies = response.headers[HttpHeaders.setCookieHeader];
      if (cookies != null && uri.contains('user/login')) {
        _cookieJar.saveFromResponse(response.request.uri,
            cookies.map((str) => Cookie.fromSetCookieValue(str)).toList());
      }
    }
  }

  static String getCookies(List<Cookie> cookies) {
    return cookies.map((cookie) => "${cookie.name}=${cookie.value}").join(';');
  }
}
