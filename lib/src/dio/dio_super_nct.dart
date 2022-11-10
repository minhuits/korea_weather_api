import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

import '../adapter/adapter_datetime.dart';
import '../models/enum/data_type.dart';
import '../models/request/weather.dart';
import '../models/response/super_nct/super_nct.dart';

/// 초단기 실황
class DioSuperNct {
  late Dio _dio;
  final _date = DateTimeAdapter();

  DioSuperNct() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://apis.data.go.kr/1360000'),
    );
  }

  /// 초단기실황조회 (JSON) SuperNctItem
  Future<SuperNctItem?> getSuperNctItemJSON(Weather weather) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtNcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> superNctItem 변환
      return SuperNctItem.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 초단기실황조회 (JSON) Item
  Future<Item?> getItemJSON(Weather weather, int index) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtNcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> superNctItem 변환
      final json = SuperNctItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList[index];
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 초단기실황조회 (JSON) Item List
  Future<List<Item>?> getItemListJSON(Weather weather) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtNcst',
        queryParameters: weather
            .copyWith(dataType: DataType.json, dateTime: nowDate)
            .toJson(),
      );

      // json -> superNctItem 변환
      final json = SuperNctItem.fromJson(response.data);
      final itemList = json.response.body.items.item;

      // null 체크!
      if (itemList.isEmpty) return Future.value(null);

      return itemList;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
    }

    return Future.value();
  }

  /// 초단기실황조회 (XML) Item
  Future<Item?> getItemXML(Weather weather, int index) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtNcst',
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

  /// 초단기실황조회 (XML) Item List
  Future<List<Item>?> getItemListXML(Weather weather) async {
    try {
      final nowDate = _date.getSuperFctDate(_date.nowDateTime());
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtNcst',
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
