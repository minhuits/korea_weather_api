import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../enum/data_type.dart';

part 'weather.g.dart';

typedef MapJson = Map<String, dynamic>;

@JsonSerializable()
class Weather {
  /// 공공데이터포털에서 받은 인증키
  @JsonKey(name: 'ServiceKey')
  final String serviceKey;

  /// 페이지번호 [Default: 1]
  final int pageNo;

  /// 한 페이지 결과 수 [Default: 1000]
  final int numOfRows;

  /// 요청자료형식(XML/JSON) [Default: XML]
  final DataType dataType;

  /// 발표일자 [자동생성]
  @JsonKey(name: 'base_date')
  String? baseDate;

  /// 발표시각 [자동생성]
  @JsonKey(name: 'base_time')
  String? baseTime;

  /// 예보지점 X 좌표 [Default: 60]
  final int ny;

  /// 예보지점 Y 좌표 [Default: 127]
  final int nx;

  Weather({
    DateTime? dateTime,
    required this.serviceKey,
    this.pageNo = 1,
    this.numOfRows = 1000,
    this.dataType = DataType.json,
    this.nx = 60,
    this.ny = 127,
  }) {
    baseDate = _dateBase(dateTime ?? DateTime.now());
    baseTime = _timeBase(dateTime ?? DateTime.now());
  }

  String _dateBase(DateTime dateTime) => DateFormat('yyyMMdd').format(dateTime);

  String _timeBase(DateTime dateTime) => DateFormat('kkmm').format(dateTime);

  Weather copyWith({
    DateTime? dateTime,
    String? serviceKey,
    int? pageNo,
    int? numOfRows,
    DataType? dataType,
    int? nx,
    int? ny,
  }) {
    return Weather(
      dateTime: dateTime,
      serviceKey: serviceKey ?? this.serviceKey,
      pageNo: pageNo ?? this.pageNo,
      numOfRows: numOfRows ?? this.numOfRows,
      dataType: dataType ?? this.dataType,
      nx: nx ?? this.nx,
      ny: ny ?? this.ny,
    );
  }

  factory Weather.fromJson(MapJson json) => _$WeatherFromJson(json);

  MapJson toJson() => _$WeatherToJson(this);
}
