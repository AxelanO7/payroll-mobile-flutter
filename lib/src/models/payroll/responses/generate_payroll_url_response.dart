import 'package:json_annotation/json_annotation.dart';
import '../models/pdf_url.dart';

part 'generate_payroll_url_response.g.dart';

@JsonSerializable()
class GeneratePayrollUrlResponse {
      GeneratePayrollUrlResponse();

  late int code;
  late String status;
  late PdfUrl data;
  String? message;

  factory GeneratePayrollUrlResponse.fromJson(Map<String,dynamic> json) => _$GeneratePayrollUrlResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GeneratePayrollUrlResponseToJson(this);
}
