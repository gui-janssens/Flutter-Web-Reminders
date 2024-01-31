import 'package:codelitt_calendar/src/presentation/presentation.dart';
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
    return Consumer<RemindersViewModel>(
        builder: (context, remindersViewModel, _) {
      return const Center(
        child: Text('Reminders list'),
      );
    });
  }
}
