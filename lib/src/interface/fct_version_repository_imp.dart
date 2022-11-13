import 'package:xml/xml.dart';

import '../models/request/requests.dart';
import '../models/response/fct_version/fct_version_model.dart';
import '../sources/fct_version_api.dart';
import '../usecase/fct_version_repository.dart';

class FctVersionRepositoryImp implements FctVersionRepository {
  late final FctVersionAPI _versionAPI;

  FctVersionRepositoryImp({bool? isLog}) {
    _versionAPI = FctVersionAPI(isLog: isLog);
  }

  @override
  Future<FctVersionModel> getJSON(WeatherVersion version) async {
    final data = await _versionAPI.getJsonData(version);
    return FctVersionModel.fromJson(data.data);
  }

  @override
  Future<ItemFctVersion> getItemJSON(WeatherVersion version, int index) async {
    final List<ItemFctVersion> itemList = [];

    final json = await getJSON(version);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList[index];
    } else {
      itemList.add(const ItemFctVersion());
      return itemList.first;
    }
  }

  @override
  Future<List<ItemFctVersion>> getItemListJSON(WeatherVersion version) async {
    final List<ItemFctVersion> itemList = [];

    final json = await getJSON(version);
    final items = json.response!.body!.items!.item!;

    if (items.isNotEmpty) {
      items.map((e) => itemList.add(e)).toList();
      return itemList;
    } else {
      itemList.add(const ItemFctVersion());
      return itemList;
    }
  }

  @override
  Future<ItemFctVersion> getItemXML(WeatherVersion version, int index) async {
    final List<ItemFctVersion> itemList = [];

    final xml = await _versionAPI.getXmlData(version);
    final document = XmlDocument.parse(xml.data);
    final item = document.findAllElements('item');
    if (item.isNotEmpty) {
      item.map<ItemFctVersion>(toXml).toList();
      return itemList[index];
    } else {
      itemList.add(const ItemFctVersion());
      return itemList.first;
    }
  }

  @override
  Future<List<ItemFctVersion>> getItemListXML(WeatherVersion version) async {
    final List<ItemFctVersion> itemList = [];

    final xml = await _versionAPI.getXmlData(version);
    final document = XmlDocument.parse(xml.data);
    final item = document.findAllElements('item');

    if (item.isNotEmpty) {
      final items = item.map<ItemFctVersion>(toXml).toList();
      items.map((e) => itemList.add(e)).toList();
      return itemList;
    } else {
      itemList.add(const ItemFctVersion());
      return itemList;
    }
  }

  @override
  ItemFctVersion toXml(XmlElement e) => ItemFctVersion.fromXml(e);
}
