import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../adapter/adapter.dart';
import '../models/enum/data_type.dart';
import '../models/request/requests.dart';
import 'client.dart';

class FctVersionAPI {
  late Dio _dio;
  final _date = DateTimeAdapter();

  FctVersionAPI({bool? isLog, PrettyDioLogger? customLogger}) {
    _dio = ApiClient.createDio(
      isLog: isLog ?? true,
      customLogger: customLogger,
    );
  }
  static const _getURL = '/getFcstVersion';

  /// 예보버전정보 Json Data
  Future<Response> getJsonData(WeatherVersion version) async {
    late Response response;

    try {
      final now = _date.nowWeatherVer(
        hour: version.date.hour - 1,
        version: version,
      );
      response = await _dio.get(
        _getURL,
        queryParameters: version.copyWith(dateTime: now).toJson(),
      );
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }

    return response.data;
  }

  /// 예보버전정보 XML Data
  Future<Response> getXmlData(WeatherVersion version) async {
    late Response response;

    try {
      final now = _date.nowWeatherVer(
        hour: version.date.hour - 1,
        version: version,
      );

      response = await _dio.get(
        _getURL,
        queryParameters: version
            .copyWith(dataType: DataType.xml, dateTime: _date.getFctDate(now))
            .toJson(),
      );
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }

    return response.data;
  }
}
