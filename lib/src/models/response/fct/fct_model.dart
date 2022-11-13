import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

import '../../../adapter/adapter_xml.dart';

part 'fct_model.freezed.dart';
part 'fct_model.g.dart';

@freezed
class FctModel with _$FctModel {
  const factory FctModel({
    /// 단기 예보조회
    @JsonKey(name: 'response') ResponseFct? response,
  }) = _FctModel;

  factory FctModel.fromJson(Map<String, Object?> json) =>
      _$FctModelFromJson(json);
}

@freezed
class ResponseFct with _$ResponseFct {
  const factory ResponseFct({
    @JsonKey(name: 'header') HeaderFct? header,
    @JsonKey(name: 'body') BodyFct? body,
  }) = _ResponseFct;

  factory ResponseFct.fromJson(Map<String, Object?> json) =>
      _$ResponseFctFromJson(json);
}

@freezed
class BodyFct with _$BodyFct {
  const factory BodyFct({
    @JsonKey(name: 'dataType') String? dataType,
    @JsonKey(name: 'items') ItemsFct? items,
    @JsonKey(name: 'pageNo') int? pageNo,
    @JsonKey(name: 'numOfRows') int? numOfRows,
    @JsonKey(name: 'totalCount') int? totalCount,
  }) = _BodyFct;

  factory BodyFct.fromJson(Map<String, Object?> json) =>
      _$BodyFctFromJson(json);
}

@freezed
class ItemsFct with _$ItemsFct {
  const factory ItemsFct({
    @JsonKey(name: 'item') List<ItemFct>? item,
  }) = _ItemsFct;

  factory ItemsFct.fromJson(Map<String, Object?> json) =>
      _$ItemsFctFromJson(json);
}

@freezed
class ItemFct with _$ItemFct {
  const factory ItemFct({
    @JsonKey(name: 'baseDate') String? baseDate,
    @JsonKey(name: 'baseTime') String? baseTime,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'fcstDate') String? fcstDate,
    @JsonKey(name: 'fcstTime') String? fcstTime,
    @JsonKey(name: 'fcstValue') String? fcstValue,
    @JsonKey(name: 'nx') int? nx,
    @JsonKey(name: 'ny') int? ny,
  }) = _ItemFct;

  factory ItemFct.fromJson(Map<String, Object?> json) =>
      _$ItemFctFromJson(json);

  factory ItemFct.fromXml(XmlElement xml) {
    return ItemFct(
      baseDate: AdapterXml.resultXml(xml, 'baseDate'),
      baseTime: AdapterXml.resultXml(xml, 'baseTime'),
      nx: AdapterXml.resultXmlInt(xml, 'nx'),
      ny: AdapterXml.resultXmlInt(xml, 'ny'),
      category: AdapterXml.resultXml(xml, 'category'),
      fcstDate: AdapterXml.resultXml(xml, 'fcstDate'),
      fcstTime: AdapterXml.resultXml(xml, 'fcstTime'),
      fcstValue: AdapterXml.resultXml(xml, 'fcstValue'),
    );
  }
}

@freezed
class HeaderFct with _$HeaderFct {
  const factory HeaderFct({
    @JsonKey(name: 'resultCode') String? resultCode,
    @JsonKey(name: 'resultMsg') String? resultMsg,
  }) = _HeaderFct;

  factory HeaderFct.fromJson(Map<String, Object?> json) =>
      _$HeaderFctFromJson(json);
}
