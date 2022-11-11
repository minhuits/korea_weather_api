import '../dio/dio_fct.dart';
import '../dio/dio_fct_version.dart';
import '../dio/dio_super_fct.dart';
import '../dio/dio_super_nct.dart';
import 'freezed/adapter_json.dart';
import 'freezed/adapter_xml.dart';

class AdapterWeather {
  /// 예보버전
  final DioFctVersion _dioFctVersion = DioFctVersion();

  /// 초단기실황조회
  final DioSuperNct _dioSuperNct = DioSuperNct();

  /// 초단기예보
  final DioSuperFct _dioSuperFct = DioSuperFct();

  /// 단기예보
  final DioFct _dioFct = DioFct();

  /// 예보버전
  void getJsonFctVersion({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioFctVersion.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioFctVersion.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctVersion.getItemListJSON(weather);
      },
    );
  }

  void getXMLVersion({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioFctVersion.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFctVersion.getItemListXML(weather);
      },
    );
  }

  /// 초단기실황
  void getJsonSuperNct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioSuperNct.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioSuperNct.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperNct.getItemListJSON(weather);
      },
    );
  }

  void getXMLSuperNct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioSuperNct.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperNct.getItemListXML(weather);
      },
    );
  }

  /// 초단기예보
  void getJsonSuperFct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        return await _dioSuperFct.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioSuperFct.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperFct.getItemListJSON(weather);
      },
    );
  }

  void getXMLSuperFct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioSuperFct.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioSuperFct.getItemListXML(weather);
      },
    );
  }

  /// 단기예보
  void getJsonFct({required AdapterItemJson adapterItem}) {
    adapterItem.when(
      getFromJson: (weather) async {
        print(_dioFct.getJSON(weather).toString());

        return await _dioFct.getJSON(weather);
      },
      getItem: (weather, index) async {
        return await _dioFct.getItemJSON(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFct.getItemListJSON(weather);
      },
    );
  }

  void getXMLFct({required AdapterItemXML adapterItem}) {
    adapterItem.when(
      getItem: (weather, index) async {
        return await _dioFct.getItemXML(weather, index);
      },
      getItemList: (weather) async {
        return await _dioFct.getItemListXML(weather);
      },
    );
  }
}
