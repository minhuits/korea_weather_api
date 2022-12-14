class DateTimeAdapterTest {
  /// 새로운 new dateTime 생성
  DateTime nowDate({
    int? day,
    int? hour,
    int? minute,
  }) {
    final nowDate = DateTime.now();

    return DateTime(
      nowDate.year,
      nowDate.month,
      day ?? nowDate.day,
      hour ?? nowDate.hour,
      minute ?? nowDate.minute,
    );
  }

  /// 단기 예보 DateTime (기존)
  DateTime getFctDate1(DateTime now) {
    if (shortNowIs(now, 2)) {
      return nowDate(day: now.day - 1, hour: 23, minute: 00);
    } else if (shortNowIs(now, 5)) {
      return nowDate(hour: 02, minute: 00);
    } else if (shortNowIs(now, 8)) {
      return nowDate(hour: 05, minute: 00);
    } else if (shortNowIs(now, 11)) {
      return nowDate(hour: 08, minute: 00);
    } else if (shortNowIs(now, 14)) {
      return nowDate(hour: 11, minute: 00);
    } else if (shortNowIs(now, 17)) {
      return nowDate(hour: 14, minute: 00);
    } else if (shortNowIs(now, 20)) {
      return nowDate(hour: 17, minute: 00);
    } else if (shortNowIs(now, 23)) {
      return nowDate(hour: 20, minute: 00);
    } else {
      return nowDate(hour: 23, minute: 00);
    }
  }

  ///(a-3)시 11분 ~ a시 10분 사이 예보
  bool shortNowIs(DateTime now, int a) {
    return now.hour < a || (now.hour == a && now.minute <= 10);
  }

  /// 단기 예보 DateTime (리팩토링)
  DateTime getFctDate2(DateTime now) {
    final fctList = [
      _hour23(now),
      _hour(2),
      _hour(5),
      _hour(8),
      _hour(11),
      _hour(14),
      _hour(17),
      _hour(20),
    ];

    if (now.hour == 23) return _hour(23);

    return fctList[_dateHour(now)];
  }

  int _dateHour(DateTime now) => (((now.hour + 1) % 24) / 3).floor();

  DateTime _hour23(DateTime now) =>
      nowDate(day: now.day - 1, hour: 23, minute: 00);

  DateTime _hour(int hour) => nowDate(hour: hour, minute: 00);
}
