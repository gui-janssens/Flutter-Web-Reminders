import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:oxidized/oxidized.dart';

class AddReminderUseCase {
  /* 
  Use cases are self explanatory -> they use the repository contract to implement use cases 
  of the application, being well aware of business rules.
   */

  final ReminderRepository repository;

  AddReminderUseCase(this.repository);

  Future<Result<Reminder, AppError>> call(Map<String, dynamic> payload) async {
    return await repository.addReminder(payload);
  }
}
