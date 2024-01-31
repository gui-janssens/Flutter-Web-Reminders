enum Weekday {
  monday('MON'),
  tuesday('TUE'),
  wednesday('WED'),
  thursday('THU'),
  friday('FRI'),
  saturday('SAT'),
  sunday('SUN');

  final String value;

  const Weekday(this.value);

  factory Weekday.fromInt(int i) {
    switch (i) {
      case 1:
        return Weekday.monday;
      case 2:
        return Weekday.tuesday;
      case 3:
        return Weekday.wednesday;
      case 4:
        return Weekday.thursday;
      case 5:
        return Weekday.friday;
      case 6:
        return Weekday.saturday;
      case 7:
        return Weekday.sunday;
      default:
        throw ArgumentError('Invalid weekday');
    }
  }
}
