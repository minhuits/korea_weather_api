import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

import '../models/enum/data_type.dart';
import '../models/request/weather.dart';
import '../models/response/super_fct/super_fct.dart';

/// 초단기예보
class DioSuperFct {
  late Dio _dio;

  DioSuperFct() {
    _dio = Dio(
      BaseOptions(baseUrl: 'https://apis.data.go.kr/1360000'),
    );
  }

  /// 초단기예보정보 (JSON) SuperFctItem
  Future<SuperFctItem?> getJSON(Weather weather) async {
    try {
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather.copyWith(dataType: DataType.json).toJson(),
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
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather.copyWith(dataType: DataType.json).toJson(),
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
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather.copyWith(dataType: DataType.json).toJson(),
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

  /// 초단기예보정보 (XML) Item
  Future<Item?> getItemXML(Weather weather, int index) async {
    try {
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather.copyWith(dataType: DataType.xml).toJson(),
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

  /// 초단기예보정보 (XML) Item List
  Future<List<Item>?> getItemListXML(Weather weather) async {
    try {
      final response = await _dio.get(
        '/VilageFcstInfoService_2.0/getUltraSrtFcst',
        queryParameters: weather.copyWith(dataType: DataType.xml).toJson(),
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
