// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresence _$GetPresenceFromJson(Map<String, dynamic> json) => GetPresence()
  ..status = (json['status'] as num).toInt()
  ..data = Presence.fromJson(json['data'] as Map<String, dynamic>)
  ..messages = json['messages'] as List<dynamic>?;

Map<String, dynamic> _$GetPresenceToJson(GetPresence instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'messages': instance.messages,
    };
