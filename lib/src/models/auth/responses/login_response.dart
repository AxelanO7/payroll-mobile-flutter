import 'package:json_annotation/json_annotation.dart';
import '../models/login.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
      LoginResponse();

  late String status;
  late int code;
  late String message;
  late Login data;

  factory LoginResponse.fromJson(Map<String,dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
