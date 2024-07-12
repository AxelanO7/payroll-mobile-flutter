import 'package:json_annotation/json_annotation.dart';


part 'general_response.g.dart';

@JsonSerializable()
class GeneralResponse {
      GeneralResponse();

  late String status;
  late int code;
  late dynamic data;
  late String message;

  factory GeneralResponse.fromJson(Map<String,dynamic> json) => _$GeneralResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralResponseToJson(this);
}
