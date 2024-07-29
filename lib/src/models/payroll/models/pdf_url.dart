import 'package:json_annotation/json_annotation.dart';


part 'pdf_url.g.dart';

@JsonSerializable()
class PdfUrl {
      PdfUrl();

  late String url;

  factory PdfUrl.fromJson(Map<String,dynamic> json) => _$PdfUrlFromJson(json);
  Map<String, dynamic> toJson() => _$PdfUrlToJson(this);
}
