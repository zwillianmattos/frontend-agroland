import 'package:agro_tools/app/core/services/cidade_estado/cidade_estado_service.dart';
import 'package:mobx/mobx.dart';

part 'weather_search_store.g.dart';

class WeatherSearchStore = _WeatherSearchStoreBase with _$WeatherSearchStore;

abstract class _WeatherSearchStoreBase with Store {
  final CidadeEstadoService cidadeEstadoService;

  _WeatherSearchStoreBase(this.cidadeEstadoService);
}
