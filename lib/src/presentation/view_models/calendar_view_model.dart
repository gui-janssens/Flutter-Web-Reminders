import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class CalendarViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;

  CalendarViewModel(this.getRemindersUseCase);

  List<List<DateTime?>> monthGrid = [];
  late DateTime currentCalendarDate;
  late DateTime selectedDate;
  List<Reminder> allReminders = [];

  initializeData() async {
    final result = await getRemindersUseCase.call();

    if (result.isOk()) {
      allReminders = result.unwrap();
    }

    selectedDate = DateTime.now();

    populateCalendarWithCurrentDate();
  }

  setSelectedMonthInCalendar(DateTime date) {
    currentCalendarDate = date;
    populateCalendar();
  }

  setSelectedDate(DateTime date) {
    selectedDate = date;
    populateCalendar();
  }

  populateCalendarWithCurrentDate() async {
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
