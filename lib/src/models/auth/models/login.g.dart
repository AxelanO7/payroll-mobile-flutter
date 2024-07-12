// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login()
  ..userId = json['user_id'] as String
  ..teacherId = json['teacher_id'] as String
  ..token = json['token'] as String
  ..role = json['role'] as String;

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'user_id': instance.userId,
      'teacher_id': instance.teacherId,
      'token': instance.token,
      'role': instance.role,
    };
