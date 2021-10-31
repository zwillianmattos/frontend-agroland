// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherDetailStore on _WeatherDetailStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_WeatherDetailStoreBase.isLoading');

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

  final _$localizacoesListaAtom =
      Atom(name: '_WeatherDetailStoreBase.localizacoesLista');

  @override
  ObservableList<Weather>? get localizacoesLista {
    _$localizacoesListaAtom.reportRead();
    return super.localizacoesLista;
  }

  @override
  set localizacoesLista(ObservableList<Weather>? value) {
    _$localizacoesListaAtom.reportWrite(value, super.localizacoesLista, () {
      super.localizacoesLista = value;
    });
  }

  final _$loadWeatherAsyncAction =
      AsyncAction('_WeatherDetailStoreBase.loadWeather');

  @override
  Future loadWeather() {
    return _$loadWeatherAsyncAction.run(() => super.loadWeather());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
localizacoesLista: ${localizacoesLista}
    ''';
  }
}
