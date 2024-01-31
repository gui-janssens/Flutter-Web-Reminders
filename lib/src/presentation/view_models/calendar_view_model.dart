import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class CalendarViewModel extends BaseViewModel {
  List<List<DateTime?>> monthGrid = [];
  late DateTime currentCalendarDate;
  late DateTime selectedDate;

  setSelectedMonthInCalendar(DateTime date) {
    currentCalendarDate = date;
    populateCalendar();
  }

  setSelectedDate(DateTime date) {
    selectedDate = date;
    populateCalendar();
  }

  populateCalendarWithCurrentDate() async {
    selectedDate = DateTime.now();
    currentCalendarDate = DateTime.now();

    currentCalendarDate.populateGridWithDaysInTheMonth(monthGrid);

    setState(ViewModelState.ready);
  }

  populateCalendar() {
    monthGrid.clear();

    currentCalendarDate.populateGridWithDaysInTheMonth(monthGrid);

    notifyListeners();
  }
}
