import 'package:json_annotation/json_annotation.dart';
import '../models/payroll.dart';

part 'get_payroll_response.g.dart';

@JsonSerializable()
class GetPayrollResponse {
      GetPayrollResponse();

  late int code;
  late String status;
  late List<Payroll?> data;
  String? message;

  factory GetPayrollResponse.fromJson(Map<String,dynamic> json) => _$GetPayrollResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPayrollResponseToJson(this);
}
