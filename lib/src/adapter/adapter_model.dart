import '../models/request/requests.dart';

class AdapterModel {
  late Weather _weatherModel;
  late WeatherVersion _versionModel;

  AdapterModel({
    required Weather weatherModel,
    required WeatherVersion versionModel,
  }) {
    _weatherModel = weatherModel;
    _versionModel = versionModel;
  }

  Weather get weather => _weatherModel;

  WeatherVersion get weatherVersion => _versionModel;
}
