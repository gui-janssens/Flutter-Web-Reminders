import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/calendar_shell_scaffold/widgets/month_grid_builder.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Calendar extends StatefulWidget {
  final CalendarViewModel calendarViewModel;
  final RemindersViewModel remindersViewModel;
  const Calendar({
    super.key,
    required this.calendarViewModel,
    required this.remindersViewModel,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  ViewModelState get state => widget.calendarViewModel.state;
  CalendarViewModel get calendarViewModel => widget.calendarViewModel;
  RemindersViewModel get remindersViewModel => widget.remindersViewModel;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            calendarViewModel.currentCalendarDate.year.toString(),
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1,
            ),
          ),
          Text(
            calendarViewModel.currentCalendarDate.getMonthName.name,
            style: const TextStyle(
              fontSize: 45,
              color: Colors.white,
              height: .7,
            ),
          ),
          const Gap(60),
          SizedBox(
            height: 24,
            width: 64,
            child: Row(
              children: [
                InkWell(
                  onTap: () => calendarViewModel.setSelectedMonthInCalendar(
                    calendarViewModel.currentCalendarDate.getPreviousMonth(),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left_outlined,
                    size: 24,
                    color: AppColors.lightGrey,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/point-navigation.svg',
                  height: 6,
                  width: 6,
                ),
                InkWell(
                  onTap: () => calendarViewModel.setSelectedMonthInCalendar(
                      calendarViewModel.currentCalendarDate.getNextMonth()),
                  child: const Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 24,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ),
          const Gap(24),
          MonthGridBuilder(
            currentCalendarDate: calendarViewModel.currentCalendarDate,
            selectedDate: calendarViewModel.selectedDate,
            monthGrid: calendarViewModel.monthGrid,
            onDateTapped: (date) {
              calendarViewModel.setSelectedDate(date);
              remindersViewModel.setSelectedDateReminders(date);
              remindersViewModel.setDateControllerText(date);
            },
            allReminders: remindersViewModel.allReminders,
          ),
          const Spacer(),
          const Text(
            '@ 2024 Placeholder Inc All rights reserved',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
