import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/no_reminders_placeholder.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/reminders_list.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersView extends StatefulWidget {
  static const path = '/';

  const RemindersView({super.key});

  @override
  State<RemindersView> createState() => _RemindersViewState();
}

class _RemindersViewState extends State<RemindersView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RemindersViewModel, CalendarViewModel>(
        builder: (context, remindersViewModel, calendarViewModel, _) {
      if (remindersViewModel.state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppColors.calendarGradientStart),
          ),
        );
      }

      if (remindersViewModel.selectedDateReminders.isEmpty) {
        return NoRemindersPlaceHolder(
          selectedDate: calendarViewModel.selectedDate,
        );
      }
      return RemindersList(
        selectedDate: calendarViewModel.selectedDate,
        remindersViewModel: remindersViewModel,
      );
    });
  }
}
