import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/home/page/home_page.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/page/news_view_more_page.dart';
import 'page/news_view_page.dart';
import 'repositories/news_repository.dart';
import 'page/news_store.dart';
import 'page/news_view_more_store.dart';
import 'page/news_view_store.dart';

class NewsModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => NewsRepository(i<Dio>())),
    BindInject((i) => NewsStore(i<NewsRepository>())),
    BindInject((i) => NewsViewStore()),
    BindInject((i) => NewsViewMoreStore(i<NewsRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => NewsViewMorePage()),
    ChildRoute('/view/:newsId', child: (_, __) => NewsViewPage()),
  ];
}
