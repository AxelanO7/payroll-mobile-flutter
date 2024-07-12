import 'package:json_annotation/json_annotation.dart';
import '../models/login.dart';

part 'get_login.g.dart';

@JsonSerializable()
class GetLogin {
      GetLogin();

  late String status;
  late int code;
  late String message;
  late Login data;

  factory GetLogin.fromJson(Map<String,dynamic> json) => _$GetLoginFromJson(json);
  Map<String, dynamic> toJson() => _$GetLoginToJson(this);
}
