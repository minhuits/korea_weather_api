import '../../korea_weather_api.dart';

class SampleJson {
  static late final String _serviceKey;
  static final _date = DateTimeAdapter();

  SampleJson({required String serviceKey}) {
    _serviceKey = serviceKey;
  }

  static const testJSON = {
    "response": {
      "header": {"resultCode": "00", "resultMsg": "NORMAL_SERVICE"},
      "body": {
        "dataType": "JSON",
        "items": {
          "item": [
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "PTY",
              "nx": 55,
              "ny": 127,
              "obsrValue": "0"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "REH",
              "nx": 55,
              "ny": 127,
              "obsrValue": "81"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "RN1",
              "nx": 55,
              "ny": 127,
              "obsrValue": "0"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "T1H",
              "nx": 55,
              "ny": 127,
              "obsrValue": "12.1"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "UUU",
              "nx": 55,
              "ny": 127,
              "obsrValue": "0"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "VEC",
              "nx": 55,
              "ny": 127,
              "obsrValue": "84"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "VVV",
              "nx": 55,
              "ny": 127,
              "obsrValue": "0"
            },
            {
              "baseDate": "20221112",
              "baseTime": "0600",
              "category": "WSD",
              "nx": 55,
              "ny": 127,
              "obsrValue": "0"
            }
          ]
        },
        "pageNo": 1,
        "numOfRows": 1000,
        "totalCount": 8
      }
    }
  };

  static final weather10 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 10,
  );
  static final weather100 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 100,
    dateTime: _dateTime,
  );
  static final weather1000 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 1000,
    dateTime: _dateTime,
  );

  static final weatherODAM = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.oDAM,
  );
  static final weatherSHRT = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.sHRT,
  );
  static final weatherVSRT = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.vSRT,
  );

  static final _dateTime = _date.nowDate(minute: 00);
}
