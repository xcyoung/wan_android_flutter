import 'package:json_annotation/json_annotation.dart';

part 'wan_response.g.dart';

@JsonSerializable()
class WanResponse<T> extends Object {
  @JsonKey(name: 'errorCode')
  int errorCode;
  @JsonKey(name: 'errorMsg')
  String errorMsg;
  @JsonKey(name: 'data')
  T data;

  WanResponse();

  factory WanResponse.fromJson(Map<String, dynamic> srcJson) =>
      _$WanResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WanResponseToJson(this);
}
