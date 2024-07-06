import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/main_page/main_page_controller.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomeController extends BaseController {
  var mainScrollController = ScrollController();
  final MainPageController rootController;

  EasyRefreshController refreshController = EasyRefreshController();

  HomeController({required this.rootController});

  String name_user = "";

  @override
  onInit() {
    super.onInit();
    isLoading = true;
    update();
  }

  @override
  onReady() async {
    name_user = await SettingsUtils.getString("name_user");
    isLoading = false;
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  resetAccount() {
    SettingsUtils.remove("name_user");
    Get.offAllNamed(AppRoutes.loginPage);
  }

  doAttendance() {
    Get.toNamed(AppRoutes.attendancePage);
  }
}
