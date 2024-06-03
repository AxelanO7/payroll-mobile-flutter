import 'package:absent_payroll/src/core/base_import.dart';

class LoginController extends BaseController {
  bool canPop = true;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

@override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  onGoBack() {
    Get.back();
  }

  onGetStarted() {
    Get.toNamed(AppRoutes.attendance);
  }

  saveName() {
    if (usernameController.text.isNotEmpty) {
      SettingsUtils.set('name_user', usernameController.text);
      Get.toNamed(AppRoutes.welcome);
    } else {
      Get.snackbar(
        'Error',
        'Please enter your name',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
