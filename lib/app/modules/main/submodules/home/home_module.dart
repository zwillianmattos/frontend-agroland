import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/home_page.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/news_view_page.dart';

class HomeModule extends Module {
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/')),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => DashboardPage()),
    ChildRoute('/news',
        child: (_, __) => NewsViewPage(
              news: __.data,
            )),
  ];
}
