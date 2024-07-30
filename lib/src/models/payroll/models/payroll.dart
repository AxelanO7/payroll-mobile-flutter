import 'package:json_annotation/json_annotation.dart';


part 'payroll.g.dart';

@JsonSerializable()
class Payroll {
      Payroll();

  late int id;
  @JsonKey(name: 'salary_amount') late int salaryAmount;
  @JsonKey(name: 'teacher_id') late String teacherId;
  late int honor;
  late int kehadiran;
  @JsonKey(name: 'wali_allowance') late int waliAllowance;
  late int fungsi;
  @JsonKey(name: 'wakasek_allowance') late int wakasekAllowance;
  @JsonKey(name: 'suami_istri_allowance') late int suamiIstriAllowance;
  @JsonKey(name: 'anak_allowance') late int anakAllowance;
  @JsonKey(name: 'piket_allowance') late int piketAllowance;
  @JsonKey(name: 'kom_allowance') late int komAllowance;
  @JsonKey(name: 'other_allowance') late int otherAllowance;
  late int deductions;
  @JsonKey(name: 'net_salary') late int netSalary;
  @JsonKey(name: 'account_number') late String accountNumber;
  @JsonKey(name: 'payment_method') late String paymentMethod;
  @JsonKey(name: 'salary_created') late String salaryCreated;
  late dynamic description;
  @JsonKey(name: 'created_at') late String createdAt;
  @JsonKey(name: 'updated_at') late String updatedAt;
  @JsonKey(name: 'deleted_at') late dynamic deletedAt;

  factory Payroll.fromJson(Map<String,dynamic> json) => _$PayrollFromJson(json);
  Map<String, dynamic> toJson() => _$PayrollToJson(this);
}
