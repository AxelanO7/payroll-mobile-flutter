import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/attendance/attendance_controller.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AttendanceController>(
      backgroundColor: ColorStyle.whiteColor,
      controller: AttendanceController(),
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
      mobile: (controller) => GetBuilder<AttendanceController>(
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
      ),
    );
  }
}
