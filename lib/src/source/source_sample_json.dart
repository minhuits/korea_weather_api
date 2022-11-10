import 'package:korea_weather_api/src/models/enum/file_type.dart';

import '../models/request/weather.dart';
import '../models/request/weather_version.dart';

class SourceSampleJSON {
  static DateTime _nowDateTime({int? day, int? hour, int? minute}) {
    return DateTime(
      DateTime.now().year,
      DateTime.now().month,
      day ?? DateTime.now().day,
      hour ?? DateTime.now().hour,
      minute ?? DateTime.now().minute,
    );
  }

  static final _dateTime = _nowDateTime(minute: 00);

  static Weather getWeather10({required String serviceKey}) {
    return Weather(
      serviceKey: serviceKey,
      pageNo: 1,
      numOfRows: 10,
      nx: 60,
      ny: 127,
    );
  }

  static Weather getWeather100({required String serviceKey}) {
    return Weather(
      serviceKey: serviceKey,
      pageNo: 1,
      numOfRows: 100,
      nx: 62,
      ny: 128,
      dateTime: _dateTime,
    );
  }

  static Weather getWeather1000({required String serviceKey}) {
    return Weather(
      serviceKey: 'serviceKey',
      pageNo: 1,
      numOfRows: 1000,
      nx: 58,
      ny: 129,
      dateTime: _dateTime,
    );
  }

  static WeatherVersion getWeatherVersionODAM({required String serviceKey}) {
    return WeatherVersion(
      serviceKey: serviceKey,
      numOfRows: 1000,
      pageNo: 1,
      dateTime: _dateTime,
      fileType: FileType.oDAM,
    );
  }

  static WeatherVersion getWeatherVersionSHRT({required String serviceKey}) {
    return WeatherVersion(
      serviceKey: serviceKey,
      numOfRows: 1000,
      pageNo: 1,
      dateTime: _dateTime,
      fileType: FileType.sHRT,
    );
  }

  static WeatherVersion getWeatherVersionVSRT({required String serviceKey}) {
    return WeatherVersion(
      serviceKey: serviceKey,
      numOfRows: 1000,
      pageNo: 1,
      dateTime: _dateTime,
      fileType: FileType.vSRT,
    );
  }
}
