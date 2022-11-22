import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

import '../../../adapter/adapter_xml.dart';

part 'fct_version_model.freezed.dart';
part 'fct_version_model.g.dart';

@freezed
class FctVersionModel with _$FctVersionModel {
  const factory FctVersionModel({
    /// 예보버전 조회
    @JsonKey(name: 'response') ResponseFctVersion? response,
  }) = _FctVersionModel;

  factory FctVersionModel.fromJson(Map<String, Object?> json) =>
      _$FctVersionModelFromJson(json);
}

@freezed
class ResponseFctVersion with _$ResponseFctVersion {
  const factory ResponseFctVersion({
    @JsonKey(name: 'header') HeaderFctVersion? header,
    @JsonKey(name: 'body') BodyFctVersion? body,
  }) = _ResponseFctVersion;

  factory ResponseFctVersion.fromJson(Map<String, Object?> json) =>
      _$ResponseFctVersionFromJson(json);
}

@freezed
class BodyFctVersion with _$BodyFctVersion {
  const factory BodyFctVersion({
    @JsonKey(name: 'dataType') String? dataType,
    @JsonKey(name: 'items') ItemsFctVersion? items,
    @JsonKey(name: 'pageNo') int? pageNo,
    @JsonKey(name: 'numOfRows') int? numOfRows,
    @JsonKey(name: 'totalCount') int? totalCount,
  }) = _BodyFctVersion;

  factory BodyFctVersion.fromJson(Map<String, Object?> json) =>
      _$BodyFctVersionFromJson(json);
}

@freezed
class ItemsFctVersion with _$ItemsFctVersion {
  const factory ItemsFctVersion({
    @JsonKey(name: 'item') List<ItemFctVersion>? item,
  }) = _ItemsFctVersion;

  factory ItemsFctVersion.fromJson(Map<String, Object?> json) =>
      _$ItemsFctVersionFromJson(json);
}

@freezed
class ItemFctVersion with _$ItemFctVersion {
  const factory ItemFctVersion({
    @JsonKey(name: 'filetype') String? filetype,
    @JsonKey(name: 'version') String? version,
  }) = _ItemFctVersion;

  factory ItemFctVersion.fromJson(Map<String, Object?> json) =>
      _$ItemFctVersionFromJson(json);

  factory ItemFctVersion.fromXml(XmlElement xml) {
    return ItemFctVersion(
      filetype: AdapterXml.resultXml(xml, 'filetype'),
      version: AdapterXml.resultXml(xml, 'version'),
    );
  }
}

@freezed
class HeaderFctVersion with _$HeaderFctVersion {
  const factory HeaderFctVersion({
    @JsonKey(name: 'resultCode') String? resultCode,
    @JsonKey(name: 'resultMsg') String? resultMsg,
  }) = _HeaderFctVersion;

  factory HeaderFctVersion.fromJson(Map<String, Object?> json) =>
      _$HeaderFctVersionFromJson(json);
}
