import 'dart:io';

import 'list_config.dart';

class CoreConfig {
  //Production Mode will disable every debug thing
  static const bool productionMode = false;

  static final bool isDesktopClient = Platform.isWindows || Platform.isLinux;
  static final bool isMacOS = !isDesktopClient && Platform.isMacOS;

  static const String _urlBaseAPILocal = '';
  static const String _urlBaseAPIDebug = 'http://128.199.86.138/api';
  static const String _urlBaseAPIProduction = 'http://128.199.86.138/api';
  static const String _urlBaseCDN = '';

  static bool getDebuggableConfig(String configName) {
    return !productionMode ? ListConfig.getConfigList[configName] ?? false : false;
  }

  static bool getFixedConfig(String configName) {
    return ListConfig.getConfigList[configName] ?? false;
  }

  static String getApiUrl() {
    String topic = _urlBaseAPIProduction;
    if (!productionMode) {
      topic = getDebuggableConfig("is_local_server") ? _urlBaseAPILocal : getDebuggableConfig("is_debug") ? _urlBaseAPIDebug : _urlBaseAPIDebug;
    }
    return topic;
  }

  static String get getEnvironment {
    String topic = "prod";
    if (!productionMode) {
      topic = getDebuggableConfig("is_local_server") ? 'local' : getDebuggableConfig("is_debug") ? 'dev' : 'prod';
    }
    return topic;
  }

  static String get getUrlCDN {
    return _urlBaseCDN;
  }
}
