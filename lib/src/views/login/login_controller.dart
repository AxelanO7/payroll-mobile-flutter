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

  handleLogin() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Gagal', 'Username atau password tidak boleh kosong');
      return;
    }

    // if (usernameController.text != 'admin' || passwordController.text != 'admin') {
    //   Get.snackbar('Gagal', 'Username atau password salah');
    //   return;
    // }

    SettingsUtils.set('name_user', usernameController.text);
    Get.snackbar('Berhasil', 'Login berhasil');
    Future.delayed(const Duration(seconds: 1), onGetStarted);
    onGetStarted();
  }

  onGetStarted() {
    Get.toNamed(AppRoutes.mainPage);
  }
}
