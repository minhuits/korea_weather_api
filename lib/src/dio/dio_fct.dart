import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

import '../adapter/adapter_datetime.dart';
import '../models/enum/data_type.dart';
import '../models/request/weather.dart';
import '../models/response/fct/fct.dart';

/// 단기예보
class DioFct {
  late Dio _dio;
  final _date = DateTimeAdapter();

  DioFct() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://apis.data.go.kr/1360000'),
    );
  }

  /// 단기예보정보 (JSON) FctItem
  Future<FctItem?> getFctItemJSON(Weather weather) async {
    try {
      final nowDate = _date.getFucDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctItem 변환
      return FctItem.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 단기예보정보 (JSON) Item
  Future<Item?> getItemJSON(Weather weather, int index) async {
    try {
      final nowDate = _date.getFucDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctItem 변환
      final json = FctItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList[index];
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 단기예보정보 (JSON) Item List
  Future<List<Item>?> getItemListJSON(Weather weather) async {
    try {
      final nowDate = _date.getFucDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> FctItem 변환
      final json = FctItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 단기예보정보 (XML) Item
  Future<Item?> getItemXML(Weather weather, int index) async {
    try {
      final nowDate = _date.getFucDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.xml, dateTime: nowDate)
            .toJson(),
      );

      final document = XmlDocument.parse(response.data);
      final item = document.findAllElements('item');
      final itemList = item.map<Item>((e) => Item.fromXml(e)).toList();

      // null 체크
      if (itemList.isEmpty) return Future.value(null);

      return itemList[index];
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 단기예보정보 (XML) Item List
  Future<List<Item>?> getItemListXML(Weather weather) async {
    try {
      final nowDate = _date.getFucDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getVilageFcst',
        queryParameters: weather
            .copyWith(dataType: DataType.xml, dateTime: nowDate)
            .toJson(),
      );

      final document = XmlDocument.parse(response.data);
      final item = document.findAllElements('item');
      final itemList = item.map<Item>((e) => Item.fromXml(e)).toList();

      // null 체크
      if (itemList.isEmpty) return Future.value(null);

      return itemList;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }
}
