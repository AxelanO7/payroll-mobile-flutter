import 'package:json_annotation/json_annotation.dart';


part 'login.g.dart';

@JsonSerializable()
class Login {
      Login();

  @JsonKey(name: 'user_id') late String userId;
  @JsonKey(name: 'teacher_id') late String teacherId;
  late String token;
  late String role;

  factory Login.fromJson(Map<String,dynamic> json) => _$LoginFromJson(json);
  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
