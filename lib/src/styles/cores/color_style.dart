import 'package:absent_payroll/src/core/base_import.dart';

class ColorStyle {
  static Color get appMainPrimaryLightColor => HexColor('4169E1');

  static Color get grayscaleGray3 => HexColor('A0A3BD');

  static Color get whiteColor => HexColor('FFFFFF');

  static Color get blackColor => HexColor('1A1A1A');

  // hash micro
  static Color get customGreyColor => HexColor('#4f4f4f');

  static Color get grayBorderColor => HexColor('DFE5EF');

  MaterialColor grayscaleRange = const MaterialColor(
    0xFF558B2F,
    <int, Color>{
      0: Color(0xFFFFFFFF),
      50: Color(0xFFF9F9F9),
      100: Color(0xFFF1F1F1),
      200: Color(0xFFE8E8E8),
      300: Color(0xFFD8D8D8),
      400: Color(0xFFB4B4B4),
      500: Color(0xFF949494),
      600: Color(0xFF6C6C6C),
      700: Color(0xFF585858),
      900: Color(0xFF1A1A1A),
    },
  );

  MaterialColor redRange = const MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFFFE9EE),
      100: Color(0xFFFFC9D2),
      200: Color(0xFFF99298),
      400: Color(0xFFFF5569),
      500: Color(0xFFFF002D),
      600: Color(0xFFF6002E),
      700: Color(0xFFE40028),
      800: Color(0xFFD80020),
      900: Color(0xFFC80013),
    },
  );

  MaterialColor orangeRange = const MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFFFF8E1),
      100: Color(0xFFFFEBB2),
      200: Color(0xFFFFDE81),
      300: Color(0xFFFFD24E),
      400: Color(0xFFFFC726),
      500: Color(0xFFFEBE03),
      600: Color(0xFFFEB000),
      700: Color(0xFFFE9D00),
      800: Color(0xFFFE8C01),
      900: Color(0xFFD68E03),
    },
  );

  MaterialColor blueRange = const MaterialColor(
    0xFF558B2F,
    <int, Color>{
      50: Color(0xFFE4F2FF),
      100: Color(0xFFBEDFFF),
      200: Color(0xFF95CCFF),
      300: Color(0xFF6BB7FF),
      400: Color(0xFF4EA8FF),
      500: Color(0xFF3B99FD),
      600: Color(0xFF398AEE),
      700: Color(0xFF3578DB),
      800: Color(0xFF3266C8),
      900: Color(0xFF2C48A8),
    },
  );
}
