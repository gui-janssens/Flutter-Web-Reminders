import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class GetRemindersUseCase {
  final ReminderRepository repository;

  GetRemindersUseCase(this.repository);

  Future<Result<List<Reminder>, AppError>> call() async {
    // return Result.ok([
    //   Reminder(
    //     'id1',
    //     'title1',
    //     'description1',
    //     DateTime.now(),
    //     Colors.red,
    //   ),
    //   Reminder(
    //     'id2',
    //     'title2',
    //     'description2',
    //     DateTime.now(),
    //     Colors.yellow,
    //   ),
    //   Reminder(
    //     'id3',
    //     'title3',
    //     'description3',
    //     DateTime.now(),
    //     Colors.green,
    //   ),
    //   Reminder(
    //     'id1',
    //     'title1',
    //     'description1',
    //     DateTime.now(),
    //     Colors.red,
    //   ),
    //   Reminder(
    //     'id2',
    //     'title2',
    //     'description2',
    //     DateTime.now(),
    //     Colors.yellow,
    //   ),
    //   Reminder(
    //     'id3',
    //     'title3',
    //     'description3',
    //     DateTime.now(),
    //     Colors.green,
    //   ),
    //   Reminder(
    //     'id1',
    //     'title1',
    //     'description1',
    //     DateTime.now(),
    //     Colors.red,
    //   ),
    //   Reminder(
    //     'id2',
    //     'title2',
    //     'description2',
    //     DateTime.now(),
    //     Colors.yellow,
    //   ),
    //   Reminder(
    //     'id3',
    //     'title3',
    //     'description3',
    //     DateTime.now(),
    //     Colors.green,
    //   ),
    // ]);

    return await repository.getReminders();
  }
}
