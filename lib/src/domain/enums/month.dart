enum Month {
  january('January'),
  february('February'),
  march('March'),
  april('April'),
  may('May'),
  june('June'),
  july('July'),
  august('August'),
  september('September'),
  october('October'),
  november('November'),
  december('December');

  final String name;

  const Month(this.name);

  factory Month.fromInt(int i) {
    switch (i) {
      case 1:
        return Month.january;
      case 2:
        return Month.february;
      case 3:
        return Month.march;
      case 4:
        return Month.april;
      case 5:
        return Month.may;
      case 6:
        return Month.june;
      case 7:
        return Month.july;
      case 8:
        return Month.august;
      case 9:
        return Month.september;
      case 10:
        return Month.october;
      case 11:
        return Month.november;
      case 12:
        return Month.december;
      default:
        throw 'Invalid month $i';
    }
  }
}
