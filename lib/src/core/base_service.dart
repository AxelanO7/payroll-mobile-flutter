import 'dart:io';

import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/index.dart';

class BaseServices {
  loadService() async {
    print('Booting up ...');
    await GetStorage.init();
    if (Platform.isIOS) {
      DartPingIOS.register();
    }
    try {
      // await Firebase.initializeApp(name: "student_results", options: StudentResultFirebaseOptions.currentPlatform);
      // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } catch (e) {
      // if (!FeatureConfig.buildProductionMode) {
      print(e);
      // }
    }

    Get.put(ConstantsService(), permanent: true);
  }

  static systemLog(String key, String message) {
    print("[$key]: $message");
  }
}
