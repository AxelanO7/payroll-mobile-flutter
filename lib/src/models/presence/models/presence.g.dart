// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presence _$PresenceFromJson(Map<String, dynamic> json) => Presence()
  ..name = json['name'] as String
  ..date = json['date'] as String
  ..checkin = json['checkin'] as String?
  ..checkout = json['checkout'] as String?
  ..description = json['description'] as String;

Map<String, dynamic> _$PresenceToJson(Presence instance) => <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'checkin': instance.checkin,
      'checkout': instance.checkout,
      'description': instance.description,
    };
