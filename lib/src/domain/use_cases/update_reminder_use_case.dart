import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class UpdateReminderUseCase {
  final ReminderRepository repository;

  UpdateReminderUseCase(this.repository);

  Future<Result<Reminder, AppError>> call(
      Map<String, dynamic> payload, String id) async {
    return await repository.updateReminder(payload, id);
  }
}
