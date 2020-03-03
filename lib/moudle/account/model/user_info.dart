import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';
@JsonSerializable()
class UserInfo {
  int id;
  List<int> collectIds;
  String email;
  String icon;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  UserInfo(this.id, this.collectIds, this.email, this.icon, this.nickname,
      this.password, this.publicName, this.token, this.type, this.username);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}
