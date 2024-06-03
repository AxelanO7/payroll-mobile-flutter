import 'package:absent_payroll/src/core/base_import.dart';

import 'attendance_controller.dart';

class AttendanceMobilePage extends StatelessWidget {
  const AttendanceMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      builder: (controller) => PopScope(
        canPop: controller.canPop,
        child: Scaffold(
          body: PageView.builder(
            itemCount: 3,
            controller: controller.pageController,
            scrollBehavior: CustomDisableGlowBehavior(),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: controller.pageItemBuilder,
          ),
        ),
      ),
    );
  }
}
