import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/no_reminders_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersListView extends StatefulWidget {
  static const path = '/';

  const RemindersListView({super.key});

  @override
  State<RemindersListView> createState() => _RemindersListViewState();
}

class _RemindersListViewState extends State<RemindersListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<RemindersViewModel, CalendarViewModel>(
        builder: (context, remindersViewModel, calendarViewModel, _) {
      if (remindersViewModel.selectedDateReminders.isEmpty) {
        return NoRemindersPlaceHolder(
          selectedDateTime: calendarViewModel.selectedDate,
        );
      }
      return const Column(
        children: [],
      );
    });
  }
}
