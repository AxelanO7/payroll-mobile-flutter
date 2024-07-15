import 'package:json_annotation/json_annotation.dart';
import '../models/presence.dart';

part 'get_presences.g.dart';

@JsonSerializable()
class GetPresences {
      GetPresences();

  late int code;
  late String status;
  late List<Presence?> data;
  List<dynamic>? message;

  factory GetPresences.fromJson(Map<String,dynamic> json) => _$GetPresencesFromJson(json);
  Map<String, dynamic> toJson() => _$GetPresencesToJson(this);
}
