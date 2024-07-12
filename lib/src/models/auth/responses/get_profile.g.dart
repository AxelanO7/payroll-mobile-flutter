// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfile _$GetProfileFromJson(Map<String, dynamic> json) => GetProfile()
  ..status = json['status'] as String
  ..code = (json['code'] as num).toInt()
  ..message = json['message'] as String
  ..data = Profile.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProfileToJson(GetProfile instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
