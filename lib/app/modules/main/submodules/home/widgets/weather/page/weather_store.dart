import 'dart:convert';

import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  final WeatherRepository weatherRepository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Weather>? localizacoesLista;

  _WeatherStoreBase(this.weatherRepository) {
    loadWeather();
  }

  @action
  loadWeather() async {
    try {
      this.isLoading = true;

      var localizacoes =
          await LocalStorage.getValue<String>('weather_localizacoes');

      localizacoesLista = ObservableList<Weather>.of([]);

      Weather? currentLocation = await weatherRepository.get();

      if (currentLocation != null) {
        currentLocation.results?.cid = "local_atual";
        localizacoesLista?.add(currentLocation);
      }

      if (localizacoes != null && localizacoes != '') {
        List<dynamic> jsonLocalizacoes = jsonDecode(localizacoes);

        jsonLocalizacoes
            .map((e) async =>
                await weatherRepository.getByCity(e['results']['city']))
            .take(100)
            .map((e) => e.then((Weather? value) {
                  print("Add Lista");
                  print("${localizacoesLista.toString()}");
                  if (value != null) localizacoesLista?.add(value);
                  return value;
                }))
            .toList();
      }

      this.isLoading = false;
    } catch (e) {
      this.isLoading = false;
      print(e);
    }
  }
}
