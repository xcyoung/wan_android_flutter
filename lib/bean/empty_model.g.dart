// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyModel _$EmptyModelFromJson(Map<String, dynamic> json) {
  return EmptyModel()
    ..data = json['data']
    ..errorCode = json['errorCode'] as int
    ..errorMsg = json['errorMsg'] as String
    ..listData = json['listData'] as List;
}

Map<String, dynamic> _$EmptyModelToJson(EmptyModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'listData': instance.listData,
    };
