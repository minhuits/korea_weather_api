import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'datetime_adapter.dart';

void main() {
  group('getFctData() Test', () {
    final date = DateTimeAdapterTest();

    void lineLog(int i) {
      if (((i + 1) % 3).floor() == 0) {
        debugPrint('===========================');
      }
    }

    test('DateTime Test', () {
      int math(DateTime now) => (((now.hour + 1) % 24) / 3).floor();

      String getDateTime(DateTime now) {
        final dateTimeList = [
          '(1일 전) 23시',
          '2시',
          '5시',
          '8시',
          '11시',
          '14시',
          '17시',
          '20시',
        ];

        if (now.hour == 23) return '23시';

        return dateTimeList[math(now)];
      }

      String getDateDay(int i) => getDateTime(date.nowDate(hour: i));

      for (int i = 0; i < 24; i++) {
        lineLog(i);
        final date = i < 10 ? '0$i시' : '$i시';

        debugPrint('$date : ${getDateDay(i)}');
      }
    });

    test('getFctDate1 (기존)', () {
      DateTime hour1(int i) => date.getFctDate1(date.nowDate(hour: i));

      for (int i = 0; i < 24; i++) {
        lineLog(i);
        final date = i < 10 ? '0$i시' : '$i시';

        debugPrint('$date : ${hour1(i)}');
      }
    });

    test('getFctDate2 (리팩토링)', () {
      DateTime hour2(int i) => date.getFctDate2(date.nowDate(hour: i));

      for (int i = 0; i < 24; i++) {
        lineLog(i);
        final date = i < 10 ? '0$i시' : '$i시';

        debugPrint('$date : ${hour2(i)}');
      }
    });
  });
}
