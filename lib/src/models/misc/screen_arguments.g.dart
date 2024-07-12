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
      ..additionalData = json['additional_data'] as Map<String, dynamic>?
      ..studentProfile = json['student_profile']
      ..state = json['state'] as bool?
      ..taskId = (json['task_id'] as num?)?.toInt()
      ..packageId = (json['package_id'] as num?)?.toInt()
      ..itemId = (json['item_id'] as num?)?.toInt()
      ..program = json['program'] as String?
      ..examGroup = json['exam_group'] as String?;

Map<String, dynamic> _$ScreenArgumentsToJson(ScreenArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'name': instance.name,
      'data': instance.data,
      'additional_data': instance.additionalData,
      'student_profile': instance.studentProfile,
      'state': instance.state,
      'task_id': instance.taskId,
      'package_id': instance.packageId,
      'item_id': instance.itemId,
      'program': instance.program,
      'exam_group': instance.examGroup,
    };
