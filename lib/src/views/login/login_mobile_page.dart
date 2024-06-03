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
                    SvgPicture.asset('assets/images/illust_mobile_login.svg', width: Get.width / 2.5, height: Get.width / 2.5),
                    Text(
                      'What\'s your name?',
                      style: TypographyStyle.heading4Bold,
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: TextField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: 'Enter username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      width: Get.width - 72,
                      height: 44,
                      color: ColorStyle.hashMicroGreyColor,
                      onPressed: controller.saveName,
                      child: Text(
                        'Save',
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
