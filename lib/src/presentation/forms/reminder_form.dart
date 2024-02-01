import 'dart:ui';

import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';

class ReminderForm {
  String? id;
  String? title;
  String? description;
  DateTime? date;
  Color? color;

  ReminderForm() {
    color = ReminderColors.colorsList.first;
  }

  factory ReminderForm.fromReminder(Reminder reminder) {
    var temp = ReminderForm();

    temp.id = reminder.id;
    temp.title = reminder.title;
    temp.description = reminder.description;
    temp.date = reminder.date;
    temp.color = reminder.color;

    return temp;
  }

  bool validateFields() {
    if (title != null && description != null && date != null && color != null) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> createPayload() {
    var temp = {
      'title': title,
      'description': description,
      'date': date!.toIso8601String(),
      'color': color!.toHex(),
    };

    if (id != null) temp['id'] = id;

    return temp;
  }
}
