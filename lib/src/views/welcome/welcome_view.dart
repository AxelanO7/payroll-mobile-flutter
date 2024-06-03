import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/welcome/welcome_controller.dart';

import 'welcome_mobile_page.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

@override
  Widget build(BuildContext context) {
    return BaseWidget<WelcomeController>(
      backgroundColor: ColorStyle.whiteColor,
      controller: WelcomeController(),
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
      mobile: (controller) => const WelcomeMobilePage(),
    );
  }
}
