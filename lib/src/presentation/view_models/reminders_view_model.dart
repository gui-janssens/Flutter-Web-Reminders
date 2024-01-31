import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';

class RemindersViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;

  RemindersViewModel(this.getRemindersUseCase);

  List<Reminder> allReminders = [];

  getReminders() async {
    final result = await getRemindersUseCase.call();

    if (result.isOk()) {
      allReminders = result.unwrap();
    }

    setState(ViewModelState.ready);
  }
}
