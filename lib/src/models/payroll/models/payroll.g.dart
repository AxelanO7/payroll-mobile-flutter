// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payroll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payroll _$PayrollFromJson(Map<String, dynamic> json) => Payroll()
  ..id = (json['id'] as num).toInt()
  ..salaryAmount = (json['salary_amount'] as num).toInt()
  ..teacherId = json['teacher_id'] as String
  ..honor = (json['honor'] as num).toInt()
  ..kehadiran = (json['kehadiran'] as num).toInt()
  ..waliAllowance = (json['wali_allowance'] as num).toInt()
  ..fungsi = (json['fungsi'] as num).toInt()
  ..wakasekAllowance = (json['wakasek_allowance'] as num).toInt()
  ..suamiIstriAllowance = (json['suami_istri_allowance'] as num).toInt()
  ..anakAllowance = (json['anak_allowance'] as num).toInt()
  ..piketAllowance = (json['piket_allowance'] as num).toInt()
  ..komAllowance = (json['kom_allowance'] as num).toInt()
  ..otherAllowance = (json['other_allowance'] as num).toInt()
  ..deductions = (json['deductions'] as num).toInt()
  ..netSalary = (json['net_salary'] as num).toInt()
  ..accountNumber = json['account_number'] as String
  ..paymentMethod = json['payment_method'] as String
  ..salaryCreated = json['salary_created'] as String
  ..description = json['description']
  ..createdAt = json['created_at'] as String
  ..updatedAt = json['updated_at'] as String
  ..deletedAt = json['deleted_at'];

Map<String, dynamic> _$PayrollToJson(Payroll instance) => <String, dynamic>{
      'id': instance.id,
      'salary_amount': instance.salaryAmount,
      'teacher_id': instance.teacherId,
      'honor': instance.honor,
      'kehadiran': instance.kehadiran,
      'wali_allowance': instance.waliAllowance,
      'fungsi': instance.fungsi,
      'wakasek_allowance': instance.wakasekAllowance,
      'suami_istri_allowance': instance.suamiIstriAllowance,
      'anak_allowance': instance.anakAllowance,
      'piket_allowance': instance.piketAllowance,
      'kom_allowance': instance.komAllowance,
      'other_allowance': instance.otherAllowance,
      'deductions': instance.deductions,
      'net_salary': instance.netSalary,
      'account_number': instance.accountNumber,
      'payment_method': instance.paymentMethod,
      'salary_created': instance.salaryCreated,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
