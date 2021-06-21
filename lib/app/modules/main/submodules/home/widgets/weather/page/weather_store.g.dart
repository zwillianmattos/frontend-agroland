// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStoreBase, Store {
  final _$wheaterAtom = Atom(name: '_WeatherStoreBase.wheater');

  @override
  Weather? get wheater {
    _$wheaterAtom.reportRead();
    return super.wheater;
  }

  @override
  set wheater(Weather? value) {
    _$wheaterAtom.reportWrite(value, super.wheater, () {
      super.wheater = value;
    });
  }

  final _$_WeatherStoreBaseActionController =
      ActionController(name: '_WeatherStoreBase');

  @override
  dynamic loadWeather() {
    final _$actionInfo = _$_WeatherStoreBaseActionController.startAction(
        name: '_WeatherStoreBase.loadWeather');
    try {
      return super.loadWeather();
    } finally {
      _$_WeatherStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wheater: ${wheater}
    ''';
  }
}
