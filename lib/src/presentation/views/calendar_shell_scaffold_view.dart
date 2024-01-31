import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalenderShellScaffoldView extends StatelessWidget {
  const CalenderShellScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => CalenderViewModel(),
      child: Consumer<CalenderViewModel>(builder: (context, viewModel, child) {
        return const Placeholder();
      }),
    );
  }
}
