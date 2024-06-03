import 'dart:io';

import '../configs/core_config.dart';

class VersionConfig {
  static const int _androidVersion = 100;
  static const int _iosVersion = 100;
  static const int _desktopVersion = 100;
  static const String _iosAppId = '1541829332';
  static const String _androidAppId = 'widya_sakti.absent_payroll';
  static const String expiredDate = "2024-5-30";

  static int get getBuildNumber {
    if (Platform.isAndroid) {
      return _androidVersion;
    } else if (CoreConfig.isDesktopClient) {
      return _desktopVersion;
    } else {
      return _iosVersion;
    }
  }

  static String get iOSAppId {
    return _iosAppId;
  }

  static String get androidAppId {
    return _androidAppId;
  }
}
