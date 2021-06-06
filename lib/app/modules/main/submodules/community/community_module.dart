import 'package:dio/dio.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/modules/main/submodules/community/repositories/thread_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/thread/thread_page.dart';
import 'pages/thread/thread_store.dart';
import 'pages/thread_view/thread_view_page.dart';
import 'pages/thread_view/thread_view_store.dart';

class CommunityModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: API_ENDPOINT)),
    ),
    BindInject(
      (i) => ThreadRepository(i<Dio>()),
    ),
    BindInject(
      (i) => ThreadStorePage(i<ThreadRepository>()),
    ),
    BindInject(
      (i) => ThreadViewStorePage(i<ThreadRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => ThreadPage()),
    ChildRoute('view/:channel/:thread', child: (_, __) => ThreadViewPage()),
  ];
}
