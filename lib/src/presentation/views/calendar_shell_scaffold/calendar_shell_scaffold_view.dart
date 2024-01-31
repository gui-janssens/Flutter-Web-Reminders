import 'package:codelitt_calendar/src/core/locator.dart';
import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/calendar_shell_scaffold/widgets/calendar.dart';
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
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (_) {
            final viewModel = CalendarViewModel();
            viewModel.populateCalendarWithCurrentDate();
            return viewModel;
          },
        ),
        ListenableProvider(
          create: (_) {
            final viewModel = RemindersViewModel(getIt<GetRemindersUseCase>());
            viewModel.getReminders();
            return viewModel;
          },
        ),
      ],
      child: Consumer2<CalendarViewModel, RemindersViewModel>(
          builder: (context, calendarViewModel, remindersViewModel, _) {
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
                        child: calendarViewModel.state.isLoading ||
                                remindersViewModel.state.isLoading
                            ? const Center()
                            : child,
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
                        child: Calendar(
                          calendarViewModel: calendarViewModel,
                          allReminders: remindersViewModel.allReminders,
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
