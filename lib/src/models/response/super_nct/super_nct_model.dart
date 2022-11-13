import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

import '../../../adapter/adapter_xml.dart';

part 'super_nct_model.freezed.dart';
part 'super_nct_model.g.dart';

@freezed
class SuperNctModel with _$SuperNctModel {
  const factory SuperNctModel({
    /// 초단기 실황 조회
    @JsonKey(name: 'response') ResponseBean? response,
  }) = _SuperNctModel;

  factory SuperNctModel.fromJson(Map<String, Object?> json) =>
      _$SuperNctModelFromJson(json);
}

@freezed
class ResponseBean with _$ResponseBean {
  const factory ResponseBean({
    @JsonKey(name: 'header') HeaderSuperNct? header,
    @JsonKey(name: 'body') BodySuperNct? body,
  }) = _ResponseBean;

  factory ResponseBean.fromJson(Map<String, Object?> json) =>
      _$ResponseBeanFromJson(json);
}

@freezed
class BodySuperNct with _$BodySuperNct {
  const factory BodySuperNct({
    @JsonKey(name: 'dataType') String? dataType,
    @JsonKey(name: 'items') ItemsSuperNct? items,
    @JsonKey(name: 'pageNo') int? pageNo,
    @JsonKey(name: 'numOfRows') int? numOfRows,
    @JsonKey(name: 'totalCount') int? totalCount,
  }) = _BodySuperNct;

  factory BodySuperNct.fromJson(Map<String, Object?> json) =>
      _$BodySuperNctFromJson(json);
}

@freezed
class ItemsSuperNct with _$ItemsSuperNct {
  const factory ItemsSuperNct({
    @JsonKey(name: 'item') List<ItemSuperNct>? item,
  }) = _ItemsSuperNct;

  factory ItemsSuperNct.fromJson(Map<String, Object?> json) =>
      _$ItemsSuperNctFromJson(json);
}

@freezed
class ItemSuperNct with _$ItemSuperNct {
  const factory ItemSuperNct({
    @JsonKey(name: 'baseDate') String? baseDate,
    @JsonKey(name: 'baseTime') String? baseTime,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'nx') int? nx,
    @JsonKey(name: 'ny') int? ny,
    @JsonKey(name: 'obsrValue') String? obsrValue,
  }) = _ItemSuperNct;

  factory ItemSuperNct.fromJson(Map<String, Object?> json) =>
      _$ItemSuperNctFromJson(json);

  factory ItemSuperNct.fromXml(XmlElement xml) {
    return ItemSuperNct(
      baseDate: AdapterXml.resultXml(xml, 'baseDate'),
      baseTime: AdapterXml.resultXml(xml, 'baseTime'),
      nx: AdapterXml.resultXmlInt(xml, 'nx'),
      ny: AdapterXml.resultXmlInt(xml, 'ny'),
      category: AdapterXml.resultXml(xml, 'category'),
      obsrValue: AdapterXml.resultXml(xml, 'obsrValue'),
    );
  }
}

@freezed
class HeaderSuperNct with _$HeaderSuperNct {
  const factory HeaderSuperNct({
    @JsonKey(name: 'resultCode') String? resultCode,
    @JsonKey(name: 'resultMsg') String? resultMsg,
  }) = _HeaderSuperNct;

  factory HeaderSuperNct.fromJson(Map<String, Object?> json) =>
      _$HeaderSuperNctFromJson(json);
}
