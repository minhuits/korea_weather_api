import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/request/weather.dart';

part 'adapter_xml.freezed.dart';

@freezed
class AdapterItemXML with _$AdapterItemXML {
  const factory AdapterItemXML.getItem(Weather weather, int index) = Item;

  const factory AdapterItemXML.getItemList(Weather weather) = ItemList;
}
