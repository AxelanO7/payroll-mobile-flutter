import 'package:json_annotation/json_annotation.dart';


part 'profile.g.dart';

@JsonSerializable()
class Profile {
      Profile();

  late String uuid;
  late int id;
  late String fullname;
  late String position;
  late String photos;
  late String email;
  late String address;
  @JsonKey(name: 'joined_at') late String joinedAt;
  @JsonKey(name: 'last_education') late String lastEducation;
  late String religion;
  late String type;
  @JsonKey(name: 'place_of_birth') late String placeOfBirth;
  @JsonKey(name: 'date_of_birth') late String dateOfBirth;
  late String gender;
  @JsonKey(name: 'account_status') late String accountStatus;

  factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
