import 'dart:ui';

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

  bool validateFields() {
    if (title != null && description != null && date != null && color != null) {
      return true;
    }
    return false;
  }

  Map<String, dynamic> createPayload() {
    return {
      'title': title,
      'description': description,
      'date': date!.toIso8601String(),
      'color': color!.toHex(),
    };
  }
}
