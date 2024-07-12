import 'package:json_annotation/json_annotation.dart';
import '../misc/error_data.dart';

part 'error_laravel_response.g.dart';

@JsonSerializable()
class ErrorLaravelResponse {
      ErrorLaravelResponse();

  late int status;
  late ErrorData data;
  late List<dynamic> meta;
  late List<dynamic> messages;

  factory ErrorLaravelResponse.fromJson(Map<String,dynamic> json) => _$ErrorLaravelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorLaravelResponseToJson(this);
}
