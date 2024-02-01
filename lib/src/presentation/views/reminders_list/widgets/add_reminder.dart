import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddReminder extends StatelessWidget {
  final DateTime selectedDateTime;
  const AddReminder(this.selectedDateTime, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            DateFormat('EEEE, MMM d, y').format(selectedDateTime),
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: AppColors.darkGrey,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Gap(20),
        AddReminderButton(
          onTap: () => GoRouter.of(context).go(EditReminderView.path),
        ),
      ],
    );
  }
}

class AddReminderButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddReminderButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            colors: [
              AppColors.addReminderGradientStart,
              AppColors.addReminderGradientStop,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: const Center(
          child: Text(
            'Add reminder',
            style: TextStyle(
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
