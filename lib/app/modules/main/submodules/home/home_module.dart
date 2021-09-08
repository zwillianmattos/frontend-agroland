import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/core/services/location/location_service.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/home_page.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/home_store.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/acoes/repositories/cotacao_repository.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/page/weather_store.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/acoes/widgets/cotacao_store.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/page/news_store.dart';

import 'widgets/news/news_module.dart';

class HomeModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => NewsRepository(i<Dio>())),
    BindInject((i) => NewsStore(i<NewsRepository>())),
    BindInject((i) => WeatherRepository(
        new Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/weather')),
        i<LocationService>())),
    BindInject((i) => WeatherStore(i<WeatherRepository>())),
    BindInject(
      (i) => HomeStore(),
    ),
    BindInject(
        (i) => CotacaoRepository(new Dio(BaseOptions(baseUrl: API_ENDPOINT)))),
    BindInject((i) => CotacaoStore(i<CotacaoRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => DashboardPage()),
    ModuleRoute('/news', module: NewsModule()),
  ];
}
