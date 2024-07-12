// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLogin _$GetLoginFromJson(Map<String, dynamic> json) => GetLogin()
  ..status = json['status'] as String
  ..code = (json['code'] as num).toInt()
  ..message = json['message'] as String
  ..data = Login.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$GetLoginToJson(GetLogin instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
