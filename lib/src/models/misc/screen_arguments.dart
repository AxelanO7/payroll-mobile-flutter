import 'package:json_annotation/json_annotation.dart';


part 'screen_arguments.g.dart';

@JsonSerializable()
class ScreenArguments {
      ScreenArguments();

  String? id;
  String? title;
  String? description;
  String? name;
  @JsonKey() dynamic data;
  @JsonKey(name: 'additional_data') Map<String,dynamic>? additionalData;
  @JsonKey(name: 'student_profile') late dynamic studentProfile;
  bool? state;
  @JsonKey(name: 'task_id') int? taskId;
  @JsonKey(name: 'package_id') int? packageId;
  @JsonKey(name: 'item_id') int? itemId;
  String? program;
  @JsonKey(name: 'exam_group') String? examGroup;

  factory ScreenArguments.fromJson(Map<String,dynamic> json) => _$ScreenArgumentsFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenArgumentsToJson(this);
}
