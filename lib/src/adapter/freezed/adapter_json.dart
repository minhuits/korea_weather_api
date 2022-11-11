import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/request/weather.dart';

part 'adapter_json.freezed.dart';

@freezed
class AdapterItemJson with _$AdapterItemJson {
  const factory AdapterItemJson.getFromJson(Weather weather) = FromJson;

  const factory AdapterItemJson.getItem(Weather weather, int index) = Item;

  const factory AdapterItemJson.getItemList(Weather weather) = ItemList;
}
