import 'package:json_annotation/json_annotation.dart';

import 'wan_response.dart';

part 'empty_model.g.dart';

@JsonSerializable()
class EmptyModel extends WanResponse<dynamic> {
  EmptyModel() : super();

  factory EmptyModel.fromJson(Map<String, dynamic> json) =>
      _$EmptyModelFromJson(json);

  toJson() => _$EmptyModelToJson(this);
}