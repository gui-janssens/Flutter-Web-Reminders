import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';

class ColorPalette extends StatelessWidget {
  final Function(Color) onColorTapped;
  final Color? selectedColor;
  const ColorPalette({
    super.key,
    required this.onColorTapped,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        ReminderColors.colorsList.length,
        (i) {
          final color = ReminderColors.colorsList[i];
          return ColorBox(
            isSelected: color == selectedColor,
            color: color,
            onColorTapped: onColorTapped,
            addPaddingRight: i != ReminderColors.colorsList.length - 1,
          );
        },
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final bool addPaddingRight;
  final Function(Color) onColorTapped;
  const ColorBox({
    super.key,
    required this.color,
    required this.isSelected,
    required this.addPaddingRight,
    required this.onColorTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => onColorTapped(color),
        child: Container(
          height: 55,
          margin: EdgeInsets.only(right: addPaddingRight ? 6 : 0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: isSelected
                ? Border.all(
                    width: 5,
                    color: AppColors.calendarGradientStart,
                  )
                : Border.all(
                    color: AppColors.textFieldGreyColor.withOpacity(.4),
                  ),
          ),
        ),
      ),
    );
  }
}
