import 'package:json_annotation/json_annotation.dart';
import '../models/presence.dart';

part 'get_presences_response.g.dart';

@JsonSerializable()
class GetPresencesResponse {
      GetPresencesResponse();

  late String code;
  late String status;
  late List<Presence?> data;
  String? message;

  factory GetPresencesResponse.fromJson(Map<String,dynamic> json) => _$GetPresencesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPresencesResponseToJson(this);
}
