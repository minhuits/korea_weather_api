import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../adapter/adapter.dart';
import '../../adapter/adapter_map.dart';
import '../enum/data_type.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  /// 공공데이터포털에서 받은 인증키
  @JsonKey(name: 'ServiceKey')
  final String serviceKey;

  /// 페이지번호 [Default: 1]
  final int pageNo;

  /// 한 페이지 결과 수 [Default: 1000]
  final int numOfRows;

  /// 요청자료형식(XML/JSON) [Default: JSON]
  final DataType dataType;

  /// 발표일자 [자동생성]
  @JsonKey(name: 'base_date')
  String? baseDate;

  /// 발표시각 [자동생성]
  @JsonKey(name: 'base_time')
  String? baseTime;

  /// 예보지점 X 좌표 [Default: 60]
  late int ny;

  /// 예보지점 Y 좌표 [Default: 127]
  late int nx;

  @JsonKey(ignore: true)
  late DateTime _dateTime;

  @JsonKey(ignore: true)
  late MapAdapter changeMap;

  @JsonKey(ignore: true)
  late MapAdapter _changeMap;

  Weather({
    DateTime? dateTime,
    double? nx,
    double? ny,
    double? newNx,
    double? newNy,
    bool isNew = false,
    required this.serviceKey,
    this.pageNo = 1,
    this.numOfRows = 1000,
    this.dataType = DataType.json,
  }) {
    changeMap = MapAdapter.changeMap(newNx ?? 126.9800083, ny ?? 37.5635694);
    final newChangeMap =
        MapAdapter.changeMap(newNy ?? 126.9800083, ny ?? 37.5635694);
    _changeMap = isNew ? newChangeMap : changeMap;

    this.nx = changeMap.x;
    this.ny = changeMap.y;

    _dateTime = dateTime ?? DateTime.now();
    baseDate = _dateBase(_dateTime);
    baseTime = _timeBase(_dateTime);
  }

  DateTime get date => _dateTime;

  MapAdapter get mapAdapter => _changeMap;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  Weather copyWith({
    DateTime? dateTime,
    bool isNew = false,
    double? newNx,
    double? newNy,
    String? serviceKey,
    int? pageNo,
    int? numOfRows,
    DataType? dataType,
    String? baseDate,
    String? baseTime,
  }) {
    return Weather(
      serviceKey: serviceKey ?? this.serviceKey,
      pageNo: pageNo ?? this.pageNo,
      numOfRows: numOfRows ?? this.numOfRows,
      dataType: dataType ?? this.dataType,
      dateTime: dateTime ?? _dateTime,
      isNew: isNew,
      newNx: newNx,
      newNy: newNy,
    );
  }

  String _dateBase(DateTime dateTime) => DateFormat('yyyMMdd').format(dateTime);

  String _timeBase(DateTime dateTime) => DateFormat('kkmm').format(dateTime);
}
