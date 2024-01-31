import 'dart:ui';

class AppColors {
  static Color convertHexToColor(String hexCode) {
    return Color(
      int.parse('0xff$hexCode'),
    );
  }
}
