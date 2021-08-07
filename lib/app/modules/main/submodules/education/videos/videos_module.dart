import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/videos/page/video_view_page.dart';
import 'package:plant_care/app/modules/main/submodules/education/videos/page/video_view_store.dart';

class VideosModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => Dio()),
    BindInject((i) => VideoViewStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => VideoViewPage()),
  ];
}
