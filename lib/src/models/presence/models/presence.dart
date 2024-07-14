import 'package:json_annotation/json_annotation.dart';


part 'presence.g.dart';

@JsonSerializable()
class Presence {
      Presence();

  late int id;
  @JsonKey(name: 'teacher_id') late String teacherId;
  @JsonKey(name: 'approved_by') late String approvedBy;
  late String uuid;
  @JsonKey(name: 'clock_in') late String clockIn;
  @JsonKey(name: 'clock_out') late String clockOut;
  @JsonKey(name: 'ip_address') late dynamic ipAddress;
  late String device;
  @JsonKey(name: 'latitude_in') late String latitudeIn;
  @JsonKey(name: 'longitude_in') late String longitudeIn;
  @JsonKey(name: 'latitude_out') late String latitudeOut;
  @JsonKey(name: 'longitude_out') late String longitudeOut;
  @JsonKey(name: 'distance_in') late int distanceIn;
  @JsonKey(name: 'distance_out') late int distanceOut;
  @JsonKey(name: 'photo_in') late String photoIn;
  @JsonKey(name: 'photo_out') late String photoOut;
  @JsonKey(name: 'presence_date') late String presenceDate;
  late String status;
  @JsonKey(name: 'created_at') late String createdAt;
  @JsonKey(name: 'updated_at') late String updatedAt;

  factory Presence.fromJson(Map<String,dynamic> json) => _$PresenceFromJson(json);
  Map<String, dynamic> toJson() => _$PresenceToJson(this);
}
