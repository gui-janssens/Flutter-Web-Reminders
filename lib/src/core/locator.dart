import 'package:codelitt_calendar/src/data/data.dart';
import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/domain/use_cases/delete_reminder_use_case.dart';
import 'package:codelitt_calendar/src/services/services.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

class Locator {
  static setup() {
    getIt.registerLazySingleton(() => ApiService(Client()));
    getIt.registerLazySingleton(
        () => ReminderRemoteDataSource(getIt<ApiService>()));
    getIt.registerLazySingleton(
        () => ReminderRepositoryImpl(getIt<ReminderRemoteDataSource>()));
    getIt.registerLazySingleton(
        () => GetRemindersUseCase(getIt<ReminderRepositoryImpl>()));
    getIt.registerLazySingleton(
        () => AddReminderUseCase(getIt<ReminderRepositoryImpl>()));
    getIt.registerLazySingleton(
        () => UpdateReminderUseCase(getIt<ReminderRepositoryImpl>()));
    getIt.registerLazySingleton(
        () => DeleteReminderUseCase(getIt<ReminderRepositoryImpl>()));
  }
}
