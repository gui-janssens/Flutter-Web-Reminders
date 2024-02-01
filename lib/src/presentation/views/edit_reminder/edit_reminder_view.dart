import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/edit_reminder/widgets/custom_text_field.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditReminderView extends StatelessWidget {
  static const path = '/edit-reminder';

  const EditReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<RemindersViewModel, CalendarViewModel>(
      builder: (context, remindersViewModel, calendarViewModel, _) {
        return Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${remindersViewModel.isEditing ? 'Edit reminder - ' : 'Add reminder - '} ${DateFormat('EEEE, MMM d, y').format(calendarViewModel.selectedDate)}',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(22),
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.darkGrey,
                ),
              ),
              const Gap(1),
              CustomTextField(
                hintText: 'Title',
                onChanged: (v) {},
              ),
              const Gap(30),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.darkGrey,
                ),
              ),
              const Gap(1),
              CustomTextField(
                hintText: 'Description',
                height: 76,
                minLines: 5,
                maxLines: 5,
                onChanged: (v) {},
              ),
              const Gap(30),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const Gap(1),
                        CustomTextField(
                          hintText: 'MM/DD/YYYY',
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Time',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const Gap(1),
                        CustomTextField(
                          hintText: 'HH:MM',
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
