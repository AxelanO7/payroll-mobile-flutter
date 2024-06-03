// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screen_arguments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScreenArguments _$ScreenArgumentsFromJson(Map<String, dynamic> json) =>
    ScreenArguments()
      ..id = json['id'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..name = json['name'] as String?
      ..data = json['data']
      ..additionalData = json['additional_data'] as Map<String, dynamic>?;

Map<String, dynamic> _$ScreenArgumentsToJson(ScreenArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'name': instance.name,
      'data': instance.data,
      'additional_data': instance.additionalData,
    };
