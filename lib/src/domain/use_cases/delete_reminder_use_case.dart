import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class DeleteReminderUseCase {
  final ReminderRepository repository;

  DeleteReminderUseCase(this.repository);

  Future<Result<void, AppError>> call(String id) async {
    return await repository.deleteReminder(id);
  }
}
