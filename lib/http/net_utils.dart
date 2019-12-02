import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'http_manager.dart';
import 'package:wan_android/bean/wan_response.dart';

Observable<WanResponse> get(String url, {Map<String, dynamic> params}) =>
    Observable.fromFuture(_get(url, params: params))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<WanResponse> _get(String url, {Map<String, dynamic> params}) async {
  var response = await HttpManager.getInstance()
      .getDio()
      .get(url, queryParameters: params);
  var res = WanResponse.fromJson(response.data);
  return res;
}

Observable<WanResponse> post(String url,
        {dynamic body, Map<String, dynamic> queryParameters}) =>
    Observable.fromFuture(
            _post(url, body: body, queryParameters: queryParameters))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<WanResponse> _post(String url,
    {dynamic body, Map<String, dynamic> queryParameters}) async {
  var response = await HttpManager.getInstance()
      .getDio()
      .post(url, queryParameters: queryParameters, data: body);
  var res = WanResponse.fromJson(response.data);
  return res;
}
