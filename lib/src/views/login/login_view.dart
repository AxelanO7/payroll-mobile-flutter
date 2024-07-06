import 'package:absent_payroll/src/core/base_import.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginController>(
      backgroundColor: ColorStyle.whiteColor,
      controller: LoginController(),
      appBar: AppBar(
        backgroundColor: ColorStyle.whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Android
          statusBarColor: ColorStyle.whiteColor,
          statusBarIconBrightness: Brightness.dark,
          // iOS
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: ColorStyle.whiteColor,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: ColorStyle.whiteColor,
        ),
        toolbarHeight: 0,
        elevation: 0,
        centerTitle: true,
      ),
      extendBody: true,
      mobile: (controller) => GetBuilder<LoginController>(
        builder: (controller) => PopScope(
          canPop: controller.canPop,
          child: Scaffold(
            backgroundColor: ColorStyle.whiteColor,
            body: ScrollConfiguration(
              behavior: CustomDisableGlowBehavior(),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Get.height - 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/global/logo.png', width: Get.width / 2.5, height: Get.width / 2.5),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: TextField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Masukkan username',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Masukkan password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        isLoading: controller.isLoadingLogin,
                        width: Get.width - 72,
                        height: 44,
                        color: ColorStyle.customGreyColor,
                        onPressed: controller.handleLogin,
                        child: Text(
                          'Login',
                          style: TypographyStyle.body2Bold.copyWith(color: ColorStyle.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
