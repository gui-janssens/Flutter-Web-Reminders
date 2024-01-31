import 'package:codelitt_calendar/src/domain/domain.dart';

extension AppDateUtils on DateTime {
  DateTime getNextMonth() {
    // If the month is December, the next month is January of the next year.
    int nextMonth = month == 12 ? 1 : month + 1;
    int nextYear = month == 12 ? year + 1 : year;

    return DateTime(nextYear, nextMonth, 1);
  }

  DateTime getPreviousMonth() {
    // If the month is January, the previous month is December of last year.
    int nextMonth = month == 1 ? 12 : month - 1;
    int nextYear = month == 1 ? year - 1 : year;

    return DateTime(nextYear, nextMonth, 1);
  }

  int getDaysInMonth() {
    // If the month is December, the next month is January of the next year.
    int nextMonth = month == 12 ? 1 : month + 1;
    int nextYear = month == 12 ? year + 1 : year;

    // Get the first day of the given month and the first day of the next month.
    DateTime firstDayThisMonth = DateTime(year, month, 1);
    DateTime firstDayNextMonth = DateTime(nextYear, nextMonth, 1);

    // Difference in days gives the number of days in the given month.
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  int getWeekdayOfFirstDay() {
    DateTime firstDayThisMonth = DateTime(year, month, 1);
    return firstDayThisMonth.weekday;
  }

  populateGridWithDaysInTheMonth(
    List<List<DateTime?>> monthGrid,
  ) {
    final daysInCurrentMonth = getDaysInMonth();
    final weekdayOfFirstDay = getWeekdayOfFirstDay();
    // calculate the number of days to prepend for the grid (nulls before the first day)
    // example: weekdayOfFirstDay == 1 (Monday) => prepend will become 1, and so on.
    int prependCount = weekdayOfFirstDay % 7;

    List<DateTime?> currentWeek =
        List.filled(prependCount, null, growable: true);
    for (int i = 1; i <= daysInCurrentMonth; i++) {
      currentWeek.add(DateTime(year, month, i));
      if (currentWeek.length == 7) {
        monthGrid.add(currentWeek);
        currentWeek = [];
      }
    }

    // If the last week is not complete, fill the rest with nulls
    if (currentWeek.isNotEmpty) {
      currentWeek.addAll(List.filled(7 - currentWeek.length, null));
      monthGrid.add(currentWeek);
    }
  }

  Month get getMonthName {
    return Month.fromInt(month);
  }

  bool isSameDate(DateTime? other) {
    if (other == null) return false;
    return year == other.year && month == other.month && day == other.day;
  }
}
