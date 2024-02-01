import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class RemindersViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;

  RemindersViewModel(this.getRemindersUseCase);

  List<Reminder> allReminders = [];
  List<Reminder> selectedDateReminders = [];

  getReminders() async {
    final result = await getRemindersUseCase.call();

    if (result.isOk()) {
      allReminders = result.unwrap();
    }

    setState(ViewModelState.ready);
  }

  setSelectedDateReminders(DateTime selectedDate) {
    selectedDateReminders.clear();
    selectedDateReminders.addAll(List<Reminder>.from(allReminders
        .where((reminder) => reminder.date.isSameDate(selectedDate))));

    notifyListeners();
  }
}
