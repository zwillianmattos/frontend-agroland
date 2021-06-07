import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/modules/main/submodules/home/home_module.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/news_view_page.dart';
import 'bottom_navigator_store.dart';
import 'bottom_navigator_widget.dart';
import 'submodules/community/community_module.dart';
import 'submodules/configurations/configurations_page.dart';
import 'submodules/education/ebook/ebook_module.dart';
import 'submodules/education/education_module.dart';
import 'submodules/home/repositories/news_repository.dart';
import 'submodules/home/stores/home_store.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BottomNavigatorStore()),
    Bind.lazySingleton((i) => NewsRepository(
        new Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2')))),
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
