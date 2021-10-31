import 'dart:convert';

import 'package:agro_tools/app/core/services/cidade_estado/cidade_estado_service.dart';
import 'package:agro_tools/app/core/services/cidade_estado/cidade_model.dart';
import 'package:agro_tools/app/core/services/cidade_estado/estado_model.dart';
import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'weather_config_store.g.dart';

class WeatherConfigStore = _WeatherConfigStoreBase with _$WeatherConfigStore;

abstract class _WeatherConfigStoreBase with Store {
  final CidadeEstadoService cidadeEstadoService;
  final WeatherRepository weatherRepository;

  @observable
  ObservableList<EstadoModel>? estados;
  @observable
  ObservableList<EstadoModel>? estadosFiltrado;
  @observable
  TextEditingController searchEstadoController = TextEditingController();

  @observable
  ObservableList<CidadeModel>? cidades;
  @observable
  ObservableList<CidadeModel>? cidadesFiltrado;
  @observable
  TextEditingController searchCidadeController = TextEditingController();

  @observable
  ObservableList<Weather>? localizacoesLista;

  @observable
  bool isLoading = false;

  _WeatherConfigStoreBase(this.cidadeEstadoService, this.weatherRepository) {
    loadLocations();
    carregaEstados();

    searchEstadoController.addListener(() {
      searchEstado(searchEstadoController.text);
    });

    searchCidadeController.addListener(() {
      searchCidade(searchCidadeController.text);
    });
  }

  @action
  Future<void> carregaEstados() async {
    estados = (await cidadeEstadoService.retornaEstados())?.asObservable();
    estadosFiltrado = estados;
  }

  @action
  Future<void> carregaCidadePorEstado(EstadoModel estadoModel) async {
    searchEstadoController.clear();
    isLoading = true;
    cidades = (await cidadeEstadoService.retornaCidadePorUf(estadoModel.sigla))
        ?.asObservable();
    cidadesFiltrado = cidades;
    isLoading = false;
  }

  @action
  List<EstadoModel>? searchEstado(String tag) {
    estadosFiltrado = estados!
        .where((EstadoModel element) =>
            element.nome.toLowerCase().contains(tag.toLowerCase()))
        .toList()
        .asObservable();

    return estadosFiltrado;
  }

  @action
  List<CidadeModel>? searchCidade(String tag) {
    cidadesFiltrado = cidades!
        .where((CidadeModel element) =>
            element.nome.toLowerCase().contains(tag.toLowerCase()))
        .toList()
        .asObservable();

    return cidadesFiltrado;
  }

  @action
  Future<void> loadLocations() async {
    isLoading = true;

    var localizacoes =
        await LocalStorage.getValue<String>('weather_localizacoes');

    localizacoesLista = ObservableList<Weather>.of([]);

    if (localizacoes != null && localizacoes != '') {
      List<dynamic>? list =
          jsonDecode(localizacoes).map((e) => Weather.fromJson(e)).toList();

      list?.forEach((element) {
        localizacoesLista?.add(element);
      });
    }

    isLoading = false;
  }

  @action
  Future<void> addLocation(CidadeModel cidade) async {
    Weather? weather = await weatherRepository.getByCity(cidade.nome);

    var range = localizacoesLista?.indexWhere(
        (element) => element.results!.cityName == weather!.results!.cityName);
  
    if (range == -1) {
      if (weather != null) {
        localizacoesLista?.add(weather);
      }

      await LocalStorage.setValue<String>(
          'weather_localizacoes',
          jsonEncode(
              localizacoesLista?.map((element) => element.toJson()).toList()));
    }
  }

  @action
  Future<void> removeLocation(Weather weather) async {
    isLoading = true;
    localizacoesLista?.remove(weather);
    await LocalStorage.setValue<String>(
        'weather_localizacoes',
        jsonEncode(
            localizacoesLista?.map((element) => element.toJson()).toList()));
    isLoading = false;
  }
}
