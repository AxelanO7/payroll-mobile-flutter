import 'package:absent_payroll/src/core/base_import.dart';

class ThemeStyle {
  static Future<ThemeData?> get currentThemeData async {
    // bool isDarkThemeMode = await DataService.getBool(DataService.keyDarkMode);
    // !isDarkThemeMode
    //     ? _themeData = AppTheme.lightTheme
    //     : _themeData = AppTheme.darkTheme;
    ThemeData(
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.white,
      ),
    );
    return null;
  }
}
