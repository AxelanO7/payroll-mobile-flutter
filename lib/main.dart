import 'package:absent_payroll/src/core/base_import.dart';
import 'package:absent_payroll/src/views/startup/startup_view.dart';

import 'src/core/base_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await BaseServices().loadService();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      theme: await ThemeStyle.currentThemeData,
      home: const StartupView(),
      getPages: AppPages.routes,
    ),
  );
}
