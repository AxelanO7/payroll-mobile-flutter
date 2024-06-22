import 'package:absent_payroll/src/core/base_import.dart';

import 'startup_controller.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartupController>(
      init: StartupController(),
      builder: (controller) => controller.isBuildExpired()
          ? const Scaffold(
              body: SafeArea(
                bottom: true,
                top: true,
                child: Center(
                  child: Column(
                    children: [Text("Oops! Silahkan memperbarui versi aplikasimu")],
                  ),
                ),
              ),
            )
          : Container(
              color: ColorStyle.whiteColor,
              width: Get.width,
              height: Get.height,
              child: Center(
                child: SizedBox(
                  width: Get.width * 0.40,
                  child: Image.asset('assets/images/global/logo.png'),
                ),
              ),
            ),
    );
  }
}
