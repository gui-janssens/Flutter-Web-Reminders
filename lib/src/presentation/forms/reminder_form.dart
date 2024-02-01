import 'dart:ui';

class ReminderForm {
  String? title;
  String? description;
  DateTime? date;
  Color? color;

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
      'date': date,
      'color': color,
    };
  }
}
