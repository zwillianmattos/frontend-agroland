// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_WeatherStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  final _$loadWeatherAsyncAction = AsyncAction('_WeatherStoreBase.loadWeather');

  @override
  Future loadWeather() {
    return _$loadWeatherAsyncAction.run(() => super.loadWeather());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
wheater: ${wheater}
    ''';
  }
}
