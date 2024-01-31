import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  final CalendarViewModel viewModel;
  const Calendar(this.viewModel, {super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  ViewModelState get state => widget.viewModel.state;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );
    }

    return const Center(
      child: Text('calendar'),
    );
  }
}
