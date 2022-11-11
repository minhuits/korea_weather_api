import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/enum/data_type.dart';
import '../../../models/request/weather.dart';
import '../../../models/response/fct_version/fct_version.dart';
import '../../adapter_datetime.dart';

/// 예보버전
class DioFctVersionJson {
  late Dio _dio;
  final _date = DateTimeAdapter();

  DioFctVersionJson() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://apis.data.go.kr/1360000'),
    );
  }

  /// 예보버전조회 (JSON) FctVersionItem
  Future<FctVersionItem?> getJSON(Weather weather) async {
    try {
      final nowDate = _date.nowDateTime(hour: DateTime.now().hour - 1);
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctVersionItem 변환
      return FctVersionItem.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 예보버전조회 (JSON) Item
  Future<Item?> getItemJSON(Weather weather, int index) async {
    try {
      final nowDate = _date.nowDateTime(hour: DateTime.now().hour - 1);
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctVersionItem 변환
      final json = FctVersionItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList[index];
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 예보버전조회 (JSON) Item List
  Future<List<Item>?> getItemListJSON(Weather weather) async {
    try {
      final nowDate = _date.nowDateTime(hour: DateTime.now().hour - 1);
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctVersionItem 변환
      final json = FctVersionItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }
}