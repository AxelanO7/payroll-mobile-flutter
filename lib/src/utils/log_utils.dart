import 'package:absent_payroll/src/core/base_import.dart';

class LogUtils {
  static log(Object? message) {
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) {
      print(message);
    }
  }

  static systemLog(String key, String message) {
    if (CoreConfig.getDebuggableConfig("is_debug_mode")) {
      print("[$key]: $message");
    }
  }
}
