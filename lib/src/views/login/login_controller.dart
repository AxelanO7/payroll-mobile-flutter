import 'package:absent_payroll/src/core/base_import.dart';

class LoginController extends BaseController {
  bool canPop = true;
  bool isLoadingLogin = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  onGoBack() {
    Get.back();
  }

  handleLogin() async {
    isLoadingLogin = true;
    update();
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Gagal', 'Username atau password tidak boleh kosong');
      return;
    }
    var res = await AuthUtils.doLogin(usernameController.text, passwordController.text);
    if (res.status) {
      Get.snackbar('Berhasil', 'Login berhasil');
    } else {
      Get.snackbar('Gagal', 'Login gagal');
      isLoadingLogin = false;
      update();
      return;
    }
    isLoadingLogin = false;
    update();
    SettingsUtils.set('name_user', usernameController.text);
    onGetStarted();
  }

  onGetStarted() {
    Get.toNamed(AppRoutes.mainPage);
  }
}
