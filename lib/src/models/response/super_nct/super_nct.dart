/// 초단기 실황 SuperNctItem
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xml/xml.dart';

part 'super_nct.freezed.dart';
part 'super_nct.g.dart';

@freezed
class SuperNctItem with _$SuperNctItem {
  const factory SuperNctItem({
    required Response response,
  }) = _SuperNctItem;

  factory SuperNctItem.fromJson(Map<String, dynamic> json) =>
      _$SuperNctItemFromJson(json);
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
    required String? baseDate,
    required String? baseTime,
    required String? category,
    required int? nx,
    required int? ny,
    required String? obsrValue,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  factory Item.fromXml(XmlElement xml) {
    return Item(
      baseDate: _resultXml(xml, 'baseDate'),
      baseTime: _resultXml(xml, 'baseTime'),
      nx: _resultXmlInt(xml, 'nx'),
      ny: _resultXmlInt(xml, 'ny'),
      category: _resultXml(xml, 'category'),
      obsrValue: _resultXmlDouble(xml, 'obsValue').toString(),
    );
  }

  static String _resultXml(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? ''
        : xml.findAllElements(key).map((e) => e.text).first;
  }

  static int _resultXmlInt(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? 0
        : int.parse(xml.findAllElements(key).map((e) => e.text).first);
  }

  static double _resultXmlDouble(XmlElement xml, String key) {
    return xml.findAllElements(key).map((e) => e.text).isEmpty
        ? 0
        : double.parse(xml.findAllElements(key).map((e) => e.text).first);
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
