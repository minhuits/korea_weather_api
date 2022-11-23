## 패키지 설명

기상청_단기예보 ((구)_동네예보) 조회서비스 API 쉽게 연동하기 위해 개발된 패키지입니다.

## 사용방법
### 공공데이터포털 인증키 발급
아래의 사이트에서 `로그인` 또는 `회원가입` 후 `활용신청`해주세요.

[공공데이터포털기상청_단기예보 ((구)_동네예보) 조회서비스](https://www.data.go.kr/data/15084084/openapi.do)

### Request
초단기실황조회, 초단기예보조회, 단기예보조회는 아래의 `Weather class`을 사용해주세요

``` dart
  Weather({
    // 날짜 [Default: DateTime.now()]
    DateTime? dateTime, 
    
    // 예보지점 X 좌표 [Default: 37.5635694]
    double? nx, 
    
    // 예보지점 Y 좌표 [Default: 126.9800083]
    double? ny, 
    
    // 공공데이터포털에서 받은 인증키
    required this.serviceKey, 
    
    // 페이지번호 [Default: 1]
    this.pageNo = 1, 
    
    // 한 페이지 결과 수 [Default: 1000]
    this.numOfRows = 1000, 
    
    // 요청자료형식(XML/JSON) [Default: JSON]
    this.dataType = DataType.json, 
  })
```

예보버전는 아래의 `WeatherVersion class`을 사용해주세요

``` dart
  WeatherVersion({
    // 날짜 [Default: DateTime.now()]
    DateTime? dateTime,
    
    // 공공데이터포털에서 받은 인증키
    required this.serviceKey,
    
    // 페이지번호 [Default: 1]
    this.pageNo = 1,
    
    // 한 페이지 결과 수 [Default: 1]
    this.numOfRows = 1,
    
    // 요청자료형식(XML/JSON) [Default: JSON]
    this.dataType = DataType.json,
    
    // 파일구분 [Default: ODAM]
    this.fileType = FileType.oDAM,
  })  
```

### Response
`SuperNct`는 초단기실황, `SuperFct`는 초단기예보, `Fct`는 단기예보, `FctVersion`는 예보버전을 의미합니다.

### Interface
`isLog` : 로그 출력 여부를 의미합니다. `Default` 값은 `true`입니다.

`customLogger` : custom 로그를 출력하고 싶은 경우 `pretty_dio_logger` 패키지를 사용해주세요.

`getJSON` : `JSON` 데이터를 가져와 `Model`를 반환합니다.

`getItemJSON` : `JSON` 데이터를 가져와 `Item`을 반환합니다.

`getItemListJSON` : `JSON` 데이터를 가져와 `Item List`로 반환합니다.

`getItemXML` : `XML` 데이터를 가져와 `Item`을 반환합니다.

`getItemListXML` : `XML` 데이터를 가져와 `Item List`로 반한합니다.

## 예제
### Main
다음과 같이 `WeatherHttpOverrides()`을 `main()`에 추가해주세요.
```dart
import 'dart:io';
import 'package:korea_weather_api/korea_weather_api.dart';

void main() {
  HttpOverrides.global = WeatherHttpOverrides();
  runApp(const MyApp());
}
```

### 초단기 실황 예제
```dart
Future<List<ItemSuperNct>> getSuperNctListJson({isLog = false}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 100,
  );
  final List<ItemSuperNct> items = [];
  final json =
  await SuperNctRepositoryImp(isLog: isLog).getItemListJSON(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemSuperNct>> getSuperNctListXML({isLog = false}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 100,
  );
  final List<ItemSuperNct> items = [];
  final json = await SuperNctRepositoryImp(
    isLog: isLog,
  ).getItemListXML(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemSuperNct>> getSuperNctJson(int index, {isLog = false}) async {
  final List<ItemSuperNct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    SuperNctRepositoryImp(isLog: isLog).getItemJSON(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

```dart
Future<List<ItemSuperNct>> getSuperNctXML(int index, {isLog = false}) async {
  final List<ItemSuperNct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    SuperNctRepositoryImp(isLog: isLog).getItemXML(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

### 초단기 예보
```dart
Future<List<ItemSuperFct>> getSuperFctListJson({isLog = false}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
  );

  final List<ItemSuperFct> items = [];

  final json =
  await SuperFctRepositoryImp(isLog: isLog).getItemListJSON(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemSuperFct>> getSuperFctListXML({isLog = false}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
  );
  final List<ItemSuperFct> items = [];

  final json =
  await SuperFctRepositoryImp(isLog: isLog).getItemListXML(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemSuperFct>> getSuperFctJson(int index, {isLog = false}) async {
  final List<ItemSuperFct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    SuperFctRepositoryImp(isLog: isLog).getItemJSON(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

```dart
Future<List<ItemSuperFct>> getSuperFctXML(int index, {isLog = false}) async {
  final List<ItemSuperFct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    SuperFctRepositoryImp(isLog: isLog).getItemXML(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

### 단기 예보 예제
```dart
Future<List<ItemFct>> getFctListJson({isLog = true}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 10,
  );
  final List<ItemFct> items = [];
  final json = await FctRepositoryImp(isLog: isLog).getItemListJSON(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemFct>> getFctListXML({isLog = false}) async {
  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 10,
  );
  final List<ItemFct> items = [];
  final json = await FctRepositoryImp(isLog: isLog).getItemListXML(weather);

  json.map((e) => setState(() => items.add(e))).toList();

  return items;
}
```

```dart
Future<List<ItemFct>> getFctJson(int index, {isLog = false}) async {
  final List<ItemFct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    FctRepositoryImp(isLog: isLog).getItemJSON(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

```dart
Future<List<ItemFct>> getFctXML(int index, {isLog = false}) async {
  final List<ItemFct> list = [];

  final weather = Weather(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: index,
  );

  for (int i = 0; i < index; i++) {
    FctRepositoryImp(isLog: isLog).getItemXML(weather, i).then((v) {
      setState(() => list.add(v));
    });
  }

  return list;
}
```

### 예보버전 예제
```dart
Future<List<ItemFctVersion>> getFctVersionJson({isLog = true}) async {
  final List<ItemFctVersion> items = [];

  final weather = WeatherVersion(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 100,
  );

  FctVersionRepositoryImp(isLog: isLog, customLogger: logger)
      .getItemJSON(weather)
      .then((value) => setState(() => items.add(value)));

  return items;
}
```

```dart
Future<List<ItemFctVersion>> getFctVersionXML({isLog = true}) async {
  final List<ItemFctVersion> items = [];

  final weather = WeatherVersion(
    serviceKey: 'serviceKey',
    pageNo: 1,
    numOfRows: 100,
  );

  FctVersionRepositoryImp(isLog: isLog, customLogger: logger)
      .getItemXML(weather)
      .then((value) => setState(() => items.add(value)));

  return items;
}
```
