import 'package:absent_payroll/src/core/base_import.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'login_controller.dart';

class LoginMobilePage extends StatelessWidget {
  const LoginMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => PopScope(
        canPop: controller.canPop,
        child: Scaffold(
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
                    const SizedBox(height:  32),
                    CustomButton(
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
    );
  }
}
