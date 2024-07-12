import 'package:json_annotation/json_annotation.dart';
import '../models/presence.dart';

part 'get_presence.g.dart';

@JsonSerializable()
class GetPresence {
      GetPresence();

  late int status;
  late Presence data;
  List<dynamic>? messages;

  factory GetPresence.fromJson(Map<String,dynamic> json) => _$GetPresenceFromJson(json);
  Map<String, dynamic> toJson() => _$GetPresenceToJson(this);
}
