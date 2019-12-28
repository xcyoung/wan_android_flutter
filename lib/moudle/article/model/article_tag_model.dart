import 'package:json_annotation/json_annotation.dart';

part 'article_tag_model.g.dart';

@JsonSerializable()
class Tag {
  String name;
  String url;

  Tag({this.name, this.url});

  factory Tag.fromJson(Map<String, dynamic> json) =>
      _$TagFromJson(json);

  Map<String, dynamic> toJson() {
    return _$TagToJson(this);
  }
}