// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WanResponse<T> _$WanResponseFromJson<T>(Map<String, dynamic> json) {
  return WanResponse<T>()
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..data = json['data'];
}

Map<String, dynamic> _$WanResponseToJson<T>(WanResponse<T> instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': instance.data,
    };
