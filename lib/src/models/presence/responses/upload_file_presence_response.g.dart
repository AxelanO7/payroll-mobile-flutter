// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_presence_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFilePresenceResponse _$UploadFilePresenceResponseFromJson(
        Map<String, dynamic> json) =>
    UploadFilePresenceResponse()
      ..code = (json['code'] as num).toInt()
      ..status = json['status'] as String
      ..data = UrlUpload.fromJson(json['data'] as Map<String, dynamic>)
      ..message = json['message'] as String?;

Map<String, dynamic> _$UploadFilePresenceResponseToJson(
        UploadFilePresenceResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
