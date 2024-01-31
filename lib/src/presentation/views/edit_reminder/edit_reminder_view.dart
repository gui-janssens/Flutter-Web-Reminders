import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditReminderView extends StatelessWidget {
  static const path = '/edit-reminder';

  const EditReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RemindersViewModel>(
        builder: (context, remindersViewModel, _) {
      return const Center(
        child: Text('edit/add reminder'),
      );
    });
  }
}
