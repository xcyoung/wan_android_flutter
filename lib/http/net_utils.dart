import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wan_android/bean/wan_response.dart';

import 'http_manager.dart';

Observable<WanResponse<T>> get<T>(String url, {Map<String, dynamic> params}) =>
    Observable<WanResponse<T>>.fromFuture(_get<T>(url, params: params))
        .delay(Duration(milliseconds: 500))
        .asBroadcastStream();

Future<WanResponse<T>> _get<T>(String url,
    {Map<String, dynamic> params}) async {
  var response = await HttpManager.getInstance()
      .getDio()
      .get(url, queryParameters: params);
  var res = WanResponse<T>.fromJson(response.data);
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
  var res = WanResponse<T>.fromJson(response.data);
  return res;
}

Observable<WanResponse<T>> request<T>(Method method, String url,
    {dynamic params,
    Map<String, dynamic> queryParams,
    Options options,
    bool isList: false}) {
  String m = _getRequestMethod(method);
  return Observable.fromFuture(_request<T>(m, url,
          data: params, queryParameters: queryParams, options: options))
      .delay(Duration(milliseconds: 500))
      .asBroadcastStream();
}

Future<WanResponse<T>> _request<T>(String method, String url,
    {dynamic data,
    Map<String, dynamic> queryParameters,
    Options options}) async {
  final response = await HttpManager.getInstance().getDio().request(url,
      queryParameters: queryParameters,
      data: data,
      options: _checkOptions(method, options));
  try {
    Map<String, dynamic> _map = response.data;
    return WanResponse<T>.fromJson(_map);
  } catch (e) {
    print(e);
    return WanResponse(data: null, errorCode: -1, errorMsg: '数据解析异常');
  }
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data);
}

Options _checkOptions(String method, Options options) {
  if (options == null) {
    options = Options();
  }
  options.method = method;
  return options;
}

String _getRequestMethod(Method method) {
  var m;
  switch (method) {
    case Method.get:
      m = 'GET';
      break;
    case Method.post:
      m = 'POST';
      break;
    case Method.put:
      m = 'PUT';
      break;
    case Method.patch:
      m = 'PATCH';
      break;
    case Method.delete:
      m = 'DELETE';
      break;
    case Method.head:
      m = 'HEAD';
      break;
  }
  return m;
}

enum Method { get, post, put, patch, delete, head }
