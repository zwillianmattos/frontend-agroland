import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/core/services/location/location_service.dart';
import 'package:plant_care/app/core/services/notification/notification_service.dart';
import 'package:plant_care/app/modules/main/submodules/home/home_module.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/repositories/weather_repository.dart';
import 'bottom_navigator_store.dart';
import 'bottom_navigator_widget.dart';
import 'submodules/community/community_module.dart';
import 'submodules/configurations/configurations_page.dart';
import 'submodules/education/education_module.dart';
import 'submodules/home/repositories/news_repository.dart';
import 'submodules/home/stores/home_store.dart';
import 'submodules/home/widgets/weather/page/weather_store.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => BottomNavigatorStore()),
    BindInject(
        (i) => NewsRepository(new Dio(BaseOptions(baseUrl: API_ENDPOINT)))),
    BindInject((i) => WeatherRepository(
        new Dio(BaseOptions(baseUrl: 'https://api.hgbrasil.com/weather')),
        i<LocationService>())),
    BindInject((i) => WeatherStore(i<WeatherRepository>())),
    BindInject(
      (i) => HomeStore(i<NewsRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => BottomNavigatorPage(),
        children: [
          ModuleRoute('/home', module: HomeModule()),
          ModuleRoute('/community', module: CommunityModule()),
          ModuleRoute('/education', module: EducationModule()),
          ChildRoute('/configurations', child: (_, __) => ConfigurationPage()),
        ]),
  ];
}
