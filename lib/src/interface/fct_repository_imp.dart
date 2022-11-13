import 'package:xml/xml.dart';

import '../models/request/requests.dart';
import '../models/response/fct/fct_model.dart';
import '../sources/fct_api.dart';
import '../usecase/fct_repository.dart';

class FctRepositoryImp implements FctRepository {
  late final FctAPI _fctAPI;

  FctRepositoryImp({bool? isLog}) {
    _fctAPI = FctAPI(isLog: isLog);
  }

  @override
  Future<FctModel> getJSON(Weather weather) async {
    final data = await _fctAPI.getJsonData(weather);
    return FctModel.fromJson(data.data);
  }

  @override
  Future<ItemFct> getItemJSON(Weather weather, int index) async {
    final List<ItemFct> itemList = [];

    final json = await getJSON(weather);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList[index];
    } else {
      itemList.add(const ItemFct());
      return itemList.first;
    }
  }

  @override
  Future<List<ItemFct>> getItemListJSON(Weather weather) async {
    final json = await getJSON(weather);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      return items;
    } else {
      return Future.value([const ItemFct()]);
    }
  }

  @override
  Future<ItemFct> getItemXML(Weather weather, int index) async {
    final List<ItemFct> itemList = [];

    final xml = await _fctAPI.getXmlData(weather);

    final document = XmlDocument.parse(xml.data);
    final item = document.findAllElements('item');

    if (item.isNotEmpty) {
      final items = item.map<ItemFct>(toXml).toList();
      items.map((e) => itemList.add(e)).toList();
      return itemList[index];
    } else {
      itemList.add(const ItemFct());
      return itemList.first;
    }
  }

  @override
  Future<List<ItemFct>> getItemListXML(Weather weather) async {
    final List<ItemFct> itemFctList = [];

    final xml = await _fctAPI.getXmlData(weather);
    final document = XmlDocument.parse(xml.data);
    final item = document.findAllElements('item');

    if (item.isNotEmpty) {
      final items = item.map<ItemFct>(toXml).toList();
      items.map((e) => itemFctList.add(e)).toList();
      return itemFctList;
    } else {
      itemFctList.add(const ItemFct());
      return itemFctList;
    }
  }

  @override
  ItemFct toXml(XmlElement e) => ItemFct.fromXml(e);
}
