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

  factory ScreenArguments.fromJson(Map<String,dynamic> json) => _$ScreenArgumentsFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenArgumentsToJson(this);
}
