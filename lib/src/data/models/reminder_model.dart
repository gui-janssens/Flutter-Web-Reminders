import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reminder_model.g.dart';

@JsonSerializable()
class ReminderModel {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String color;

  ReminderModel(this.id, this.title, this.description, this.date, this.color);

  Reminder toEntity() => Reminder(
        id,
        title,
        description,
        date,
        AppColors.convertHexToColor(color),
      );

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);
}
