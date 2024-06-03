import 'package:absent_payroll/src/core/base_import.dart';

import 'welcome_controller.dart';

class WelcomeMobilePage extends StatelessWidget {
  const WelcomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) => PopScope(
        canPop: controller.canPop,
        child: Scaffold(
          body: ScrollConfiguration(
            behavior: CustomDisableGlowBehavior(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: Get.height - 32,
                child: Stack(
                  children: [
                    Positioned(
                      top: -52,
                      left: -32,
                      child: Container(
                        width: Get.width / 2,
                        height: Get.height / 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              //HexColor('F8DEB5'),
                              Colors.redAccent,
                              HexColor('FFFFFF')],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -52,
                      right: -32,
                      child: Container(
                        width: Get.width / 2,
                        height: Get.height / 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              HexColor('FFFFFF'),
                              Colors.redAccent,
                              //HexColor('F8DEB5'),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/images/global/logo_think_foward_black.png', width: Get.width / 2.5, height: Get.width / 2.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width,
                            child: Text(
                              'Hi!\nWelcome',
                              style: TypographyStyle.heading1Bold.copyWith(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                color: ColorStyle.hashMicroGreyColor,
                              ),
                            ),
                          ),
                          Text(
                            'To Hash Micro Attendance App',
                            style: TypographyStyle.body3SemiBold.copyWith(color: ColorStyle.hashMicroGreyColor),
                          ),
                          const Spacer(),
                          Center(
                            child: CustomButton(
                              width: Get.width - 80,
                              height: 48,
                              color: ColorStyle.hashMicroGreyColor,
                              radius: 12,
                              onPressed: controller.onGetStarted,
                              child: Text('Get Started', style: TypographyStyle.body2Bold.copyWith(color: ColorStyle.whiteColor)),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
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
