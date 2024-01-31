import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalenderShellScaffoldView extends StatelessWidget {
  final Widget child;
  const CalenderShellScaffoldView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (_) => CalenderViewModel(),
      child: Consumer<CalenderViewModel>(builder: (context, viewModel, _) {
        return Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(child: child),
            ],
          ),
        );
      }),
    );
  }
}
