// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_config_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherConfigStore on _WeatherConfigStoreBase, Store {
  final _$estadosAtom = Atom(name: '_WeatherConfigStoreBase.estados');

  @override
  ObservableList<EstadoModel>? get estados {
    _$estadosAtom.reportRead();
    return super.estados;
  }

  @override
  set estados(ObservableList<EstadoModel>? value) {
    _$estadosAtom.reportWrite(value, super.estados, () {
      super.estados = value;
    });
  }

  final _$estadosFiltradoAtom =
      Atom(name: '_WeatherConfigStoreBase.estadosFiltrado');

  @override
  ObservableList<EstadoModel>? get estadosFiltrado {
    _$estadosFiltradoAtom.reportRead();
    return super.estadosFiltrado;
  }

  @override
  set estadosFiltrado(ObservableList<EstadoModel>? value) {
    _$estadosFiltradoAtom.reportWrite(value, super.estadosFiltrado, () {
      super.estadosFiltrado = value;
    });
  }

  final _$searchEstadoControllerAtom =
      Atom(name: '_WeatherConfigStoreBase.searchEstadoController');

  @override
  TextEditingController get searchEstadoController {
    _$searchEstadoControllerAtom.reportRead();
    return super.searchEstadoController;
  }

  @override
  set searchEstadoController(TextEditingController value) {
    _$searchEstadoControllerAtom
        .reportWrite(value, super.searchEstadoController, () {
      super.searchEstadoController = value;
    });
  }

  final _$cidadesAtom = Atom(name: '_WeatherConfigStoreBase.cidades');

  @override
  ObservableList<CidadeModel>? get cidades {
    _$cidadesAtom.reportRead();
    return super.cidades;
  }

  @override
  set cidades(ObservableList<CidadeModel>? value) {
    _$cidadesAtom.reportWrite(value, super.cidades, () {
      super.cidades = value;
    });
  }

  final _$cidadesFiltradoAtom =
      Atom(name: '_WeatherConfigStoreBase.cidadesFiltrado');

  @override
  ObservableList<CidadeModel>? get cidadesFiltrado {
    _$cidadesFiltradoAtom.reportRead();
    return super.cidadesFiltrado;
  }

  @override
  set cidadesFiltrado(ObservableList<CidadeModel>? value) {
    _$cidadesFiltradoAtom.reportWrite(value, super.cidadesFiltrado, () {
      super.cidadesFiltrado = value;
    });
  }

  final _$searchCidadeControllerAtom =
      Atom(name: '_WeatherConfigStoreBase.searchCidadeController');

  @override
  TextEditingController get searchCidadeController {
    _$searchCidadeControllerAtom.reportRead();
    return super.searchCidadeController;
  }

  @override
  set searchCidadeController(TextEditingController value) {
    _$searchCidadeControllerAtom
        .reportWrite(value, super.searchCidadeController, () {
      super.searchCidadeController = value;
    });
  }

  final _$localizacoesListaAtom =
      Atom(name: '_WeatherConfigStoreBase.localizacoesLista');

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

  final _$isLoadingAtom = Atom(name: '_WeatherConfigStoreBase.isLoading');

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

  final _$carregaEstadosAsyncAction =
      AsyncAction('_WeatherConfigStoreBase.carregaEstados');

  @override
  Future<void> carregaEstados() {
    return _$carregaEstadosAsyncAction.run(() => super.carregaEstados());
  }

  final _$carregaCidadePorEstadoAsyncAction =
      AsyncAction('_WeatherConfigStoreBase.carregaCidadePorEstado');

  @override
  Future<void> carregaCidadePorEstado(EstadoModel estadoModel) {
    return _$carregaCidadePorEstadoAsyncAction
        .run(() => super.carregaCidadePorEstado(estadoModel));
  }

  final _$loadLocationsAsyncAction =
      AsyncAction('_WeatherConfigStoreBase.loadLocations');

  @override
  Future<void> loadLocations() {
    return _$loadLocationsAsyncAction.run(() => super.loadLocations());
  }

  final _$addLocationAsyncAction =
      AsyncAction('_WeatherConfigStoreBase.addLocation');

  @override
  Future<void> addLocation(CidadeModel cidade) {
    return _$addLocationAsyncAction.run(() => super.addLocation(cidade));
  }

  final _$removeLocationAsyncAction =
      AsyncAction('_WeatherConfigStoreBase.removeLocation');

  @override
  Future<void> removeLocation(Weather weather) {
    return _$removeLocationAsyncAction.run(() => super.removeLocation(weather));
  }

  final _$_WeatherConfigStoreBaseActionController =
      ActionController(name: '_WeatherConfigStoreBase');

  @override
  List<EstadoModel>? searchEstado(String tag) {
    final _$actionInfo = _$_WeatherConfigStoreBaseActionController.startAction(
        name: '_WeatherConfigStoreBase.searchEstado');
    try {
      return super.searchEstado(tag);
    } finally {
      _$_WeatherConfigStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<CidadeModel>? searchCidade(String tag) {
    final _$actionInfo = _$_WeatherConfigStoreBaseActionController.startAction(
        name: '_WeatherConfigStoreBase.searchCidade');
    try {
      return super.searchCidade(tag);
    } finally {
      _$_WeatherConfigStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estados: ${estados},
estadosFiltrado: ${estadosFiltrado},
searchEstadoController: ${searchEstadoController},
cidades: ${cidades},
cidadesFiltrado: ${cidadesFiltrado},
searchCidadeController: ${searchCidadeController},
localizacoesLista: ${localizacoesLista},
isLoading: ${isLoading}
    ''';
  }
}
