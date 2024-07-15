// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payroll_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPayrollResponse _$GetPayrollResponseFromJson(Map<String, dynamic> json) =>
    GetPayrollResponse()
      ..code = (json['code'] as num).toInt()
      ..status = json['status'] as String
      ..data = (json['data'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Payroll.fromJson(e as Map<String, dynamic>))
          .toList()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetPayrollResponseToJson(GetPayrollResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
