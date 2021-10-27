import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/services/location/location_service.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/page/weather_store.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';

import 'page/weather_detail_page.dart';
import 'page/weather_detail_store.dart';

class WeatherModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => WeatherRepository(
        new Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/weather')),
        i<LocationService>())),
    BindInject((i) => WeatherStore(i<WeatherRepository>())),
    BindInject((i) => WeatherDetailStore(i<WeatherRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => WeatherDetailPage()),
  ];
}
