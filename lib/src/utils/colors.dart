import 'dart:ui';

class AppColors {
  static const background = Color(0xffEBF3FE);
  static const boxShadow = Color(0xffD1DCF0);
  static const calendarGradientStart = Color(0xff101277);
  static const calendarGradientStop = Color(0xff421F91);
  static const lightGrey = Color(0xffD9D9D9);
  static const addReminderGradientStart = Color(0xffFF465D);
  static const addReminderGradientStop = Color(0xffBC46BA);
  static const editButtonGradientStop = Color(0xff00ffcc);

  static Color convertHexToColor(String hexCode) {
    return Color(
      int.parse('0xff$hexCode'),
    );
  }
}
