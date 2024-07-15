import 'package:json_annotation/json_annotation.dart';
import '../models/url_upload.dart';

part 'upload_file_presence_response.g.dart';

@JsonSerializable()
class UploadFilePresenceResponse {
      UploadFilePresenceResponse();

  late int code;
  late String status;
  late UrlUpload data;
  String? message;

  factory UploadFilePresenceResponse.fromJson(Map<String,dynamic> json) => _$UploadFilePresenceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UploadFilePresenceResponseToJson(this);
}
