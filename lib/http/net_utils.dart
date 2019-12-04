import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'http_manager.dart';
import 'package:wan_android/bean/wan_response.dart';

Observable<WanResponse<T>> get<T>(String url, {Map<String, dynamic> params}) =>
    Observable<WanResponse<T>>.fromFuture(_get<T>(url, params: params))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<WanResponse<T>> _get<T>(String url,
    {Map<String, dynamic> params}) async {
  var response = await HttpManager.getInstance()
      .getDio()
      .get(url, queryParameters: params);
  var res = WanResponse.fromJson(response.data);
  return res;
}

Observable<WanResponse<T>> post<T>(String url,
        {dynamic body, Map<String, dynamic> queryParameters}) =>
    Observable<WanResponse<T>>.fromFuture(
            _post<T>(url, body: body, queryParameters: queryParameters))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<WanResponse<T>> _post<T>(String url,
    {dynamic body, Map<String, dynamic> queryParameters}) async {
  var response = await HttpManager.getInstance()
      .getDio()
      .post(url, queryParameters: queryParameters, data: body);
  var res = WanResponse.fromJson(response.data);
  return res;
}
