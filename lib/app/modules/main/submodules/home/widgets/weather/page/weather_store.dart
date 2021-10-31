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
  Weather? wheater;

  _WeatherStoreBase(this.weatherRepository) {
    loadWeather();
  }

  @action
  loadWeather() async {
    try {
      this.isLoading = true;
      this.wheater = await weatherRepository.get();
    } catch (e) {
      this.isLoading = false;
      print(e);
    } finally {
      this.isLoading = false;
    }
  }
}
