import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditReminderView extends StatelessWidget {
  const EditReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CalenderViewModel, EditReminderViewModel>(
        builder: (context, calenderViewModel, editReminderViewModel, _) {
      return Container();
    });
  }
}
