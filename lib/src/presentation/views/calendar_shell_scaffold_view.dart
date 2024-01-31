import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
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
          backgroundColor: AppColors.background,
          body: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width > 1120
                      ? MediaQuery.of(context).size.width
                      : 1120,
                ),
                alignment: Alignment.center,
                child: Container(
                  height: 690,
                  width: 1120,
                  margin: const EdgeInsets.symmetric(horizontal: 160),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.boxShadow,
                        offset: Offset(0, 4),
                        blurRadius: 28,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 1120 - 450,
                        padding: const EdgeInsets.all(40),
                        child: child,
                      ),
                      Container(
                        width: 450,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              AppColors.calendarGradientStart,
                              AppColors.calendarGradientStop,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
