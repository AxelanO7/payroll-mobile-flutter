import 'package:json_annotation/json_annotation.dart';


part 'presence.g.dart';

@JsonSerializable()
class Presence {
      Presence();

  late String name;
  late String date;
  String? checkin;
  String? checkout;
  late String description;

  factory Presence.fromJson(Map<String,dynamic> json) => _$PresenceFromJson(json);
  Map<String, dynamic> toJson() => _$PresenceToJson(this);
}
