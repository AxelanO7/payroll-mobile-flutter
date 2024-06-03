import 'package:absent_payroll/src/core/base_import.dart';

class MainPageController extends BaseController {
  static int indexTab = 0;
  static bool onFab = false;
  static PageController pageController = PageController(initialPage: 1);

  bool canPop = true;

  @override
  onInit() {
    super.onInit();
  }

  @override
  onReady() async {
    update();
    super.onReady();
  }

  @override
  onClose() async {
    super.onClose();
  }

  onGoBack() {
    Get.back();
  }

  Widget pageItemBuilder(context, position) {
    switch (position) {
      default:
        return Container();
    }
  }

  Future<bool> onWillPop() async {
    if (pageController.page == 0.0) {
      return true;
    } else {
      pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
      return false;
    }
  }

  tapTab(idx) async {
    onFab = false;
    indexTab = idx >= 1 ? idx + 1 : idx;
    pageController.jumpToPage(idx >= 1 ? idx + 1 : idx);
    update();
  }

  void tapHome() {
    onFab = true;
    indexTab = 1;
    pageController.jumpToPage(1);
    update();
  }

  void onGoListStatus() {
    onFab = false;
    indexTab = 0;
    pageController.jumpToPage(0);
    update();
  }

  void onGoProfile() {
    onFab = false;
    indexTab = 2;
    pageController.jumpToPage(2);
    update();
  }
}
