import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../adapter/adapter.dart';
import '../models/models.dart';
import 'weather_client.dart';

class NctAPI {
  late Dio _dio;
  final _date = DateTimeAdapter();

  NctAPI({bool? isLog, PrettyDioLogger? customLogger}) {
    _dio = ApiClient.createDio(
      isLog: isLog ?? true,
      customLogger: customLogger,
    );
  }

  static const _getURL = '/getUltraSrtNcst';

  /// 초단기실황정보 Json Data
  Future getJsonData(Weather weather) async {
    late Response response;

    try {
      final nowDate = _date.getSuperNctDate(weather.date);
      response = await _dio.get(
        _getURL,
        queryParameters: weather.copyWith(dateTime: nowDate).toJson(),
      );
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }

    return response.data;
  }

  /// 초단기실황정보 XML Data
  Future getXmlData(Weather weather) async {
    late Response response;

    try {
      final nowDate = _date.getSuperNctDate(weather.date);
      response = await _dio.get(
        _getURL,
        queryParameters: weather
            .copyWith(dataType: DataType.xml, dateTime: nowDate)
            .toJson(),
      );
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }

    return response.data;
  }
}
