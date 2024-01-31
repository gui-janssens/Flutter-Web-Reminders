import 'dart:ui';

class AppColors {
  static const background = Color(0xffEBF3FE);
  static const boxShadow = Color(0xffD1DCF0);
  static const calendarGradientStart = Color(0xff101277);
  static const calendarGradientStop = Color(0xff421F91);

  static Color convertHexToColor(String hexCode) {
    return Color(
      int.parse('0xff$hexCode'),
    );
  }
}
