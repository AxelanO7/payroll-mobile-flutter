// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presences_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresencesResponse _$GetPresencesResponseFromJson(
        Map<String, dynamic> json) =>
    GetPresencesResponse()
      ..code = json['code'] as String
      ..status = json['status'] as String
      ..data = (json['data'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Presence.fromJson(e as Map<String, dynamic>))
          .toList()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetPresencesResponseToJson(
        GetPresencesResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
