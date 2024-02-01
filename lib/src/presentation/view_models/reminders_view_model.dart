import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class RemindersViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;

  RemindersViewModel(this.getRemindersUseCase);

  List<Reminder> allReminders = [];
  List<Reminder> selectedDateReminders = [];

  Reminder? reminderToBeEdited;

  getReminders() async {
    final result = await getRemindersUseCase.call();

    if (result.isOk()) {
      allReminders = result.unwrap();
    }

    setSelectedDateReminders(DateTime.now());

    setState(ViewModelState.ready);
  }

  setSelectedDateReminders(DateTime selectedDate) {
    selectedDateReminders.clear();
    selectedDateReminders.addAll(List<Reminder>.from(allReminders
        .where((reminder) => reminder.date.isSameDate(selectedDate))));
  }

  setReminderToBeEdited(Reminder reminder) {
    reminderToBeEdited = Reminder.copy(reminder);
  }
}
