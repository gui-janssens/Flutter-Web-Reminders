import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/app_error.dart';
import 'package:oxidized/oxidized.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  @override
  Future<Result<Reminder, AppError>> addReminder(Reminder reminder) {
    // TODO: implement addReminder
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Reminder>, AppError>> getReminders() {
    // TODO: implement getReminders
    throw UnimplementedError();
  }

  @override
  Future<Result<Reminder, AppError>> updateReminder(Reminder reminder) {
    // TODO: implement updateReminder
    throw UnimplementedError();
  }
}
