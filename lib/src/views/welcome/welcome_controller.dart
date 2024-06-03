import 'package:absent_payroll/src/core/base_import.dart';

class WelcomeController extends BaseController {
  bool canPop = true;

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
    Get.toNamed(AppRoutes.mainPage);
  }
}
