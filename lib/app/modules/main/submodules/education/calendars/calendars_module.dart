import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CalendarsModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => Dio()),
    //BindInject((i) => VideoViewStore()),
    //BindInject((i) => VideoViewPlaylistStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    //ChildRoute('/playlist/:id', child: (_, __) => VideoViewPlaylistPage()),
    //ChildRoute('/view/:id', child: (_, __) => VideoViewPage()),
  ];
}
