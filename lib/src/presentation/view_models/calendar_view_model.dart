import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class CalendarViewModel extends BaseViewModel {
  List<List<int?>> monthGrid = [];

  late DateTime selectedDate;

  setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  populateCalendarWithCurrentMonth() async {
    selectedDate = DateTime.now();
    final daysInCurrentMonth = selectedDate.getDaysInMonth();
    final weekdayOfFirstDay = selectedDate.getWeekdayOfFirstDay();

    selectedDate.populateGridWithDaysInTheMonth(
      daysInCurrentMonth,
      weekdayOfFirstDay,
      monthGrid,
    );

    setState(ViewModelState.ready);
  }

  populateCalendar() {
    monthGrid.clear();

    final daysInCurrentMonth = selectedDate.getDaysInMonth();
    final weekdayOfFirstDay = selectedDate.getWeekdayOfFirstDay();

    selectedDate.populateGridWithDaysInTheMonth(
      daysInCurrentMonth,
      weekdayOfFirstDay,
      monthGrid,
    );

    notifyListeners();
  }
}
