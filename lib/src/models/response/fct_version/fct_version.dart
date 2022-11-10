/// 예보 버전 정보 FctVersionItem
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'fct_version.freezed.dart';
part 'fct_version.g.dart';

@freezed
class FctVersionItem with _$FctVersionItem {
  const factory FctVersionItem({
    required Response response,
  }) = _FctVersionItem;

  factory FctVersionItem.fromJson(Map<String, dynamic> json) =>
      _$FctVersionItemFromJson(json);
}

@freezed
class Response with _$Response {
  const factory Response({
    required Header header,
    required Body body,
  }) = _Response;

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
}

@freezed
class Body with _$Body {
  const factory Body({
    required String dataType,
    required Items items,
    required int pageNo,
    required int numOfRows,
    required int totalCount,
  }) = _Body;

  factory Body.fromJson(Map<String, dynamic> json) => _$BodyFromJson(json);
}

@freezed
class Items with _$Items {
  const factory Items({
    required List<Item> item,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    required String filetype,
    required String version,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromXml(XmlElement xml) {
    return Item(
      version: _resultXml(xml, 'version'),
      filetype: _resultXml(xml, 'filetype'),
    );
  }

  static String _resultXml(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ''
        : xml.findAllElements(key).map((e) => e.text).first;
  }
}

@freezed
class Header with _$Header {
  const factory Header({
    required String resultCode,
    required String resultMsg,
  }) = _Header;

  factory Header.fromJson(Map<String, dynamic> json) => _$HeaderFromJson(json);
}
