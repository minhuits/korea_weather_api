import 'package:xml/xml.dart';

import '../models/models.dart';

abstract class FctVersionRepository {
  Future<FctVersionModel> getJSON(WeatherVersion weatherVersion);
  Future<ItemFctVersion> getItemXML(WeatherVersion version);
  Future<ItemFctVersion> getItemJSON(WeatherVersion version);

  ItemFctVersion toXml(XmlElement e);
}
