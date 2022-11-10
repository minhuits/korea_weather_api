// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fct_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FctVersionItem _$$_FctVersionItemFromJson(Map<String, dynamic> json) =>
    _$_FctVersionItem(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FctVersionItemToJson(_$_FctVersionItem instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

_$_Response _$$_ResponseFromJson(Map<String, dynamic> json) => _$_Response(
      header: Header.fromJson(json['header'] as Map<String, dynamic>),
      body: Body.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResponseToJson(_$_Response instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

_$_Body _$$_BodyFromJson(Map<String, dynamic> json) => _$_Body(
      dataType: json['dataType'] as String,
      items: Items.fromJson(json['items'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      numOfRows: json['numOfRows'] as int,
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$$_BodyToJson(_$_Body instance) => <String, dynamic>{
      'dataType': instance.dataType,
      'items': instance.items,
      'pageNo': instance.pageNo,
      'numOfRows': instance.numOfRows,
      'totalCount': instance.totalCount,
    };

_$_Items _$$_ItemsFromJson(Map<String, dynamic> json) => _$_Items(
      item: (json['item'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ItemsToJson(_$_Items instance) => <String, dynamic>{
      'item': instance.item,
    };

_$_Item _$$_ItemFromJson(Map<String, dynamic> json) => _$_Item(
      filetype: json['filetype'] as String,
      version: json['version'] as String,
    );

Map<String, dynamic> _$$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'filetype': instance.filetype,
      'version': instance.version,
    };

_$_Header _$$_HeaderFromJson(Map<String, dynamic> json) => _$_Header(
      resultCode: json['resultCode'] as String,
      resultMsg: json['resultMsg'] as String,
    );

Map<String, dynamic> _$$_HeaderToJson(_$_Header instance) => <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };
