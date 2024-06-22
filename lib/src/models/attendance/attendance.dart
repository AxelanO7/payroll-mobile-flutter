import 'dart:io';

class Attendance {
  final String name;
  final DateTime date;
  final String? checkin;
  final String? checkout;
  final String description;

  Attendance({required this.name, required this.date, required this.checkin, required this.checkout, required this.description});
}
