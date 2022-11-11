import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/enum/data_type.dart';
import '../../../models/request/weather.dart';
import '../../../models/response/super_fct/super_fct.dart';
import '../../adapter_datetime.dart';

/// 초단기예보
class DioSuperFctJson {
  late Dio _dio;
  final _date = DateTimeAdapter();

  DioSuperFctJson() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://apis.data.go.kr/1360000'),
    );
  }

  /// 초단기예보정보 (JSON) SuperFctItem
  Future<SuperFctItem?> getJSON(Weather weather) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> SuperFctItem 변환
      return SuperFctItem.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 초단기예보정보 (JSON) Item
  Future<Item?> getItemJSON(Weather weather, int index) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> SuperFctItem 변환
      final json = SuperFctItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      debugPrint('itemList.isNotEmpty : ${itemList.isNotEmpty}');
      if (itemList.isEmpty) return Future.value(null);

      return itemList[index];
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 초단기예보정보 (JSON) Item List
  Future<List<Item>?> getItemListJSON(Weather weather) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> superFctItem 변환
      final json = SuperFctItem.fromJson(response.data);
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
