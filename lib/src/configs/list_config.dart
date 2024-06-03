class ListConfig {
  static final Map<String, bool> _configList = {
    //Global Features
    "is_debug_mode": true, "use_dev_api": true, "is_local_server": false, "log_api_response": true, "is_beta": true,
  };

  static Map<String, bool> get getConfigList {
    return _configList;
  }
}
