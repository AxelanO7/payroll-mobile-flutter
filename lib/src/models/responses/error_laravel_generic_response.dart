import 'package:json_annotation/json_annotation.dart';
import '../misc/error_generic_data.dart';

part 'error_laravel_generic_response.g.dart';

@JsonSerializable()
class ErrorLaravelGenericResponse {
      ErrorLaravelGenericResponse();

  late int status;
  late ErrorGenericData data;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory ErrorLaravelGenericResponse.fromJson(Map<String,dynamic> json) => _$ErrorLaravelGenericResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorLaravelGenericResponseToJson(this);
}
