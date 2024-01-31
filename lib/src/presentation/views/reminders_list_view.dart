import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersListView extends StatelessWidget {
  const RemindersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CalenderViewModel, RemindersListViewModel>(
        builder: (context, calenderViewModel, remindersListViewModel, _) {
      return Container();
    });
  }
}
