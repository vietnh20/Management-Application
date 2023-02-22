// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      id: json['id'] as int,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      token: json['accessToken'] as String,
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'fullName': instance.fullName,
      'accessToken': instance.token,
    };
