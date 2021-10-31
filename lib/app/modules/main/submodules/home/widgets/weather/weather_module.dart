import 'package:agro_tools/app/core/services/cidade_estado/cidade_estado_service.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/page/weather_config_page.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/page/weather_config_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/services/location/location_service.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/page/weather_store.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';

import 'page/weather_detail_page.dart';
import 'page/weather_detail_store.dart';

class WeatherModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => CidadeEstadoService(new Dio(
        BaseOptions(baseUrl: 'https://servicodados.ibge.gov.br/api/v1')))),
    BindInject((i) => WeatherRepository(
        new Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/weather')),
        i<LocationService>())),
    BindInject((i) => WeatherStore(i<WeatherRepository>())),
    BindInject((i) => WeatherDetailStore(i<WeatherRepository>())),
    BindInject((i) =>
        WeatherConfigStore(i<CidadeEstadoService>(), i<WeatherRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => WeatherDetailPage()),
    ChildRoute('/config', child: (_, __) => WeatherConfigPage()),
  ];
}
