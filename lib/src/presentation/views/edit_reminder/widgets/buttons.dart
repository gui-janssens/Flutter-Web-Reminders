import 'package:codelitt_calendar/src/presentation/presentation.dart';
import 'package:codelitt_calendar/src/presentation/views/edit_reminder/widgets/created_in_a_different_date_dialog.dart';
import 'package:codelitt_calendar/src/presentation/views/edit_reminder/widgets/toast.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class Buttons extends StatelessWidget {
  final RemindersViewModel remindersViewModel;
  final CalendarViewModel calendarViewModel;

  const Buttons({
    super.key,
    required this.remindersViewModel,
    required this.calendarViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: remindersViewModel.isEditing
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (remindersViewModel.isEditing)
          CustomButton(
            onTap: () async {
              final result = await remindersViewModel.onDeleteReminder();

              if (result) {
                GoRouter.of(context).go(RemindersView.path);
              }
            },
            text: 'Remove',
            isLoading: remindersViewModel.isDeleting,
            color: AppColors.removeReminder,
          ),
        const Gap(15),
        Row(
          children: [
            CustomButton(
              onTap: () {
                GoRouter.of(context).go(RemindersView.path);
              },
              text: 'Cancel',
              color: AppColors.cancelReminder,
            ),
            const Gap(15),
            CustomButton(
              onTap: () async {
                late SaveReminderResult result;
                if (remindersViewModel.isEditing) {
                  result = await remindersViewModel.onUpdateReminder();
                } else {
                  result = await remindersViewModel
                      .onCreateReminder(calendarViewModel.selectedDate);
                }
                if (result.isFail) {
                  showToast(
                    context,
                    'Please, fill in all the fields.',
                  );
                } else {
                  if (result.isCreatedInADifferentDate) {
                    createdInADifferentDateDialog(
                      context,
                      onTap: (optionChosen) {
                        if (optionChosen == ButtonChosen.goBackToPreviousDate) {
                          GoRouter.of(context).go(RemindersView.path);
                        } else {
                          // we set the selected date
                          calendarViewModel.setSelectedDate(
                            remindersViewModel.form.date!,
                          );

                          // we set the selected calendar month
                          calendarViewModel.setSelectedMonthInCalendar(
                            remindersViewModel.form.date!,
                          );

                          // let's get the reminders for the selected date
                          remindersViewModel.setSelectedDateReminders(
                            remindersViewModel.form.date!,
                          );

                          GoRouter.of(context).go(RemindersView.path);
                        }
                      },
                    );
                  } else {
                    GoRouter.of(context).go(RemindersView.path);
                  }
                }
              },
              text: 'Save',
              isLoading: remindersViewModel.isSaving,
              color: AppColors.saveReminder,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color color;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: AppColors.boxShadow,
              offset: Offset(0, 4),
              blurRadius: 28,
              spreadRadius: 2,
            )
          ],
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
