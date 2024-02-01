import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/add_reminder.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/custom_scroll_bar.dart';
import 'package:codelitt_calendar/src/presentation/views/reminders_list/widgets/reminder_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RemindersList extends StatelessWidget {
  final DateTime selectedDate;
  final RemindersViewModel remindersViewModel;

  RemindersList({
    super.key,
    required this.selectedDate,
    required this.remindersViewModel,
  });

  final ScrollController scrollController = ScrollController();

  List<Reminder> get selectedDateReminders =>
      remindersViewModel.selectedDateReminders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
          child: AddReminder(
            selectedDate,
            clearForm: () => remindersViewModel.clearForm(selectedDate),
          ),
        ),
        const Gap(20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: CustomScrollbar(
              controller: scrollController,
              child: ListView.separated(
                controller: scrollController,
                itemCount: selectedDateReminders.length,
                itemBuilder: (context, index) => ReminderCard(
                  reminder: selectedDateReminders[index],
                  isFirst: index == 0,
                  isLast: index == selectedDateReminders.length - 1,
                  onEditReminder: (reminder) {
                    remindersViewModel.setReminderToBeEdited(reminder);
                    GoRouter.of(context).go(EditReminderView.path);
                  },
                ),
                separatorBuilder: (_, index) {
                  return const Gap(15);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
