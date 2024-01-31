extension DateUtils on DateTime {
  int getDaysInMonth(int year, int month) {
    // If the month is December, the next month is January of the next year.
    int nextMonth = month == 12 ? 1 : month + 1;
    int nextYear = month == 12 ? year + 1 : year;

    // Get the first day of the given month and the first day of the next month.
    DateTime firstDayThisMonth = DateTime(year, month, 1);
    DateTime firstDayNextMonth = DateTime(nextYear, nextMonth, 1);

    // Difference in days gives the number of days in the given month.
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
