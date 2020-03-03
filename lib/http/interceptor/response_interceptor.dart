import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wan_android/bean/response_data.dart';

class ResponseInterceptors extends Interceptor {
  @override
  onResponse(Response response) async {
    RequestOptions option = response.request;
    try {
      if (response.statusCode >= HttpStatus.ok && response.statusCode < 300) {
        var header = response.headers[Headers.contentTypeHeader];
        Map<String, dynamic> responseMap = response.data;
        int errorCode = responseMap['errorCode'];
        String errorMsg = responseMap['errorMsg'];
        var data = responseMap['data'];
        return ResultData(data, errorCode, errorMsg, headers: header);
      } else {
        return ResultData(null, -1, '');
      }
    } catch (e) {
      print(e.toString() + option.path);
      return ResultData(response.data, -100, '', headers: response.headers);
    }
  }
}
