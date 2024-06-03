export 'package:absent_payroll/src/configs/index.dart';
export 'package:absent_payroll/src/core/base_controller.dart';
export 'package:absent_payroll/src/core/base_model.dart';
export 'package:absent_payroll/src/core/base_widget.dart';
export 'package:absent_payroll/src/helpers/index.dart';
export 'package:absent_payroll/src/models/index.dart';
export 'package:absent_payroll/src/routes/index.dart';
export 'package:absent_payroll/src/services/index.dart';
export 'package:absent_payroll/src/styles/cores/index.dart';
export 'package:absent_payroll/src/utils/index.dart';
export 'package:absent_payroll/src/widgets/index.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:get/get.dart';

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map(
        (str) => str.toCapitalized(),
      )
      .join(' ');
}
