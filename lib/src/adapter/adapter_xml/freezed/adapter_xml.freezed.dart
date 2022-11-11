// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adapter_xml.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdapterItemXML {
  Weather get weather => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Weather weather, int index) getItem,
    required TResult Function(Weather weather) getItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Weather weather, int index)? getItem,
    TResult? Function(Weather weather)? getItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Weather weather, int index)? getItem,
    TResult Function(Weather weather)? getItemList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) getItem,
    required TResult Function(ItemList value) getItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? getItem,
    TResult? Function(ItemList value)? getItemList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? getItem,
    TResult Function(ItemList value)? getItemList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdapterItemXMLCopyWith<AdapterItemXML> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdapterItemXMLCopyWith<$Res> {
  factory $AdapterItemXMLCopyWith(
          AdapterItemXML value, $Res Function(AdapterItemXML) then) =
      _$AdapterItemXMLCopyWithImpl<$Res, AdapterItemXML>;
  @useResult
  $Res call({Weather weather});
}

/// @nodoc
class _$AdapterItemXMLCopyWithImpl<$Res, $Val extends AdapterItemXML>
    implements $AdapterItemXMLCopyWith<$Res> {
  _$AdapterItemXMLCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemCopyWith<$Res> implements $AdapterItemXMLCopyWith<$Res> {
  factory _$$ItemCopyWith(_$Item value, $Res Function(_$Item) then) =
      __$$ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Weather weather, int index});
}

/// @nodoc
class __$$ItemCopyWithImpl<$Res>
    extends _$AdapterItemXMLCopyWithImpl<$Res, _$Item>
    implements _$$ItemCopyWith<$Res> {
  __$$ItemCopyWithImpl(_$Item _value, $Res Function(_$Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? index = null,
  }) {
    return _then(_$Item(
      null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Item implements Item {
  const _$Item(this.weather, this.index);

  @override
  final Weather weather;
  @override
  final int index;

  @override
  String toString() {
    return 'AdapterItemXML.getItem(weather: $weather, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Item &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemCopyWith<_$Item> get copyWith =>
      __$$ItemCopyWithImpl<_$Item>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Weather weather, int index) getItem,
    required TResult Function(Weather weather) getItemList,
  }) {
    return getItem(weather, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Weather weather, int index)? getItem,
    TResult? Function(Weather weather)? getItemList,
  }) {
    return getItem?.call(weather, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Weather weather, int index)? getItem,
    TResult Function(Weather weather)? getItemList,
    required TResult orElse(),
  }) {
    if (getItem != null) {
      return getItem(weather, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) getItem,
    required TResult Function(ItemList value) getItemList,
  }) {
    return getItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? getItem,
    TResult? Function(ItemList value)? getItemList,
  }) {
    return getItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? getItem,
    TResult Function(ItemList value)? getItemList,
    required TResult orElse(),
  }) {
    if (getItem != null) {
      return getItem(this);
    }
    return orElse();
  }
}

abstract class Item implements AdapterItemXML {
  const factory Item(final Weather weather, final int index) = _$Item;

  @override
  Weather get weather;
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$ItemCopyWith<_$Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemListCopyWith<$Res>
    implements $AdapterItemXMLCopyWith<$Res> {
  factory _$$ItemListCopyWith(
          _$ItemList value, $Res Function(_$ItemList) then) =
      __$$ItemListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Weather weather});
}

/// @nodoc
class __$$ItemListCopyWithImpl<$Res>
    extends _$AdapterItemXMLCopyWithImpl<$Res, _$ItemList>
    implements _$$ItemListCopyWith<$Res> {
  __$$ItemListCopyWithImpl(_$ItemList _value, $Res Function(_$ItemList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
  }) {
    return _then(_$ItemList(
      null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
    ));
  }
}

/// @nodoc

class _$ItemList implements ItemList {
  const _$ItemList(this.weather);

  @override
  final Weather weather;

  @override
  String toString() {
    return 'AdapterItemXML.getItemList(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemList &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @override
  int get hashCode => Object.hash(runtimeType, weather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemListCopyWith<_$ItemList> get copyWith =>
      __$$ItemListCopyWithImpl<_$ItemList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Weather weather, int index) getItem,
    required TResult Function(Weather weather) getItemList,
  }) {
    return getItemList(weather);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Weather weather, int index)? getItem,
    TResult? Function(Weather weather)? getItemList,
  }) {
    return getItemList?.call(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Weather weather, int index)? getItem,
    TResult Function(Weather weather)? getItemList,
    required TResult orElse(),
  }) {
    if (getItemList != null) {
      return getItemList(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) getItem,
    required TResult Function(ItemList value) getItemList,
  }) {
    return getItemList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? getItem,
    TResult? Function(ItemList value)? getItemList,
  }) {
    return getItemList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? getItem,
    TResult Function(ItemList value)? getItemList,
    required TResult orElse(),
  }) {
    if (getItemList != null) {
      return getItemList(this);
    }
    return orElse();
  }
}

abstract class ItemList implements AdapterItemXML {
  const factory ItemList(final Weather weather) = _$ItemList;

  @override
  Weather get weather;
  @override
  @JsonKey(ignore: true)
  _$$ItemListCopyWith<_$ItemList> get copyWith =>
      throw _privateConstructorUsedError;
}
