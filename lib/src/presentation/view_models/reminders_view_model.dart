import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/domain/use_cases/delete_reminder_use_case.dart';
import 'package:codelitt_calendar/src/presentation/forms/reminder_form.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class RemindersViewModel extends BaseViewModel {
  final GetRemindersUseCase getRemindersUseCase;
  final AddReminderUseCase addReminderUseCase;
  final UpdateReminderUseCase updateReminderUseCase;
  final DeleteReminderUseCase deleteReminderUseCase;

  RemindersViewModel(
    this.getRemindersUseCase,
    this.addReminderUseCase,
    this.updateReminderUseCase,
    this.deleteReminderUseCase,
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
    form = ReminderForm.fromReminder(reminderToBeEdited!);
    dateController.text = DateFormat('MM/dd/yyyy').format(form.date!);
    timeController.text = DateFormat('HH:mm').format(form.date!);
    hour = form.date!.hour;
    minutes = form.date!.minute;

    notifyListeners();
  }

  ReminderForm form = ReminderForm();

  clearForm(DateTime selectedDate) {
    form = ReminderForm();
    setDateControllerText(selectedDate);
    timeController.text = '';
  }

  setDateControllerText(DateTime date) {
    dateController.text = DateFormat('MM/dd/yyyy').format(date);
    form.date = date;
  }

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

  Future<SaveReminderResult> onUpdateReminder() async {
    if (!form.validateFields()) {
      return SaveReminderResult.fail;
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
    final result = await updateReminderUseCase.call(
        reminderPayload, reminderToBeEdited!.id);
    setSaving(false);

    if (result.isErr()) {
      return SaveReminderResult.fail;
    }

    final Reminder updatedReminder = Reminder(
      reminderToBeEdited!.id,
      form.title!,
      form.description!,
      form.date!,
      form.color!,
    );

    allReminders[allReminders.indexWhere((element) => element.id == form.id)] =
        updatedReminder;

    selectedDateReminders[selectedDateReminders
        .indexWhere((element) => element.id == form.id)] = updatedReminder;

    notifyListeners();

    late SaveReminderResult successType;
    if (form.date!.isSameDate(reminderToBeEdited!.date)) {
      successType = SaveReminderResult.savedInTheSameDate;
    } else {
      successType = SaveReminderResult.savedInADifferentDate;
    }

    reminderToBeEdited = null;

    return successType;
  }

  Future<SaveReminderResult> onCreateReminder(DateTime selectedDate) async {
    if (!form.validateFields()) {
      return SaveReminderResult.fail;
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
    if (result.isErr()) {
      return SaveReminderResult.fail;
    }

    final reminder = result.unwrap();
    allReminders.add(reminder);
    setSelectedDateReminders(selectedDate);
    late SaveReminderResult successType;
    if (form.date!.isSameDate(selectedDate)) {
      successType = SaveReminderResult.savedInTheSameDate;
    } else {
      successType = SaveReminderResult.savedInADifferentDate;
    }

    return successType;
  }

  bool isDeleting = false;

  setDeleting(bool value) {
    isDeleting = value;
    notifyListeners();
  }

  Future<bool> onDeleteReminder() async {
    setDeleting(true);
    final result = await deleteReminderUseCase.call(reminderToBeEdited!.id);
    setDeleting(false);

    if (result.isOk()) {
      allReminders
          .removeWhere((element) => element.id == reminderToBeEdited!.id);
      selectedDateReminders
          .removeWhere((element) => element.id == reminderToBeEdited!.id);
      notifyListeners();
      return true;
    }

    return false;
  }
}

enum SaveReminderResult {
  fail('fail'),
  savedInTheSameDate('savedInTheSameDate'),
  savedInADifferentDate('savedInADifferentDate');

  final String value;

  const SaveReminderResult(this.value);

  bool get isCreatedInADifferentDate =>
      this == SaveReminderResult.savedInADifferentDate;

  bool get isFail => this == SaveReminderResult.fail;
}
