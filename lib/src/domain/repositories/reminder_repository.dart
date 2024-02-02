import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

abstract class ReminderRepository {
  /* 
  Abstract classes are like contracts that define the methods that must be implemented.
  The dependants on contracts don't know anything about the implementation itself.
  */
  Future<Result<List<Reminder>, AppError>> getReminders();

  Future<Result<Reminder, AppError>> addReminder(Map<String, dynamic> payload);

  Future<Result<void, AppError>> updateReminder(
    Map<String, dynamic> payload,
    String id,
  );

  Future<Result<void, AppError>> deleteReminder(String id);
}
