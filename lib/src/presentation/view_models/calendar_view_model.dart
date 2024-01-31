import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class CalendarViewModel extends BaseViewModel {
  List<List<int?>> monthGrid = [];

  late DateTime selectedDate;

  setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  populateCalendarWithCurrentDate() async {
    selectedDate = DateTime.now();

    selectedDate.populateGridWithDaysInTheMonth(monthGrid);

    setState(ViewModelState.ready);
  }

  populateCalendar() {
    monthGrid.clear();

    selectedDate.populateGridWithDaysInTheMonth(monthGrid);

    notifyListeners();
  }
}
