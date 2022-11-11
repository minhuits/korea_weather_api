import 'adapter_json/dio/dio_fct.dart';
import 'adapter_json/dio/dio_fct_version.dart';
import 'adapter_json/dio/dio_super_fct.dart';
import 'adapter_json/dio/dio_super_nct.dart';
import 'adapter_json/freezed/adapter_json.dart';
import 'adapter_xml/dio/dio_fct.dart';
import 'adapter_xml/dio/dio_fct_version.dart';
import 'adapter_xml/dio/dio_super_fct.dart';
import 'adapter_xml/dio/dio_super_nct.dart';
import 'adapter_xml/freezed/adapter_xml.dart';

class AdapterWeather {
  /// 예보버전
  final _dioFctVersionJson = DioFctVersionJson();
  final _dioFctVersionXML = DioFctVersionXML();

  /// 초단기실황조회
  final _dioSuperNctJson = DioSuperNctJson();
  final _dioSuperNctXML = DioSuperNctXML();

  /// 초단기예보
  final _dioSuperFctJson = DioSuperFctJson();
  final _dioSuperFctXML = DioSuperFctXML();

  /// 단기예보
  final _dioFctJson = DioFctJson();
  final _dioFctXML = DioFctXML();

  /// 예보버전
  void getJsonFctVersion({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioFctVersionJson.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioFctVersionJson.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctVersionJson.getItemListJSON(weather);
      },
    );
  }

  void getXMLVersion({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioFctVersionXML.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctVersionXML.getItemListXML(weather);
      },
    );
  }

  /// 초단기실황
  void getJsonSuperNct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioSuperNctJson.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioSuperNctJson.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperNctJson.getItemListJSON(weather);
      },
    );
  }

  void getXMLSuperNct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioSuperNctXML.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperNctXML.getItemListXML(weather);
      },
    );
  }

  /// 초단기예보
  void getJsonSuperFct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioSuperFctJson.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioSuperFctJson.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperFctJson.getItemListJSON(weather);
      },
    );
  }

  void getXMLSuperFct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioSuperFctXML.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperFctXML.getItemListXML(weather);
      },
    );
  }

  /// 단기예보
  void getJsonFct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioFctJson.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioFctJson.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctJson.getItemListJSON(weather);
      },
    );
  }

  void getXMLFct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioFctXML.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctXML.getItemListXML(weather);
      },
    );
  }
}
