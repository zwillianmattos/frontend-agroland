import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/videos/page/video_view_page.dart';
import 'package:plant_care/app/modules/main/submodules/education/videos/page/video_view_store.dart';

import 'page/video_view_playlist_page.dart';
import 'page/video_view_playlist_store.dart';

class VideosModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => Dio()),
    BindInject((i) => VideoViewStore()),
    BindInject((i) => VideoViewPlaylistStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/playlist/:id', child: (_, __) => VideoViewPlaylistPage()),
    ChildRoute('/view/:id', child: (_, __) => VideoViewPage()),
  ];
}
