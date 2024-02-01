import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: AppColors.boxShadow,
              offset: Offset(0, 4),
              blurRadius: 28,
              spreadRadius: 2,
            )
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
