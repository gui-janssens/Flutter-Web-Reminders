import 'dart:ui';

class AppColors {
  static const background = Color(0xffEBF3FE);
  static const boxShadow = Color(0xffD1DCF0);
  static const calendarGradientStart = Color(0xff101277);
  static const calendarGradientStop = Color(0xff421F91);
  static const lightGrey = Color(0xffD9D9D9);
  static const midGrey = Color(0xff767a7b);
  static const darkGrey = Color(0xff384042);
  static const addReminderGradientStart = Color(0xffFF465D);
  static const addReminderGradientStop = Color(0xffBC46BA);
  static const editButtonGradientStart = Color(0xff3BC6FB);
  static const editButtonGradientStop = Color(0xff00ffcc);
}

class ReminderColors {
  static const lightGreen = Color(0xffC8E6C9);
  static const yellow = Color(0xffF5DD29);
  static const orange = Color(0xffFFCC80);
  static const red = Color(0xffEF9A9A);
  static const purple = Color(0xffCD8DE5);
  static const blue = Color(0xff5BA4CF);
  static const lightBlue = Color(0xff29CCE5);
  static const green = Color(0xff6DECA9);
  static const pink = Color(0xffFF8ED4);
  static const brown = Color(0xffBCAAA4);

  static Color fromHex(String hexCode) {
    return Color(int.parse('0xff$hexCode'));
  }
}

extension ColorUtils on Color {
  String toHex() {
    return value.toRadixString(16).padLeft(8, '0');
  }
}
