// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_payroll_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePayrollUrlResponse _$GeneratePayrollUrlResponseFromJson(
        Map<String, dynamic> json) =>
    GeneratePayrollUrlResponse()
      ..code = (json['code'] as num).toInt()
      ..status = json['status'] as String
      ..data = PdfUrl.fromJson(json['data'] as Map<String, dynamic>)
      ..message = json['message'] as String?;

Map<String, dynamic> _$GeneratePayrollUrlResponseToJson(
        GeneratePayrollUrlResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
