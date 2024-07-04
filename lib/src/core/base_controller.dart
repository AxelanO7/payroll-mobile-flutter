import 'dart:io';

import 'base_import.dart';

class BaseController extends GetxController with WidgetsBindingObserver {
  ScreenArguments? screenArguments;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(val) {
    _isLoading = val;
    update();
  }

  @override
  onInit() async {
    await initArguments();
    super.onInit();
  }

  @override
  void onReady() async {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        if (Platform.isAndroid) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
        }
      }
      handleSystemChannel(msg);
      return msg;
    });
    super.onReady();
  }

  @override
  onClose() async {
    print("onClose");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChannels.lifecycle.setMessageHandler((msg) async {
      if (msg == AppLifecycleState.resumed.toString()) {
        if (Platform.isAndroid) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
        }
      }
      return msg;
    });
    super.onClose();
  }

  handleSystemChannel(msg) {
    print('SystemChannels> $msg');
  }

  initArguments() async {
    if (Get.arguments != null) {
      if (Get.arguments is ScreenArguments) {
        screenArguments = Get.arguments as ScreenArguments;
      }
    }
  }

  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<String> get getTeacherId async {
    return await SettingsUtils.getString('teacher_id');
  }
}
