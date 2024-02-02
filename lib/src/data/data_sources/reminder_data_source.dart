import 'package:codelitt_calendar/src/data/data.dart';
import 'package:codelitt_calendar/src/services/services.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class ReminderRemoteDataSource {
  /* 
  Data sources are responsible for wrapping resources from the remote data source into the application, 
  and are reponsible for converting incoming data into models.
   */

  final ApiService apiService;

  ReminderRemoteDataSource(this.apiService);

  Future<Result<List<ReminderModel>, AppError>> getReminders() async {
    final response = await apiService.get(path: EndPoints.reminders);

    if (response.isOk()) {
      final data = response.unwrap();
      final List<ReminderModel> reminders = List<ReminderModel>.from(
        data.map((e) => ReminderModel.fromJson(e)),
      );

      return Result.ok(reminders);
    }

    return Result.err(response.unwrapErr());
  }

  Future<Result<ReminderModel, AppError>> addReminder(
      Map<String, dynamic> payload) async {
    final response = await apiService.post(
      path: EndPoints.reminders,
      payload: payload,
    );

    if (response.isOk()) {
      final data = response.unwrap();
      return Result.ok(ReminderModel.fromJson(data));
    }

    return Result.err(response.unwrapErr());
  }

  Future<Result<void, AppError>> updateReminder(
      Map<String, dynamic> payload, String id) async {
    final response = await apiService.patch(
      path: '${EndPoints.reminders}/$id',
      payload: payload,
    );

    if (response.isOk()) {
      return const Result.ok(true);
    }

    return Result.err(response.unwrapErr());
  }

  Future<Result<void, AppError>> deleteReminder(String id) async {
    final response = await apiService.delete(
      path: '${EndPoints.reminders}/$id',
    );

    if (response.isOk()) {
      return const Result.ok(true);
    }

    return Result.err(response.unwrapErr());
  }
}
