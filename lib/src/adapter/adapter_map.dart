import 'dart:math';

/// 동네 좌표 변환
class MapAdapter {
  final int x;
  final int y;

  MapAdapter(this.x, this.y);

  /// 위경도 (x, y)  -> 동네 좌표(X, Y) 변환
  ///
  /// x : 경도 (초/100) -> 격자 X
  /// y : 위도 (초/100) -> 격자 Y
  ///
  /// ```dart
  /// // 서울특별시
  /// final map = Coordinate.changeMap(126.98000833333333, 37.56356944444444);
  /// print('결과 x = ${map.x}, y = ${map.y}');
  /// [결과] x = 60, y = 127
  /// ```
  factory MapAdapter.changeMap(double longitude, double latitude) {
    late double deGrad;
    late double re;
    late double oLon;
    late double sn;
    late double sf;
    late double ro;
    late double slat1;
    late double slat2;
    late double ra;
    late double theta;

    final map = ChangeMapParameter(
      re: 6371.00877,
      grid: 5.0,
      slat1: 30.0,
      slat2: 60.0,
      oLon: 126.0,
      oLat: 38.0,
      nx: 210 / 5.0,
      ny: 675 / 5.0,
      first: 0,
    );

    if (map.first == 0) {
      late double oLat;

      deGrad = pi / 180.0;

      re = map.re! / map.grid!;

      slat1 = map.slat1! * deGrad;
      slat2 = map.slat2! * deGrad;

      oLon = map.oLon! * deGrad;
      oLat = map.oLat! * deGrad;

      sn = tan(pi * 0.25 + slat2 * 0.5) / tan(pi * 0.25 + slat1 * 0.5);
      sn = log(cos(slat1) / cos(slat2)) / log(sn);

      sf = tan(pi * 0.25 + slat1 * 0.5);
      sf = pow(sf, sn) * cos(slat1) / sn;

      ro = tan(pi * 0.25 + oLat * 0.5);
      ro = re * sf / pow(ro, sn);

      map.copyWith(first: 1);
    }

    ra = tan(pi * 0.25 + latitude * deGrad * 0.5);
    ra = re * sf / pow(ra, sn);
    theta = longitude * deGrad - oLon;

    if (theta > pi) theta -= 2.0 * pi;
    if (theta < -pi) theta += 2.0 * pi;

    theta *= sn;

    double x = (ra * sin(theta)) + map.nx!;
    double y = (ro - ra * cos(theta)) + map.ny!;

    x = x + 1.5;
    y = y + 1.5;

    return MapAdapter(x.toInt(), y.toInt());
  }
}

/// 변환에 필요한 Parameter
class ChangeMapParameter {
  ///사용할 지구반경
  final double? re;

  ///격자간격
  final double? grid;

  ///표준위도
  final double? slat1;

  ///표준위도
  final double? slat2;

  ///기준점의 경도
  final double? oLon;

  ///기준점의 위도
  final double? oLat;

  ///기준점의 X 좌표
  final double? nx;

  ///기준점의 Y 좌표
  final double? ny;

  ///시작여부
  final int? first;

  ChangeMapParameter({
    this.re,
    this.grid,
    this.slat1,
    this.slat2,
    this.oLon,
    this.oLat,
    this.nx,
    this.ny,
    required this.first,
  });

  ChangeMapParameter copyWith({int? first}) {
    return ChangeMapParameter(
      first: first ?? this.first,
    );
  }
}
