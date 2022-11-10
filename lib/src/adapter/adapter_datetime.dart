class DateTimeAdapter {
  /// 새로운 new dateTime 생성
  DateTime nowDateTime({int? day, int? hour, int? minute}) {
    DateTime baseDateTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      day ?? DateTime.now().day,
      hour ?? DateTime.now().hour,
      minute ?? DateTime.now().minute,
    );
    return baseDateTime;
  }

  /// 초단기 DateTime
  DateTime getSuperFctDate(DateTime now) {
    // 40분 이전이면 현재 시보다 1시간 전 `base_time`을 요청한다.
    if (now.minute <= 40) {
      if (now.hour == 0) {
        // 단. 00시 이면 `base_date`는 전날이고 `base_time`은 2330이다.
        return nowDateTime(day: now.day - 1, hour: 23, minute: 30);
      }
      return nowDateTime(hour: now.hour - 1, minute: 30);
    }

    //40분 이후면 현재 시와 같은 `base_time`을 요청한다.
    return nowDateTime(minute: 30);
  }

  /// 단기 DateTime
  DateTime getFucDate(DateTime now) {
    if (shortNowIs(now, 2)) {
      return nowDateTime(day: now.day - 1, hour: 23, minute: 00);
    } else if (shortNowIs(now, 5)) {
      return nowDateTime(hour: 02, minute: 00);
    } else if (shortNowIs(now, 8)) {
      return nowDateTime(hour: 05, minute: 00);
    } else if (shortNowIs(now, 11)) {
      return nowDateTime(hour: 08, minute: 00);
    } else if (shortNowIs(now, 14)) {
      return nowDateTime(hour: 11, minute: 00);
    } else if (shortNowIs(now, 17)) {
      return nowDateTime(hour: 14, minute: 00);
    } else if (shortNowIs(now, 20)) {
      return nowDateTime(hour: 17, minute: 00);
    } else if (shortNowIs(now, 23)) {
      return nowDateTime(hour: 20, minute: 00);
    } else {
      return nowDateTime(hour: 23, minute: 00);
    }
  }

  ///(a-3)시 11분 ~ a시 10분 사이 예보
  bool shortNowIs(DateTime now, int a) {
    return now.hour < a || (now.hour == a && now.minute <= 10);
  }
}
