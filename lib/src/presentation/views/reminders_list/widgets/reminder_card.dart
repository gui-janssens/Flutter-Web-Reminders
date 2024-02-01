import 'package:codelitt_calendar/src/domain/domain.dart';
import 'package:codelitt_calendar/src/utils/utlls.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:svg_flutter/svg.dart';

class ReminderCard extends StatelessWidget {
  final Reminder reminder;
  final bool isFirst;
  final bool isLast;
  const ReminderCard({
    Key? key,
    required this.reminder,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 40 : 0,
        bottom: isLast ? 40 : 0,
        left: 40,
        right: 17,
      ),
      child: Stack(
        children: [
          const SizedBox(
            height: 135 + 18,
            width: double.maxFinite,
          ),
          Container(
            height: 135,
            width: double.maxFinite,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.boxShadow,
                  offset: Offset(0, 4),
                  blurRadius: 24,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(
                          height: double.maxFinite,
                          width: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: reminder.color,
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                reminder.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.midGrey,
                                ),
                              ),
                              const Gap(6),
                              Text(
                                reminder.description,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: double.maxFinite,
                  width: 1,
                  color: AppColors.boxShadow,
                ),
                Container(
                  width: 110,
                  height: double.maxFinite,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/clock.svg',
                        height: 34,
                        fit: BoxFit.fitHeight,
                      ),
                      const Gap(3),
                      Text(
                        DateFormat('HH:mm').format(reminder.date),
                        style: const TextStyle(
                          color: AppColors.midGrey,
                          fontSize: 35,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.editButtonGradientStart,
                    AppColors.editButtonGradientStop,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/edit.svg',
                  height: 18,
                  width: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
