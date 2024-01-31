import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MonthGridBuilder extends StatelessWidget {
  final List<List<DateTime?>> monthGrid;
  final DateTime selectedDate;
  final DateTime currentCalendarDate;
  final Function(DateTime) onDateTapped;
  final List<Reminder> allReminders;
  const MonthGridBuilder({
    super.key,
    required this.currentCalendarDate,
    required this.monthGrid,
    required this.selectedDate,
    required this.onDateTapped,
    required this.allReminders,
  });

  bool get sameMonthAndYear =>
      selectedDate.year == currentCalendarDate.year &&
      selectedDate.month == currentCalendarDate.month;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            const WeekdaysBuilder(),
            const Gap(10),
          ] +
          List.generate(
            monthGrid.length,
            (week) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (day) => Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (monthGrid[week][day] == null) return;
                      if (selectedDate.day == monthGrid[week][day]!.day &&
                          sameMonthAndYear) return;
                      onDateTapped(
                        DateTime(
                          currentCalendarDate.year,
                          currentCalendarDate.month,
                          monthGrid[week][day]!.day,
                        ),
                      );
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 45,
                            decoration:
                                selectedDate.day == monthGrid[week][day]?.day &&
                                        sameMonthAndYear
                                    ? const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.addReminderGradientStart,
                                            AppColors.addReminderGradientStop,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      )
                                    : null,
                            child: Center(
                              child: Text(
                                monthGrid[week][day] == null
                                    ? ''
                                    : monthGrid[week][day]!.day.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          if (allReminders.isNotEmpty &&
                              allReminders.any((reminder) => reminder.date
                                  .isSameDate(monthGrid[week][day])))
                            Positioned(
                              top: 8,
                              right: 5,
                              child: Container(
                                height: 6,
                                width: 6,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.editButtonGradientStop,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

class WeekdaysBuilder extends StatelessWidget {
  const WeekdaysBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        Weekday.values.length,
        (i) => Expanded(
          child: Center(
            child: Text(
              Weekday.values[i].value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
