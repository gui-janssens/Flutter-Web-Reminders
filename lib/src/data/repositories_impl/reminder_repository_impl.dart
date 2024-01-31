import 'package:codelitt_calendar/src/data/data.dart';
import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/app_error.dart';
import 'package:oxidized/oxidized.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderRemoteDataSource remoteDataSource;

  ReminderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<Reminder, AppError>> addReminder(
      Map<String, dynamic> payload) async {
    final result = await remoteDataSource.addReminder(payload);

    if (result.isOk()) {
      final reminderModel = result.unwrap();
      final reminder = reminderModel.toEntity();
      return Result.ok(reminder);
    }

    return Result.err(result.unwrapErr());
  }

  @override
  Future<Result<List<Reminder>, AppError>> getReminders() async {
    final result = await remoteDataSource.getReminders();

    if (result.isOk()) {
      final reminders = result.unwrap();
      return Result.ok(reminders.map((e) => e.toEntity()).toList());
    }

    return Result.err(result.unwrapErr());
  }

  @override
  Future<Result<void, AppError>> updateReminder(
    Map<String, dynamic> payload,
    String id,
  ) async {
    final result = await remoteDataSource.updateReminder(payload, id);

    if (result.isOk()) {
      return const Result.ok(true);
    }

    return Result.err(result.unwrapErr());
  }

  @override
  Future<Result<void, AppError>> deleteReminder(String id) async {
    return await remoteDataSource.deleteReminder(id);
  }
}
