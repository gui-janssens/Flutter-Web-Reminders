import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/add_reminder.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class NoRemindersPlaceHolder extends StatelessWidget {
  final DateTime selectedDateTime;

  const NoRemindersPlaceHolder({
    super.key,
    required this.selectedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddReminder(selectedDateTime),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/no_reminders_placeholder.svg',
              height: 225,
              fit: BoxFit.fitHeight,
              placeholderBuilder: (_) => Container(height: 225),
            ),
            const Gap(5),
            const Text(
              'No reminders registered so far',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),
        Opacity(
          opacity: 0,
          child: AddReminder(selectedDateTime),
        ),
      ],
    );
  }
}
