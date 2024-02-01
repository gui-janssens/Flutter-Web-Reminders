import 'dart:ui';

class Reminder {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Color color;

  Reminder(this.id, this.title, this.description, this.date, this.color);

  factory Reminder.copy(Reminder reminder) {
    return Reminder(
      reminder.id,
      reminder.title,
      reminder.description,
      reminder.date,
      reminder.color,
    );
  }
}
