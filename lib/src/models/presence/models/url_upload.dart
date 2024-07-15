import 'package:json_annotation/json_annotation.dart';


part 'url_upload.g.dart';

@JsonSerializable()
class UrlUpload {
      UrlUpload();

  late String url;

  factory UrlUpload.fromJson(Map<String,dynamic> json) => _$UrlUploadFromJson(json);
  Map<String, dynamic> toJson() => _$UrlUploadToJson(this);
}
