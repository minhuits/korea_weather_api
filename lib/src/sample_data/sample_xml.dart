import '../adapter/adapter.dart';
import '../models/models.dart';

class SampleXml {
  static late final String _serviceKey;
  static final _date = DateTimeAdapter();

  SampleXml({required String serviceKey}) {
    _serviceKey = serviceKey;
  }

  static const testXML = '''
  <?xml version="1.0" encoding="UTF-8"?>
  <response>
    <header>
      <resultCode>00</resultCode>
      <resultMsg>NORMAL_SERVICE</resultMsg>
    </header>
    <body>
      <dataType>XML</dataType>
      <items>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>TMP</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>12</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>UUU</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>-1.7</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>VVV</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>2.2</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>VEC</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>141</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>WSD</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>2.8</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>SKY</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>4</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>PTY</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>0</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>POP</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>30</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>WAV</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>0</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
        <item>
          <baseDate>20221112</baseDate>
          <baseTime>0500</baseTime>
          <category>PCP</category>
          <fcstDate>20221112</fcstDate>
          <fcstTime>0600</fcstTime>
          <fcstValue>강수없음</fcstValue>
          <nx>55</nx>
          <ny>127</ny>
        </item>
      </items>
      <numOfRows>10</numOfRows>
      <pageNo>1</pageNo>
      <totalCount>809</totalCount>
    </body>
  </response>
  ''';

  static final weather10 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 10,
    dataType: DataType.xml,
  );
  static final weather100 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 100,
    dateTime: _dateTime,
    dataType: DataType.xml,
  );
  static final weather1000 = Weather(
    serviceKey: _serviceKey,
    pageNo: 1,
    numOfRows: 1000,
    dateTime: _dateTime,
    dataType: DataType.xml,
  );

  static final weatherODAM = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.oDAM,
    dataType: DataType.xml,
  );
  static final weatherSHRT = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.sHRT,
    dataType: DataType.xml,
  );
  static final weatherVSRT = WeatherVersion(
    serviceKey: _serviceKey,
    numOfRows: 1000,
    pageNo: 1,
    dateTime: _dateTime,
    fileType: FileType.vSRT,
    dataType: DataType.xml,
  );

  static final _dateTime = _date.nowDate(minute: 00);
}
