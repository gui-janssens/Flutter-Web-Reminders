import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditReminderView extends StatelessWidget {
  static const path = '/edit-reminder';

  const EditReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => EditReminderViewModel(),
      child: Consumer2<CalenderViewModel, EditReminderViewModel>(
          builder: (context, calenderViewModel, editReminderViewModel, _) {
        return Container(
          color: Colors.green,
        );
      }),
    );
  }
}
