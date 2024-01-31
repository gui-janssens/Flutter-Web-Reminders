import 'dart:ui';

Color convertHexToColor(String hexCode) {
  return Color(
    int.parse('0xff$hexCode'),
  );
}
