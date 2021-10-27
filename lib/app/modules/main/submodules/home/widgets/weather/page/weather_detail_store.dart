import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/models/weather.dart';

part 'weather_detail_store.g.dart';

class WeatherDetailStore = _WeatherDetailStoreBase with _$WeatherDetailStore;

abstract class _WeatherDetailStoreBase with Store {
    final WeatherRepository weatherRepository;

  @observable
  bool isLoading = false;

  @observable
  Weather? weather;

  _WeatherDetailStoreBase(this.weatherRepository) {
    loadWeather();
  }

  @action
  loadWeather() async {
    try {
      this.isLoading = true;
      this.weather = await weatherRepository.get();
    } catch (e) {
      this.isLoading = false;
      print(e);
    } finally {
      this.isLoading = false;
    }
  }
}
