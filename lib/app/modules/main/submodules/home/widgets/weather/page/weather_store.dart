import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStoreBase with _$WeatherStore;

abstract class _WeatherStoreBase with Store {
  final WeatherRepository weatherRepository;

  @observable
  Weather? wheater;

  _WeatherStoreBase(this.weatherRepository) {
    loadWeather();
  }

  @action
  loadWeather() async {
    wheater = await weatherRepository.get();
  }
}
