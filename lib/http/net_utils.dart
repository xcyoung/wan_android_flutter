import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wan_android/bean/response_data.dart';

import 'http_manager.dart';

Future<ResultData> request(
  Method method,
  String url, {
  dynamic params,
  Map<String, dynamic> queryParams,
  Options options,
}) async {
  String m = _getRequestMethod(method);
  return await _request(m, url,
      data: params, queryParameters: queryParams, options: options);
}

Future<ResultData> _request(String method, String url,
    {dynamic data,
    Map<String, dynamic> queryParameters,
    Options options}) async {
  final response = await HttpManager.getInstance().getDio().request(url,
      queryParameters: queryParameters,
      data: data,
      options: _checkOptions(method, options));
  return response.data;
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
