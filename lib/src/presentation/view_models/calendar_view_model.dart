import 'package:codelitt_calendar/src/presentation/presentation.dart';

class CalendarViewModel extends BaseViewModel {
  setCurrentMonth() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(ViewModelState.ready);
  }
}
