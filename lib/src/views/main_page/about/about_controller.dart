import 'package:absent_payroll/src/core/base_import.dart';

class AboutController extends BaseController {
  bool canPop = true;

  TextEditingController nameController = TextEditingController();

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
}
