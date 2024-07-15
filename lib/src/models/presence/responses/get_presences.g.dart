// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresences _$GetPresencesFromJson(Map<String, dynamic> json) => GetPresences()
  ..code = (json['code'] as num).toInt()
  ..status = json['status'] as String
  ..data = (json['data'] as List<dynamic>)
      .map((e) =>
          e == null ? null : Presence.fromJson(e as Map<String, dynamic>))
      .toList()
  ..message = json['message'] as List<dynamic>?;

Map<String, dynamic> _$GetPresencesToJson(GetPresences instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
