import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

abstract class ReminderRepository {
  Future<Result<List<Reminder>, AppError>> getReminders();

  Future<Result<Reminder, AppError>> addReminder(Reminder reminder);

  Future<Result<Reminder, AppError>> updateReminder(Reminder reminder);
}
