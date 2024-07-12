import 'package:json_annotation/json_annotation.dart';
import '../models/profile.dart';

part 'get_profile.g.dart';

@JsonSerializable()
class GetProfile {
      GetProfile();

  late String status;
  late int code;
  late String message;
  late Profile data;

  factory GetProfile.fromJson(Map<String,dynamic> json) => _$GetProfileFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfileToJson(this);
}
