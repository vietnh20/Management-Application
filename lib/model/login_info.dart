import 'package:json_annotation/json_annotation.dart';

part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  int id;
  String username;
  String fullName;
  @JsonKey(name: 'accessToken')
  String token;
  LoginInfo(
      {required this.id,
      required this.username,
      required this.fullName,
      required this.token});

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}
