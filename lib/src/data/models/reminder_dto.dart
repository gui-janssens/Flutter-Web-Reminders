import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reminder_dto.g.dart';

@JsonSerializable()
class ReminderDto {
  final String title;
  final String description;
  final DateTime date;
  final String color;

  ReminderDto(this.title, this.description, this.date, this.color);

  Reminder toEntity() => Reminder(
        title,
        description,
        date,
        AppColors.convertHexToColor(color),
      );
}
