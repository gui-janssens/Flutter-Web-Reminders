import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/forms/reminder_form.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RemindersViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;
  final AddReminderUseCase addReminderUseCase;

  RemindersViewModel(
    this.getRemindersUseCase,
    this.addReminderUseCase,
  );

  List<Reminder> allReminders = [];
  List<Reminder> selectedDateReminders = [];

  Reminder? reminderToBeEdited;
  bool get isEditing => reminderToBeEdited != null;

  getReminders() async {
    final result = await getRemindersUseCase.call();

    if (result.isOk()) {
      allReminders = result.unwrap();
    }

    setSelectedDateReminders(DateTime.now());

    setState(ViewModelState.ready);
  }

  setSelectedDateReminders(DateTime selectedDate) {
    selectedDateReminders.clear();
    selectedDateReminders.addAll(List<Reminder>.from(allReminders
        .where((reminder) => reminder.date.isSameDate(selectedDate))));

    selectedDateReminders.sort(
      (a, b) => a.date.millisecondsSinceEpoch
          .compareTo(b.date.millisecondsSinceEpoch),
    );
  }

  setReminderToBeEdited(Reminder reminder) {
    reminderToBeEdited = Reminder.copy(reminder);
  }

  ReminderForm form = ReminderForm();

  onEditFormColor(color) {
    form.color = color;
    notifyListeners();
  }

  onEditFormTitle(title) {
    form.title = title;
    notifyListeners();
  }

  onEditFormDescription(description) {
    form.description = description;
  }

  final MaskedTextController dateController = MaskedTextController(
    mask: '00/00/0000',
  );
  bool dateHasError = false;
  String? dateError;
  onEditFormDate(String input) {
    dateHasError = false;
    notifyListeners();
    if (input.length < 10) {
      return;
    }
    final date = parseDate(input);
    if (date == null) {
      notifyListeners();
      return;
    }

    form.date = date;

    notifyListeners();
  }

  DateTime? parseDate(String input) {
    // Regular expression to check the basic structure
    final RegExp dateRegExp =
        RegExp(r'^(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])/[0-9]{4}$');

    if (!dateRegExp.hasMatch(input)) {
      // Does not match the pattern MM/DD/YYYY
      dateHasError = true;
      dateError = 'Invalid date';
      return null;
    }

    // Further logical validation
    try {
      final dateParts = input.split('/');
      final month = int.parse(dateParts[0]);
      final day = int.parse(dateParts[1]);
      final year = int.parse(dateParts[2]);

      if (year < 2024) {
        dateHasError = true;
        dateError = 'Cannot create reminders in the past';
        return null;
      }

      final date = DateTime(year, month, day);
      if (date.month != month || date.day != day || date.year != year) {
        dateHasError = true;
        dateError = 'Invalid date';
        return null;
      }

      return date;
    } catch (e) {
      dateHasError = true;
      dateError = 'Invalid date';
      return null;
    }
  }

  final timeController = MaskedTextController(mask: '00:00');
  String? timeError;
  bool timeHasError = false;
  late int hour;
  late int minutes;
  onEditFormTime(input) {
    timeError = null;
    timeHasError = false;
    notifyListeners();

    if (input.length < 5) {
      return;
    }

    if (!validateTime(input)) {
      notifyListeners();
      return;
    }

    hour = int.parse(input.split(':')[0]);
    minutes = int.parse(input.split(':')[1]);
  }

  bool validateTime(String input) {
    final timeRegExp = RegExp(r'^(?:[01]\d|2[0-3]):[0-5]\d$');

    if (!timeRegExp.hasMatch(input)) {
      timeHasError = true;
      timeError = 'Invalid time';
      return false;
    }

    return true;
  }

  bool isSaving = false;

  setSaving(bool value) {
    isSaving = value;
    notifyListeners();
  }

  Future<bool> onCreateReminder(DateTime selectedDate) async {
    if (!form.validateFields()) {
      return false;
    }

    form.date = DateTime(
      form.date!.year,
      form.date!.month,
      form.date!.day,
      hour,
      minutes,
    );

    final reminderPayload = form.createPayload();

    setSaving(true);
    final result = await addReminderUseCase.call(reminderPayload);
    setSaving(false);
    if (result.isOk()) {
      final reminder = result.unwrap();
      allReminders.add(reminder);
      setSelectedDateReminders(selectedDate);
      form = ReminderForm();
      return true;
    }

    return false;
  }
}
