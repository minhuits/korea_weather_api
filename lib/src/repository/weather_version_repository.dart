import 'package:xml/xml.dart';

import '../models/models.dart';

abstract class VersionRepository<T1, T2> {
  Future<T2> getJSON(WeatherVersion weatherVersion);
  Future<T1> getItemXML(WeatherVersion version, int index);
  Future<T1> getItemJSON(WeatherVersion version, int index);
  Future<List<T1>> getItemListJSON(WeatherVersion version);
  Future<List<T1>> getItemListXML(WeatherVersion version);

  T1 toXml(XmlElement e);
}
