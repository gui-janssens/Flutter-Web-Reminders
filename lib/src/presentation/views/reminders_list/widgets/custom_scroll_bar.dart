import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;

  const CustomScrollbar({
    super.key,
    required this.child,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      trackColor: Colors.white,
      thumbColor: AppColors.calendarGradientStop,
      mainAxisMargin: 65,
      thickness: 6,
      radius: const Radius.circular(8),
      trackRadius: const Radius.circular(8),
      thumbVisibility: true,
      trackVisibility: false,
      controller: controller,
      child: child,
    );
  }
}
