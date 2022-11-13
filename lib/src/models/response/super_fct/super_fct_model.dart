import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

import '../../../adapter/adapter_xml.dart';

part 'super_fct_model.freezed.dart';
part 'super_fct_model.g.dart';

@freezed
class SuperFctModel with _$SuperFctModel {
  const factory SuperFctModel({
    /// 초단기 예보조회
    @JsonKey(name: 'response') ResponseSuperFct? response,
  }) = _SuperFctModel;

  factory SuperFctModel.fromJson(Map<String, Object?> json) =>
      _$SuperFctModelFromJson(json);
}

@freezed
class ResponseSuperFct with _$ResponseSuperFct {
  const factory ResponseSuperFct({
    @JsonKey(name: 'header') HeaderSuperFct? header,
    @JsonKey(name: 'body') BodySuperFct? body,
  }) = _ResponseSuperFct;

  factory ResponseSuperFct.fromJson(Map<String, Object?> json) =>
      _$ResponseSuperFctFromJson(json);
}

@freezed
class BodySuperFct with _$BodySuperFct {
  const factory BodySuperFct({
    @JsonKey(name: 'dataType') String? dataType,
    @JsonKey(name: 'items') ItemsSuperFct? items,
    @JsonKey(name: 'pageNo') int? pageNo,
    @JsonKey(name: 'numOfRows') int? numOfRows,
    @JsonKey(name: 'totalCount') int? totalCount,
  }) = _BodySuperFct;

  factory BodySuperFct.fromJson(Map<String, Object?> json) =>
      _$BodySuperFctFromJson(json);
}

@freezed
class ItemsSuperFct with _$ItemsSuperFct {
  const factory ItemsSuperFct({
    @JsonKey(name: 'item') List<ItemSuperFct>? item,
  }) = _ItemsSuperFct;

  factory ItemsSuperFct.fromJson(Map<String, Object?> json) =>
      _$ItemsSuperFctFromJson(json);
}

@freezed
class ItemSuperFct with _$ItemSuperFct {
  const factory ItemSuperFct({
    @JsonKey(name: 'baseDate') String? baseDate,
    @JsonKey(name: 'baseTime') String? baseTime,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'fcstDate') String? fcstDate,
    @JsonKey(name: 'fcstTime') String? fcstTime,
    @JsonKey(name: 'fcstValue') String? fcstValue,
    @JsonKey(name: 'nx') int? nx,
    @JsonKey(name: 'ny') int? ny,
  }) = _ItemSuperFct;

  factory ItemSuperFct.fromJson(Map<String, Object?> json) =>
      _$ItemSuperFctFromJson(json);

  factory ItemSuperFct.fromXml(XmlElement xml) {
    return ItemSuperFct(
      baseDate: AdapterXml.resultXml(xml, 'baseDate'),
      baseTime: AdapterXml.resultXml(xml, 'baseTime'),
      category: AdapterXml.resultXml(xml, 'category'),
      fcstDate: AdapterXml.resultXml(xml, 'fcstDate'),
      fcstTime: AdapterXml.resultXml(xml, 'fcstTime'),
      fcstValue: AdapterXml.resultXml(xml, 'fcstValue'),
      nx: AdapterXml.resultXmlInt(xml, 'nx'),
      ny: AdapterXml.resultXmlInt(xml, 'ny'),
    );
  }
}

@freezed
class HeaderSuperFct with _$HeaderSuperFct {
  const factory HeaderSuperFct({
    @JsonKey(name: 'resultCode') String? resultCode,
    @JsonKey(name: 'resultMsg') String? resultMsg,
  }) = _HeaderSuperFct;

  factory HeaderSuperFct.fromJson(Map<String, Object?> json) =>
      _$HeaderSuperFctFromJson(json);
}
