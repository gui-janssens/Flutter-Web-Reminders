import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class GetRemindersUseCase {
  final ReminderRepository repository;

  GetRemindersUseCase(this.repository);

  Future<Result<List<Reminder>, AppError>> call() async {
    return await repository.getReminders();
  }
}
