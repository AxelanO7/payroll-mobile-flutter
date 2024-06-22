import 'package:get/get.dart';
import 'package:absent_payroll/src/views/attendance/attendance_view.dart';
import 'package:absent_payroll/src/views/login//login_view.dart';
import 'package:absent_payroll/src/views/main_page/main_page_view.dart';
import 'package:absent_payroll/src/views/startup/startup_view.dart';

part 'app_routes.dart';

abstract class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.initialRoute,
      page: () => const StartupView(),
    ),
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPageView(),
    ),
    GetPage(
      name: AppRoutes.attendancePage,
      page: () => const AttendanceView(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginView(),
    ),
  ];
}
