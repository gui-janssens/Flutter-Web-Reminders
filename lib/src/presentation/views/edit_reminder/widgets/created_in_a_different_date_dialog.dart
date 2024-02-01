import 'package:flutter/cupertino.dart';

enum ButtonChosen {
  goBackToPreviousDate,
  moveToReminderDate,
}

createdInADifferentDateDialog(
  BuildContext context, {
  required Function(ButtonChosen) onTap,
}) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('Different dates'),
      content: const Text(
        'You saved this reminder in a different date. Would you like to go back to the current date or move to the reminder\'s date?',
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Go back to previous date'),
          onPressed: () {
            onTap(ButtonChosen.goBackToPreviousDate);
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            onTap(ButtonChosen.moveToReminderDate);
            Navigator.of(context).pop();
          },
          child: const Text('Move to reminder date'),
        ),
      ],
    ),
  );
}
