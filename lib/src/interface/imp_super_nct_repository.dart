import 'package:xml/xml.dart';

import '../models/models.dart';
import '../sources/sources.dart';
import '../usecase/usecase.dart';

class SuperNctRepositoryImp implements SuperNctRepository {
  late final NctAPI _nctAPI;

  SuperNctRepositoryImp({bool? isLog}) {
    _nctAPI = NctAPI(isLog: isLog);
  }

  @override
  Future<SuperNctModel> getJSON(Weather weather) async {
    final data = await _nctAPI.getJsonData(weather);
    return SuperNctModel.fromJson(data);
  }

  @override
  Future<ItemSuperNct> getItemJSON(Weather weather, int index) async {
    final List<ItemSuperNct> itemList = [];

    final json = await getJSON(weather);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList[index];
    } else {
      itemList.add(const ItemSuperNct());
      return itemList.first;
    }
  }

  @override
  Future<List<ItemSuperNct>> getItemListJSON(Weather weather) async {
    final List<ItemSuperNct> itemList = [];

    final json = await getJSON(weather);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList;
    } else {
      itemList.add(const ItemSuperNct());
      return itemList;
    }
  }

  @override
  Future<List<ItemSuperNct>> getItemListXML(Weather weather) async {
    final List<ItemSuperNct> itemList = [];

    final xml = await _nctAPI.getXmlData(weather);
    final document = XmlDocument.parse(xml);
    final item = document.findAllElements('item');
    final items = item.map<ItemSuperNct>(toXml).toList();

    if (item.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList;
    } else {
      itemList.add(const ItemSuperNct());
      return itemList;
    }
  }

  @override
  Future<ItemSuperNct> getItemXML(Weather weather, int index) async {
    final List<ItemSuperNct> itemList = [];

    final xml = await _nctAPI.getXmlData(weather);
    final document = XmlDocument.parse(xml);
    final item = document.findAllElements('item');
    final items = item.map<ItemSuperNct>(toXml).toList();

    if (item.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return items[index];
    } else {
      itemList.add(const ItemSuperNct());
      return itemList.first;
    }
  }

  @override
  ItemSuperNct toXml(XmlElement e) => ItemSuperNct.fromXml(e);
}
